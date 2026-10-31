package tk;

import ps.f0;

/* loaded from: classes3.dex */
public final class f extends g {

    /* renamed from: c, reason: collision with root package name */
    public final transient int f89418c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f89419d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ g f89420e;

    public f(g gVar, int i5, int i11) {
        this.f89420e = gVar;
        this.f89418c = i5;
        this.f89419d = i11;
    }

    @Override // tk.d
    public final int c() {
        return this.f89420e.d() + this.f89418c + this.f89419d;
    }

    @Override // tk.d
    public final int d() {
        return this.f89420e.d() + this.f89418c;
    }

    @Override // tk.d
    public final Object[] e() {
        return this.f89420e.e();
    }

    @Override // tk.g, java.util.List
    /* renamed from: f */
    public final g subList(int i5, int i11) {
        f0.h(i5, i11, this.f89419d);
        int i12 = this.f89418c;
        return this.f89420e.subList(i5 + i12, i11 + i12);
    }

    @Override // java.util.List
    public final Object get(int i5) {
        f0.g(i5, this.f89419d);
        return this.f89420e.get(i5 + this.f89418c);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f89419d;
    }
}
