package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eh7 extends u1 {
    public final /* synthetic */ int a;
    public final dh7 b;

    public /* synthetic */ eh7(dh7 dh7Var, int i) {
        this.a = i;
        this.b = dh7Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        switch (this.a) {
            case 0:
                ((Map.Entry) obj).getClass();
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean addAll(Collection collection) {
        int i = this.a;
        collection.getClass();
        switch (i) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
            case 0:
                dh7Var.clear();
                break;
            default:
                dh7Var.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                int iJ = dh7Var.j(entry.getKey());
                if (iJ < 0) {
                    return false;
                }
                Object[] objArr = dh7Var.b;
                objArr.getClass();
                return g76.L(objArr[iJ], entry.getValue());
            default:
                return dh7Var.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean containsAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                return this.b.f(collection);
            default:
                return super.containsAll(collection);
        }
    }

    @Override // defpackage.u1
    public final int d() {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
        }
        return dh7Var.i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
        }
        return dh7Var.isEmpty();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
            case 0:
                return new ah7(dh7Var, 0);
            default:
                return new ah7(dh7Var, 1);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        int i = this.a;
        dh7 dh7Var = this.b;
        switch (i) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    dh7Var.c();
                    int iJ = dh7Var.j(entry.getKey());
                    if (iJ >= 0) {
                        Object[] objArr = dh7Var.b;
                        objArr.getClass();
                        if (g76.L(objArr[iJ], entry.getValue())) {
                            dh7Var.n(iJ);
                        }
                    }
                }
                break;
            default:
                dh7Var.c();
                int iJ2 = dh7Var.j(obj);
                if (iJ2 >= 0) {
                    dh7Var.n(iJ2);
                }
                break;
        }
        return true;
    }

    @Override // java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean removeAll(Collection collection) {
        int i = this.a;
        dh7 dh7Var = this.b;
        collection.getClass();
        switch (i) {
            case 0:
                dh7Var.c();
                break;
            default:
                dh7Var.c();
                break;
        }
        return super.removeAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean retainAll(Collection collection) {
        int i = this.a;
        dh7 dh7Var = this.b;
        collection.getClass();
        switch (i) {
            case 0:
                dh7Var.c();
                break;
            default:
                dh7Var.c();
                break;
        }
        return super.retainAll(collection);
    }
}
