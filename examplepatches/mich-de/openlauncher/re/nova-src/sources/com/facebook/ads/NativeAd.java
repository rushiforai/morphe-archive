package com.facebook.ads;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import androidx.annotation.Keep;
import com.facebook.ads.internal.api.NativeAdApi;
import com.facebook.ads.internal.api.NativeAdBaseApi;
import com.facebook.ads.internal.bench.Benchmark;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.ads.internal.util.common.Preconditions;
import com.facebook.infer.annotation.Nullsafe;
import java.util.List;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public class NativeAd extends NativeAdBase {
    private NativeAdApi mNativeAdApi;
    private NativeOptions mNativeOptions;

    @Keep
    /* loaded from: classes2.dex */
    public enum AdCreativeType {
        IMAGE,
        VIDEO,
        CAROUSEL,
        UNKNOWN
    }

    @Keep
    /* loaded from: classes2.dex */
    public static class NativeOptions {
        private Boolean mDisableFullScreen = null;
        private Boolean mHideMediaControls = null;
        private Boolean mUnMuteVolume = null;

        @Benchmark
        public NativeOptions() {
        }

        public Boolean getDisableFullScreen() {
            return this.mDisableFullScreen;
        }

        public Boolean getHideMediaControls() {
            return this.mHideMediaControls;
        }

        public Boolean getUnMuteVolume() {
            return this.mUnMuteVolume;
        }

        public NativeOptions setDisableFullScreen(Boolean bool) {
            this.mDisableFullScreen = bool;
            return this;
        }

        public NativeOptions setHideMediaControls(Boolean bool) {
            this.mHideMediaControls = bool;
            return this;
        }

        public NativeOptions setUnMuteVolume(Boolean bool) {
            this.mUnMuteVolume = bool;
            return this;
        }
    }

    public NativeAd(Context context, String str) {
        super(context, str);
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(this, this.mNativeAdBaseApi);
    }

    public AdCreativeType getAdCreativeType() {
        return this.mNativeAdApi.getAdCreativeType();
    }

    public NativeAdApi getNativeAdApi() {
        return this.mNativeAdApi;
    }

    public NativeOptions getNativeOptions() {
        return this.mNativeOptions;
    }

    public NativeAdOptionsViewPosition getPreferredAdOptionsViewPosition() {
        return this.mNativeAdApi.getPreferredAdOptionsViewPosition();
    }

    @Deprecated
    public VideoAutoplayBehavior getVideoAutoplayBehavior() {
        return this.mNativeAdApi.getVideoAutoplayBehavior();
    }

    public void registerViewForInteraction(View view, MediaView mediaView) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView);
    }

    public void setPreferredAdOptionsViewPosition(NativeAdOptionsViewPosition nativeAdOptionsViewPosition) {
        this.mNativeAdApi.setPreferredAdOptionsViewPosition(nativeAdOptionsViewPosition);
    }

    public NativeAd(Context context, NativeAdBaseApi nativeAdBaseApi) {
        super(nativeAdBaseApi);
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(this, this.mNativeAdBaseApi);
    }

    public void registerViewForInteraction(View view, MediaView mediaView, MediaView mediaView2) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView, mediaView2);
    }

    public NativeAd(Context context, NativeAdBase nativeAdBase) {
        super(context, nativeAdBase);
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(nativeAdBase, this, this.mNativeAdBaseApi);
    }

    public void registerViewForInteraction(View view, MediaView mediaView, List<View> list) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView, list);
    }

    public NativeAd(Context context, NativeAdBase nativeAdBase, NativeOptions nativeOptions) {
        super(context, nativeAdBase);
        this.mNativeOptions = nativeOptions;
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(nativeAdBase, this, this.mNativeAdBaseApi);
    }

    public void registerViewForInteraction(View view, MediaView mediaView, MediaView mediaView2, List<View> list) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView, mediaView2, list);
    }

    public void registerViewForInteraction(View view, MediaView mediaView, ImageView imageView) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView, imageView);
    }

    public NativeAd(Context context, String str, NativeOptions nativeOptions) {
        super(context, str);
        this.mNativeOptions = nativeOptions;
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(this, this.mNativeAdBaseApi);
    }

    public void registerViewForInteraction(View view, MediaView mediaView, ImageView imageView, List<View> list) {
        Preconditions.checkIsOnMainThread();
        this.mNativeAdApi.registerViewForInteraction(view, mediaView, imageView, list);
    }

    public NativeAd(Context context, NativeAdBaseApi nativeAdBaseApi, NativeOptions nativeOptions) {
        super(nativeAdBaseApi);
        this.mNativeOptions = nativeOptions;
        this.mNativeAdApi = DynamicLoaderFactory.makeLoader(context).createNativeAdApi(this, this.mNativeAdBaseApi);
    }
}
