package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dzf extends gyf {
    public final transient Object d;

    public dzf(Object obj) {
        this.d = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.d.equals(obj);
    }

    @Override // defpackage.cxf
    public final int d(Object[] objArr) {
        objArr[0] = this.d;
        return 1;
    }

    @Override // defpackage.gyf, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.d.hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return new iyf(this.d);
    }

    @Override // defpackage.gyf, defpackage.cxf
    public final uxf m() {
        Object[] objArr = {this.d};
        for (int i = 0; i < 1; i++) {
            exf exfVar = uxf.b;
            if (objArr[i] == null) {
                z72.c(b09.w(i, "at index "));
                return null;
            }
        }
        return uxf.s(1, objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return ev6.x("[", this.d.toString(), "]");
    }
}
