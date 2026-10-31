package bn;

import android.os.Build;

/* loaded from: classes.dex */
public final class c implements gm.d {

    /* renamed from: a, reason: collision with root package name */
    public static final c f18139a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final gm.c f18140b = gm.c.a("packageName");

    /* renamed from: c, reason: collision with root package name */
    public static final gm.c f18141c = gm.c.a("versionName");

    /* renamed from: d, reason: collision with root package name */
    public static final gm.c f18142d = gm.c.a("appBuildVersion");

    /* renamed from: e, reason: collision with root package name */
    public static final gm.c f18143e = gm.c.a("deviceManufacturer");

    /* renamed from: f, reason: collision with root package name */
    public static final gm.c f18144f = gm.c.a("currentProcessDetails");

    /* renamed from: g, reason: collision with root package name */
    public static final gm.c f18145g = gm.c.a("appProcessDetails");

    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        a aVar = (a) obj;
        gm.e eVar = (gm.e) obj2;
        eVar.f(f18140b, aVar.f18116a);
        eVar.f(f18141c, aVar.f18117b);
        eVar.f(f18142d, aVar.f18118c);
        eVar.f(f18143e, Build.MANUFACTURER);
        eVar.f(f18144f, aVar.f18119d);
        eVar.f(f18145g, aVar.f18120e);
    }
}
