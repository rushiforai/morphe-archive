package aa;

import android.content.Context;
import o9.t1;
import o9.z0;

/* loaded from: classes.dex */
public abstract class g0 extends c {

    /* renamed from: p, reason: collision with root package name */
    public static final Object f589p = new Object();

    /* renamed from: q, reason: collision with root package name */
    public static g0 f590q;

    /* renamed from: r, reason: collision with root package name */
    public static int f591r;
    public final int n;
    public g0 o;

    public g0(Context context, int i5, int i11, int i12) {
        super(context, i5, i11);
        this.n = i12;
    }

    public static g0 A(Context context, fz.u uVar) {
        synchronized (f589p) {
            try {
                g0 g0Var = f590q;
                if (g0Var != null) {
                    f590q = g0Var.o;
                    g0Var.o = null;
                    return g0Var;
                }
                return new mx.k0(context, uVar.f56360b, uVar.f56361c, (fz.d) uVar.f56362d, ((mx.l0) ((z0) z0.f80267w.h(context))).f77203x, null, false, f591r, 96);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static g0 w(Context context) {
        return A(context, t1.c(context).f80135d.f56214w);
    }

    public final void D() {
        synchronized (f589p) {
            try {
                if (f591r != this.n) {
                    return;
                }
                this.f549f = false;
                this.o = f590q;
                f590q = this;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        D();
    }
}
