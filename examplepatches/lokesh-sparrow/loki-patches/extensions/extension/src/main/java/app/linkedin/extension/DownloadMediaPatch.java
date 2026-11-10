/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;

import java.util.List;

/**
 * The download button of the older viewer presenters, the ones still assembled out of views rather than
 * composed. {@link #onMediaBind} is injected at the start of their onBind: the overlay is built once per
 * inflated layout and then re-pointed at whatever item the presenter is showing now, because presenters are
 * recycled and the same view comes back with a different photo or video in it.
 */
@SuppressWarnings("unused")
public final class DownloadMediaPatch {

    /** Tag of the overlay. The Compose viewer's button looks it up too, so both variants hide together. */
    static final String OVERLAY_TAG = "morphe_download_overlay";

    private static final int OVERLAY_FILL = 0x80000000;
    private static final int OVAL = GradientDrawable.OVAL;
    private static final int ICON = android.R.drawable.stat_sys_download;
    private static final String ICON_LABEL = "Download";
    private static final int BUTTON_SIZE = 44;
    private static final int BUTTON_PADDING = 10;
    /** Clear of the viewer's own bar, where its close and overflow buttons sit. */
    private static final int BUTTON_TOP = 112;
    private static final int BUTTON_MARGIN_END = 16;

    private DownloadMediaPatch() {
    }

    /** Adds, or re-points, the button that floats over the photo or video of a viewer presenter. */
    public static void onMediaBind(Object viewData, Object binding) {
        try {
            if (!enabled()) return;
            View root = rootOf(binding);
            String bound = viewData.getClass().getSimpleName();
            Settings.debugLog("legacy media viewer bind " + bound);
            ViewGroup host = root instanceof ViewGroup ? (ViewGroup) root : null;
            if (host == null) return;

            View overlay = host.findViewWithTag(OVERLAY_TAG);
            if (overlay != null) {
                reveal(overlay);
            } else {
                View created = overlayFor(host.getContext());
                host.addView(created, overlayParams());
                reveal(created);
                overlay = created;
            }
            // The pass-through overlay is a frame, and the button is its only child.
            bind(overlay, viewData);
        } catch (Throwable problem) {
            Diagnostics.error("onMediaBind failed", problem);
        }
    }

    private static boolean enabled() {
        return Settings.downloadMedia();
    }

    /** The inflated root of a presenter's binding. */
    private static View rootOf(Object binding) throws Exception {
        return (View) binding.getClass().getMethod("getRoot").invoke(binding);
    }

    /** Covers the viewer, so the button can sit in its corner. */
    private static ViewGroup.LayoutParams overlayParams() {
        return new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private static void reveal(View overlay) {
        overlay.setVisibility(View.VISIBLE);
        ViewGroup parent = (ViewGroup) overlay.getParent();
        parent.bringChildToFront(overlay);
    }

    private static void bind(View overlay, Object viewData) {
        ViewGroup frame = (ViewGroup) overlay;
        frame.getChildAt(0).setOnClickListener(clicked -> downloadCurrent(clicked.getContext(), viewData));
    }

    private static View overlayFor(Context context) {
        // Nothing but the button is clickable here, so touches beside it reach the media underneath.
        FrameLayout layer = new FrameLayout(context);
        layer.setTag(OVERLAY_TAG);
        layer.addView(downloadButton(context), buttonParams(context));
        return layer;
    }

    private static ImageButton downloadButton(Context context) {
        ImageButton circle = new ImageButton(context);
        circle.setContentDescription(ICON_LABEL);
        circle.setImageResource(ICON);
        circle.setBackground(round(OVERLAY_FILL));
        int padding = px(context, BUTTON_PADDING);
        circle.setPadding(padding, padding, padding, padding);
        return circle;
    }

    /** A filled circle behind the icon, so it stays visible over a photo of any brightness. */
    private static GradientDrawable round(int argb) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(argb);
        shape.setShape(OVAL);
        return shape;
    }

