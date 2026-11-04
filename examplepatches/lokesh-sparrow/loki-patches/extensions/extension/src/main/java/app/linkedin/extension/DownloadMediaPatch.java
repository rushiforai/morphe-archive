package app.linkedin.extension;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;

import java.util.List;

@SuppressWarnings("unused")
public final class DownloadMediaPatch {
    private static final String TAG = "LinkedInPatches";
    private static final String OVERLAY_TAG = "morphe_download_overlay";

    /**
     * Injected at the start of onBind(ViewData, ViewDataBinding) of the media viewer presenters.
     * Adds (or rebinds) a download button on top of the photo or video.
     */
    public static void onMediaBind(Object viewData, Object binding) {
        try {
            if (!Settings.downloadMedia()) return;
            View root = (View) binding.getClass().getMethod("getRoot").invoke(binding);
            Settings.debugLog("legacy media viewer bind " + viewData.getClass().getSimpleName());
            if (!(root instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) root;

            View overlay = group.findViewWithTag(OVERLAY_TAG);
            if (overlay == null) {
                overlay = createOverlay(group.getContext());
                group.addView(overlay, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            }
            overlay.bringToFront();
            // Presenters are recycled, so always rebind to the current item.
            ((ViewGroup) overlay).getChildAt(0).setOnClickListener(v -> download(v.getContext(), viewData));
        } catch (Throwable t) {
            Diagnostics.error("onMediaBind failed", t);
        }
    }

    private static View createOverlay(Context context) {
        // Full size, non-clickable layer: touches outside the button fall through to the media.
        FrameLayout overlay = new FrameLayout(context);
        overlay.setTag(OVERLAY_TAG);

        ImageButton button = new ImageButton(context);
        button.setImageResource(android.R.drawable.stat_sys_download);
        button.setContentDescription("Download");
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(0x80000000);
        button.setBackground(background);
        int padding = dp(context, 10);
        button.setPadding(padding, padding, padding, padding);

        int size = dp(context, 44);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.END);
        // Below the viewer's top bar (close / overflow buttons).
        params.topMargin = dp(context, 112);
        params.setMarginEnd(dp(context, 16));
        overlay.addView(button, params);
        return overlay;
    }

    private static void download(Context context, Object viewData) {
        try {
            String url = findVideoUrl(viewData);
            boolean isVideo = url != null;
            if (!isVideo) url = findImageUrl(viewData);
            if (url == null) {
                Downloads.toast(context, "Media not found");
                return;
            }

            if (Downloads.enqueue(context, url, String.valueOf(System.currentTimeMillis()), isVideo)) {
                Downloads.toastStarted(context, 1, isVideo);
            }
        } catch (Throwable t) {
            Diagnostics.error("download failed", t);
            Downloads.toast(context, I18n.f("Download failed: %1$s", t.getMessage()));
        }
    }

    /**
     * MediaViewerVideoViewData.videoPlayMetadata.progressiveStreams[]
     * -> highest resolution stream -> streamingLocations[0].url (a plain MP4).
     */
    private static String findVideoUrl(Object viewData) {
        Object streams = Reflect.get(Reflect.get(viewData, "videoPlayMetadata"), "progressiveStreams");
        if (!(streams instanceof List)) return null;

        Object best = null;
        long bestScore = -1;
        for (Object stream : (List<?>) streams) {
            long pixels = (long) Reflect.asInt(Reflect.get(stream, "width")) * Reflect.asInt(Reflect.get(stream, "height"));
            long score = pixels * 100_000L + Reflect.asInt(Reflect.get(stream, "bitRate")) / 1000;
            if (score > bestScore && firstUrl(stream) != null) {
                best = stream;
                bestScore = score;
            }
        }
        return best == null ? null : firstUrl(best);
    }

    private static String firstUrl(Object stream) {
        Object locations = Reflect.get(stream, "streamingLocations");
        if (!(locations instanceof List)) return null;
        for (Object location : (List<?>) locations) {
            Object url = Reflect.get(location, "url");
            if (url instanceof String) return (String) url;
        }
        return null;
    }

    /**
     * ImageViewModel.attributes[].detailData.vectorImageValue
     * -> rootUrl + largest artifact's fileIdentifyingUrlPathSegment.
     */
    private static String findImageUrl(Object viewData) {
        Object image = Reflect.get(viewData, "image"); // MediaViewerImageViewData
        if (image == null) image = Reflect.get(viewData, "imageViewModel"); // MultiPhotoImageViewData
        Object attributes = Reflect.get(image, "attributes");
        if (!(attributes instanceof List)) return null;

        for (Object attribute : (List<?>) attributes) {
            Object detail = Reflect.get(attribute, "detailData");

            String vectorUrl = largestArtifactUrl(Reflect.get(detail, "vectorImageValue"));
            if (vectorUrl != null) return vectorUrl;

            Object plainUrl = Reflect.get(Reflect.get(detail, "imageUrlValue"), "url");
            if (plainUrl instanceof String) return (String) plainUrl;
        }
        return null;
    }

    private static String largestArtifactUrl(Object vectorImage) {
        Object artifacts = Reflect.get(vectorImage, "artifacts");
        if (!(artifacts instanceof List)) return null;

        Object rootUrl = Reflect.get(vectorImage, "rootUrl");
        String best = null;
        int bestWidth = -1;
        for (Object artifact : (List<?>) artifacts) {
            Object segment = Reflect.get(artifact, "fileIdentifyingUrlPathSegment");
            int width = Reflect.asInt(Reflect.get(artifact, "width"));
            if (segment instanceof String && width > bestWidth) {
                best = (String) segment;
                bestWidth = width;
            }
        }
        if (best == null) return null;
        // Segments are usually relative to rootUrl, but can already be absolute.
        return best.startsWith("http") || !(rootUrl instanceof String) ? best : rootUrl + best;
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

}
