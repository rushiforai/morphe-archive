/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The download button of the server driven media screens: the photo viewer (MediaUpdateDetail), the video
 * viewer (VideoViewer), the profile photo and the banner. A long press opens the Loki Patches settings.
 *
 * These screens are composed off the main thread a moment after their fragment resumes, so media found in a
 * payload is remembered against the screen in front, or held briefly for the screen that is about to resume.
 * Both viewers hide their own chrome on a tap, so the button is not part of their layout: it floats above it
 * and follows that chrome.
 */
@SuppressWarnings("unused")
public final class SduiMediaDownload {

    /** View tag of the floating button, so each screen can find and remove its own. */
    private static final String BUTTON_TAG = "morphe_sdui_download";
    /** The photo viewer (MediaUpdateDetail) and the video viewer (VideoViewer). */
    private static final String VIEWER_SCREENS = "com.linkedin.sdui.flagshipnav.media.";
    /** ProfilePictureNonSelf and ProfilePictureEdit, which are one's own photo. */
    private static final String PROFILE_PHOTO_SCREENS = "com.linkedin.sdui.flagshipnav.profile.ProfilePicture";
    /** One's own banner. */
    private static final String COVER_SCREEN = "com.linkedin.sdui.flagshipnav.profile.ProfileCoverImageViewer";
    /** Someone else's banner. */
    private static final String BACKGROUND_SCREEN = "com.linkedin.sdui.flagshipnav.profile.ProfilePreviewBackgroundPhoto";

    /** How long media that arrived before its screen stays waiting for it. */
    private static final long HANDOVER_WINDOW_MS = 5000;
    private static final int BUTTON_SIZE = 44;
    private static final int BUTTON_PADDING = 10;
    private static final int BUTTON_MARGIN_END = 16;
    private static final int BUTTON_TOP = 88;
    /** The document viewer has a second bar with the title and page counter, so its button sits lower. */
    private static final int BUTTON_TOP_DOCUMENT = 164;
    private static final int THUMBNAIL_SIZE = 64;
    private static final int THUMBNAIL_PADDING = 12;
    private static final int ROW_INSET = 20;
    private static final int CACHE_SIZE = 40;
    private static final int FETCH_THREADS = 2;
    private static final int FETCH_TIMEOUT_MS = 8000;
    private static final int THUMBNAIL_SAMPLE = 2;
    private static final float LABEL_SP = 16;

    private static final Handler mainThread = new Handler(Looper.getMainLooper());
    private static final Map<Object, List<MediaItem>> mediaByScreen = new WeakHashMap<>();
    /** The document (PDF or carousel) shown on a screen; the same button saves it as a PDF. */
    private static final Map<Object, DocumentPdf.Doc> documentByScreen = new WeakHashMap<>();
    private static final ExecutorService thumbnailPool = Executors.newFixedThreadPool(FETCH_THREADS);
    private static final LruCache<String, Bitmap> thumbnailCache = new LruCache<>(CACHE_SIZE);

    private static Object currentFragment;
    private static boolean currentIsViewer;
    private static volatile String currentScreen = "";

    /** Media that arrived before its screen resumed, and when it arrived. */
    private static List<MediaItem> waitingMedia;
    private static long waitingMediaAt;
    private static DocumentPdf.Doc waitingDocument;
    private static long waitingDocumentAt;

    private SduiMediaDownload() {
    }

    /** The screen id of the screen in front, such as com.linkedin.sdui.flagshipnav.media.VideoViewer. */
    static String resumedScreen() {
        return currentScreen;
    }

    // region Fragment lifecycle hooks (main thread)

    public static void onFragmentResumed(Object fragment) {
        try {
            SettingsShortcut.ensureRegistered();
            String id = screenOf(fragment);
            Settings.debugLog("SduiFragment resumed screen=" + id);
            currentFragment = fragment;
            currentScreen = id;
            currentIsViewer = isViewerScreen(id);

            Activity host = activityOf(fragment);
            if (host == null) return;
            WhatsNew.maybeShow(host);
            GmsCoreCheck.check(host);
            removeButton(host, BUTTON_TAG);
            if (!currentIsViewer || !Settings.downloadMedia()) return;

            if (waitingMedia != null && SystemClock.uptimeMillis() - waitingMediaAt < HANDOVER_WINDOW_MS) {
                attach(fragment, waitingMedia);
            }
            waitingMedia = null;
            if (waitingDocument != null && SystemClock.uptimeMillis() - waitingDocumentAt < HANDOVER_WINDOW_MS) {
                documentByScreen.put(fragment, waitingDocument);
            }
            waitingDocument = null;
            if (mediaByScreen.containsKey(fragment) || documentByScreen.containsKey(fragment)) {
                showButton(host, fragment);
            }
        } catch (Throwable problem) {
            Diagnostics.error("onFragmentResumed failed", problem);
        }
    }