    private static FrameLayout.LayoutParams buttonParams(Context context) {
        int size = px(context, BUTTON_SIZE);
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.END);
        layout.topMargin = px(context, BUTTON_TOP);
        layout.setMarginEnd(px(context, BUTTON_MARGIN_END));
        return layout;
    }

    private static void downloadCurrent(Context context, Object viewData) {
        try {
            String video = videoUrl(viewData);
            // A video viewer has both models on it; the video wins, since that is what is playing.
            String url = video != null ? video : imageUrl(viewData);
            boolean isVideo = video != null;
            if (url == null) {
                reportMissing(context);
                return;
            }
            // Pegasus has no asset id at this level, so the moment of the tap names the saved file.
            String name = String.valueOf(System.currentTimeMillis());
            if (Downloads.enqueue(context, url, name, isVideo)) Downloads.toastStarted(context, 1, isVideo);
        } catch (Throwable problem) {
            Diagnostics.error("download failed", problem);
            Downloads.toast(context, I18n.f("Download failed: %1$s", problem.getMessage()));
        }
    }

    private static void reportMissing(Context context) {
        Downloads.toast(context, "Media not found");
    }

    /**
     * MediaViewerVideoViewData.videoPlayMetadata.progressiveStreams[]: the most pixels wins, the higher bit
     * rate breaks a tie, and the winner's first streamingLocation is a plain MP4.
     */
    private static String videoUrl(Object viewData) {
        Object metadata = Reflect.get(viewData, "videoPlayMetadata");
        Object renditions = Reflect.get(metadata, "progressiveStreams");
        if (!(renditions instanceof List)) return null;

        Object winner = null;
        long winnerScore = -1;
        for (Object candidate : (List<?>) renditions) {
            if (streamUrl(candidate) == null) continue;
            long ranking = rank(candidate);
            if (ranking > winnerScore) {
                winner = candidate;
                winnerScore = ranking;
            }
        }
        return winner == null ? null : streamUrl(winner);
    }

    /** Pixels first, bit rate as the tie breaker: the biggest picture at the best quality. */
    private static long rank(Object stream) {
        long pixels = (long) Reflect.asInt(Reflect.get(stream, "width"))
                * Reflect.asInt(Reflect.get(stream, "height"));
        return pixels * 100_000L + Reflect.asInt(Reflect.get(stream, "bitRate")) / 1000;
    }

    /** The first location of a stream that carries a URL; broken renditions have none. */
    private static String streamUrl(Object stream) {
        Object places = Reflect.get(stream, "streamingLocations");
        if (!(places instanceof List)) return null;
        for (Object place : (List<?>) places) {
            Object address = Reflect.get(place, "url");
            if (address instanceof String) return (String) address;
        }
        return null;
    }

    /**
     * ImageViewModel.attributes[].detailData, whichever shape it has: a vector image (its root URL plus the
     * segmented URL of the widest artifact) or a plain image URL.
     */
    private static String imageUrl(Object viewData) {
        Object model = Reflect.get(viewData, "image"); // MediaViewerImageViewData
        if (model == null) model = Reflect.get(viewData, "imageViewModel"); // MultiPhotoImageViewData
        Object parts = Reflect.get(model, "attributes");
        if (!(parts instanceof List)) return null;

        for (Object part : (List<?>) parts) {
            Object data = Reflect.get(part, "detailData");
            String segmented = artifactUrl(Reflect.get(data, "vectorImageValue"));
            if (segmented != null) return segmented;
            Object direct = Reflect.get(Reflect.get(data, "imageUrlValue"), "url");
            if (direct instanceof String) return (String) direct;
        }
        return null;
    }

    /** The URL segment of the widest artifact, absolute already or relative to the vector image's root. */
    private static String artifactUrl(Object vectorImage) {
        Object renditions = Reflect.get(vectorImage, "artifacts");
        if (!(renditions instanceof List)) return null;

        Object base = Reflect.get(vectorImage, "rootUrl");
        String widest = null;
        int widestWidth = -1;
        for (Object rendition : (List<?>) renditions) {
            Object path = Reflect.get(rendition, "fileIdentifyingUrlPathSegment");
            int width = Reflect.asInt(Reflect.get(rendition, "width"));
            if (width > widestWidth && path instanceof String) {
                widest = (String) path;
                widestWidth = width;
            }
        }
        if (widest == null) return null;
        boolean absolute = widest.startsWith("http");
        return absolute || !(base instanceof String) ? widest : base + widest;
    }

    /** A dp value in pixels, the same conversion applied dimensions use. */
    private static int px(Context context, int value) {
        float density = context.getResources().getDisplayMetrics().density;
        return (int) (value * density);
    }
}
