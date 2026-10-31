package com.facebook.ads;

import android.content.Context;
import androidx.annotation.Keep;
import com.facebook.ads.internal.api.AdComponentFrameLayout;
import com.facebook.ads.internal.api.AdOptionsViewApi;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderFactory;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
@Deprecated
/* loaded from: classes.dex */
public class AdOptionsView extends AdComponentFrameLayout {
    private final AdOptionsViewApi mAdOptionsViewApi;

    @Keep
    public enum Orientation {
        HORIZONTAL,
        VERTICAL
    }

    public AdOptionsView(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout) {
        super(context);
        AdOptionsViewApi adOptionsViewApiCreateAdOptionsView = DynamicLoaderFactory.makeLoader(context).createAdOptionsView(context, nativeAdBase, nativeAdLayout, this);
        this.mAdOptionsViewApi = adOptionsViewApiCreateAdOptionsView;
        attachAdComponentViewApi(adOptionsViewApiCreateAdOptionsView);
    }

    public void setIconColor(int i5) {
        this.mAdOptionsViewApi.setIconColor(i5);
    }

    public void setIconSizeDp(int i5) {
        this.mAdOptionsViewApi.setIconSizeDp(i5);
    }

    public void setOnAdClosedListener(AdClosedListener adClosedListener) {
        this.mAdOptionsViewApi.setOnAdClosedListener(adClosedListener);
    }

    public void setSingleIcon(boolean z11) {
        this.mAdOptionsViewApi.setSingleIcon(z11);
    }

    public AdOptionsView(Context context, NativeAdBase nativeAdBase, NativeAdLayout nativeAdLayout, Orientation orientation, int i5) {
        super(context);
        AdOptionsViewApi adOptionsViewApiCreateAdOptionsView = DynamicLoaderFactory.makeLoader(context).createAdOptionsView(context, nativeAdBase, nativeAdLayout, orientation, i5, this);
        this.mAdOptionsViewApi = adOptionsViewApiCreateAdOptionsView;
        attachAdComponentViewApi(adOptionsViewApiCreateAdOptionsView);
    }
}
