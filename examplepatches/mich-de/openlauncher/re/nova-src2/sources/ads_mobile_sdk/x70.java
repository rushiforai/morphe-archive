package ads_mobile_sdk;

import b.t2;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class x70 extends c0.g2 {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f11599g = {t2.C(x70.class, "adEventCallback", "getAdEventCallback()Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdEventCallback;"), t2.C(x70.class, "onCustomClickListener", "getOnCustomClickListener()Lcom/google/android/libraries/ads/mobile/sdk/nativead/OnCustomClickListener;")};

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x70(InternalNativeAd internalNativeAd) {
        super(internalNativeAd);
        Intrinsics.g(internalNativeAd, "internalNativeAd");
        String str = internalNativeAd.f33987e.f4934c;
    }
}
