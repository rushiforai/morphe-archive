package com.google.android.gms.ads.mediation;

import android.content.Context;
import android.os.Bundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eg.g;
import eg.h;
import eg.r;
import kotlin.Deprecated;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Deprecated
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\bg\u0018\u00002\u00020\u0001J9\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\b\u0010\n\u001a\u0004\u0018\u00010\u0006H&¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH&¢\u0006\u0004\b\u000e\u0010\u000fø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0010À\u0006\u0001"}, d2 = {"Lcom/google/android/gms/ads/mediation/MediationInterstitialAdapter;", "Leg/h;", "Landroid/content/Context;", "context", "Leg/r;", "listener", "Landroid/os/Bundle;", "serverParameters", "Leg/g;", "mediationAdRequest", "mediationExtras", b.f42142b, "requestInterstitialAd", "(Landroid/content/Context;Leg/r;Landroid/os/Bundle;Leg/g;Landroid/os/Bundle;)V", "showInterstitial", "()V", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public interface MediationInterstitialAdapter extends h {
    /* synthetic */ void onDestroy();

    /* synthetic */ void onPause();

    /* synthetic */ void onResume();

    void requestInterstitialAd(@NotNull Context context, @NotNull r listener, @NotNull Bundle serverParameters, @NotNull g mediationAdRequest, @Nullable Bundle mediationExtras);

    void showInterstitial();
}
