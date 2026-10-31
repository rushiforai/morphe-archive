package com.facebook.ads;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.Keep;
import com.facebook.ads.internal.api.AdComponentFrameLayout;
import com.facebook.ads.internal.api.AdViewConstructorParams;
import com.facebook.ads.internal.api.MediaViewVideoRendererApi;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public abstract class MediaViewVideoRenderer extends AdComponentFrameLayout {
    private MediaViewVideoRendererApi mMediaViewVideoRendererApi;

    @Deprecated
    protected NativeAd nativeAd;

    @Deprecated
    protected VideoAutoplayBehavior videoAutoplayBehavior;

    public MediaViewVideoRenderer(Context context) {
        super(context);
        initialize(new AdViewConstructorParams(context));
    }

    private void initialize(AdViewConstructorParams adViewConstructorParams) {
        MediaViewVideoRendererApi mediaViewVideoRendererApiCreateMediaViewVideoRendererApi = DynamicLoaderFactory.makeLoader(adViewConstructorParams.getContext()).createMediaViewVideoRendererApi();
        this.mMediaViewVideoRendererApi = mediaViewVideoRendererApiCreateMediaViewVideoRendererApi;
        attachAdComponentViewApi(mediaViewVideoRendererApiCreateMediaViewVideoRendererApi);
        this.mMediaViewVideoRendererApi.initialize(adViewConstructorParams, this);
    }

    @Override // com.facebook.ads.internal.api.AdComponentFrameLayout, android.view.ViewGroup, com.facebook.ads.internal.api.AdComponentView
    public void addView(View view) {
    }

    @Deprecated
    public void destroy() {
    }

    public final void disengageSeek(VideoStartReason videoStartReason) {
        this.mMediaViewVideoRendererApi.disengageSeek(videoStartReason);
    }

    public final void engageSeek() {
        this.mMediaViewVideoRendererApi.engageSeek();
    }

    public final int getCurrentTimeMs() {
        return this.mMediaViewVideoRendererApi.getCurrentTimeMs();
    }

    public final int getDuration() {
        return this.mMediaViewVideoRendererApi.getDuration();
    }

    public MediaViewVideoRendererApi getMediaViewVideoRendererApi() {
        return this.mMediaViewVideoRendererApi;
    }

    @Deprecated
    public final View getVideoView() {
        return this.mMediaViewVideoRendererApi.getVideoView();
    }

    public final float getVolume() {
        return this.mMediaViewVideoRendererApi.getVolume();
    }

    public void onCompleted() {
    }

    public void onError() {
    }

    public void onPaused() {
    }

    public void onPlayed() {
    }

    public void onPrepared() {
    }

    public void onSeek() {
    }

    public void onSeekDisengaged() {
    }

    public void onSeekEngaged() {
    }

    public void onVolumeChanged() {
    }

    public final void pause(boolean z11) {
        this.mMediaViewVideoRendererApi.pause(z11);
    }

    public final void play(VideoStartReason videoStartReason) {
        this.mMediaViewVideoRendererApi.play(videoStartReason);
    }

    public final void seekTo(int i5) {
        this.mMediaViewVideoRendererApi.seekTo(i5);
    }

    @Deprecated
    public final void setListener(Object obj) {
    }

    @Deprecated
    public void setNativeAd(NativeAd nativeAd) {
        this.nativeAd = nativeAd;
        this.videoAutoplayBehavior = nativeAd.getVideoAutoplayBehavior();
    }

    public final void setVolume(float f11) {
        this.mMediaViewVideoRendererApi.setVolume(f11);
    }

    public boolean shouldAllowBackgroundPlayback() {
        return false;
    }

    public final boolean shouldAutoplay() {
        return this.mMediaViewVideoRendererApi.shouldAutoplay();
    }

    @Deprecated
    public void unsetNativeAd() {
        this.nativeAd = null;
        this.videoAutoplayBehavior = VideoAutoplayBehavior.DEFAULT;
    }

    @Override // com.facebook.ads.internal.api.AdComponentFrameLayout, android.view.ViewGroup, com.facebook.ads.internal.api.AdComponentView
    public void addView(View view, int i5) {
    }

    public MediaViewVideoRenderer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initialize(new AdViewConstructorParams(context, attributeSet));
    }

    @Override // com.facebook.ads.internal.api.AdComponentFrameLayout, android.view.ViewGroup, com.facebook.ads.internal.api.AdComponentView
    public void addView(View view, int i5, int i11) {
    }

    @Override // com.facebook.ads.internal.api.AdComponentFrameLayout, android.view.ViewGroup, com.facebook.ads.internal.api.AdComponentView
    public void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
    }

    public MediaViewVideoRenderer(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        initialize(new AdViewConstructorParams(context, attributeSet, i5));
    }

    @Override // com.facebook.ads.internal.api.AdComponentFrameLayout, android.view.ViewGroup, android.view.ViewManager, com.facebook.ads.internal.api.AdComponentView
    public void addView(View view, ViewGroup.LayoutParams layoutParams) {
    }

    @TargetApi(21)
    public MediaViewVideoRenderer(Context context, AttributeSet attributeSet, int i5, int i11) {
        super(context, attributeSet, i5, i11);
        initialize(new AdViewConstructorParams(context, attributeSet, i5, i11));
    }
}
