/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/**
 * Swaps Tumblr's own font for the phone's, or for a font file the person chose.
 *
 * <p>Every font resource Tumblr loads goes through one method of AndroidX's ResourcesCompat, View
 * text and Compose text alike, so {@link #replacement} sits at its start and answers for Favorit,
 * Tumblr's interface font. The fonts a post's author can pick (Calluna, Clearface and the rest) are
 * other resources, so they stay. What's left is the Roboto Tumblr asks the system for by name. That's
 * already the phone's font, so {@link #provided} only steps in when there's a chosen file. The rows
 * the dashboard inflates ahead of time are built without AppCompat, so Android itself loads their
 * fonts and {@link #preinflated} changes them as they're handed over.
 *
 * <p>Only the Typeface changes, so a text's spans, links and size stay, and a glyph the chosen font
 * doesn't have falls back to the system's. Tumblr keeps the fonts it loaded for as long as it runs,
 * so a change shows after a restart.
 */
public final class AppFont {
    private AppFont() {}

    /** Favorit's resources, each with the weight it draws at. */
    private static final String[] INTERFACE_FONTS =
            {"favorit_tumblr", "favorit_tumblr_regular_400", "favorit_tumblr_medium", "favorit_tumblr_bold_700"};
    private static final int[] WEIGHTS = {400, 400, 500, 700};
    private static final int MEDIUM = 500;
    private static final int BOLD = 700;

    /** What the report counts. */
    static final String SWAPPED = "font swapped";

    /** Where the chosen file lives, inside Tumblr's private storage. */
    private static final String FOLDER = "hushtumblr_font";
    private static final String FILE = "font";
    private static final String INCOMING = "font.incoming";

    /** Larger than the large CJK fonts, and small enough that a stray pick can't fill the phone. */
    private static final long MOST_BYTES = 64L * 1024 * 1024;

    /** How many leading bytes of a file's hash go in front of its name in the saved value. */
    private static final int HASH_BYTES = 8;

    /** How much of a file's name is kept for its row. */
    private static final int LONGEST_NAME = 80;

    /** Favorit's resource ids in the order of {@link #INTERFACE_FONTS}, looked up once. */
    @Nullable
    static volatile int[] interfaceFontIds;

    private static final Map<Integer, Typeface> FACES = new ConcurrentHashMap<>();

    /** Why a chosen file wasn't taken. Its message is the toast, and never names the file. */
    public static final class Refused extends Exception {
        Refused(String message) {
            super(message);
        }
    }

