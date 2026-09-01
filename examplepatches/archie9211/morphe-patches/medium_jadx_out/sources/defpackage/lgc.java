package defpackage;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lgc extends y1 {
    public static final lgc b = new lgc(new Object[0]);
    public final Object[] a;

    public lgc(Object[] objArr) {
        this.a = objArr;
    }

    @Override // defpackage.y1
    public final y1 d(int i, Object obj) {
        Object[] objArr = this.a;
        hlg.n(i, objArr.length);
        if (i == objArr.length) {
            return f(obj);
        }
        if (objArr.length < 32) {
            Object[] objArr2 = new Object[objArr.length + 1];
            k80.j0(0, i, 6, objArr, objArr2);
            k80.g0(i + 1, i, objArr.length, objArr, objArr2);
            objArr2[i] = obj;
            return new lgc(objArr2);
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        k80.g0(i + 1, i, objArr.length - 1, objArr, objArrCopyOf);
        objArrCopyOf[i] = obj;
        Object[] objArr3 = new Object[32];
        objArr3[0] = objArr[31];
        return new v89(objArrCopyOf, objArr3, objArr.length + 1, 0);
    }

    @Override // defpackage.y1
    public final y1 f(Object obj) {
        Object[] objArr = this.a;
        if (objArr.length < 32) {
            Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length + 1);
            objArrCopyOf[objArr.length] = obj;
            return new lgc(objArrCopyOf);
        }
        Object[] objArr2 = new Object[32];
        objArr2[0] = obj;
        return new v89(objArr, objArr2, objArr.length + 1, 0);
    }

    @Override // java.util.List
    public final Object get(int i) {
        Object[] objArr = this.a;
        hlg.m(i, objArr.length);
        return objArr[i];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.a.length;
    }

    @Override // defpackage.k1, java.util.List
    public final int indexOf(Object obj) {
        return k80.A0(obj, this.a);
    }

    @Override // defpackage.k1, java.util.List
    public final int lastIndexOf(Object obj) {
        return k80.F0(obj, this.a);
    }

    @Override // defpackage.k1, java.util.List
    public final ListIterator listIterator(int i) {
        Object[] objArr = this.a;
        hlg.n(i, objArr.length);
        return new mz0(i, objArr.length, objArr);
    }

    @Override // defpackage.y1
    public final y1 m(Collection collection) {
        Object[] objArr = this.a;
        if (collection.size() + objArr.length > 32) {
            x89 x89VarP = p();
            x89VarP.addAll(collection);
            return x89VarP.d();
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, collection.size() + objArr.length);
        int length = objArr.length;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            objArrCopyOf[length] = it2.next();
            length++;
        }
        return new lgc(objArrCopyOf);
    }

    @Override // defpackage.y1
    public final x89 p() {
        return new x89(this, null, this.a, 0);
    }

    @Override // defpackage.y1
    public final y1 q(w1 w1Var) {
        Object[] objArr = this.a;
        int length = objArr.length;
        int length2 = objArr.length;
        Object[] objArrCopyOf = objArr;
        boolean z = false;
        for (int i = 0; i < length2; i++) {
            Object obj = objArr[i];
            if (((Boolean) w1Var.invoke(obj)).booleanValue()) {
                if (!z) {
                    objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
                    z = true;
                    length = i;
                }
            } else if (z) {
                objArrCopyOf[length] = obj;
                length++;
            }
        }
        return length == objArr.length ? this : length == 0 ? b : new lgc(k80.m0(0, length, objArrCopyOf));
    }

    @Override // defpackage.y1
    public final y1 r(int i) {
        Object[] objArr = this.a;
        hlg.m(i, objArr.length);
        if (objArr.length == 1) {
            return b;
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length - 1);
        k80.g0(i, i + 1, objArr.length, objArr, objArrCopyOf);
        return new lgc(objArrCopyOf);
    }

    @Override // defpackage.y1
    public final y1 s(int i, Object obj) {
        Object[] objArr = this.a;
        hlg.m(i, objArr.length);
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        objArrCopyOf[i] = obj;
        return new lgc(objArrCopyOf);
    }
}
