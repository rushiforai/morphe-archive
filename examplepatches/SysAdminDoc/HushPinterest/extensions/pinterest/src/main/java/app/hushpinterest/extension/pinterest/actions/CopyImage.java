/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.Activity;
import android.app.AppOpsManager;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Process;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.LongSupplier;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Copy image (#11): puts a pin's full-size picture on the clipboard as a picture, so any app that
 * pastes images takes it. The picture comes from the same place Download pin saves it from (the
 * original behind a supplied size, found by {@link OriginalLookup}), is fetched whole through
 * {@link PinTransfer#fetch} within one 30 second budget and 64 MiB, checked by its type header
 * and its first bytes, and kept in the app's cache under {@link CopiedImages}. The clip holds an
 * address on {@link SharePreviewProvider}, which serves only that folder and only to an app the
 * clipboard hands the read grant. The newest copy stays readable until a newer one replaces it.
 * Anything copied while the picture loads is newer still, so it stays and the picture is dropped.
 *
 * <p>Nothing here runs unless Download pins is installed and on, as for its other rows.
 */
final class CopyImage {
    private CopyImage() {}

    /** Largest picture copied. */
    static final long MAX_BYTES = 64L * 1024 * 1024;

    /** One budget for the original lookup and the fetch together. */
    static final long BUDGET_MS = 30000;

    /** Tests replace them so they never reach the network or the real clock. */
    static volatile PinTransfer.Connection connection = PinTransfer.NETWORK;
    static volatile LongSupplier clock = PinTransfer.CLOCK;

    enum Result { COPIED, SKIPPED, TOO_LARGE, NOT_IMAGE, TIMED_OUT, FAILED, BUSY }

    /** What the worker made: a finished picture in the cache, or why it couldn't. */
    static final class Fetch {
        final Result result;
        @Nullable final File file;
        @Nullable final String mime;

        Fetch(Result result, @Nullable File file, @Nullable String mime) {
            this.result = result;
            this.file = file;
            this.mime = mime;
        }
    }

    /** One copy at a time: a second tap while the first fetches is told so. */
    private static final AtomicBoolean RUNNING = new AtomicBoolean();

    /** Whether the Copy image row may be offered or used. */
    static boolean active() {
        return PinDownloads.active() && PatchFamily.Capability.COPY_IMAGE.installed() && Settings.COPY_IMAGE.get();
    }

    /** True when the menu row should show for a pin: an image Download pin can save. */
    static boolean offered(PinMedia.Resolution media) {
        return active() && media != null && media.source != null && !media.source.mime.startsWith("video/");
    }

    /**
     * Starts a copy of the picture [pin] carries, read again now. True when the work was queued, so
     * the menu may close. Every failure says so in a toast and leaves the clipboard as it was.
     */
    static boolean start(Object pin, Context context) {
        if (!active()) return false;
        try {
            PinMedia.Resolution media = PinMedia.resolve(pin);
            if (media == null || context == null) return false;
            if (!offered(media)) {
                report(Result.FAILED);
                return false;
            }
            Context app = context.getApplicationContext();
            if (!SharePreviewProvider.serves(app)) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "copy image provider missing");
                report(Result.FAILED);
                return false;
            }
            // Taken at the tap, while Pinterest has focus and Android lets it read the clipboard, and
            // before the copy counts as running, so nothing here can leave it running.
            Mark asked = Mark.read(app);
            if (!RUNNING.compareAndSet(false, true)) {
                report(Result.BUSY);
                return false;
            }
            boolean queued = Utils.runOnBackgroundThread(() -> {
                Fetch made;
                try {
                    made = fetch(app, media);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "fetch image to copy", failure);
                    made = new Fetch(Result.FAILED, null, null);
                }
                Fetch done = made;
                Utils.runOnMainThread(() -> {
                    Result shown = Result.FAILED;
                    try {
                        shown = publish(app, done, asked);
                    } finally {
                        // Deleting is disk work, so it goes back to a worker, and the next copy waits
                        // for it: the sweep would take that copy's part file too.
                        Result settled = shown;
                        if (!Utils.runOnBackgroundThread(() -> {
                            try {
                                settle(done, settled);
                            } finally {
                                RUNNING.set(false);
                            }
                        })) {
                            RUNNING.set(false);
                        }
                    }
                });
            });
            if (!queued) {
                RUNNING.set(false);
                report(Result.FAILED);
            }
            return queued;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "start image copy", failure);
            report(Result.FAILED);
            return false;
        }
    }

    /**
     * Fetches the picture into the cache and checks it. Worker threads only. A file comes back only
     * for {@link Result#COPIED}; every other answer leaves nothing of this copy behind.
     */
    static Fetch fetch(Context app, PinMedia.Resolution media) {
        return fetch(media, CopiedImages.dir(app));
    }

    /** The same into [dir], one of {@link CopiedImages}' folders. Share image fetches into its own. */
    static Fetch fetch(PinMedia.Resolution media, @Nullable File dir) {
        long began = clock.getAsLong();
        if (dir == null) return new Fetch(Result.FAILED, null, null);
        CopiedImages.clearParts(dir);
        PinMedia.Source source = media.source;
        if (source == null) return new Fetch(Result.FAILED, null, null);
        if (PinMedia.standIn(media)) {
            long left = BUDGET_MS - (clock.getAsLong() - began);
            source = OriginalLookup.look(source, clock, Math.max(0, Math.min(OriginalLookup.DEADLINE_MS, left))).source;
        }
        long left = BUDGET_MS - (clock.getAsLong() - began);
        if (left <= 0) return new Fetch(Result.TIMED_OUT, null, null);
        String id = UUID.randomUUID().toString().replace("-", "");
        File part = new File(dir, CopiedImages.partName(id));
        try {
            PinTransfer.Fetched got = PinTransfer.fetch(source, part, MAX_BYTES, CopyImage::imageType, connection, clock, left);
            if (got.status != 200) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy refused by media host");
                return new Fetch(Result.FAILED, null, null);
            }
            // A 200 that kept nothing was turned away by its type, or had no body.
            String declared = imageType(got.type) ? canonical(got.type) : null;
            String shown = got.written == 0 ? null : sniff(part);
            if (declared == null || shown == null || !declared.equals(shown)) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy not an image");
                return new Fetch(Result.NOT_IMAGE, null, null);
            }
            File finished = new File(dir, id + CopiedImages.extension(shown));
            if (!part.renameTo(finished)) return new Fetch(Result.FAILED, null, null);
            return new Fetch(Result.COPIED, finished, shown);
        } catch (PinTransfer.TooLarge tooLarge) {
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy too large");
            return new Fetch(Result.TOO_LARGE, null, null);
        } catch (SocketTimeoutException slow) {
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy timed out");
            return new Fetch(Result.TIMED_OUT, null, null);
        } catch (IOException | RuntimeException failure) {
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy failed");
            return new Fetch(Result.FAILED, null, null);
        } finally {
            if (part.exists() && !part.delete()) part.deleteOnExit();
        }
    }

    /**
     * Sets the clip for a finished picture and says so, or says why not. Main thread, and no disk
     * work: {@link #settle} deletes files afterwards on a worker. The clipboard changes only here,
     * after the file is in place, only to the new picture, and only while it still holds what
     * [asked] saw at the tap: a copy made while the picture loaded is newer, so it stays.
     */
    static Result publish(Context app, Fetch fetched, @Nullable Mark asked) {
        File file = fetched.file;
        if (fetched.result != Result.COPIED || file == null) {
            report(fetched.result);
            return fetched.result;
        }
        try {
            // Switched off or paused while it fetched: no clip.
            if (!active()) return Result.SKIPPED;
            if (!unchanged(app, asked)) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copy kept a newer clip");
                Utils.showToastLong(L10n.t("The image wasn't copied, since the clipboard may have changed."));
                return Result.SKIPPED;
            }
            Uri uri = SharePreviewProvider.clipUri(app, file.getName());
            ClipboardManager clipboard = (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
            if (uri == null || clipboard == null || fetched.mime == null) throw new IllegalStateException("No clip target");
            ClipData clip = new ClipData(new ClipDescription(L10n.t("Pin image"), new String[]{fetched.mime}),
                    new ClipData.Item(uri));
            clipboard.setPrimaryClip(clip);
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "image copied");
            // Android 13 and newer show their own confirmation for every copy.
            if (Build.VERSION.SDK_INT < 33) Utils.showToastShort(L10n.t("Image copied."));
            return Result.COPIED;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "set image clip", failure);
            report(Result.FAILED);
            return Result.FAILED;
        }
    }

    /**
     * Worker threads only, after {@link #publish} answered [shown]. A picture now on the clipboard
     * becomes the folder's only one, so the replaced copy goes; a picture that never reached the
     * clipboard is deleted itself, and the last clip's file stays readable.
     */
    static void settle(Fetch fetched, Result shown) {
        File file = fetched.file;
        if (file == null) return;
        try {
            File dir = file.getParentFile();
            if (shown == Result.COPIED) {
                if (dir != null) CopiedImages.keepOnly(dir, file.getName());
            } else if (file.exists() && !file.delete()) {
                file.deleteOnExit();
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "tidy copied images", failure);
        }
    }

    /**
     * What the clipboard held at the tap, told by its description alone: the time Android stamped
     * on the clip, its label and its types. Never what the clip holds. It lives in memory for one
     * comparison and is never logged or kept. Reading a description isn't a paste, so Android 12
     * and newer show no paste notice for it.
     */
    static final class Mark {
        final boolean held;
        final long stamp;
        @Nullable final String label;
        final List<String> types;

        private Mark(@Nullable ClipDescription description) {
            held = description != null;
            stamp = description == null ? 0 : description.getTimestamp();
            CharSequence named = description == null ? null : description.getLabel();
            label = named == null ? null : named.toString();
            List<String> found = new ArrayList<>();
            int count = description == null ? 0 : description.getMimeTypeCount();
            for (int i = 0; i < count; i++) found.add(description.getMimeType(i));
            types = found;
        }

        /** The clipboard now, or null when it can't be asked at all. */
        @Nullable
        static Mark read(Context app) {
            try {
                ClipboardManager clipboard = (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
                return clipboard == null ? null : new Mark(clipboard.getPrimaryClipDescription());
            } catch (RuntimeException refused) {
                return null;
            }
        }

        boolean sameClip(Mark other) {
            return held && other.held && stamp == other.stamp && Objects.equals(label, other.label)
                    && types.equals(other.types);
        }
    }

    /**
     * Whether the clipboard still holds the clip [asked] saw, so the picture may replace it.
     * Android answers an app without focus, or one its clipboard app op turns away, as if the
     * clipboard were empty, so an empty clipboard counts as unchanged only while Pinterest's screen
     * has focus and the app op lets it read. Anything it can't tell counts as changed: the picture
     * is dropped rather than put over a copy made since.
     */
    static boolean unchanged(Context app, @Nullable Mark asked) {
        if (asked == null) return false;
        Mark now = Mark.read(app);
        if (now == null || now.held != asked.held) return false;
        if (now.held) return now.sameClip(asked);
        Activity screen = Utils.getActivity();
        return screen != null && screen.hasWindowFocus() && mayRead(app);
    }

    /** The app op Android's clipboard checks after focus. Its name isn't in the public SDK. */
    private static final String READ_CLIPBOARD_OP = "android:read_clipboard";

    /** Whether the clipboard app op lets Pinterest read, as Android checks it. No answer counts as no. */
    private static boolean mayRead(Context app) {
        try {
            AppOpsManager ops = (AppOpsManager) app.getSystemService(Context.APP_OPS_SERVICE);
            return ops != null && ops.unsafeCheckOpNoThrow(READ_CLIPBOARD_OP, Process.myUid(), app.getPackageName())
                    == AppOpsManager.MODE_ALLOWED;
        } catch (RuntimeException unknown) {
            return false;
        }
    }

    private static void report(Result result) {
        switch (result) {
            case TOO_LARGE:
                Utils.showToastLong(L10n.t("That image is too big to copy."));
                break;
            case NOT_IMAGE:
                Utils.showToastLong(L10n.t("Pinterest didn't send a usable image."));
                break;
            case TIMED_OUT:
                Utils.showToastLong(L10n.t("Copying the image took too long. Try again."));
                break;
            case BUSY:
                Utils.showToastShort(L10n.t("Still copying the last image."));
                break;
            case FAILED:
                Utils.showToastLong(L10n.t("Couldn't copy the image. Check your connection and try again."));
                break;
            default:
                break;
        }
    }

    /** True for the four picture types the clip may carry, as the media host's Content-Type names them. */
    static boolean imageType(@Nullable String header) {
        return canonical(header) != null;
    }

    /** The picture type a Content-Type header names, with image/jpg read as JPEG, or null. */
    @Nullable
    static String canonical(@Nullable String header) {
        if (header == null) return null;
        String type = header.split(";", 2)[0].trim().toLowerCase(Locale.ROOT);
        if (type.equals("image/jpg")) return "image/jpeg";
        return CopiedImages.extension(type) == null ? null : type;
    }

    /** The picture type the first bytes of [file] show, or null when they show none of the four. */
    @Nullable
    static String sniff(File file) throws IOException {
        byte[] head = new byte[12];
        int filled = 0;
        try (InputStream in = new FileInputStream(file)) {
            while (filled < head.length) {
                int read = in.read(head, filled, head.length - filled);
                if (read < 0) break;
                filled += read;
            }
        }
        return sniff(head, filled);
    }

    @Nullable
    static String sniff(byte[] b, int n) {
        if (n >= 3 && (b[0] & 0xff) == 0xff && (b[1] & 0xff) == 0xd8 && (b[2] & 0xff) == 0xff) return "image/jpeg";
        if (n >= 8 && (b[0] & 0xff) == 0x89 && b[1] == 'P' && b[2] == 'N' && b[3] == 'G'
                && b[4] == 0x0d && b[5] == 0x0a && b[6] == 0x1a && b[7] == 0x0a) return "image/png";
        if (n >= 6) {
            String start = new String(b, 0, 6, StandardCharsets.US_ASCII);
            if (start.equals("GIF87a") || start.equals("GIF89a")) return "image/gif";
        }
        if (n >= 12 && new String(b, 0, 4, StandardCharsets.US_ASCII).equals("RIFF")
                && new String(b, 8, 4, StandardCharsets.US_ASCII).equals("WEBP")) return "image/webp";
        return null;
    }
}