    /**
     * Placed first in the method every font resource loads through. Answers the face to use in place
     * of font [id], or null to let Tumblr load its own. Never throws.
     */
    @Nullable
    public static Typeface replacement(Context context, int id) {
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.FONT_CHOICE.installed()) return null;
            HookStatus.invoked(FamilyNames.APP_FONT);
            if (!Settings.APP_FONT.get()) return null;
            int weight = interfaceWeight(context, id);
            if (weight == 0) return null;
            HookStatus.counted(FamilyNames.APP_FONT, SWAPPED);
            return face(context, weight);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_FONT, "font resource", failure);
            return null;
        }
    }

    /**
     * Placed where Tumblr's font picker answers with Roboto, the phone's own. A chosen file takes its
     * place at the same weight, and without one the answer comes back as it was. Never throws.
     */
    public static Typeface provided(Typeface tumblrs) {
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.FONT_CHOICE.installed()) return tumblrs;
            HookStatus.invoked(FamilyNames.APP_FONT);
            if (!Settings.APP_FONT.get() || tumblrs == null) return tumblrs;
            Context context = Utils.getContext();
            if (context == null || chosenFile(context) == null) return tumblrs;
            return face(context, weightOf(tumblrs));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_FONT, "system font", failure);
            return tumblrs;
        }
    }

    /**
     * Placed where the dashboard hands over a row it inflated ahead of time. That inflater has no
     * AppCompat, so the row's text views got their fonts from Android and never reached
     * {@link #replacement}. Never throws.
     */
    public static void preinflated(View row) {
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.FONT_CHOICE.installed()) return;
            HookStatus.invoked(FamilyNames.APP_FONT);
            if (!Settings.APP_FONT.get() || row == null) return;
            Context context = row.getContext();
            int[] ids = interfaceFontIds(context);
            Typeface[] tumblrs = new Typeface[ids.length];
            for (int at = 0; at < ids.length; at++) {
                if (ids[at] != 0) tumblrs[at] = context.getResources().getFont(ids[at]);
            }
            restyle(row, tumblrs, context);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_FONT, "inflated row", failure);
        }
    }

    /** Swaps the face of every text view under [view] that draws in one of [tumblrs], in the order of {@link #WEIGHTS}. */
    static void restyle(View view, Typeface[] tumblrs, Context context) {
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int at = 0; at < group.getChildCount(); at++) restyle(group.getChildAt(at), tumblrs, context);
        } else if (view instanceof TextView) {
            TextView text = (TextView) view;
            Typeface drawn = text.getTypeface();
            int weight = drawn == null ? 0 : weightAmong(tumblrs, drawn);
            if (weight == 0) return;
            HookStatus.counted(FamilyNames.APP_FONT, SWAPPED);
            text.setTypeface(face(context, weight), drawn.getStyle());
        }
    }

    /** The weight [drawn] has when it's one of [tumblrs], bold or italic on top or not, or 0. Android keeps one object per font and style. */
    private static int weightAmong(Typeface[] tumblrs, Typeface drawn) {
        for (int at = 0; at < tumblrs.length; at++) {
            Typeface own = tumblrs[at];
            if (own != null && (drawn == own || drawn == Typeface.create(own, drawn.getStyle()))) return WEIGHTS[at];
        }
        return 0;
    }

    /**
     * Copies a chosen font into place and answers what to save as {@link TextSettings#APP_FONT_FILE}:
     * a short hash, so another file under the same name still counts as a change, and the file's
     * name for its row. The file in use stays until the new one has passed.
     */
    public static String install(Context context, InputStream source, @Nullable String name) throws IOException, Refused {
        return install(context, source, name, MOST_BYTES);
    }

    static String install(Context context, InputStream source, @Nullable String name, long mostBytes) throws IOException, Refused {
        File folder = new File(context.getFilesDir(), FOLDER);
        if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("no font folder");
        File incoming = new File(folder, INCOMING);
        try {
            String hash = copy(source, incoming, mostBytes);
            if (!isFont(incoming)) throw new Refused(L10n.t("That isn't a font file. Nothing changed."));
            Files.move(incoming.toPath(), new File(folder, FILE).toPath(), StandardCopyOption.ATOMIC_MOVE);
            return hash + " " + tidyName(name);
        } finally {
            // Already gone once it's in place.
            //noinspection ResultOfMethodCallIgnored
            incoming.delete();
        }
    }

    /** Deletes the chosen file. A leftover one does nothing, as an empty saved value stops it being read. */
    public static void forget(Context context) {
        //noinspection ResultOfMethodCallIgnored
        new File(new File(context.getFilesDir(), FOLDER), FILE).delete();
    }

    /** The name in a value {@link #install} answered, or an empty string when no file is chosen. */
    public static String shownName(String saved) {
        return saved.substring(saved.indexOf(' ') + 1);
    }

    /** Copies at most [mostBytes] and answers the start of the file's hash. */
    private static String copy(InputStream source, File target, long mostBytes) throws IOException, Refused {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException missing) {
            throw new IOException(missing);
        }
        long total = 0;
        byte[] buffer = new byte[64 * 1024];
        try (OutputStream out = new FileOutputStream(target)) {
            for (int read = source.read(buffer); read != -1; read = source.read(buffer)) {
                total += read;
                if (total > mostBytes) throw new Refused(L10n.t("That file is too big to be a font."));
                digest.update(buffer, 0, read);
                out.write(buffer, 0, read);
            }
        }
        byte[] hash = digest.digest();
        StringBuilder hex = new StringBuilder();
        for (int at = 0; at < HASH_BYTES; at++) hex.append(String.format("%02x", hash[at]));
        return hex.toString();
    }

    /**
     * Whether [file] opens as a font. The header is checked first, as older phones are happy to hand
     * back a Typeface for very little. Android 9 and up answer an unreadable file with the default
     * face, and older ones throw.
     */
    static boolean isFont(File file) throws IOException {
        if (!hasFontHeader(file)) return false;
        try {
            Typeface read = Typeface.createFromFile(file);
            return read != null && read != Typeface.DEFAULT;
        } catch (RuntimeException unreadable) {
            return false;
        }
    }

    /** TrueType, OpenType with PostScript outlines, Apple's TrueType tag, or a TrueType collection. */
    private static boolean hasFontHeader(File file) throws IOException {
        byte[] start = new byte[4];
        try (InputStream in = new FileInputStream(file)) {
            int got = 0;
            while (got < start.length) {
                int read = in.read(start, got, start.length - got);
                if (read == -1) return false;
                got += read;
            }
        }
        if (start[0] == 0 && start[1] == 1 && start[2] == 0 && start[3] == 0) return true;
        String tag = new String(start, StandardCharsets.ISO_8859_1);
        return tag.equals("OTTO") || tag.equals("true") || tag.equals("ttcf");
    }

    /** A file's name on one line and not too long. One with no name still needs something to show. */
    private static String tidyName(@Nullable String name) {
        String tidy = name == null ? "" : name.replaceAll("\\s+", " ").trim();
        if (tidy.isEmpty()) return "font";
        return tidy.length() <= LONGEST_NAME ? tidy : tidy.substring(0, LONGEST_NAME);
    }

    /** The weight font [id] draws at, or 0 when it isn't one of Favorit's. */
    private static int interfaceWeight(Context context, int id) {
        int[] ids = interfaceFontIds(context);
        for (int at = 0; at < ids.length; at++) if (ids[at] != 0 && ids[at] == id) return WEIGHTS[at];
        return 0;
    }

    // The fonts' names are kept, so they have no R field here.
    @SuppressWarnings("DiscouragedApi")
    private static int[] interfaceFontIds(Context context) {
        int[] known = interfaceFontIds;
        if (known != null) return known;
        Resources resources = context.getResources();
        known = new int[INTERFACE_FONTS.length];
        for (int at = 0; at < known.length; at++) {
            known[at] = resources.getIdentifier(INTERFACE_FONTS[at], "font", context.getPackageName());
            if (known[at] == 0) HookStatus.missingMember(FamilyNames.APP_FONT, "font", "resources", INTERFACE_FONTS[at]);
        }
        interfaceFontIds = known;
        return known;
    }

    /** The chosen file, or null when none is chosen or it's gone. */
    @Nullable
    private static File chosenFile(Context context) {
        if (TextSettings.APP_FONT_FILE.get().isEmpty()) return null;
        File file = new File(new File(context.getFilesDir(), FOLDER), FILE);
        return file.isFile() ? file : null;
    }

    private static Typeface face(Context context, int weight) {
        Typeface known = FACES.get(weight);
        if (known != null) return known;
        Typeface made = atWeight(base(context), weight);
        FACES.put(weight, made);
        return made;
    }

    /** The chosen file's face, or the phone's when there's no file or it stopped opening. */
    private static Typeface base(Context context) {
        File file = chosenFile(context);
        if (file == null) return Typeface.DEFAULT;
        try {
            Typeface read = Typeface.createFromFile(file);
            return read != null ? read : Typeface.DEFAULT;
        } catch (RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.APP_FONT, "font file", unreadable);
            return Typeface.DEFAULT;
        }
    }

    private static Typeface atWeight(Typeface base, int weight) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) return Typeface.create(base, weight, false);
        if (weight >= BOLD) return Typeface.create(base, Typeface.BOLD);
        return base == Typeface.DEFAULT && weight >= MEDIUM ? Typeface.create("sans-serif-medium", Typeface.NORMAL) : base;
    }

    private static int weightOf(Typeface typeface) {
        int weight = Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ? typeface.getWeight() : 0;
        if (weight > 0) return weight;
        return typeface.isBold() ? BOLD : WEIGHTS[0];
    }

    /** Forgets every face made so far, as a restart of Tumblr would. */
    static void clearForTests() {
        FACES.clear();
        interfaceFontIds = null;
    }
}
