package com.fyber.inneractive.sdk.external;

import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.util.Collection;

/* loaded from: classes3.dex */
public interface NativeAdContent {

    public static class ViewTag {
        public static final String AD_DESCRIPTION = "DESCRIPTION";
        public static final String AD_ICON = "ICON";
        public static final String AD_TITLE = "TITLE";
        public static final String CTA = "CTA";
        public static final String MEDIA_VIEW = "MEDIA_VIEW";
        public static final String OTHER = "OTHER";
        public static final String RATING = "RATING";
        public static final String ROOT = "ROOT";
    }

    void bindMediaView(MediaView mediaView);

    void destroy();

    String getAdCallToAction();

    String getAdDescription();

    String getAdTitle();

    String getAdvertiserName();

    Uri getAppIcon();

    Float getMediaAspectRatio();

    MediaView getMediaView();

    String getPrice();

    Float getRating();

    void registerViewsForInteraction(ViewGroup viewGroup, MediaView mediaView, ImageView imageView, Collection<View> collection);
}
