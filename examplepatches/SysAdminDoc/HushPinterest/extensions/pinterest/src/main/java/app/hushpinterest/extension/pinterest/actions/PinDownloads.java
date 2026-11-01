/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.PersistableBundle;
import android.text.format.Formatter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.HushDialogs;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Adds a native Download row to the pin overflow menu, using media the pin already carries. */
public final class PinDownloads {
    private PinDownloads() {}

    static final String ROW_TAG = "hushpinterest_download_pin";
    private static final String DETAILS_TAG = "hushpinterest_pin_media_details";
    static final String COPY_TAG = "hushpinterest_copy_media_link";
    static final String COPY_IMAGE_TAG = "hushpinterest_copy_image";
    static final String SHARE_IMAGE_TAG = "hushpinterest_share_image";

    /** Pinterest's own Download image rows, marked as the native menu builds them. Weak, so closed menus go. */
    private static final Map<View, Boolean> nativeDownloads = Collections.synchronizedMap(new WeakHashMap<>());

    /** Rewritten by the patch to read the controller's private pin through a generated bridge. */
    private static Object menuPin(Object controller) { return null; }

    /** Rewritten to return Pinterest's native overflow menu layout. */
    private static ViewGroup menuView(Object controller) { return null; }

    private static View menuOrigin(Object controller) { return null; }

    private static boolean menuCloseup(Object controller) { return true; }

    /** Rewritten to read only the typed pin model held by a native grid cell. */
    static Object cellPin(View cell) { return null; }

    /** Rewritten to call the native row factory with Pinterest's Download icon. */
    private static View menuRow(ViewGroup layout, String title) { return null; }

    /** Rewritten to call the menu presenter's own dismissal event through a generated bridge. */
    private static void dismissMenu(Object controller) {}

    /** Rewritten to read the pin from the overflow sheet's menu data. */
    private static Object sheetPin(Object sheet) { return null; }

    /** Rewritten to return the list the overflow sheet adds its rows to. */
    private static ViewGroup sheetView(Object sheet) { return null; }

    private static View sheetOrigin(Object sheet) { return null; }

    private static boolean sheetCloseup(Object sheet) { return true; }

    /** Rewritten to call the sheet's own row factory with Pinterest's Download icon. */
    private static View sheetRow(Object sheet, String title) { return null; }

    /** Rewritten to call the method the sheet's presenter closes it with before each of its own actions. */
    private static void dismissSheet(Object sheet) {}

    static boolean active() {
        return Utils.settingsReady() && PatchFamily.Capability.PIN_DOWNLOADS.installed() && Settings.DOWNLOAD_PINS.get();
    }

    public static void attach(Object controller) {
        attach(controller, false);
    }

    /**
     * The same rows for the full-screen overflow sheet a pin's closeup opens in place of the menu above
     * when Pinterest's android_overflow_gestalt_sheet experiment is on (#2). Called as the sheet finishes
     * building its rows.
     */
    public static void attachSheet(Object sheet) {
        attach(sheet, true);
    }

    private static View row(Object controller, boolean sheet, ViewGroup layout, String title) {
        return sheet ? sheetRow(controller, title) : menuRow(layout, title);
    }

    private static void dismiss(Object controller, boolean sheet) {
        if (sheet) dismissSheet(controller); else dismissMenu(controller);
    }

