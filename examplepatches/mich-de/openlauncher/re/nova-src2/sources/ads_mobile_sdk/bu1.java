package ads_mobile_sdk;

import b.t2;
import b0.x;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import ui.d;

/* loaded from: classes.dex */
public final class bu1 extends c0.g2 implements d {

    /* renamed from: q, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f1560q = {t2.C(bu1.class, "adEventCallback", "getAdEventCallback()Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdEventCallback;")};

    /* renamed from: b, reason: collision with root package name */
    public final InternalNativeAd f1561b;

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.e3 f1562c;

    /* renamed from: d, reason: collision with root package name */
    public final String f1563d;

    /* renamed from: g, reason: collision with root package name */
    public final String f1564g;

    /* renamed from: h, reason: collision with root package name */
    public final String f1565h;

    /* renamed from: m, reason: collision with root package name */
    public final vm.c f1566m;

    /* renamed from: p, reason: collision with root package name */
    public final d62 f1567p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bu1(InternalNativeAd internalNativeAd) {
        super(internalNativeAd);
        Intrinsics.g(internalNativeAd, "internalNativeAd");
        this.f1561b = internalNativeAd;
        int i5 = 1;
        this.f1562c = new io.sentry.e3(i5, new x(this, i5), null);
        it1 it1Var = internalNativeAd.f33987e;
        this.f1563d = (String) it1Var.f4935d.get("headline");
        LinkedHashMap linkedHashMap = it1Var.f4935d;
        this.f1564g = (String) linkedHashMap.get("call_to_action");
        this.f1565h = (String) linkedHashMap.get("advertiser");
        wf1 wf1Var = it1Var.f4938g;
        this.f1566m = wf1Var != null ? new vm.c(18, wf1Var.f11268a, wf1Var.f11269b) : null;
        md1 md1Var = it1Var.f4939h;
        if (md1Var != null) {
            List<wf1> list = md1Var.f7137b;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            for (wf1 wf1Var2 : list) {
                arrayList.add(new vm.c(18, wf1Var2.f11268a, wf1Var2.f11269b));
            }
        }
        this.f1567p = new d62(internalNativeAd);
        internalNativeAd.f33988l.k();
    }

    public final void setAdEventCallback(ui.e eVar) {
        this.f1562c.setValue(this, f1560q[0], eVar);
    }
}
