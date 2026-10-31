package com.google.android.gms.ads.mediation;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import bg.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import eg.g;
import eg.h;
import eg.m;
import kotlin.Deprecated;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Deprecated
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bg\u0018\u00002\u00020\u0001JA\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n2\b\u0010\f\u001a\u0004\u0018\u00010\u0006H&¢\u0006\u0004\b\u000e\u0010\u000fJ\u0011\u0010\u0011\u001a\u0004\u0018\u00010\u0010H&¢\u0006\u0004\b\u0011\u0010\u0012ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0013À\u0006\u0001"}, d2 = {"Lcom/google/android/gms/ads/mediation/MediationBannerAdapter;", "Leg/h;", "Landroid/content/Context;", "context", "Leg/m;", "listener", "Landroid/os/Bundle;", "serverParameters", "Lbg/c;", "adSize", "Leg/g;", "mediationAdRequest", "mediationExtras", b.f42142b, "requestBannerAd", "(Landroid/content/Context;Leg/m;Landroid/os/Bundle;Lbg/c;Leg/g;Landroid/os/Bundle;)V", "Landroid/view/View;", "getBannerView", "()Landroid/view/View;", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public interface MediationBannerAdapter extends h {
    @Nullable
    View getBannerView();

    /* synthetic */ void onDestroy();

    /* synthetic */ void onPause();

    /* synthetic */ void onResume();

    void requestBannerAd(@NotNull Context context, @NotNull m listener, @NotNull Bundle serverParameters, @NotNull c adSize, @NotNull g mediationAdRequest, @Nullable Bundle mediationExtras);
}
