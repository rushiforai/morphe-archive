package androidx.compose.runtime.snapshots;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import c70.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gy.l0;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMutableList;
import org.jetbrains.annotations.NotNull;
import p1.o1;
import s1.d;
import t1.c;
import t1.i;
import z1.b0;
import z1.d0;
import z1.f;
import z1.k;
import z1.p;
import z1.q;
import z1.w;
import z1.z;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u00022\u00020\u00032\b\u0012\u0004\u0012\u00028\u00000\u00042\u00060\u0005j\u0002`\u0006¨\u0006\u0007"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotStateList;", "T", "Landroid/os/Parcelable;", "Lz1/z;", b.f42142b, "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SuppressLint({"BanParcelableUsage"})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SnapshotStateList<T> implements Parcelable, z, List<T>, RandomAccess, KMutableList {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<SnapshotStateList<Object>> CREATOR = new p(0);

    /* renamed from: a, reason: collision with root package name */
    public w f14112a;

    public SnapshotStateList() {
        this(i.f88455c);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVarAdd = dVarC.add(obj);
            if (dVarAdd.equals(dVarC)) {
                return false;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarAdd, true);
            }
            k.n(fVarK, this);
        } while (!zB);
        return true;
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        return q.e(this, new l0(i5, collection, 5));
    }

    public final void b(int i5, int i11) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            t1.f fVarBuilder = dVarC.builder();
            fVarBuilder.subList(i5, i11).clear();
            d dVarE = fVarBuilder.e();
            if (Intrinsics.b(dVarE, dVarC)) {
                return;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarE, true);
            }
            k.n(fVarK, this);
        } while (!zB);
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        f fVarK;
        w wVar = this.f14112a;
        Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
        synchronized (k.f97943c) {
            fVarK = k.k();
            w wVar2 = (w) k.w(wVar, this, fVarK);
            synchronized (q.f97955a) {
                wVar2.f(i.f88455c);
                wVar2.g(wVar2.d() + 1);
                wVar2.h(wVar2.e() + 1);
            }
        }
        k.n(fVarK, this);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return q.c(this).c().contains(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        return q.c(this).c().containsAll(collection);
    }

    @Override // z1.z
    public final b0 d() {
        return this.f14112a;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // z1.z
    public final void f(b0 b0Var) {
        b0Var.f97902b = this.f14112a;
        this.f14112a = (w) b0Var;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        return q.c(this).c().get(i5);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        return q.c(this).c().indexOf(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return q.c(this).c().isEmpty();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return listIterator();
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        return q.c(this).c().lastIndexOf(obj);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new a(this, 0);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        Object obj = get(i5);
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVarC2 = dVarC.C(i5);
            if (Intrinsics.b(dVarC2, dVarC)) {
                break;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarC2, true);
            }
            k.n(fVarK, this);
        } while (!zB);
        return obj;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVarC0 = ((c) dVarC).C0(new t1.b(0, collection));
            if (Intrinsics.b(dVarC0, dVarC)) {
                return false;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarC0, true);
            }
            k.n(fVarK, this);
        } while (!zB);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        return q.e(this, new t1.b(2, collection));
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        Object obj2 = get(i5);
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVar = dVarC.set(i5, obj);
            if (dVar.equals(dVarC)) {
                break;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVar, false);
            }
            k.n(fVarK, this);
        } while (!zB);
        return obj2;
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return q.c(this).c().size();
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        if (!(i5 >= 0 && i5 <= i11 && i11 <= size())) {
            o1.a("fromIndex or toIndex are out of bounds");
        }
        return new d0(this, i5, i11);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    public final String toString() {
        w wVar = this.f14112a;
        Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        return "SnapshotStateList(value=" + ((w) k.i(wVar)).c() + ")@" + hashCode();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        d dVarC = q.c(this).c();
        int size = dVarC.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            parcel.writeValue(dVarC.get(i11));
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVarAddAll = dVarC.addAll(collection);
            if (Intrinsics.b(dVarAddAll, dVarC)) {
                return false;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarAddAll, true);
            }
            k.n(fVarK, this);
        } while (!zB);
        return true;
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        return new a(this, i5);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }

    public SnapshotStateList(d dVar) {
        f fVarK = k.k();
        w wVar = new w(fVarK.g(), dVar);
        if (!(fVarK instanceof z1.a)) {
            wVar.f97902b = new w(1, dVar);
        }
        this.f14112a = wVar;
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            d dVarAdd = dVarC.add(i5, obj);
            if (dVarAdd.equals(dVarC)) {
                return;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarAdd, true);
            }
            k.n(fVarK, this);
        } while (!zB);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        int iD;
        d dVarC;
        f fVarK;
        boolean zB;
        do {
            synchronized (q.f97955a) {
                w wVar = this.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            c cVar = (c) dVarC;
            int iIndexOf = cVar.indexOf(obj);
            d dVarC2 = cVar;
            if (iIndexOf != -1) {
                dVarC2 = cVar.C(iIndexOf);
            }
            if (Intrinsics.b(dVarC2, dVarC)) {
                return false;
            }
            w wVar3 = this.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, this, fVarK), iD, dVarC2, true);
            }
            k.n(fVarK, this);
        } while (!zB);
        return true;
    }
}
