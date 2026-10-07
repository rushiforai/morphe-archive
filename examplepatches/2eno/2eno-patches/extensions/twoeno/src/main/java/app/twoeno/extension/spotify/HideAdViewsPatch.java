package app.twoeno.extension.spotify;

import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.twoeno.extension.shared.Logger;
import app.twoeno.extension.shared.Reflection;

/**
 * Hides ad banners and ad players.
 */
@SuppressWarnings("unused")
public final class HideAdViewsPatch {
    /**
     * Known ad view classes.
     */
    public static final String[] AD_VIEW_CLASSES = {
            "com.spotify.adsinternal.playback.video.CountdownBarView",
            "com.spotify.adsinternal.display.DisplayAdView",
            "com.spotify.adsinternal.ads.AudioAdView",
            "com.spotify.nowplaying.ads.AdPlayerView",
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
