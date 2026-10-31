package mh;

/* loaded from: classes3.dex */
public final class h extends j {

    /* renamed from: c, reason: collision with root package name */
    public final transient j f76340c;

    public h(j jVar) {
        this.f76340c = jVar;
    }

    @Override // mh.j, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return this.f76340c.contains(obj);
    }

    @Override // mh.j
    public final j g() {
        return this.f76340c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        j jVar = this.f76340c;
        a.e(i5, jVar.size());
        return jVar.get((jVar.size() - 1) - i5);
    }

    @Override // mh.j, java.util.List
    /* renamed from: h */
    public final j subList(int i5, int i11) {
        j jVar = this.f76340c;
        a.m(i5, i11, jVar.size());
        return jVar.subList(jVar.size() - i11, jVar.size() - i5).g();
    }

    @Override // mh.j, java.util.List
    public final int indexOf(Object obj) {
        int iLastIndexOf = this.f76340c.lastIndexOf(obj);
        if (iLastIndexOf >= 0) {
            return (r0.size() - 1) - iLastIndexOf;
        }
        return -1;
    }

    @Override // mh.j, java.util.List
    public final int lastIndexOf(Object obj) {
        int iIndexOf = this.f76340c.indexOf(obj);
        if (iIndexOf >= 0) {
            return (r0.size() - 1) - iIndexOf;
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f76340c.size();
    }
}
