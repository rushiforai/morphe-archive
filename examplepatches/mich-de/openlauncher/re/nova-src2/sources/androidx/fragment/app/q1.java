package androidx.fragment.app;

import java.util.ArrayList;

/* loaded from: classes2.dex */
public abstract class q1 {

    /* renamed from: a, reason: collision with root package name */
    public final r0 f14659a;

    /* renamed from: b, reason: collision with root package name */
    public final ClassLoader f14660b;

    /* renamed from: d, reason: collision with root package name */
    public int f14662d;

    /* renamed from: e, reason: collision with root package name */
    public int f14663e;

    /* renamed from: f, reason: collision with root package name */
    public int f14664f;

    /* renamed from: g, reason: collision with root package name */
    public int f14665g;

    /* renamed from: h, reason: collision with root package name */
    public int f14666h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f14667i;

    /* renamed from: k, reason: collision with root package name */
    public String f14669k;

    /* renamed from: l, reason: collision with root package name */
    public int f14670l;

    /* renamed from: m, reason: collision with root package name */
    public CharSequence f14671m;
    public int n;
    public CharSequence o;

    /* renamed from: p, reason: collision with root package name */
    public ArrayList f14672p;

    /* renamed from: q, reason: collision with root package name */
    public ArrayList f14673q;

    /* renamed from: s, reason: collision with root package name */
    public ArrayList f14675s;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14661c = new ArrayList();

    /* renamed from: j, reason: collision with root package name */
    public boolean f14668j = true;

    /* renamed from: r, reason: collision with root package name */
    public boolean f14674r = false;

    public q1(r0 r0Var, ClassLoader classLoader) {
        this.f14659a = r0Var;
        this.f14660b = classLoader;
    }

    public final void b(FragmentContainerView fragmentContainerView, h0 h0Var, String str) {
        h0Var.mContainer = fragmentContainerView;
        h0Var.mInDynamicContainer = true;
        e(fragmentContainerView.getId(), h0Var, str, 1);
    }

    public final void c(p1 p1Var) {
        this.f14661c.add(p1Var);
        p1Var.f14652d = this.f14662d;
        p1Var.f14653e = this.f14663e;
        p1Var.f14654f = this.f14664f;
        p1Var.f14655g = this.f14665g;
    }

    public final void d() {
        if (!this.f14668j) {
            throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
        }
        this.f14667i = true;
        this.f14669k = null;
    }

    public abstract void e(int i5, h0 h0Var, String str, int i11);

    public final void f(int i5, h0 h0Var, String str) {
        if (i5 == 0) {
            throw new IllegalArgumentException("Must use non-zero containerViewId");
        }
        e(i5, h0Var, str, 2);
    }

    public final void g(boolean z11, Runnable runnable) {
        if (!z11) {
            if (this.f14667i) {
                throw new IllegalStateException("This transaction is already being added to the back stack");
            }
            this.f14668j = false;
        }
        if (this.f14675s == null) {
            this.f14675s = new ArrayList();
        }
        this.f14675s.add(runnable);
    }

    public final void h() {
        this.f14674r = true;
    }
}