    public static void onFragmentPaused(Object fragment) {
        try {
            // One viewer can pause after the next one resumed, and only the one in front owns the button.
            if (currentFragment != fragment) return;
            currentFragment = null;
            currentIsViewer = false;
            Activity host = activityOf(fragment);
            if (host == null) return;
            removeButton(host, BUTTON_TAG);
        } catch (Throwable problem) {
            Diagnostics.error("onFragmentPaused failed", problem);
        }
    }

    public static void onFragmentHiddenChanged(Object fragment, boolean hidden) {
        if (hidden) {
            onFragmentPaused(fragment);
            return;
        }
        onFragmentResumed(fragment);
    }

    private static boolean isViewerScreen(String screen) {
        if (screen.startsWith(VIEWER_SCREENS) || screen.startsWith(PROFILE_PHOTO_SCREENS)) return true;
        return screen.equals(COVER_SCREEN) || screen.equals(BACKGROUND_SCREEN);
    }

    // endregion

    // region Media found in a payload (any thread)

    /** Called by the component filter for every viewer payload, on whichever thread transforms it. */
    static void offer(ProtoScanner scan, String source, boolean profileScreen) {
        List<MediaItem> found = MediaItem.extract(scan, profileScreen);
        Settings.debugLog("media payload from " + source + ": " + summary(found));
        if (found.isEmpty()) return;

        mainThread.post(() -> {
            Object screen = currentFragment;
            if (screen != null && currentIsViewer) {
                attach(screen, found);
                announce(screen);
                return;
            }
            // The viewer fragment has not resumed yet; it collects the media from here.
            waitingMedia = union(waitingMedia, found);
            waitingMediaAt = SystemClock.uptimeMillis();
        });
    }

    /** Called when the full screen document player is built, possibly on a background thread. */
    static void offerDocument(DocumentPdf.Doc doc) {
        mainThread.post(() -> {
            Object screen = currentFragment;
            if (screen != null && currentIsViewer) {
                documentByScreen.put(screen, doc);
                announce(screen);
                return;
            }
            waitingDocument = doc;
            waitingDocumentAt = SystemClock.uptimeMillis();
        });
    }

    private static void attach(Object fragment, List<MediaItem> found) {
        List<MediaItem> known = mediaByScreen.get(fragment);
        List<MediaItem> all = union(known, found);
        mediaByScreen.put(fragment, all);
        Settings.debugLog("media attached: " + summary(all));
    }

    /** Refreshes the button of a screen that just received media or a document. */
    private static void announce(Object fragment) {
        Activity host = activityOf(fragment);
        if (host != null) showButton(host, fragment);
    }

    /** The media of both lists, in order, without a second entry for an asset that is already there. */
    private static List<MediaItem> union(List<MediaItem> kept, List<MediaItem> found) {
        List<MediaItem> merged = kept == null ? new ArrayList<MediaItem>() : new ArrayList<>(kept);
        for (MediaItem candidate : found) {
            boolean known = false;
            for (MediaItem existing : merged) {
                if (existing.assetId.equals(candidate.assetId)) {
                    known = true;
                    break;
                }
            }
            if (!known) merged.add(candidate);
        }
        return merged;
    }

    /** What the report shows: the label and the asset of each item, never its URL. */
    private static String summary(List<MediaItem> listed) {
        if (listed == null) return "[]";
        StringBuilder text = new StringBuilder("[");
        boolean first = true;
        for (MediaItem media : listed) {
            if (!first) text.append(", ");
            first = false;
            text.append(media.label()).append(' ').append(media.assetId);
        }
        return text.append(']').toString();
    }

    // endregion

    // region The button

