package ads_mobile_sdk;

import android.os.Bundle;
import android.view.View;
import cl.k0;
import eg.x;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import ni.o;

/* loaded from: classes2.dex */
public final class ju1 implements b.f3 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f5398a;

    /* renamed from: b, reason: collision with root package name */
    public final String f5399b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f5400c;

    /* renamed from: d, reason: collision with root package name */
    public final String f5401d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f5402e;

    /* renamed from: f, reason: collision with root package name */
    public final String f5403f;

    /* renamed from: g, reason: collision with root package name */
    public final String f5404g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f5405h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f5406i = 0;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f5407j;

    /* renamed from: l, reason: collision with root package name */
    public final View f5408l;
    public final Bundle n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f5409p;

    /* renamed from: q, reason: collision with root package name */
    public final float f5410q;

    public ju1(x nativeAdMapper) {
        ArrayList arrayList;
        Intrinsics.g(nativeAdMapper, "nativeAdMapper");
        this.f5398a = nativeAdMapper;
        this.f5399b = nativeAdMapper.f52748a;
        ArrayList arrayList2 = nativeAdMapper.f52749b;
        if (arrayList2 != null) {
            arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
            Iterator it = arrayList2.iterator();
            while (it.hasNext()) {
                arrayList.add(new hu1((hg.a) it.next(), 1));
            }
        } else {
            arrayList = null;
        }
        this.f5400c = arrayList;
        x xVar = (x) this.f5398a;
        this.f5401d = xVar.f52750c;
        hg.a aVar = xVar.f52751d;
        this.f5402e = aVar != null ? new hu1(aVar, 0) : null;
        x xVar2 = (x) this.f5398a;
        this.f5403f = xVar2.f52752e;
        this.f5404g = xVar2.f52753f;
        this.f5405h = xVar2.f52754g;
        this.f5407j = xVar2.f52755h;
        xVar2.getClass();
        this.f5408l = xVar2.f52756i;
        this.n = xVar2.f52757j;
        this.o = xVar2.f52758k;
        this.f5409p = xVar2.f52759l;
        this.f5410q = xVar2.f52760m;
    }

    @Override // b.f3
    public final View a() {
        switch (this.f5406i) {
            case 0:
                return this.f5408l;
            default:
                return (View) this.f5402e;
        }
    }

    @Override // b.f3
    public final boolean b() {
        switch (this.f5406i) {
        }
        return this.o;
    }

    @Override // b.f3
    public final View c() {
        switch (this.f5406i) {
            case 0:
                return null;
            default:
                return this.f5408l;
        }
    }

    @Override // b.f3
    public final boolean d() {
        switch (this.f5406i) {
        }
        return this.f5409p;
    }

    @Override // b.f3
    public final void destroy() {
        switch (this.f5406i) {
            case 0:
                ((x) this.f5398a).a();
                break;
            default:
                ((eg.z) this.f5398a).getClass();
                break;
        }
    }

    @Override // b.f3
    public final float e() {
        switch (this.f5406i) {
        }
        return this.f5410q;
    }

    @Override // b.f3
    public final ArrayList f() {
        switch (this.f5406i) {
        }
        return this.f5400c;
    }

    @Override // b.f3
    public final String getAdvertiser() {
        switch (this.f5406i) {
        }
        return this.f5404g;
    }

    @Override // b.f3
    public final String getBody() {
        switch (this.f5406i) {
        }
        return this.f5401d;
    }

    @Override // b.f3
    public final String getCallToAction() {
        switch (this.f5406i) {
        }
        return this.f5403f;
    }

    @Override // b.f3
    public final Bundle getExtras() {
        switch (this.f5406i) {
        }
        return this.n;
    }

    @Override // b.f3
    public final boolean getHasVideoContent() {
        switch (this.f5406i) {
        }
        return this.f5407j;
    }

    @Override // b.f3
    public final String getHeadline() {
        switch (this.f5406i) {
        }
        return this.f5399b;
    }

    @Override // b.f3
    public final b.u5 getIcon() {
        switch (this.f5406i) {
            case 0:
                return (hu1) this.f5402e;
            default:
                return (wl3) this.f5405h;
        }
    }

    @Override // b.f3
    public final String getPrice() {
        switch (this.f5406i) {
        }
        return null;
    }

    @Override // b.f3
    public final String getStore() {
        switch (this.f5406i) {
            case 0:
                return (String) this.f5405h;
            default:
                return null;
        }
    }

    @Override // b.f3
    public final void recordImpression() {
        switch (this.f5406i) {
            case 0:
                ((x) this.f5398a).c();
                break;
            default:
                ((eg.z) this.f5398a).getClass();
                break;
        }
    }

    @Override // b.f3
    public final void a(View view) {
        switch (this.f5406i) {
            case 0:
                ((x) this.f5398a).b(view);
                break;
            default:
                ((eg.z) this.f5398a).getClass();
                break;
        }
    }

    @Override // b.f3
    public final void a(o oVar, Map map) {
        switch (this.f5406i) {
            case 0:
                ((x) this.f5398a).d(oVar, map);
                break;
            default:
                ((eg.z) this.f5398a).a(oVar, map);
                break;
        }
    }

    @Override // b.f3
    public final void a(o oVar) {
        switch (this.f5406i) {
            case 0:
                ((x) this.f5398a).e(oVar);
                break;
            default:
                ((eg.z) this.f5398a).b(oVar);
                break;
        }
    }

    public ju1(eg.z unifiedNativeAdMapper) {
        Intrinsics.g(unifiedNativeAdMapper, "unifiedNativeAdMapper");
        this.f5398a = unifiedNativeAdMapper;
        this.f5399b = unifiedNativeAdMapper.f52761a;
        this.f5400c = null;
        this.f5401d = unifiedNativeAdMapper.f52762b;
        k0 k0Var = unifiedNativeAdMapper.f52763c;
        this.f5405h = k0Var != null ? new wl3(k0Var) : null;
        this.f5403f = unifiedNativeAdMapper.f52764d;
        this.f5404g = unifiedNativeAdMapper.f52765e;
        this.f5407j = unifiedNativeAdMapper.f52766f;
        this.f5408l = unifiedNativeAdMapper.f52767g;
        this.f5402e = unifiedNativeAdMapper.f52768h;
        this.n = unifiedNativeAdMapper.f52769i;
        this.o = unifiedNativeAdMapper.f52770j;
        this.f5409p = unifiedNativeAdMapper.f52771k;
        this.f5410q = unifiedNativeAdMapper.f52772l;
    }
}
