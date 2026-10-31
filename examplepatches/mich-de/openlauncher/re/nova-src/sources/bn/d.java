package bn;

import android.os.Build;

/* loaded from: classes.dex */
public final class d implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f18160a = new d();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f18161b = gm.c.a("appId");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f18162c = gm.c.a("deviceModel");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f18163d = gm.c.a("sessionSdkVersion");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f18164e = gm.c.a("osVersion");

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f18165f = gm.c.a("logEnvironment");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f18166g = gm.c.a("androidAppInfo");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        b bVar = (b) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.f(f18161b, bVar.f18126a);
        eVar.f(f18162c, Build.MODEL);
        eVar.f(f18163d, "3.0.7");
        eVar.f(f18164e, Build.VERSION.RELEASE);
        eVar.f(f18165f, w.f18303b);
        eVar.f(f18166g, bVar.f18127b);
    }
}
