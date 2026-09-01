package defpackage;

import j$.util.DesugarCollections;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tw6 extends a2 implements uw6, RandomAccess {
    public final ArrayList b;

    static {
        new tw6(10).a = false;
    }

    public tw6(int i) {
        this(new ArrayList(i));
    }

    @Override // defpackage.uw6
    public final List a() {
        return DesugarCollections.unmodifiableList(this.b);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        d();
        this.b.add(i, (String) obj);
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        d();
        if (collection instanceof uw6) {
            collection = ((uw6) collection).a();
        }
        boolean zAddAll = this.b.addAll(i, collection);
        ((AbstractList) this).modCount++;
        return zAddAll;
    }

    @Override // defpackage.uw6
    public final uw6 b() {
        return this.a ? new l1e(this) : this;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        d();
        this.b.clear();
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        ArrayList arrayList = this.b;
        Object obj = arrayList.get(i);
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof f21) {
            f21 f21Var = (f21) obj;
            String strU = f21Var.u();
            if (f21Var.p()) {
                arrayList.set(i, strU);
            }
            return strU;
        }
        byte[] bArr = (byte[]) obj;
        String str = new String(bArr, v56.a);
        if (toe.a.s(bArr, 0, bArr.length)) {
            arrayList.set(i, str);
        }
        return str;
    }

    @Override // defpackage.t56
    public final t56 h(int i) {
        ArrayList arrayList = this.b;
        if (i < arrayList.size()) {
            lg8.r();
            return null;
        }
        ArrayList arrayList2 = new ArrayList(i);
        arrayList2.addAll(arrayList);
        return new tw6(arrayList2);
    }

    @Override // defpackage.uw6
    public final void j(f21 f21Var) {
        d();
        this.b.add(f21Var);
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.uw6
    public final Object o(int i) {
        return this.b.get(i);
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        d();
        Object objRemove = this.b.remove(i);
        ((AbstractList) this).modCount++;
        return objRemove instanceof String ? (String) objRemove : objRemove instanceof f21 ? ((f21) objRemove).u() : new String((byte[]) objRemove, v56.a);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        d();
        Object obj2 = this.b.set(i, (String) obj);
        return obj2 instanceof String ? (String) obj2 : obj2 instanceof f21 ? ((f21) obj2).u() : new String((byte[]) obj2, v56.a);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.b.size();
    }

    public tw6(ArrayList arrayList) {
        this.b = arrayList;
    }

    @Override // defpackage.a2, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        return addAll(this.b.size(), collection);
    }
}
