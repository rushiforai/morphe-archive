package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lhg extends vgg {
    public static final Object[] i;
    public static final lhg j;
    public final transient Object[] d;
    public final transient int e;
    public final transient Object[] f;
    public final transient int g;
    public final transient int h;

    static {
        Object[] objArr = new Object[0];
        i = objArr;
        j = new lhg(0, 0, 0, objArr, objArr);
    }

    public lhg(int i2, int i3, int i4, Object[] objArr, Object[] objArr2) {
        this.d = objArr;
        this.e = i2;
        this.f = objArr2;
        this.g = i3;
        this.h = i4;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj != null) {
            Object[] objArr = this.f;
            if (objArr.length != 0) {
                int I = gr7.I(obj);
                while (true) {
                    int i2 = I & this.g;
                    Object obj2 = objArr[i2];
                    if (obj2 == null) {
                        return false;
                    }
                    if (obj2.equals(obj)) {
                        return true;
                    }
                    I = i2 + 1;
                }
            }
        }
        return false;
    }

    @Override // defpackage.agg
    public final ugf d() {
        return s().listIterator(0);
    }

    @Override // defpackage.agg
    public final Object[] e() {
        return this.d;
    }

    @Override // defpackage.agg
    public final int f() {
        return 0;
    }

    @Override // defpackage.vgg, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return s().listIterator(0);
    }

    @Override // defpackage.agg
    public final int m() {
        return this.h;
    }

    @Override // defpackage.agg
    public final boolean p() {
        return false;
    }

    @Override // defpackage.agg
    public final int q(Object[] objArr) {
        Object[] objArr2 = this.d;
        int i2 = this.h;
        System.arraycopy(objArr2, 0, objArr, 0, i2);
        return i2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.h;
    }

    @Override // defpackage.vgg
    public final mgg t() {
        cgg cggVar = mgg.b;
        int i2 = this.h;
        return i2 == 0 ? dhg.e : new dhg(i2, this.d);
    }
}
