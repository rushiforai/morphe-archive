package f1;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final class e1 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53480a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f53481b;

    public /* synthetic */ e1(SnapshotStateList snapshotStateList, int i5) {
        this.f53480a = i5;
        this.f53481b = snapshotStateList;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f53480a) {
            case 0:
                i0.h hVar = (i0.h) obj;
                boolean z11 = hVar instanceof i0.f;
                SnapshotStateList snapshotStateList = this.f53481b;
                if (z11) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.g) {
                    snapshotStateList.remove(((i0.g) hVar).f61086a);
                } else if (hVar instanceof i0.d) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.e) {
                    snapshotStateList.remove(((i0.e) hVar).f61085a);
                } else if (hVar instanceof i0.k) {
                    snapshotStateList.add(hVar);
                } else if (hVar instanceof i0.l) {
                    snapshotStateList.remove(((i0.l) hVar).f61090a);
                } else if (hVar instanceof i0.j) {
                    snapshotStateList.remove(((i0.j) hVar).f61088a);
                }
                break;
            case 1:
                i0.h hVar2 = (i0.h) obj;
                boolean z12 = hVar2 instanceof i0.k;
                SnapshotStateList snapshotStateList2 = this.f53481b;
                if (z12) {
                    snapshotStateList2.add(hVar2);
                } else if (hVar2 instanceof i0.l) {
                    snapshotStateList2.remove(((i0.l) hVar2).f61090a);
                } else if (hVar2 instanceof i0.j) {
                    snapshotStateList2.remove(((i0.j) hVar2).f61088a);
                } else if (hVar2 instanceof i0.b) {
                    snapshotStateList2.add(hVar2);
                } else if (hVar2 instanceof i0.c) {
                    snapshotStateList2.remove(((i0.c) hVar2).f61084a);
                } else if (hVar2 instanceof i0.a) {
                    snapshotStateList2.remove(((i0.a) hVar2).f61083a);
                }
                break;
            case 2:
                i0.h hVar3 = (i0.h) obj;
                boolean z13 = hVar3 instanceof i0.k;
                SnapshotStateList snapshotStateList3 = this.f53481b;
                if (z13) {
                    snapshotStateList3.add(hVar3);
                } else if (hVar3 instanceof i0.l) {
                    snapshotStateList3.remove(((i0.l) hVar3).f61090a);
                } else if (hVar3 instanceof i0.j) {
                    snapshotStateList3.remove(((i0.j) hVar3).f61088a);
                } else if (hVar3 instanceof i0.b) {
                    snapshotStateList3.add(hVar3);
                } else if (hVar3 instanceof i0.c) {
                    snapshotStateList3.remove(((i0.c) hVar3).f61084a);
                } else if (hVar3 instanceof i0.a) {
                    snapshotStateList3.remove(((i0.a) hVar3).f61083a);
                }
                break;
            case 3:
                i0.h hVar4 = (i0.h) obj;
                boolean z14 = hVar4 instanceof i0.f;
                SnapshotStateList snapshotStateList4 = this.f53481b;
                if (z14) {
                    snapshotStateList4.add(hVar4);
                } else if (hVar4 instanceof i0.g) {
                    snapshotStateList4.remove(((i0.g) hVar4).f61086a);
                } else if (hVar4 instanceof i0.d) {
                    snapshotStateList4.add(hVar4);
                } else if (hVar4 instanceof i0.e) {
                    snapshotStateList4.remove(((i0.e) hVar4).f61085a);
                } else if (hVar4 instanceof i0.k) {
                    snapshotStateList4.add(hVar4);
                } else if (hVar4 instanceof i0.l) {
                    snapshotStateList4.remove(((i0.l) hVar4).f61090a);
                } else if (hVar4 instanceof i0.j) {
                    snapshotStateList4.remove(((i0.j) hVar4).f61088a);
                } else if (hVar4 instanceof i0.b) {
                    snapshotStateList4.add(hVar4);
                } else if (hVar4 instanceof i0.c) {
                    snapshotStateList4.remove(((i0.c) hVar4).f61084a);
                } else if (hVar4 instanceof i0.a) {
                    snapshotStateList4.remove(((i0.a) hVar4).f61083a);
                }
                break;
            default:
                i0.h hVar5 = (i0.h) obj;
                boolean z15 = hVar5 instanceof i0.k;
                SnapshotStateList snapshotStateList5 = this.f53481b;
                if (z15) {
                    snapshotStateList5.add(hVar5);
                } else if (hVar5 instanceof i0.l) {
                    snapshotStateList5.remove(((i0.l) hVar5).f61090a);
                } else if (hVar5 instanceof i0.j) {
                    snapshotStateList5.remove(((i0.j) hVar5).f61088a);
                } else if (hVar5 instanceof i0.b) {
                    snapshotStateList5.add(hVar5);
                } else if (hVar5 instanceof i0.c) {
                    snapshotStateList5.remove(((i0.c) hVar5).f61084a);
                } else if (hVar5 instanceof i0.a) {
                    snapshotStateList5.remove(((i0.a) hVar5).f61083a);
                }
                break;
        }
        return Unit.f71706a;
    }
}
