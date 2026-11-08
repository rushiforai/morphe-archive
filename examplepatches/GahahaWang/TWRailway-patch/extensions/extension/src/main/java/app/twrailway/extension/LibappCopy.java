package app.twrailway.extension;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Some patches change the app's compiled Dart code (libapp.so), which cannot read a setting.
 * The installed libapp.so has every such patch applied. When a setting differs from that, a copy
 * of libapp.so with the setting is written to the app's files directory, and the Flutter engine
 * is told to load the copy instead ({@code --aot-shared-library-name}, which only accepts
 * libraries in the app's internal storage). A setting takes effect the next time the app starts.
 *
 * <ul>
 *   <li>Expand search history: the number of searches shown in the search history.</li>
 *   <li>Hide upgrade button: whether the subscribe button of the search pages is shown.</li>
 *   <li>Fix search history count: the limit shown in the count next to 搜尋歷史, and its
 *   "升級" text.</li>
 *   <li>Hide review prompt: whether the "喜歡這個App嗎？" dialog can be shown.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class LibappCopy {
    private static final String AOT_LIBRARY_FLAG = "--aot-shared-library-name=";
    private static final String DIRECTORY = "twrailway_patches";
    private static final String LIBRARY = "libapp.so";

    private static final int NOP = 0xd503201f;

    // Search history limit, arm64: x0 = (isPremium ? 0x22 : 0) + 6, the Smi of 20 or 3.
    // csetm x0, eq | mov x0, #0x22 (patched), then mov x16, #0x22; and x0, x0, x16; add x0, x0, #6.
    private static final int CSETM_X0_EQ = 0xda9f13e0;
    private static final int MOV_X0_0x22 = 0xd2800440;
    private static final int[] LIMIT_TAIL = {0xd2800450, 0x8a100000, 0x91001800};
    private static final int MOVZ_X0 = 0xd2800000;

    // Upgrade button: `if (iap.isPurchased.value) return const SizedBox();` where the patch
    // replaces the `tbnz` (branch to the button when false) with a nop. See HideUpgradeButtonPatch.
    private static final int[] UPGRADE_BUTTON_HEAD = {0xb8417001, 0x8b1c8021, 0xb841b020, 0x8b1c8000, 0xaa0003e1};
    private static final int TBNZ_W0_4_BUTTON = 0x372000a0;
    private static final int[] UPGRADE_BUTTON_TAIL = {0xf97ba360, 0xaa1d03ef, 0xa8c179fd, 0xd65f03c0};
    private static final int UPGRADE_BUTTON_LENGTH = 4 * (UPGRADE_BUTTON_HEAD.length + 2 + UPGRADE_BUTTON_TAIL.length);

    // Review dialog: AppController.canShowReview returns false at once, where the patch replaces
    // `cbnz x2, return_false` (successUsageCount % 5 != 0) with `b return_false`.
    // See HideReviewPromptPatch.
    private static final int[] REVIEW_CHECK_HEAD = {0xd28000a0, 0x9ac00c23, 0x9b008462, 0xeb1f005f, 0x540005cb};
    private static final int CBNZ_X2_RETURN_FALSE = 0xb50004e2;
    private static final int B_RETURN_FALSE = 0x14000027;
    private static final int[] REVIEW_CHECK_TAIL = {0xf85f83a1};
    private static final int REVIEW_CHECK_LENGTH = 4 * (REVIEW_CHECK_HEAD.length + 1 + REVIEW_CHECK_TAIL.length);

    // Search history count, see FixSearchHistoryCountPatch: the clamp of the count in
    // HistoryUpgradeBadge.build, the limit passed by the search page, and the badge text.
    private static final int[] COUNT_CLAMP_HEAD = {0xf840b020, 0xb6f80060, 0xd2800000, 0x14000004};
    private static final int COUNT_CLAMP_BRANCH = 0x5400004d;
    private static final int COUNT_CLAMP_TAIL = 0xf81f83a0;
    private static final int[] COUNT_LIMIT_HEAD = {0xaa0003e3, 0xf85c83a0, 0xf81e83a3, 0xf800b060};
    private static final int COUNT_LIMIT_TAIL = 0xf8013060;
    private static final int[] COUNT_TEXT_ORIGINAL = {0x91407370, 0xf9466e10, 0xb801f050, 0x91407361, 0xf9467021};
    /** The badge text from the start of the clamp, in the same function. */
    private static final int COUNT_TEXT_FROM_CLAMP = 0x1ac;
    private static final int ORIGINAL_COUNT_LIMIT = 3;
    private static final int CMP_X0 = 0xf100001f;
    private static final int CMP_X0_MASK = 0xffc003ff;
    private static final int MOVZ_X0_MASK = 0xffe0001f;

    private LibappCopy() {
    }

    /**
     * Called at the start of FlutterLoader.ensureInitializationComplete with the engine's
     * arguments, before libapp.so is loaded.
     */
    public static String[] flutterShellArgs(Context context, String[] args) {
        try {
            if (context == null) return args;
            Context appContext = context.getApplicationContext();
            File directory = new File(appContext.getFilesDir(), DIRECTORY);

            Set<String> applied = PatchSettings.appliedPatches();

            // -1: leave as installed, 0: restore the app's own behavior, else the number to show.
            int searchHistoryLimit = -1;
            if (applied.contains(PatchSettings.EXPAND_SEARCH_HISTORY)) {
                boolean expand = PatchSettings.expandSearchHistory(appContext);
                int limit = PatchSettings.searchHistoryLimit(appContext);
                if (!expand) searchHistoryLimit = 0;
                else if (limit != PatchSettings.SEARCH_HISTORY_MAX) searchHistoryLimit = limit;
            }
            boolean showUpgradeButton = applied.contains(PatchSettings.HIDE_UPGRADE_BUTTON)
                    && !PatchSettings.hideUpgradeButton(appContext);
            boolean showReviewPrompt = applied.contains(PatchSettings.HIDE_REVIEW_PROMPT)
                    && !PatchSettings.hideReviewPrompt(appContext);

            // -1: leave as installed, 0: restore the app's own badge, else the limit to show.
            // The installed libapp.so shows the maximum, the limit of the expanded history.
            int countLimit = -1;
            if (applied.contains(PatchSettings.FIX_SEARCH_HISTORY_COUNT)) {
                if (!PatchSettings.fixSearchHistoryCount(appContext)) {
                    countLimit = 0;
                } else {
                    int shown = searchHistoryLimit < 0 ? PatchSettings.SEARCH_HISTORY_MAX
                            : searchHistoryLimit == 0 ? ORIGINAL_COUNT_LIMIT : searchHistoryLimit;
                    if (shown != PatchSettings.SEARCH_HISTORY_MAX) countLimit = shown;
                }
            }

            if (searchHistoryLimit < 0 && !showUpgradeButton && countLimit < 0 && !showReviewPrompt) {
                // The installed libapp.so already matches the settings.
                deleteCopies(directory, null);
                return args;
            }

            String name = "libapp"
                    + (searchHistoryLimit < 0 ? "" : searchHistoryLimit == 0 ? "-history-original" : "-history-" + searchHistoryLimit)
                    + (showUpgradeButton ? "-upgrade-button" : "")
                    + (countLimit < 0 ? "" : countLimit == 0 ? "-count-original" : "-count-" + countLimit)
                    + (showReviewPrompt ? "-review" : "")
                    + ".so";
            File copy = new File(directory, name);
            File stamp = new File(directory, name + ".source");
            String source = sourceIdentity(appContext);
            if (source == null) return args;

            if (!copy.isFile() || !source.equals(readText(stamp))) {
                deleteCopies(directory, null);
                byte[] library = readLibrary(appContext);
                if (library == null) return args;
                if (searchHistoryLimit >= 0 && !setSearchHistoryLimit(library, searchHistoryLimit)) {
                    Log.w(PatchSettings.TAG, "Could not find the search history limit in libapp.so");
                    return args;
                }
                if (showUpgradeButton && !restoreUpgradeButton(library)) {
                    Log.w(PatchSettings.TAG, "Could not find the upgrade button in libapp.so");
                    return args;
                }
                if (countLimit >= 0 && !setSearchHistoryCount(library, countLimit)) {
                    Log.w(PatchSettings.TAG, "Could not find the search history count in libapp.so");
                    return args;
                }
                if (showReviewPrompt && !restoreReviewPrompt(library)) {
                    Log.w(PatchSettings.TAG, "Could not find the review check in libapp.so");
                    return args;
                }
                if (!directory.isDirectory() && !directory.mkdirs()) return args;
                File temporary = new File(directory, name + ".tmp");
                try (FileOutputStream output = new FileOutputStream(temporary)) {
                    output.write(library);
                    output.getFD().sync();
                }
                if (!temporary.renameTo(copy)) return args;
                writeText(stamp, source);
            }
            deleteCopies(directory, name);

            Log.i(PatchSettings.TAG, "Loading " + copy + " for the patch settings");
            String[] result = new String[(args == null ? 0 : args.length) + 1];
            result[0] = AOT_LIBRARY_FLAG + copy.getAbsolutePath();
            if (args != null) System.arraycopy(args, 0, result, 1, args.length);
            return result;
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not apply the patch settings to libapp.so", t);
            return args;
        }
    }

    /**
     * Sets the search history limit in the arm64 libapp.so in {@code library}, or restores the
     * original instruction when {@code limit} is 0.
     */
    private static boolean setSearchHistoryLimit(byte[] library, int limit) {
        int found = -1;
        for (int offset = 0; offset + 16 <= library.length; offset += 4) {
            int first = readInt(library, offset);
            if ((first == CSETM_X0_EQ || first == MOV_X0_0x22)
                    && readInt(library, offset + 4) == LIMIT_TAIL[0]
                    && readInt(library, offset + 8) == LIMIT_TAIL[1]
                    && readInt(library, offset + 12) == LIMIT_TAIL[2]) {
                if (found != -1) return false;
                found = offset;
            }
        }
        if (found == -1) return false;

        if (limit <= 0) {
            writeInt(library, found, CSETM_X0_EQ);
        } else {
            // mov x0, #Smi(limit); nop; nop; nop
            writeInt(library, found, MOVZ_X0 | ((limit << 1) << 5));
            writeInt(library, found + 4, NOP);
            writeInt(library, found + 8, NOP);
            writeInt(library, found + 12, NOP);
        }
        return true;
    }

    /**
     * Sets the limit shown in the search history count of the arm64 libapp.so in {@code library}
     * without the "升級" text, or restores the app's own badge when {@code limit} is 0.
     */
    private static boolean setSearchHistoryCount(byte[] library, int limit) {
        int clamp = -1;
        int limitOffset = -1;
        for (int offset = 0; offset + 32 <= library.length; offset += 4) {
            if (matches(library, offset, COUNT_CLAMP_HEAD)
                    && (readInt(library, offset + 16) & CMP_X0_MASK) == CMP_X0
                    && readInt(library, offset + 20) == COUNT_CLAMP_BRANCH
                    && (readInt(library, offset + 24) & MOVZ_X0_MASK) == MOVZ_X0
                    && readInt(library, offset + 28) == COUNT_CLAMP_TAIL) {
                if (clamp != -1) return false;
                clamp = offset;
            }
            if (matches(library, offset, COUNT_LIMIT_HEAD)
                    && (readInt(library, offset + 16) & MOVZ_X0_MASK) == MOVZ_X0
                    && readInt(library, offset + 20) == COUNT_LIMIT_TAIL) {
                if (limitOffset != -1) return false;
                limitOffset = offset;
            }
        }
        if (clamp == -1 || limitOffset == -1) return false;

        // The patched text loads other pool entries, but keeps the store in between.
        int text = clamp + COUNT_TEXT_FROM_CLAMP;
        if (text + 20 > library.length
                || readInt(library, text + 8) != COUNT_TEXT_ORIGINAL[2]
                || !isPoolLoad(library, text, 16) || !isPoolLoad(library, text + 12, 1)) {
            return false;
        }

        int value = limit <= 0 ? ORIGINAL_COUNT_LIMIT : limit;
        writeInt(library, clamp + 16, CMP_X0 | (value << 10));
        writeInt(library, clamp + 24, MOVZ_X0 | (value << 5));
        writeInt(library, limitOffset + 16, MOVZ_X0 | (value << 5));
        if (limit <= 0) {
            for (int i = 0; i < COUNT_TEXT_ORIGINAL.length; i++) {
                writeInt(library, text + 4 * i, COUNT_TEXT_ORIGINAL[i]);
            }
        }
        // Otherwise the installed libapp.so already has the text without "升級".
        return true;
    }

    /** {@code add xd, x27, #imm, lsl #12; ldr xd, [xd, #imm]}: an object pool load into xd. */
    private static boolean isPoolLoad(byte[] library, int offset, int rd) {
        int add = readInt(library, offset);
        int ldr = readInt(library, offset + 4);
        return (add & 0xffc003ff) == (0x91400000 | (27 << 5) | rd)
                && (ldr & 0xffc003ff) == (0xf9400000 | (rd << 5) | rd);
    }

    /** Puts back the branch to the upgrade button of the search pages. */
    private static boolean restoreUpgradeButton(byte[] library) {
        List<Integer> found = new ArrayList<>();
        for (int offset = 0; offset + UPGRADE_BUTTON_LENGTH <= library.length; offset += 4) {
            if (matches(library, offset, UPGRADE_BUTTON_HEAD)
                    && (readInt(library, offset + 20) >>> 26) == 0x25 // bl
                    && readInt(library, offset + 24) == NOP
                    && matches(library, offset + 28, UPGRADE_BUTTON_TAIL)) {
                found.add(offset);
            }
        }
        if (found.isEmpty() || found.size() > 2) return false;
        for (int offset : found) writeInt(library, offset + 24, TBNZ_W0_4_BUTTON);
        return true;
    }

    /** Puts back the check that lets AppController.canShowReview show the review dialog. */
    private static boolean restoreReviewPrompt(byte[] library) {
        int found = -1;
        int branch = 4 * REVIEW_CHECK_HEAD.length;
        for (int offset = 0; offset + REVIEW_CHECK_LENGTH <= library.length; offset += 4) {
            if (matches(library, offset, REVIEW_CHECK_HEAD)
                    && readInt(library, offset + branch) == B_RETURN_FALSE
                    && matches(library, offset + branch + 4, REVIEW_CHECK_TAIL)) {
                if (found != -1) return false;
                found = offset;
            }
        }
        if (found == -1) return false;
        writeInt(library, found + branch, CBNZ_X2_RETURN_FALSE);
        return true;
    }

    private static boolean matches(byte[] library, int offset, int[] words) {
        for (int i = 0; i < words.length; i++) {
            if (readInt(library, offset + 4 * i) != words[i]) return false;
        }
        return true;
    }

    /** Identifies the installed libapp.so, so a copy is made again after the app changes. */
    private static String sourceIdentity(Context context) {
        ApplicationInfo info = context.getApplicationInfo();
        File library = new File(info.nativeLibraryDir, LIBRARY);
        File file = library.isFile() ? library : new File(info.sourceDir);
        if (!file.isFile()) return null;
        return file.getAbsolutePath() + ":" + file.length() + ":" + file.lastModified();
    }

    private static byte[] readLibrary(Context context) throws IOException {
        ApplicationInfo info = context.getApplicationInfo();
        File library = new File(info.nativeLibraryDir, LIBRARY);
        if (library.isFile()) {
            try (InputStream input = new FileInputStream(library)) {
                return readAll(input);
            }
        }

        // Not extracted (extractNativeLibs="false"): read it from the APK.
        List<String> apks = new ArrayList<>();
        apks.add(info.sourceDir);
        if (info.splitSourceDirs != null) {
            for (String split : info.splitSourceDirs) apks.add(split);
        }
        for (String apk : apks) {
            try (ZipFile zip = new ZipFile(apk)) {
                for (String abi : Build.SUPPORTED_ABIS) {
                    ZipEntry entry = zip.getEntry("lib/" + abi + "/" + LIBRARY);
                    if (entry == null) continue;
                    try (InputStream input = zip.getInputStream(entry)) {
                        return readAll(input);
                    }
                }
            }
        }
        return null;
    }

    private static void deleteCopies(File directory, String keep) {
        File[] files = directory.listFiles();
        if (files == null) return;
        for (File file : files) {
            String name = file.getName();
            if (keep != null && (name.equals(keep) || name.equals(keep + ".source"))) continue;
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    private static byte[] readAll(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(16 * 1024 * 1024);
        byte[] buffer = new byte[256 * 1024];
        int read;
        while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
        return output.toByteArray();
    }

    private static String readText(File file) {
        if (!file.isFile()) return null;
        try (InputStream input = new FileInputStream(file)) {
            return new String(readAll(input), StandardCharsets.UTF_8);
        } catch (IOException e) {
            return null;
        }
    }

    private static void writeText(File file, String text) throws IOException {
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(text.getBytes(StandardCharsets.UTF_8));
        }
    }

    private static int readInt(byte[] bytes, int offset) {
        return (bytes[offset] & 0xff)
                | (bytes[offset + 1] & 0xff) << 8
                | (bytes[offset + 2] & 0xff) << 16
                | (bytes[offset + 3] & 0xff) << 24;
    }

    private static void writeInt(byte[] bytes, int offset, int value) {
        bytes[offset] = (byte) value;
        bytes[offset + 1] = (byte) (value >> 8);
        bytes[offset + 2] = (byte) (value >> 16);
        bytes[offset + 3] = (byte) (value >> 24);
    }
}
