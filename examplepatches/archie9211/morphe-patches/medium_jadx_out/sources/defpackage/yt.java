package defpackage;

import android.os.Parcelable;
import android.util.SparseArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yt extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ due b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yt(due dueVar, int i) {
        super(0);
        this.a = i;
        this.b = dueVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        due dueVar = this.b;
        switch (i) {
            case 0:
                dueVar.getLayoutNode().C();
                break;
            case 1:
                if (dueVar.e && dueVar.isAttachedToWindow() && dueVar.getView().getParent() == dueVar) {
                    px8 snapshotObserver = dueVar.getSnapshotObserver();
                    snapshotObserver.a.d(dueVar, fn.k, dueVar.getUpdate());
                }
                break;
            case 2:
                SparseArray<Parcelable> sparseArray = new SparseArray<>();
                dueVar.A.saveHierarchyState(sparseArray);
                break;
            case 3:
                dueVar.getReleaseBlock().invoke(dueVar.A);
                dueVar.g();
                break;
            case 4:
                dueVar.getResetBlock().invoke(dueVar.A);
                break;
            default:
                dueVar.getUpdateBlock().invoke(dueVar.A);
                break;
        }
        return c1eVar;
    }
}
