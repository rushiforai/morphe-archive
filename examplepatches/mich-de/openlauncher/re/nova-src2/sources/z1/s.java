package z1;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes2.dex */
public final class s implements z, Map, KMutableMap {

    /* renamed from: a, reason: collision with root package name */
    public r f97958a;

    /* renamed from: b, reason: collision with root package name */
    public final l f97959b;

    /* renamed from: c, reason: collision with root package name */
    public final m f97960c;

    /* renamed from: d, reason: collision with root package name */
    public final l f97961d;

    public s() {
        u1.c cVar = u1.c.f90330f;
        Intrinsics.e(cVar, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf>");
        f fVarK = k.k();
        r rVar = new r(fVarK.g(), cVar);
        if (!(fVarK instanceof a)) {
            rVar.f97902b = new r(1, cVar);
        }
        this.f97958a = rVar;
        this.f97959b = new l(this, 0);
        this.f97960c = new m(this);
        this.f97961d = new l(this, 1);
    }

    public static final boolean a(s sVar, r rVar, int i5, s1.f fVar) {
        boolean z11;
        synchronized (t.f97962a) {
            int i11 = rVar.f97957d;
            if (i11 == i5) {
                rVar.f97956c = fVar;
                z11 = true;
                rVar.f97957d = i11 + 1;
            } else {
                z11 = false;
            }
        }
        return z11;
    }

    public final r b() {
        r rVar = this.f97958a;
        Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
        return (r) k.t(rVar, this);
    }

    @Override // java.util.Map
    public final void clear() {
        f fVarK;
        r rVar = this.f97958a;
        Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
        r rVar2 = (r) k.i(rVar);
        u1.c cVar = u1.c.f90330f;
        Intrinsics.e(cVar, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf>");
        if (cVar != rVar2.f97956c) {
            r rVar3 = this.f97958a;
            Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                r rVar4 = (r) k.w(rVar3, this, fVarK);
                synchronized (t.f97962a) {
                    rVar4.f97956c = cVar;
                    rVar4.f97957d++;
                }
            }
            k.n(fVarK, this);
        }
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return b().f97956c.containsKey(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return b().f97956c.containsValue(obj);
    }

    @Override // z1.z
    public final b0 d() {
        return this.f97958a;
    }

    @Override // java.util.Map
    public final Set entrySet() {
        return this.f97959b;
    }

    @Override // z1.z
    public final void f(b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
        this.f97958a = (r) b0Var;
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        return b().f97956c.get(obj);
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return b().f97956c.isEmpty();
    }

    @Override // java.util.Map
    public final Set keySet() {
        return this.f97960c;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        s1.f fVar;
        int i5;
        Object objPut;
        f fVarK;
        boolean zA;
        do {
            synchronized (t.f97962a) {
                r rVar = this.f97958a;
                Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                r rVar2 = (r) k.i(rVar);
                fVar = rVar2.f97956c;
                i5 = rVar2.f97957d;
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(fVar);
            u1.e eVar = (u1.e) fVar.builder();
            objPut = eVar.put(obj, obj2);
            s1.f fVarBuild = eVar.build();
            if (Intrinsics.b(fVarBuild, fVar)) {
                break;
            }
            r rVar3 = this.f97958a;
            Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zA = a(this, (r) k.w(rVar3, this, fVarK), i5, fVarBuild);
            }
            k.n(fVarK, this);
        } while (!zA);
        return objPut;
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        s1.f fVar;
        int i5;
        f fVarK;
        boolean zA;
        do {
            synchronized (t.f97962a) {
                r rVar = this.f97958a;
                Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                r rVar2 = (r) k.i(rVar);
                fVar = rVar2.f97956c;
                i5 = rVar2.f97957d;
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(fVar);
            u1.e eVar = (u1.e) fVar.builder();
            eVar.putAll(map);
            s1.f fVarBuild = eVar.build();
            if (Intrinsics.b(fVarBuild, fVar)) {
                return;
            }
            r rVar3 = this.f97958a;
            Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zA = a(this, (r) k.w(rVar3, this, fVarK), i5, fVarBuild);
            }
            k.n(fVarK, this);
        } while (!zA);
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        s1.f fVar;
        int i5;
        Object objRemove;
        f fVarK;
        boolean zA;
        do {
            synchronized (t.f97962a) {
                r rVar = this.f97958a;
                Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                r rVar2 = (r) k.i(rVar);
                fVar = rVar2.f97956c;
                i5 = rVar2.f97957d;
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(fVar);
            s1.e eVarBuilder = fVar.builder();
            objRemove = eVarBuilder.remove(obj);
            s1.f fVarBuild = eVarBuilder.build();
            if (Intrinsics.b(fVarBuild, fVar)) {
                break;
            }
            r rVar3 = this.f97958a;
            Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zA = a(this, (r) k.w(rVar3, this, fVarK), i5, fVarBuild);
            }
            k.n(fVarK, this);
        } while (!zA);
        return objRemove;
    }

    @Override // java.util.Map
    public final int size() {
        return b().f97956c.size();
    }

    public final String toString() {
        r rVar = this.f97958a;
        Intrinsics.e(rVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
        return "SnapshotStateMap(value=" + ((r) k.i(rVar)).f97956c + ")@" + hashCode();
    }

    @Override // java.util.Map
    public final Collection values() {
        return this.f97961d;
    }
}
