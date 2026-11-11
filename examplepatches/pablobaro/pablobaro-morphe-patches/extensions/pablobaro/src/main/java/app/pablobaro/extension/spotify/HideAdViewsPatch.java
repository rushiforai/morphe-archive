package app.pablobaro.extension.spotify;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.pablobaro.extension.shared.Logger;
import app.pablobaro.extension.shared.Reflection;

/**
 * Hides ad banners, ad labels, ad overlay controls, ad players and the audio and embedded ad layouts.
 */
@SuppressWarnings("unused")
public final class HideAdViewsPatch {
    /**
     * Known ad view classes. Must match the list of the patch.
     */
    public static final String[] AD_VIEW_CLASSES = {
            // Older Spotify versions.
            "com.spotify.adsinternal.playback.video.CountdownBarView",
            "com.spotify.adsinternal.display.DisplayAdView",
            "com.spotify.adsinternal.ads.AudioAdView",
            "com.spotify.nowplaying.ads.AdPlayerView",
            // Newer Spotify versions.
            "com.spotify.adsdisplay.uiusecases.adtag.AdTagView",
            "com.spotify.adsdisplay.uiusecases.videocontrolsoverlay.VideoControlsOverlayView",
            "com.spotify.nowplayingmodes.adsmode.ui.overlay.AdsOverlayControlsLayout",
    };

    private static final String[] AD_CLASS_NAME_MARKERS = {
            "adsinternal", "brandad", "videoad", "audioad", "adslot", "countdownbar", "displayad"
    };
    private static final String[] AD_RESOURCE_NAME_MARKERS = {
            "audio_ad", "video_ad", "banner_ad", "ad_nudge", "brand_ad"
    };
    private static final String[] AD_DESCRIPTION_MARKERS = {"advertisement", "werbung"};

    private static final View.OnAttachStateChangeListener HIDE_ON_ATTACH = new View.OnAttachStateChangeListener() {
        @Override
        public void onViewAttachedToWindow(View view) {
            hideView(view);
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
        }
    };

    private HideAdViewsPatch() {
    }

    /**
     * Hides a view and collapses it to zero size.
     * Can be used as the replacement of {@link View#onMeasure(int, int)}, as it sets the measured dimension.
     */
    public static void hideView(View view) {
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.width = 0;
            params.height = 0;
            view.setLayoutParams(params);
        }
        try {
            Reflection.findMethod(View.class, "setMeasuredDimension", "int", "int").invoke(view, 0, 0);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Injection point: constructors of the {@link #AD_VIEW_CLASSES}, after the super constructor call.
     */
    public static void onAdViewCreated(View view) {
        view.setVisibility(View.GONE);
        // Constructors can delegate to each other, so this may run more than once.
        view.removeOnAttachStateChangeListener(HIDE_ON_ATTACH);
        view.addOnAttachStateChangeListener(HIDE_ON_ATTACH);
    }

    /**
     * Injection point: replaces {@link LayoutInflater#inflate(int, ViewGroup, boolean)} calls that inflate ad layouts.
     *
     * @return The result of the inflation, with the inflated ad layout hidden.
     */
    public static View inflateAdLayout(LayoutInflater inflater, int resource, ViewGroup root, boolean attachToRoot) {
        View view = inflater.inflate(resource, root, attachToRoot);
        try {
            int index = InflatedAdLayout.indexOfInflatedView(
                    attachToRoot,
                    root != null && view == root,
                    root == null ? 0 : root.getChildCount()
            );
            if (index == InflatedAdLayout.RETURNED_VIEW) {
                onAdViewCreated(view);
            } else if (index != InflatedAdLayout.NONE) {
                onAdViewCreated(root.getChildAt(index));
            }
        } catch (Throwable ex) {
            Logger.error("inflateAdLayout failure", ex);
        }
        return view;
    }

    private static boolean containsAny(String value, String[] markers) {
        for (String marker : markers) {
            if (value.contains(marker)) return true;
        }
        return false;
    }

    private static boolean isAdView(View view) {
        String className = view.getClass().getName().toLowerCase(Locale.ROOT);
        if (containsAny(className, AD_CLASS_NAME_MARKERS)) return true;

        String resourceName = "";
        try {
            if (view.getId() != View.NO_ID) {
                resourceName = view.getResources().getResourceEntryName(view.getId()).toLowerCase(Locale.ROOT);
            }
        } catch (Throwable ignored) {
        }
        if (containsAny(resourceName, AD_RESOURCE_NAME_MARKERS)) return true;

        CharSequence description = view.getContentDescription();
        String lowerDescription = description == null ? "" : description.toString().toLowerCase(Locale.ROOT);
        return lowerDescription.equals("ad") || containsAny(lowerDescription, AD_DESCRIPTION_MARKERS);
    }

    /**
     * Hides all ad views in a view hierarchy, such as the decor view of an activity.
     */
    public static void hideAdViews(View root) {
        try {
            if (isAdView(root)) hideView(root);

            if (root instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) root;
                for (int i = 0; i < group.getChildCount(); i++) {
                    hideAdViews(group.getChildAt(i));
                }
            }
        } catch (Throwable ex) {
            Logger.error("hideAdViews failure", ex);
        }
    }
}
