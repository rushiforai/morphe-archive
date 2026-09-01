package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pzf extends fyf {
    public static final Object[] m;
    public static final pzf n;
    public final transient Object[] h;
    public final transient int i;
    public final transient Object[] j;
    public final transient int k;
    public final transient int l;

    static {
        Object[] objArr = new Object[0];
        m = objArr;
        n = new pzf(0, 0, 0, objArr, objArr);
    }

    public pzf(int i, int i2, int i3, Object[] objArr, Object[] objArr2) {
        super(3);
        this.h = objArr;
        this.i = i;
        this.j = objArr2;
        this.k = i2;
        this.l = i3;
    }

    @Override // defpackage.fyf
    public final ayf B() {
        return ayf.A(this.l, this.h);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj == null) {
            return false;
        }
        Object[] objArr = this.j;
        if (objArr.length == 0) {
            return false;
        }
        int iRotateLeft = (int) (((long) Integer.rotateLeft((int) (((long) obj.hashCode()) * (-862048943)), 15)) * 461845907);
        while (true) {
            int i = iRotateLeft & this.k;
            Object obj2 = objArr[i];
            if (obj2 == null) {
                return false;
            }
            if (obj2.equals(obj)) {
                return true;
            }
            iRotateLeft = i + 1;
        }
    }

    @Override // defpackage.fyf, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return A().listIterator(0);
    }

    @Override // defpackage.ogf
    public final int q(Object[] objArr) {
        Object[] objArr2 = this.h;
        int i = this.l;
        System.arraycopy(objArr2, 0, objArr, 0, i);
        return i;
    }

    @Override // defpackage.ogf
    public final int r() {
        return this.l;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.l;
    }

    @Override // defpackage.ogf
    public final int t() {
        return 0;
    }

    @Override // defpackage.ogf
    public final ugf v() {
        return A().listIterator(0);
    }

    @Override // defpackage.ogf
    public final Object[] w() {
        return this.h;
    }
}
