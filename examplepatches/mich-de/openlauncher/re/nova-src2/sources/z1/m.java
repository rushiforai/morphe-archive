package z1;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m extends n {
    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        t.a();
        throw null;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        t.a();
        throw null;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f97953a.containsKey(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Collection collection2 = collection;
        if ((collection2 instanceof Collection) && collection2.isEmpty()) {
            return true;
        }
        Iterator it = collection2.iterator();
        while (it.hasNext()) {
            if (!this.f97953a.containsKey(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        s sVar = this.f97953a;
        return new y(sVar, ((s1.c) sVar.b().f97956c.entrySet()).iterator(), 1);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.f97953a.remove(obj) != null;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection collection) {
        Iterator it = collection.iterator();
        while (true) {
            boolean z11 = false;
            while (it.hasNext()) {
                if (this.f97953a.remove(it.next()) != null || z11) {
                    z11 = true;
                }
            }
            return z11;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection collection) {
        s1.f fVar;
        int i5;
        f fVarK;
        boolean zA;
        Set setN1 = b70.g.N1(collection);
        s sVar = this.f97953a;
        boolean z11 = false;
        do {
            synchronized (t.f97962a) {
                r rVar = sVar.f97958a;
                Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                r rVar2 = (r) k.i(rVar);
                fVar = rVar2.f97956c;
                i5 = rVar2.f97957d;
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(fVar);
            s1.e eVarBuilder = fVar.builder();
            Iterator it = sVar.f97959b.iterator();
            while (((y) it).hasNext()) {
                Map.Entry entry = (Map.Entry) ((y) it).next();
                if (!setN1.contains(entry.getKey())) {
                    eVarBuilder.remove(entry.getKey());
                    z11 = true;
                }
            }
            Unit unit2 = Unit.f71706a;
            s1.f fVarBuild = eVarBuilder.build();
            if (Intrinsics.b(fVarBuild, fVar)) {
                break;
            }
            r rVar3 = sVar.f97958a;
            Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zA = s.a(sVar, (r) k.w(rVar3, sVar, fVarK), i5, fVarBuild);
            }
            k.n(fVarK, sVar);
        } while (!zA);
        return z11;
    }
}
