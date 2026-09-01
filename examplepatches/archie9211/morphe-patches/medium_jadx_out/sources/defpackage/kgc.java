package defpackage;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kgc extends x1 {
    public static final kgc b = new kgc(new Object[0]);
    public final Object[] a;

    public kgc(Object[] objArr) {
        this.a = objArr;
    }

    public final x1 d(Collection collection) {
        if (collection.isEmpty()) {
            return this;
        }
        Object[] objArr = this.a;
        if (collection.size() + objArr.length > 32) {
            w89 w89VarF = f();
            w89VarF.addAll(collection);
            return w89VarF.d();
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, collection.size() + objArr.length);
        int length = objArr.length;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            objArrCopyOf[length] = it2.next();
            length++;
        }
        return new kgc(objArrCopyOf);
    }

    public final w89 f() {
        return new w89(this, null, this.a, 0);
    }

    @Override // java.util.List
    public final Object get(int i) {
        Object[] objArr = this.a;
        sgg.F(i, objArr.length);
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
        sgg.G(i, objArr.length);
        return new lz0(i, objArr.length, objArr);
    }
}
