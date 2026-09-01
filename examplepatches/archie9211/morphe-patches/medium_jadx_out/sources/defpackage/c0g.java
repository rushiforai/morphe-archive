package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c0g extends fyf {
    public final transient Object h;

    public c0g(Object obj) {
        super(3);
        this.h = obj;
    }

    @Override // defpackage.fyf
    public final ayf A() {
        Object[] objArr = {this.h};
        for (int i = 0; i < 1; i++) {
            hxf hxfVar = ayf.f;
            if (objArr[i] == null) {
                z72.c(b09.w(i, "at index "));
                return null;
            }
        }
        return ayf.A(1, objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.h.equals(obj);
    }

    @Override // defpackage.fyf, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.h.hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return new uyf(this.h);
    }

    @Override // defpackage.ogf
    public final int q(Object[] objArr) {
        objArr[0] = this.h;
        return 1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return ev6.x("[", this.h.toString(), "]");
    }

    @Override // defpackage.ogf
    public final ugf v() {
        return new uyf(this.h);
    }
}
