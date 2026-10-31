package k9;

import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: h, reason: collision with root package name */
    public static final WeakHashMap f71206h = new WeakHashMap();

    /* renamed from: i, reason: collision with root package name */
    public static final ThreadLocal f71207i = new ThreadLocal();

    /* renamed from: a, reason: collision with root package name */
    public int f71208a;

    /* renamed from: b, reason: collision with root package name */
    public int f71209b;

    /* renamed from: c, reason: collision with root package name */
    public int f71210c;

    /* renamed from: d, reason: collision with root package name */
    public int f71211d;

    /* renamed from: e, reason: collision with root package name */
    public int f71212e;

    /* renamed from: f, reason: collision with root package name */
    public int f71213f;

    /* renamed from: g, reason: collision with root package name */
    public c f71214g;

    public int a() {
        return this.f71213f;
    }

    public int b() {
        return this.f71212e;
    }

    public abstract void c();

    public final void d(int i5, int i11) {
        this.f71210c = i5;
        this.f71211d = i11;
        this.f71212e = i5 > 0 ? i9.a.b(i5) : 0;
        int iB = i11 > 0 ? i9.a.b(i11) : 0;
        this.f71213f = iB;
        if (this.f71212e > 4096 || iB > 4096) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BasicTexture");
            bVar.p(new Exception(), "texture is too large: %d x %d", Integer.valueOf(this.f71212e), Integer.valueOf(this.f71213f));
        }
    }

    public final void finalize() {
        ThreadLocal threadLocal = f71207i;
        threadLocal.set(a.class);
        c();
        threadLocal.set(null);
    }
}
