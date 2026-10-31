package androidx.recyclerview.widget;

/* loaded from: classes2.dex */
public final class g implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f14963a;

    /* renamed from: b, reason: collision with root package name */
    public int f14964b = 0;

    /* renamed from: c, reason: collision with root package name */
    public int f14965c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f14966d = -1;

    /* renamed from: e, reason: collision with root package name */
    public Object f14967e = null;

    public g(c1 c1Var) {
        this.f14963a = c1Var;
    }

    public final void a() {
        int i5 = this.f14964b;
        if (i5 == 0) {
            return;
        }
        c1 c1Var = this.f14963a;
        if (i5 == 1) {
            c1Var.e(this.f14965c, this.f14966d);
        } else if (i5 == 2) {
            c1Var.j(this.f14965c, this.f14966d);
        } else if (i5 == 3) {
            c1Var.o(this.f14965c, this.f14966d, this.f14967e);
        }
        this.f14967e = null;
        this.f14964b = 0;
    }

    @Override // androidx.recyclerview.widget.c1
    public final void e(int i5, int i11) {
        int i12;
        if (this.f14964b == 1 && i5 >= (i12 = this.f14965c)) {
            int i13 = this.f14966d;
            if (i5 <= i12 + i13) {
                this.f14966d = i13 + i11;
                this.f14965c = Math.min(i5, i12);
                return;
            }
        }
        a();
        this.f14965c = i5;
        this.f14966d = i11;
        this.f14964b = 1;
    }

    @Override // androidx.recyclerview.widget.c1
    public final void j(int i5, int i11) {
        int i12;
        if (this.f14964b == 2 && (i12 = this.f14965c) >= i5 && i12 <= i5 + i11) {
            this.f14966d += i11;
            this.f14965c = i5;
        } else {
            a();
            this.f14965c = i5;
            this.f14966d = i11;
            this.f14964b = 2;
        }
    }

    @Override // androidx.recyclerview.widget.c1
    public final void o(int i5, int i11, Object obj) {
        int i12;
        int i13;
        int i14;
        if (this.f14964b == 3 && i5 <= (i13 = this.f14966d + (i12 = this.f14965c)) && (i14 = i5 + i11) >= i12 && this.f14967e == obj) {
            this.f14965c = Math.min(i5, i12);
            this.f14966d = Math.max(i13, i14) - this.f14965c;
            return;
        }
        a();
        this.f14965c = i5;
        this.f14966d = i11;
        this.f14967e = obj;
        this.f14964b = 3;
    }

    @Override // androidx.recyclerview.widget.c1
    public final void r(int i5, int i11) {
        a();
        this.f14963a.r(i5, i11);
    }
}
