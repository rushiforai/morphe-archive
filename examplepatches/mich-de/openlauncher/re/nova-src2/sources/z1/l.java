package z1;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes2.dex */
public final class l extends n {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f97952b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(s sVar, int i5) {
        super(sVar);
        this.f97952b = i5;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        switch (this.f97952b) {
            case 0:
                t.a();
                throw null;
            default:
                t.a();
                throw null;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        switch (this.f97952b) {
            case 0:
                t.a();
                throw null;
            default:
                t.a();
                throw null;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        switch (this.f97952b) {
            case 0:
                if (!(obj instanceof Map.Entry) || ((obj instanceof KMappedMarker) && !(obj instanceof KMutableMap.Entry))) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                return Intrinsics.b(this.f97953a.get(entry.getKey()), entry.getValue());
            default:
                return this.f97953a.containsValue(obj);
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection collection) {
        switch (this.f97952b) {
            case 0:
                Collection collection2 = collection;
                if (!(collection2 instanceof Collection) || !collection2.isEmpty()) {
                    Iterator it = collection2.iterator();
                    while (it.hasNext()) {
                        if (!contains((Map.Entry) it.next())) {
                            break;
                        }
                    }
                    break;
                }
                break;
            default:
                Collection collection3 = collection;
                if (!(collection3 instanceof Collection) || !collection3.isEmpty()) {
                    Iterator it2 = collection3.iterator();
                    while (it2.hasNext()) {
                        if (!this.f97953a.containsValue(it2.next())) {
                            break;
                        }
                    }
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        switch (this.f97952b) {
            case 0:
                s sVar = this.f97953a;
                return new y(sVar, ((s1.c) sVar.b().f97956c.entrySet()).iterator(), 0);
            default:
                s sVar2 = this.f97953a;
                return new y(sVar2, ((s1.c) sVar2.b().f97956c.entrySet()).iterator(), 2);
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        Object next;
        switch (this.f97952b) {
            case 0:
                if (obj instanceof Map.Entry) {
                    return (!(obj instanceof KMappedMarker) || (obj instanceof KMutableMap.Entry)) && this.f97953a.remove(((Map.Entry) obj).getKey()) != null;
                }
                return false;
            default:
                s sVar = this.f97953a;
                Iterator it = sVar.f97959b.iterator();
                while (true) {
                    if (((y) it).hasNext()) {
                        next = ((y) it).next();
                        if (Intrinsics.b(((Map.Entry) next).getValue(), obj)) {
                        }
                    } else {
                        next = null;
                    }
                }
                Map.Entry entry = (Map.Entry) next;
                if (entry == null) {
                    return false;
                }
                sVar.remove(entry.getKey());
                return true;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection collection) {
        s1.f fVar;
        int i5;
        f fVarK;
        boolean zA;
        boolean z11 = false;
        switch (this.f97952b) {
            case 0:
                Iterator it = collection.iterator();
                while (true) {
                    boolean z12 = false;
                    while (it.hasNext()) {
                        if (this.f97953a.remove(((Map.Entry) it.next()).getKey()) != null || z12) {
                            z12 = true;
                        }
                    }
                    return z12;
                    break;
                }
                break;
            default:
                Set setN1 = b70.g.N1(collection);
                s sVar = this.f97953a;
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
                    Iterator it2 = sVar.f97959b.iterator();
                    while (((y) it2).hasNext()) {
                        Map.Entry entry = (Map.Entry) ((y) it2).next();
                        if (setN1.contains(entry.getValue())) {
                            eVarBuilder.remove(entry.getKey());
                            z11 = true;
                        }
                    }
                    Unit unit2 = Unit.f71706a;
                    s1.f fVarBuild = eVarBuilder.build();
                    if (!Intrinsics.b(fVarBuild, fVar)) {
                        r rVar3 = sVar.f97958a;
                        Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                        synchronized (k.f97943c) {
                            fVarK = k.k();
                            zA = s.a(sVar, (r) k.w(rVar3, sVar, fVarK), i5, fVarBuild);
                        }
                        k.n(fVarK, sVar);
                    }
                    return z11;
                } while (!zA);
                return z11;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection collection) {
        s1.f fVar;
        int i5;
        f fVarK;
        boolean zA;
        s1.f fVar2;
        int i11;
        f fVarK2;
        boolean zA2;
        boolean z11 = false;
        switch (this.f97952b) {
            case 0:
                Collection<Map.Entry> collection2 = collection;
                int iD0 = b70.k.d0(b70.c.u0(collection2, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Map.Entry entry : collection2) {
                    linkedHashMap.put(entry.getKey(), entry.getValue());
                }
                s sVar = this.f97953a;
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
                        Map.Entry entry2 = (Map.Entry) ((y) it).next();
                        if (!linkedHashMap.containsKey(entry2.getKey()) || !Intrinsics.b(linkedHashMap.get(entry2.getKey()), entry2.getValue())) {
                            eVarBuilder.remove(entry2.getKey());
                            z11 = true;
                        }
                    }
                    Unit unit2 = Unit.f71706a;
                    s1.f fVarBuild = eVarBuilder.build();
                    if (!Intrinsics.b(fVarBuild, fVar)) {
                        r rVar3 = sVar.f97958a;
                        Intrinsics.e(rVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                        synchronized (k.f97943c) {
                            fVarK = k.k();
                            zA = s.a(sVar, (r) k.w(rVar3, sVar, fVarK), i5, fVarBuild);
                        }
                        k.n(fVarK, sVar);
                    }
                    return z11;
                } while (!zA);
                return z11;
            default:
                Set setN1 = b70.g.N1(collection);
                s sVar2 = this.f97953a;
                do {
                    synchronized (t.f97962a) {
                        r rVar4 = sVar2.f97958a;
                        Intrinsics.e(rVar4, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                        r rVar5 = (r) k.i(rVar4);
                        fVar2 = rVar5.f97956c;
                        i11 = rVar5.f97957d;
                        Unit unit3 = Unit.f71706a;
                    }
                    Intrinsics.d(fVar2);
                    s1.e eVarBuilder2 = fVar2.builder();
                    Iterator it2 = sVar2.f97959b.iterator();
                    while (((y) it2).hasNext()) {
                        Map.Entry entry3 = (Map.Entry) ((y) it2).next();
                        if (!setN1.contains(entry3.getValue())) {
                            eVarBuilder2.remove(entry3.getKey());
                            z11 = true;
                        }
                    }
                    Unit unit4 = Unit.f71706a;
                    s1.f fVarBuild2 = eVarBuilder2.build();
                    if (!Intrinsics.b(fVarBuild2, fVar2)) {
                        r rVar6 = sVar2.f97958a;
                        Intrinsics.e(rVar6, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap, V of androidx.compose.runtime.snapshots.SnapshotStateMap>");
                        synchronized (k.f97943c) {
                            fVarK2 = k.k();
                            zA2 = s.a(sVar2, (r) k.w(rVar6, sVar2, fVarK2), i11, fVarBuild2);
                        }
                        k.n(fVarK2, sVar2);
                    }
                    return z11;
                } while (!zA2);
                return z11;
        }
    }
}