    private static void attach(Object controller, boolean sheet) {
        HookStatus.invoked(FamilyNames.DOWNLOAD_PINS);
        if (!active()) return;
        try {
            Object pin = sheet ? sheetPin(controller) : menuPin(controller);
            ViewGroup layout = sheet ? sheetView(controller) : menuView(controller);
            PinMedia.Resolution media = PinMedia.resolve(pin);
            if (layout == null || layout.findViewWithTag(ROW_TAG) != null || media == null) return;
            boolean supported = media.source != null;
            String title = supported ? L10n.t("Download pin") : L10n.t("Download unavailable");
            View row = row(controller, sheet, layout, title);
            if (row == null) return;
            row.setTag(ROW_TAG);
            row.setFocusable(true);
            row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            row.setContentDescription(supported ? title : title + ". " + refusalMessage(media.refusal));
            // The menu takes a moment to close, and a second tap in that time would queue the pin again.
            AtomicBoolean started = new AtomicBoolean();
            row.setOnClickListener(ignored -> {
                if (!active() || started.get()) return;
                if (!supported) { showDetails(media); return; }
                try {
                    if (start(pin, layout.getContext())) {
                        started.set(true);
                        dismiss(controller, sheet);
                    }
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "dismiss download menu", failure);
                }
            });
            // The sheet opens with its own header rows, so its Hush rows take the native Download row's place.
            int at = sheet ? nativeIndex(layout) : 0;
            layout.addView(row, at);
            // For a video, Download pin saves the video and not a still image, so Pinterest's row stays.
            if (supported && !media.source.mime.startsWith("video/")) hideNativeDownload(layout);
            boolean closeup = sheet ? sheetCloseup(controller) : menuCloseup(controller);
            ViewGroup grid = closeup ? null
                : GridDownloads.grid(sheet ? sheetOrigin(controller) : menuOrigin(controller), pin);
            if (grid != null) {
                String batchTitle = L10n.t("Download visible pins");
                View batch = row(controller, sheet, layout, batchTitle);
                if (batch != null) {
                    batch.setFocusable(true);
                    batch.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                    batch.setContentDescription(batchTitle);
                    batch.setOnClickListener(ignored -> {
                        if (active() && GridDownloads.grid(grid, pin) == grid && GridDownloads.show(grid)) dismiss(controller, sheet);
                    });
                    layout.addView(batch, at + 1);
                }
            }
            if (supported) {
                String detailsTitle = L10n.t("Media details");
                View details = row(controller, sheet, layout, detailsTitle);
                if (details != null) {
                    details.setTag(DETAILS_TAG);
                    details.setFocusable(true);
                    details.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                    details.setContentDescription(detailsTitle);
                    details.setOnClickListener(ignored -> { if (active()) showDetails(media); });
                    layout.addView(details, at + 1);
                }
                String copyTitle = L10n.t("Copy media link");
                View copy = row(controller, sheet, layout, copyTitle);
                if (copy != null) {
                    copy.setTag(COPY_TAG);
                    copy.setFocusable(true);
                    copy.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                    copy.setContentDescription(copyTitle);
                    copy.setOnClickListener(ignored -> {
                        try {
                            if (copyLink(pin, layout.getContext())) dismiss(controller, sheet);
                        } catch (Throwable failure) {
                            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "dismiss copy menu", failure);
                        }
                    });
                    layout.addView(copy, at + 1);
                }
                // Under Copy image, added first so Copy image lands above it. Images only, and off by default.
                if (ShareImage.offered(media)) {
                    String shareTitle = L10n.t("Share image");
                    View share = row(controller, sheet, layout, shareTitle);
                    if (share != null) {
                        share.setTag(SHARE_IMAGE_TAG);
                        share.setFocusable(true);
                        share.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                        share.setContentDescription(shareTitle);
                        // Same guard as Copy image: a tap while the menu closes would fetch the picture twice.
                        AtomicBoolean sharing = new AtomicBoolean();
                        share.setOnClickListener(ignored -> {
                            if (!ShareImage.active() || sharing.get()) return;
                            try {
                                if (ShareImage.start(pin, layout.getContext())) {
                                    sharing.set(true);
                                    dismiss(controller, sheet);
                                }
                            } catch (Throwable failure) {
                                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "dismiss share image menu", failure);
                            }
                        });
                        layout.addView(share, at + 1);
                        HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "share image row added to pin menu");
                    }
                }
                // Right under Download pin. A video has no picture to copy, and the switch starts off.
                if (CopyImage.offered(media)) {
                    String imageTitle = L10n.t("Copy image");
                    View image = row(controller, sheet, layout, imageTitle);
                    if (image != null) {
                        image.setTag(COPY_IMAGE_TAG);
                        image.setFocusable(true);
                        image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                        image.setContentDescription(imageTitle);
                        // The menu takes a moment to close, and a second tap in that time would start a second copy.
                        AtomicBoolean copying = new AtomicBoolean();
                        image.setOnClickListener(ignored -> {
                            if (!CopyImage.active() || copying.get()) return;
                            try {
                                if (CopyImage.start(pin, layout.getContext())) {
                                    copying.set(true);
                                    dismiss(controller, sheet);
                                }
                            } catch (Throwable failure) {
                                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "dismiss copy image menu", failure);
                            }
                        });
                        layout.addView(image, at + 1);
                        HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "copy image row added to pin menu");
                    }
                }
            }
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, supported ? "download row added to pin menu" : "download explanation added to pin menu");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "attach download row", failure);
        }
    }

    /**
     * Called by the patch with the row Pinterest built for its own Download image action. Only a
     * menu that Download pin is going to join needs the row remembered, so the switch gates it the
     * way it gates {@link #attach}, and the dex contract sees the family control it asks of every hook.
     */
    public static void nativeRow(View row) {
        if (!active()) return;
        try {
            if (row != null) nativeDownloads.put(row, Boolean.TRUE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "mark Pinterest's download row", failure);
        }
    }

    /**
     * With Download pin saving an image, Pinterest's own Download image row repeats it (#2). GONE leaves
     * its model and click handler untouched.
     */
    private static int nativeIndex(ViewGroup layout) {
        for (int i = 0; i < layout.getChildCount(); i++) {
            if (nativeDownloads.containsKey(layout.getChildAt(i))) return i;
        }
        return 0;
    }

    private static void hideNativeDownload(ViewGroup layout) {
        for (int i = 0; i < layout.getChildCount(); i++) {
            View child = layout.getChildAt(i);
            if (child.getVisibility() != View.GONE && nativeDownloads.containsKey(child)) {
                child.setVisibility(View.GONE);
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "Pinterest's download row replaced");
            }
        }
    }

    private static void showDetails(PinMedia.Resolution media) {
        try {
            Activity activity = Utils.getActivity();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                throw new IllegalStateException("Activity unavailable");
            }
            // Facts an earlier check found are shown again until they expire. Opening never asks.
            FileCheck.Facts known = FileCheck.known(media);
            boolean checkable = known == null && FileCheck.checkable(media);
            AlertDialog.Builder builder = HushDialogs.builder(activity)
                    .setTitle(L10n.t("Media details"))
                    .setMessage(detailsText(activity, media, known, false))
                    .setPositiveButton(L10n.t("Close"), (dialog, which) -> dialog.dismiss());
            // Its listener is replaced once the dialog shows, so a tap checks without closing it.
            if (checkable) builder.setNeutralButton(L10n.t("Check the file"), null);
            AlertDialog details = builder.create();
            details.show();
            HushDialogs.paint(details);
            if (checkable) offerCheck(activity, details, media);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "show supplied media details", failure);
            Utils.showToastLong(L10n.t("Couldn't show the media details. Open the pin again and retry."));
        }
    }

    /**
     * The details' text. Each value says where it came from: supplied by Pinterest, checked from
     * the file, or unknown. [checked] replaces the supplied values, and [failed] says a check
     * didn't work, above the supplied ones.
     */
    static String detailsText(Context context, PinMedia.Resolution media, @Nullable FileCheck.Facts checked, boolean failed) {
        StringBuilder text = new StringBuilder();
        if (media.refusal != null) text.append(refusalMessage(media.refusal)).append("\n\n");
        if (checked != null) {
            text.append(L10n.t("These details were checked from the first part of the file. "
                    + "HushPinterest didn't download the whole file."))
                    .append("\n\n").append(L10n.f("Width: %s", fromFile(L10n.f("%d pixels", checked.width))))
                    .append("\n").append(L10n.f("Height: %s", fromFile(L10n.f("%d pixels", checked.height))))
                    .append("\n").append(L10n.f("File type: %s", fromFile(checked.mime)))
                    .append("\n").append(L10n.f("File size: %s", checked.size == null ? L10n.t("Unknown")
                            : fromFile(Formatter.formatFileSize(L10n.localized(context), checked.size))))
                    // A stand-in whose original the media host didn't give was checked as itself.
                    .append("\n").append(PinMedia.standIn(media) && checked.url.equals(media.source.url)
                            ? L10n.f("Checked file: the %s size Pinterest supplied", media.size)
                            : L10n.t("Checked file: the original image"));
            return text.toString();
        }
        text.append(failed ? L10n.t("Couldn't check the file, so these are still the details Pinterest supplied.")
                : L10n.t("These details come from the link and file information Pinterest gave the app. "
                + "HushPinterest hasn't opened the file to check them."));
        text.append("\n\n").append(L10n.f("Width: %s", media.width == null ? L10n.t("Unknown")
                        : supplied(L10n.f("%d pixels", media.width))))
                .append("\n").append(L10n.f("Height: %s", media.height == null ? L10n.t("Unknown")
                        : supplied(L10n.f("%d pixels", media.height))))
                .append("\n").append(L10n.f("Link type: %s", media.urlType == null ? L10n.t("Unknown")
                        : supplied(media.urlType)));
        if (media.source != null && media.size != null) text.append("\n").append(PinMedia.standIn(media)
                ? L10n.f("Size: %s. Downloads look for the original first.", media.size)
                : L10n.t("Size: the original image"));
        // Pinterest never says how big the file is. Only a check can.
        if (FileCheck.checkable(media)) text.append("\n").append(L10n.f("File size: %s", L10n.t("Unknown")));
        return text.toString();
    }

    private static String supplied(String value) {
        return L10n.f("%s, supplied by Pinterest", value);
    }

    private static String fromFile(String value) {
        return L10n.f("%s, checked from the file", value);
    }

    /**
     * Check the file reads the start of the file a download would save, on a worker thread, and
     * puts what it found in the open details. Only this tap asks the media host: opening the menu
     * or the details, sharing and downloading never do.
     */
    private static void offerCheck(Activity activity, AlertDialog details, PinMedia.Resolution media) {
        Button check = details.getButton(AlertDialog.BUTTON_NEUTRAL);
        if (check == null) return;
        // A tap already queued reaches the listener even after the button is disabled.
        AtomicBoolean running = new AtomicBoolean();
        check.setOnClickListener(ignored -> {
            if (!running.compareAndSet(false, true)) return;
            if (!active()) {
                checked(activity, details, media, null, running);
                return;
            }
            check.setEnabled(false);
            check.setText(L10n.t("Checking the file"));
            boolean queued = Utils.runOnBackgroundThread(() -> {
                FileCheck.Facts[] found = new FileCheck.Facts[1];
                try {
                    // Switched off or paused since the tap: no request.
                    if (active()) found[0] = FileCheck.check(media);
                } catch (IOException unanswered) {
                    HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "media file check failed");
                } catch (RuntimeException failure) {
                    HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "check media file", failure);
                } finally {
                    Utils.runOnMainThread(() -> checked(activity, details, media, found[0], running));
                }
            });
            if (!queued) checked(activity, details, media, null, running);
        });
    }

    /** Shows what a check found, or that it didn't work. Nothing once the details or the screen have closed. */
    private static void checked(Activity activity, AlertDialog details, PinMedia.Resolution media,
                                @Nullable FileCheck.Facts facts, AtomicBoolean running) {
        try {
            if (activity.isFinishing() || activity.isDestroyed() || !details.isShowing()) return;
            details.setMessage(detailsText(activity, media, facts, facts == null));
            Button check = details.getButton(AlertDialog.BUTTON_NEUTRAL);
            if (facts != null) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "media file checked");
                if (check != null) check.setVisibility(View.GONE);
                return;
            }
            if (check != null) {
                check.setText(L10n.t("Check the file"));
                check.setEnabled(true);
            }
            running.set(false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "show checked media details", failure);
        }
    }

    private static String refusalMessage(PinMedia.Refusal refusal) {
        switch (refusal) {
            case ADAPTIVE_VIDEO: return L10n.t("Pinterest only streams this video. There's no file to download.");
            case MP4_MISSING: return L10n.t("Pinterest didn't offer a downloadable video file for this pin.");
            case IMAGE_MISSING: return L10n.t("Pinterest hasn't supplied an image to download.");
            case IMAGE_TYPE: return L10n.t("HushPinterest can't download this type of image.");
            case PUBLIC_LINK: return L10n.t("This media link isn't a public Pinterest link.");
            default: throw new IllegalArgumentException("Unknown media refusal");
        }
    }

    static boolean start(Object pin, Context context) {
        boolean queued = start(pin, context, null);
        if (queued) SaveAndDownload.downloaded(pin);
        return queued;
    }

    /** Marks a Media link clip with the copy that made it, so the same text copied again isn't ours. */
    private static final String CLIP_OWNER = "app.hushpinterest.media_link";
    private static final AtomicReference<String> latestCopy = new AtomicReference<>();

    /**
     * Copies the address of the media the Download row would save, read from the pin again: a
     * supplied original or MP4, or for a stand-in size the original the media host has behind it,
     * else that size. Never an address off Pinterest's media host.
     */
    static boolean copyLink(Object pin, Context context) {
        if (!active()) return false;
        try {
            PinMedia.Resolution media = PinMedia.resolve(pin);
            if (media == null || context == null) return false;
            if (media.source == null) {
                Utils.showToastLong(refusalMessage(media.refusal));
                return false;
            }
            String owner = UUID.randomUUID().toString();
            latestCopy.set(owner);
            copy(context, media.source.url, owner);
            if (!PinMedia.standIn(media)) return true;
            PinMedia.Source standIn = media.source;
            // The stand-in is copied now, so a slow or failed lookup still leaves a working link. The
            // original replaces it only while this copy is the latest and the clipboard still holds
            // it. The app's context, so the pin screen isn't held while the lookup waits.
            Context app = context.getApplicationContext();
            Utils.runOnBackgroundThread(() -> {
                PinMedia.Source chosen = OriginalLookup.find(standIn);
                if (chosen.url.equals(standIn.url)) return;
                Utils.runOnMainThread(() -> {
                    try {
                        if (active() && owner.equals(latestCopy.get()) && holds(app, standIn.url, owner)) {
                            set(app, chosen.url, owner);
                            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "copied media link made original");
                        }
                    } catch (Throwable failure) {
                        HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "copy original media link", failure);
                    }
                });
            });
            return true;
        } catch (Throwable failure) {
            copyFailed(failure);
            return false;
        }
    }

    private static void copy(Context context, String url, String owner) {
        set(context, url, owner);
        HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "media link copied");
        // Android 13 and newer show their own confirmation for every copy.
        if (Build.VERSION.SDK_INT < 33) Utils.showToastShort(L10n.t("Media link copied."));
    }

    private static void set(Context context, String url, String owner) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = ClipData.newPlainText(L10n.t("Media link"), url);
        PersistableBundle extras = new PersistableBundle();
        extras.putString(CLIP_OWNER, owner);
        clip.getDescription().setExtras(extras);
        clipboard.setPrimaryClip(clip);
    }

    /** Whether the clipboard still holds exactly the clip [owner] copied. A read Android refuses says no. */
    private static boolean holds(Context context, String url, String owner) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData current = clipboard == null ? null : clipboard.getPrimaryClip();
            if (current == null || current.getItemCount() != 1) return false;
            PersistableBundle extras = current.getDescription().getExtras();
            CharSequence text = current.getItemAt(0).getText();
            return extras != null && owner.equals(extras.getString(CLIP_OWNER))
                    && text != null && url.equals(text.toString());
        } catch (RuntimeException refused) {
            return false;
        }
    }

    private static void copyFailed(Throwable failure) {
        HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "copy media link", failure);
        Utils.showToastLong(L10n.t("Couldn't copy the media link. Open the pin again, then retry."));
    }

    enum Result { QUEUED, QUEUED_UNTRACKED, SKIPPED, UNSUPPORTED, FAILED }

    /** The callback reports the actual native enqueue outcome, not worker submission. */
    static boolean start(Object pin, Context context, Consumer<Result> listener) {
        AtomicBoolean reported = new AtomicBoolean();
        Consumer<Result> after = listener == null ? null : result -> {
            if (reported.compareAndSet(false, true)) listener.accept(result);
        };
        if (!active()) { report(after, Result.SKIPPED); return false; }
        try {
            PinMedia.Resolution media = PinMedia.resolve(pin);
            if (media == null || context == null) { report(after, Result.SKIPPED); return false; }
            PinMedia.Source source = media.source;
            if (source == null) {
                if (after == null) Utils.showToastLong(refusalMessage(media.refusal));
                report(after, Result.UNSUPPORTED);
                return false;
            }
            String id = media.id;
            boolean standIn = PinMedia.standIn(media);
            Context app = context.getApplicationContext();
            boolean queued = Utils.runOnBackgroundThread(() -> {
                if (!active()) { report(after, Result.SKIPPED); return; }
                try {
                    PinMedia.Source chosen = standIn ? OriginalLookup.find(source) : source;
                    if (!active()) { report(after, Result.SKIPPED); return; }
                    DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
                    if (manager == null) throw new IllegalStateException("Download service unavailable");
                    String folder = DownloadFolder.current();
                    long request = manager.enqueue(request(chosen, fileName(id, chosen), folder));
                    if (request < 0) throw new IllegalStateException("Download service rejected pin");
                    boolean tracked = DownloadLedger.record(app, request, id, folder);
                    HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "pin queued in Downloads");
                    report(after, tracked ? Result.QUEUED : Result.QUEUED_UNTRACKED);
                    if (after == null) Utils.showToastLong(startedMessage(tracked, folder));
                } catch (Throwable failure) {
                    failed(QUEUE_FAILED, failure, after == null);
                    report(after, Result.FAILED);
                }
            });
            if (!queued) {
                failed(QUEUE_FAILED, new IllegalStateException("Worker unavailable"), after == null);
                report(after, Result.FAILED);
            }
            return queued;
        } catch (Throwable failure) {
            failed("start pin download", failure, after == null);
            report(after, Result.FAILED);
            return false;
        }
    }

    private static String fileName(String id, PinMedia.Source source) {
        return "Pinterest_" + id + "_" + Long.toUnsignedString(System.nanoTime()) + source.suffix;
    }

    private static void report(Consumer<Result> after, Result result) {
        if (after != null) Utils.runOnMainThread(() -> after.accept(result));
    }

    static DownloadManager.Request request(PinMedia.Source source, String fileName) {
        return request(source, fileName, DownloadFolder.current());
    }

    /**
     * [folder] is read once by the caller, so the request, its history and its toast agree. Null
     * saves in Download.
     */
    static DownloadManager.Request request(PinMedia.Source source, String fileName, String folder) {
        if (PinMedia.mediaUri(source.url) == null) throw new IllegalArgumentException("Not a public Pinterest media URL");
        // DownloadManager appends the sub path to a file: URI as if it were already encoded, and
        // its service parses that URI back as text. A raw # cut the path there and a raw % was read
        // as an escape, so a folder named "Art #2" or "100%" lost the download. Encoding everything
        // but the slashes makes the round trip give back the folder as picked.
        String subPath = Uri.encode(DownloadFolder.subPath(folder, fileName), "/");
        // Every download, retry and batch pin is built here, so each takes the network limits that
        // are on when it's queued. Android waits for a network they allow; nothing here retries.
        return new DownloadManager.Request(Uri.parse(source.url))
                .setMimeType(source.mime)
                .setTitle(L10n.t("Download pin"))
                .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                .setAllowedOverMetered(!Settings.DOWNLOAD_UNMETERED_ONLY.get())
                .setAllowedOverRoaming(!Settings.DOWNLOAD_NO_ROAMING.get())
                .setDestinationInExternalPublicDir(DownloadFolder.directory(folder), subPath);
    }

    /**
     * The toast after a download is queued. It names the folder the download goes to, since
     * Android's Downloads list shows only the Download folder.
     */
    static String startedMessage(boolean tracked, String folder) {
        if (folder != null) {
            return tracked ? L10n.f("Download started. Check %s.", folder)
                    : L10n.f("Download started, but history wasn't saved. Check %s.", folder);
        }
        return tracked ? L10n.t("Download started. Check Downloads.")
                : L10n.t("Download started, but history wasn't saved. Check Downloads.");
    }

    /** The diagnostics name for a download Android wouldn't queue; its toast says to try again. */
    private static final String QUEUE_FAILED = "queue pin download";

    /**
     * Records the failure, and says so only for a pin downloaded [alone]. A batch counts its
     * failures and says them once in its summary; a toast for each of 500 pins ran half an hour.
     */
    private static void failed(String action, Throwable failure, boolean alone) {
        HookStatus.threw(FamilyNames.DOWNLOAD_PINS, action, failure);
        if (!alone) return;
        Utils.showToastLong(action.equals(QUEUE_FAILED)
                ? L10n.t("Couldn't start the download. Check Downloads and try again.")
                : L10n.t("Couldn't prepare this pin. Open it again, then retry."));
    }
}
