package eg;

import ads_mobile_sdk.h2;
import android.content.Context;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class b implements o {

    @NotNull
    public static final a Companion = new a();

    @NotNull
    public static final String ERROR_MESSAGE_METHOD_NOT_FOUND = "Method is not found";

    @NotNull
    public abstract bg.f getSDKVersionInfo();

    @NotNull
    public abstract bg.f getVersionInfo();

    public abstract void initialize(@NotNull Context context, @NotNull c cVar, @NotNull List<n> list);

    public void loadAppOpenAd(@NotNull j adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support app open ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadBannerAd(@NotNull l adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support banner ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadInterscrollerAd(@NotNull l adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support interscroller ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadInterstitialAd(@NotNull q adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support interstitial ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadNativeAd(@NotNull s adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support native ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadNativeAdMapper(@NotNull s adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        throw new IllegalStateException(ERROR_MESSAGE_METHOD_NOT_FOUND);
    }

    public void loadRewardedAd(@NotNull w adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support rewarded ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }

    public void loadRewardedInterstitialAd(@NotNull w adConfiguration, @NotNull f callback) {
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(callback, "callback");
        h2[] h2VarArr = h2.f4194b;
        callback.onFailure(new bg.a(7, getClass().getSimpleName().concat(" does not support rewarded interstitial ads."), "com.google.android.libraries.ads.mobile.sdk"));
    }
}
