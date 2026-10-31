package i30;

import java.util.WeakHashMap;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: h, reason: collision with root package name */
    public static final WeakHashMap f61245h = new WeakHashMap();

    /* renamed from: i, reason: collision with root package name */
    public static final ThreadLocal f61246i = new ThreadLocal();

    /* renamed from: a, reason: collision with root package name */
    public int f61247a;

    /* renamed from: b, reason: collision with root package name */
    public int f61248b;

    /* renamed from: c, reason: collision with root package name */
    public int f61249c;

    /* renamed from: d, reason: collision with root package name */
    public int f61250d;

    /* renamed from: e, reason: collision with root package name */
    public int f61251e;

    /* renamed from: f, reason: collision with root package name */
    public int f61252f;

    /* renamed from: g, reason: collision with root package name */
    public i f61253g;

    public final void a() {
        i iVar = this.f61253g;
        if (iVar != null) {
            boolean z11 = true;
            if (this.f61248b == 1) {
                synchronized (iVar.f61311m) {
                    try {
                        if (this.f61248b != 1) {
                            z11 = false;
                        }
                        if (z11) {
                            b3.x xVar = iVar.f61311m;
                            int i5 = this.f61247a;
                            int[] iArr = xVar.f17392b;
                            int length = iArr.length;
                            int i11 = xVar.f17391a;
                            if (length == i11) {
                                int[] iArr2 = new int[i11 + i11];
                                System.arraycopy(iArr, 0, iArr2, 0, i11);
                                xVar.f17392b = iArr2;
                            }
                            int[] iArr3 = xVar.f17392b;
                            int i12 = xVar.f17391a;
                            xVar.f17391a = i12 + 1;
                            iArr3[i12] = i5;
                        }
                    } finally {
                    }
                }
            }
        }
        this.f61248b = 0;
        this.f61253g = null;
    }

    public abstract int b();

    public int c() {
        return this.f61252f;
    }

    public int d() {
        return this.f61251e;
    }

    public abstract int e();

    public final void f(int i5, int i11) {
        this.f61249c = i5;
        this.f61250d = i11;
        this.f61251e = f30.f.e(i5);
        int iE = f30.f.e(i11);
        this.f61252f = iE;
        if (this.f61251e > 2048 || iE > 2048) {
            mc0.d.f76206a.p(new Exception(), "texture is too large: %d x %d", Integer.valueOf(this.f61251e), Integer.valueOf(this.f61252f));
        }
    }

    public final void finalize() {
        ThreadLocal threadLocal = f61246i;
        threadLocal.set(a.class);
        x xVar = (x) this;
        xVar.a();
        if (xVar.f61371l != null) {
            xVar.g();
        }
        threadLocal.set(null);
    }
}
