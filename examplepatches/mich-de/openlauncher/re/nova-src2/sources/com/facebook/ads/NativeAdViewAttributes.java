package com.facebook.ads;

import android.content.Context;
import android.graphics.Typeface;
import androidx.annotation.Keep;
import com.facebook.ads.internal.api.NativeAdViewAttributesApi;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public class NativeAdViewAttributes {
    private final NativeAdViewAttributesApi mNativeAdViewAttributesApi;

    public NativeAdViewAttributes(Context context) {
        this.mNativeAdViewAttributesApi = DynamicLoaderFactory.makeLoader(context).createNativeAdViewAttributesApi();
    }

    @Deprecated
    public boolean getAutoplay() {
        return AdSettings.isVideoAutoplay();
    }

    @Deprecated
    public boolean getAutoplayOnMobile() {
        return AdSettings.isVideoAutoplayOnMobile();
    }

    @Deprecated
    public int getBackgroundColor() {
        return 0;
    }

    @Deprecated
    public int getButtonBorderColor() {
        return 0;
    }

    @Deprecated
    public int getButtonColor() {
        return 0;
    }

    @Deprecated
    public int getButtonTextColor() {
        return 0;
    }

    @Deprecated
    public int getDescriptionTextColor() {
        return 0;
    }

    @Deprecated
    public int getDescriptionTextSize() {
        return 0;
    }

    public NativeAdViewAttributesApi getInternalAttributes() {
        return this.mNativeAdViewAttributesApi;
    }

    @Deprecated
    public int getTitleTextColor() {
        return 0;
    }

    @Deprecated
    public int getTitleTextSize() {
        return 0;
    }

    @Deprecated
    public Typeface getTypeface() {
        return null;
    }

    @Deprecated
    public NativeAdViewAttributes setAutoplay(boolean z11) {
        return this;
    }

    @Deprecated
    public NativeAdViewAttributes setAutoplayOnMobile(boolean z11) {
        return this;
    }

    public NativeAdViewAttributes setBackgroundColor(int i5) {
        this.mNativeAdViewAttributesApi.setBackgroundColor(i5);
        return this;
    }

    public NativeAdViewAttributes setButtonBorderColor(int i5) {
        this.mNativeAdViewAttributesApi.setCTABorderColor(i5);
        return this;
    }

    public NativeAdViewAttributes setButtonColor(int i5) {
        this.mNativeAdViewAttributesApi.setCTABackgroundColor(i5);
        return this;
    }

    public NativeAdViewAttributes setButtonTextColor(int i5) {
        this.mNativeAdViewAttributesApi.setCTATextColor(i5);
        return this;
    }

    public NativeAdViewAttributes setDescriptionTextColor(int i5) {
        this.mNativeAdViewAttributesApi.setSecondaryTextColor(i5);
        return this;
    }

    public NativeAdViewAttributes setTitleTextColor(int i5) {
        this.mNativeAdViewAttributesApi.setPrimaryTextColor(i5);
        return this;
    }

    public NativeAdViewAttributes setTypeface(Typeface typeface) {
        this.mNativeAdViewAttributesApi.setTypeface(typeface);
        return this;
    }

    @Deprecated
    public NativeAdViewAttributes() {
        this.mNativeAdViewAttributesApi = DynamicLoaderFactory.makeLoaderUnsafe().createNativeAdViewAttributesApi();
    }
}