    private static void showButton(Activity host, Object fragment) {
        ViewGroup root = contentOf(host);
        if (root == null) return;
        View floating = root.findViewWithTag(BUTTON_TAG);
        if (floating == null) {
            floating = buildButton(host);
            root.addView(floating);
        }
        FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) floating.getLayoutParams();
        int top = px(host, documentByScreen.get(fragment) != null ? BUTTON_TOP_DOCUMENT : BUTTON_TOP);
        if (layout.topMargin != top) {
            layout.topMargin = top;
            floating.setLayoutParams(layout);
        }
        floating.bringToFront();
        // A video viewer opens immersive, so the button starts hidden rather than over a bare screen.
        floating.setVisibility(ViewerChrome.controlsVisible() ? View.VISIBLE : View.GONE);
        floating.setOnClickListener(clicked -> onDownloadClick(host, fragment));
        floating.setOnLongClickListener(clicked -> {
            SettingsActivity.open(host);
            return true;
        });
    }

    private static ViewGroup contentOf(Activity host) {
        return host.findViewById(android.R.id.content);
    }

    private static void removeButton(Activity host, String tag) {
        ViewGroup root = contentOf(host);
        View button = root == null ? null : root.findViewWithTag(tag);
        if (button != null) root.removeView(button);
    }

    /**
     * Shows or hides both download button variants at once. A tap in the viewers hides the app's own chrome,
     * so the buttons follow it instead of floating over an empty screen.
     */
    static void setButtonVisible(Activity host, boolean visible) {
        if (host == null) return;
        ViewGroup root = contentOf(host);
        if (root == null) return;
        for (String tag : new String[]{BUTTON_TAG, DownloadMediaPatch.OVERLAY_TAG}) {
            View button = root.findViewWithTag(tag);
            if (button != null) button.setVisibility(visible ? View.VISIBLE : View.GONE);
        }
    }

    /** Whether the button is showing. True when the screen has no button to hide. */
    static boolean buttonVisible(Activity host) {
        if (host == null) return true;
        ViewGroup root = contentOf(host);
        View button = root == null ? null : root.findViewWithTag(BUTTON_TAG);
        return button == null || button.getVisibility() == View.VISIBLE;
    }

    private static View buildButton(Context context) {
        ImageButton circle = new ImageButton(context);
        circle.setTag(BUTTON_TAG);
        circle.setImageResource(android.R.drawable.stat_sys_download);
        circle.setContentDescription("Download");
        GradientDrawable plate = new GradientDrawable();
        plate.setShape(GradientDrawable.OVAL);
        plate.setColor(0x99000000);
        circle.setBackground(plate);
        int inset = px(context, BUTTON_PADDING);
        circle.setPadding(inset, inset, inset, inset);

        int side = px(context, BUTTON_SIZE);
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(side, side, Gravity.TOP | Gravity.END);
        // Below the viewer's top bar.
        layout.topMargin = px(context, BUTTON_TOP);
        layout.setMarginEnd(px(context, BUTTON_MARGIN_END));
        circle.setLayoutParams(layout);
        return circle;
    }

    // endregion

    // region What a tap does

    private static void onDownloadClick(Activity host, Object fragment) {
        List<MediaItem> found = mediaByScreen.get(fragment);
        DocumentPdf.Doc document = documentByScreen.get(fragment);
        if (document != null) {
            if (found == null || found.isEmpty()) {
                DocumentPdf.save(host, document);
            } else {
                // A document and photos on one screen: the user says which of them they meant.
                String pages = I18n.f("Document as PDF (%1$s pages)", document.pages);
                String title = I18n.tr("Choose media");
                String cancel = I18n.tr("Cancel");
                AlertDialog dialog = new AlertDialog.Builder(host)
                        .setTitle(title)
                        .setItems(new String[]{pages, I18n.tr("Photos and videos")},
                                (d, which) -> {
                                    if (which == 0) DocumentPdf.save(host, document);
                                    else if (found.size() == 1) save(host, found);
                                    else chooseMedia(host, new ArrayList<>(found));
                                })
                        .setNegativeButton(cancel, null)
                        .show();
                SettingsActivity.tintButtons(dialog, host);
            }
            return;
        }
        if (found == null || found.isEmpty()) {
            Downloads.toast(host, "Media not found");
            return;
        }
        if (found.size() == 1) {
            save(host, found);
            return;
        }
        chooseMedia(host, new ArrayList<>(found));
    }

    private static void chooseMedia(Activity host, List<MediaItem> chosen) {
        BaseAdapter adapter = new BaseAdapter() {
            @Override
            public int getCount() {
                return chosen.size();
            }

            @Override
            public Object getItem(int row) {
                return chosen.get(row);
            }

            @Override
            public long getItemId(int row) {
                return (long) row;
            }

            @Override
            public View getView(int row, View recycled, ViewGroup parent) {
                return mediaRow(host, chosen.get(row), row);
            }
        };

        String title = I18n.tr("Choose media");
        String cancel = I18n.tr("Cancel");
        String every = I18n.f("All (%1$s)", chosen.size());
        AlertDialog dialog = new AlertDialog.Builder(host)
                .setTitle(title)
                .setAdapter(adapter, (d, which) -> save(host, chosen.subList(which, which + 1)))
                .setPositiveButton(every, (d, which) -> save(host, chosen))
                .setNegativeButton(cancel, null)
                .show();
        SettingsActivity.tintButtons(dialog, host);
    }

    private static View mediaRow(Context context, MediaItem item, int position) {
        LinearLayout line = new LinearLayout(context);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        int pad = px(context, THUMBNAIL_PADDING);
        line.setPadding(px(context, ROW_INSET), pad / 2, pad, pad / 2);

        ImageView preview = new ImageView(context);
        preview.setScaleType(ImageView.ScaleType.CENTER_CROP);
        preview.setBackgroundColor(0x33888888);
        int side = px(context, THUMBNAIL_SIZE);
        line.addView(preview, new LinearLayout.LayoutParams(side, side));
        loadThumbnail(preview, item.thumbnailUrl);

        TextView caption = new TextView(context);
        String name = item.video ? I18n.f("Video %1$sp", item.size) : I18n.f("Photo %1$spx", item.size);
        caption.setText((position + 1) + ". " + name);
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, LABEL_SP);
        caption.setPadding(pad, 0, 0, 0);
        line.addView(caption);
        return line;
    }

    /** Hands the items to the download queue; the notification and the saved file are its business. */
    private static void save(Activity host, List<MediaItem> wanted) {
        int queued = 0;
        boolean videosOnly = true;
        for (MediaItem media : wanted) {
            if (Downloads.enqueue(host, media.url, media.assetId, media.video)) queued++;
            videosOnly &= media.video;
        }
        if (queued > 0) Downloads.toastStarted(host, queued, videosOnly);
    }

    // endregion

    // region Thumbnails

    private static void loadThumbnail(ImageView view, String address) {
        if (address == null) return;
        Bitmap ready = thumbnailCache.get(address);
        if (ready != null) {
            view.setImageBitmap(ready);
            return;
        }
        // Rows are recycled, so a late fetch must not land on whatever row now sits in this view.
        view.setTag(address);
        thumbnailPool.execute(() -> {
            Bitmap fetched = downloadBitmap(address);
            if (fetched == null) return;
            thumbnailCache.put(address, fetched);
            mainThread.post(() -> {
                if (address.equals(view.getTag())) view.setImageBitmap(fetched);
            });
        });
    }

    private static Bitmap downloadBitmap(String address) {
        HttpURLConnection link = null;
        try {
            link = (HttpURLConnection) new URL(address).openConnection();
            link.setConnectTimeout(FETCH_TIMEOUT_MS);
            link.setReadTimeout(FETCH_TIMEOUT_MS);
            try (InputStream body = link.getInputStream()) {
                BitmapFactory.Options decode = new BitmapFactory.Options();
                decode.inSampleSize = THUMBNAIL_SAMPLE;
                return BitmapFactory.decodeStream(body, null, decode);
            }
        } catch (Throwable problem) {
            return null;
        } finally {
            if (link != null) link.disconnect();
        }
    }

    // endregion

    private static Activity activityOf(Object fragment) {
        Object value = Proto.call(fragment, "getActivity");
        return value instanceof Activity ? (Activity) value : null;
    }

    /** The screen id, read out of the fragment's view model. */
    private static String screenOf(Object fragment) {
        Object model = Reflect.get(fragment, "viewModel");
        Object context = Reflect.get(model, "screenContext");
        return Proto.string(context, "getScreenId");
    }

    private static int px(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }
}
