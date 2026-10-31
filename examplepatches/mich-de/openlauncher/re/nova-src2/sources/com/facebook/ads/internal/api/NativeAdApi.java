package com.facebook.ads.internal.api;

import android.view.View;
import android.widget.ImageView;
import androidx.annotation.Keep;
import com.facebook.ads.MediaView;
import com.facebook.ads.NativeAd;
import com.facebook.ads.NativeAdOptionsViewPosition;
import com.facebook.ads.VideoAutoplayBehavior;
import com.facebook.infer.annotation.Nullsafe;
import java.util.List;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface NativeAdApi {
    NativeAd.AdCreativeType getAdCreativeType();

    NativeAdOptionsViewPosition getPreferredAdOptionsViewPosition();

    VideoAutoplayBehavior getVideoAutoplayBehavior();

    void registerViewForInteraction(View view, MediaView mediaView);

    void registerViewForInteraction(View view, MediaView mediaView, ImageView imageView);

    void registerViewForInteraction(View view, MediaView mediaView, ImageView imageView, List<View> list);

    void registerViewForInteraction(View view, MediaView mediaView, MediaView mediaView2);

    void registerViewForInteraction(View view, MediaView mediaView, MediaView mediaView2, List<View> list);

    void registerViewForInteraction(View view, MediaView mediaView, List<View> list);

    void setPreferredAdOptionsViewPosition(NativeAdOptionsViewPosition nativeAdOptionsViewPosition);
}
