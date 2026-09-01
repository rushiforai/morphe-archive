package defpackage;

import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tgf extends ogf implements Set, j$.util.Set {
    public static final Object[] i;
    public static final tgf j;
    public transient sgf f;
    public final transient Object[] g;
    public final transient Object[] h;

    static {
        Object[] objArr = new Object[0];
        i = objArr;
        j = new tgf(objArr, objArr);
    }

    public tgf(Object[] objArr, Object[] objArr2) {
        super(0);
        this.g = objArr;
        this.h = objArr2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return false;
    }

    @Override // defpackage.ogf
    public final int d(Object[] objArr) {
        System.arraycopy(this.g, 0, objArr, 0, 0);
        return 0;
    }

    @Override // defpackage.ogf
    public final int e() {
        return 0;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this || obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            try {
                if (set.size() == 0) {
                    return containsAll(set);
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    @Override // defpackage.ogf
    public final int f() {
        return 0;
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        return 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        sgf sgfVar = this.f;
        if (sgfVar == null) {
            pgf pgfVar = rgf.f;
            sgfVar = sgf.h;
            this.f = sgfVar;
        }
        return sgfVar.listIterator(0);
    }

    @Override // defpackage.ogf
    public final Object[] m() {
        return this.g;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 0;
    }
}
