package defpackage;

import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fh7 extends AbstractCollection implements Collection, uh6 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ fh7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean addAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                throw new UnsupportedOperationException();
            default:
                return super.addAll(collection);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((dh7) obj).clear();
                break;
            default:
                ((m89) obj).clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return ((dh7) obj2).containsValue(obj);
            default:
                return ((m89) obj2).containsValue(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean isEmpty() {
        switch (this.a) {
            case 0:
                return ((dh7) this.b).isEmpty();
            default:
                return super.isEmpty();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return new ah7((dh7) obj, 2);
            default:
                m89 m89Var = (m89) obj;
                atd[] atdVarArr = new atd[8];
                for (int i2 = 0; i2 < 8; i2++) {
                    atdVarArr[i2] = new btd(2);
                }
                return new q89(m89Var, atdVarArr);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean remove(Object obj) {
        switch (this.a) {
            case 0:
                dh7 dh7Var = (dh7) this.b;
                dh7Var.c();
                int iK = dh7Var.k(obj);
                if (iK < 0) {
                    return false;
                }
                dh7Var.n(iK);
                return true;
            default:
                return super.remove(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean removeAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                ((dh7) this.b).c();
                break;
        }
        return super.removeAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean retainAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                ((dh7) this.b).c();
                break;
        }
        return super.retainAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((dh7) obj).i;
            default:
                return ((m89) obj).e;
        }
    }
}
