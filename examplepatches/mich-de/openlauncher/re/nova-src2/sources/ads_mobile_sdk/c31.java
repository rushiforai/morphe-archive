package ads_mobile_sdk;

import b.t2;
import b0.x;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class c31 extends c0.g2 implements oi.b {

    /* renamed from: b, reason: collision with root package name */
    public final bu1 f1648b;

    /* renamed from: c, reason: collision with root package name */
    public final vm.c f1649c;

    /* renamed from: d, reason: collision with root package name */
    public final String f1650d;

    /* renamed from: i, reason: collision with root package name */
    public final io.sentry.e3 f1651i;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f1647k = {t2.C(c31.class, "adEventCallback", "getAdEventCallback()Lcom/google/android/libraries/ads/mobile/sdk/iconad/IconAdEventCallback;")};

    /* renamed from: j, reason: collision with root package name */
    public static final lm.e f1646j = new lm.e(3);

    /* JADX WARN: Illegal instructions before constructor call */
    public c31(bu1 bu1Var, vm.c cVar) {
        InternalNativeAd internalNativeAd = bu1Var.f1561b;
        super(internalNativeAd);
        this.f1648b = bu1Var;
        this.f1649c = cVar;
        this.f1650d = bu1Var.f1563d;
        this.f1651i = new io.sentry.e3(1, new x(this, 2), (Object) null);
    }

    public final void setAdEventCallback(oi.c cVar) {
        this.f1651i.setValue(this, f1647k[0], cVar);
    }
}
