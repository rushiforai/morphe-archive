package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ejc implements Parcelable, dqc, List, RandomAccess, vh6 {
    public static final Parcelable.Creator<ejc> CREATOR = new djc(0);
    public bqc a;

    public ejc(y1 y1Var) {
        oic oicVarH = uic.h();
        bqc bqcVar = new bqc(oicVarH.g(), y1Var);
        if (!(oicVarH instanceof sd5)) {
            bqcVar.b = new bqc(1L, y1Var);
        }
        this.a = bqcVar;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        int i;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarF = y1Var.f(obj);
            if (y1VarF.equals(y1Var)) {
                return false;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i, y1VarF, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        int i;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarM = y1Var.m(collection);
            if (g76.L(y1VarM, y1Var)) {
                return false;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i, y1VarM, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        oic oicVarH;
        bqc bqcVar = this.a;
        bqcVar.getClass();
        synchronized (uic.c) {
            oicVarH = uic.h();
            bqc bqcVar2 = (bqc) uic.x(bqcVar, this, oicVarH);
            synchronized (g01.r) {
                bqcVar2.c = lgc.b;
                bqcVar2.d++;
                bqcVar2.e++;
            }
        }
        uic.m(oicVarH, this);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return g01.R(this).c.contains(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        return g01.R(this).c.containsAll(collection);
    }

    @Override // defpackage.dqc
    public final fqc d() {
        return this.a;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.dqc
    public final fqc f(fqc fqcVar, fqc fqcVar2, fqc fqcVar3) {
        return null;
    }

    @Override // java.util.List
    public final Object get(int i) {
        return g01.R(this).c.get(i);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        return g01.R(this).c.indexOf(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return g01.R(this).c.isEmpty();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return listIterator();
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        return g01.R(this).c.lastIndexOf(obj);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new wn5(this, 0);
    }

    @Override // defpackage.dqc
    public final void m(fqc fqcVar) {
        fqcVar.b = this.a;
        this.a = (bqc) fqcVar;
    }

    public final void p(int i, int i2) {
        int i3;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i3 = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            x89 x89VarP = y1Var.p();
            x89VarP.subList(i, i2).clear();
            y1 y1VarD = x89VarP.d();
            if (g76.L(y1VarD, y1Var)) {
                return;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i3, y1VarD, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        int i;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            int iIndexOf = y1Var.indexOf(obj);
            y1 y1VarR = iIndexOf != -1 ? y1Var.r(iIndexOf) : y1Var;
            if (y1VarR.equals(y1Var)) {
                return false;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i, y1VarR, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        int i;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarQ = y1Var.q(new w1(0, collection));
            if (g76.L(y1VarQ, y1Var)) {
                return false;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i, y1VarQ, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        return g01.T(this, new w1(3, collection));
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        int i2;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        Object obj2 = get(i);
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i2 = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarS = y1Var.s(i, obj);
            if (y1VarS.equals(y1Var)) {
                break;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i2, y1VarS, false);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return obj2;
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return g01.R(this).c.getSize();
    }

    @Override // java.util.List
    public final List subList(int i, int i2) {
        if (!(i >= 0 && i <= i2 && i2 <= size())) {
            xx9.a("fromIndex or toIndex are out of bounds");
        }
        return new cvc(this, i, i2);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return kng.N(this);
    }

    public final String toString() {
        bqc bqcVar = this.a;
        bqcVar.getClass();
        return "SnapshotStateList(value=" + ((bqc) uic.f(bqcVar)).c + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        y1 y1Var = g01.R(this).c;
        int size = y1Var.getSize();
        parcel.writeInt(size);
        for (int i2 = 0; i2 < size; i2++) {
            parcel.writeValue(y1Var.get(i2));
        }
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return kng.O(this, objArr);
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i) {
        return new wn5(this, i);
    }

    public ejc() {
        this(lgc.b);
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        int i2;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i2 = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarD = y1Var.d(i, obj);
            if (y1VarD.equals(y1Var)) {
                return;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i2, y1VarD, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        return g01.T(this, new rr6(i, collection));
    }

    @Override // java.util.List
    public final Object remove(int i) {
        int i2;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        Object obj = get(i);
        do {
            synchronized (g01.r) {
                bqc bqcVar = this.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i2 = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            y1 y1VarR = y1Var.r(i);
            if (y1VarR.equals(y1Var)) {
                break;
            }
            bqc bqcVar3 = this.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, this, oicVarH), i2, y1VarR, true);
            }
            uic.m(oicVarH, this);
        } while (!zK);
        return obj;
    }
}
