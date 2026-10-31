package qf;

import android.text.Layout;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public String f84031a;

    /* renamed from: b, reason: collision with root package name */
    public int f84032b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f84033c;

    /* renamed from: d, reason: collision with root package name */
    public int f84034d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f84035e;

    /* renamed from: k, reason: collision with root package name */
    public float f84041k;

    /* renamed from: l, reason: collision with root package name */
    public String f84042l;
    public Layout.Alignment o;

    /* renamed from: p, reason: collision with root package name */
    public Layout.Alignment f84044p;

    /* renamed from: r, reason: collision with root package name */
    public b f84046r;

    /* renamed from: f, reason: collision with root package name */
    public int f84036f = -1;

    /* renamed from: g, reason: collision with root package name */
    public int f84037g = -1;

    /* renamed from: h, reason: collision with root package name */
    public int f84038h = -1;

    /* renamed from: i, reason: collision with root package name */
    public int f84039i = -1;

    /* renamed from: j, reason: collision with root package name */
    public int f84040j = -1;

    /* renamed from: m, reason: collision with root package name */
    public int f84043m = -1;
    public int n = -1;

    /* renamed from: q, reason: collision with root package name */
    public int f84045q = -1;

    /* renamed from: s, reason: collision with root package name */
    public float f84047s = Float.MAX_VALUE;

    public final void a(g gVar) {
        int i5;
        Layout.Alignment alignment;
        Layout.Alignment alignment2;
        String str;
        if (gVar != null) {
            if (!this.f84033c && gVar.f84033c) {
                this.f84032b = gVar.f84032b;
                this.f84033c = true;
            }
            if (this.f84038h == -1) {
                this.f84038h = gVar.f84038h;
            }
            if (this.f84039i == -1) {
                this.f84039i = gVar.f84039i;
            }
            if (this.f84031a == null && (str = gVar.f84031a) != null) {
                this.f84031a = str;
            }
            if (this.f84036f == -1) {
                this.f84036f = gVar.f84036f;
            }
            if (this.f84037g == -1) {
                this.f84037g = gVar.f84037g;
            }
            if (this.n == -1) {
                this.n = gVar.n;
            }
            if (this.o == null && (alignment2 = gVar.o) != null) {
                this.o = alignment2;
            }
            if (this.f84044p == null && (alignment = gVar.f84044p) != null) {
                this.f84044p = alignment;
            }
            if (this.f84045q == -1) {
                this.f84045q = gVar.f84045q;
            }
            if (this.f84040j == -1) {
                this.f84040j = gVar.f84040j;
                this.f84041k = gVar.f84041k;
            }
            if (this.f84046r == null) {
                this.f84046r = gVar.f84046r;
            }
            if (this.f84047s == Float.MAX_VALUE) {
                this.f84047s = gVar.f84047s;
            }
            if (!this.f84035e && gVar.f84035e) {
                this.f84034d = gVar.f84034d;
                this.f84035e = true;
            }
            if (this.f84043m != -1 || (i5 = gVar.f84043m) == -1) {
                return;
            }
            this.f84043m = i5;
        }
    }
}
