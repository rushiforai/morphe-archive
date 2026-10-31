package n0;

import p1.s2;

/* loaded from: classes.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f77434a;

    /* renamed from: b, reason: collision with root package name */
    public final k0 f77435b;

    /* renamed from: d, reason: collision with root package name */
    public int f77437d;

    /* renamed from: e, reason: collision with root package name */
    public j0 f77438e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f77439f;

    /* renamed from: c, reason: collision with root package name */
    public int f77436c = -1;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f77440g = androidx.compose.runtime.d.k(null);

    public j0(Object obj, k0 k0Var) {
        this.f77434a = obj;
        this.f77435b = k0Var;
    }

    public final j0 a() {
        if (this.f77439f) {
            j0.b.c("Pin should not be called on an already disposed item ");
        }
        if (this.f77437d == 0) {
            this.f77435b.f77443a.add(this);
            j0 j0Var = (j0) ((s2) this.f77440g).getValue();
            if (j0Var != null) {
                j0Var.a();
            } else {
                j0Var = null;
            }
            this.f77438e = j0Var;
        }
        this.f77437d++;
        return this;
    }

    public final void b() {
        if (this.f77439f) {
            return;
        }
        if (this.f77437d <= 0) {
            j0.b.c("Release should only be called once");
        }
        int i5 = this.f77437d - 1;
        this.f77437d = i5;
        if (i5 == 0) {
            this.f77435b.f77443a.remove(this);
            j0 j0Var = this.f77438e;
            if (j0Var != null) {
                j0Var.b();
            }
            this.f77438e = null;
        }
    }
}
