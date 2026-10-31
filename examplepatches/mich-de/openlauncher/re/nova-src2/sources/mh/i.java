package mh;

/* loaded from: classes3.dex */
public final class i extends j {

    /* renamed from: c, reason: collision with root package name */
    public final transient int f76342c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f76343d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ j f76344e;

    public i(j jVar, int i5, int i11) {
        this.f76344e = jVar;
        this.f76342c = i5;
        this.f76343d = i11;
    }

    @Override // mh.f
    public final int c() {
        return this.f76344e.d() + this.f76342c + this.f76343d;
    }

    @Override // mh.f
    public final int d() {
        return this.f76344e.d() + this.f76342c;
    }

    @Override // mh.f
    public final Object[] f() {
        return this.f76344e.f();
    }

    @Override // java.util.List
    public final Object get(int i5) {
        a.e(i5, this.f76343d);
        return this.f76344e.get(i5 + this.f76342c);
    }

    @Override // mh.j, java.util.List
    /* renamed from: h */
    public final j subList(int i5, int i11) {
        a.m(i5, i11, this.f76343d);
        int i12 = this.f76342c;
        return this.f76344e.subList(i5 + i12, i11 + i12);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f76343d;
    }
}
