package defpackage;

import android.database.DataSetObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h27 extends DataSetObserver {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ h27(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.database.DataSetObserver
    public final void onChanged() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                k27 k27Var = (k27) obj;
                if (k27Var.z.isShowing()) {
                    k27Var.e();
                }
                break;
            default:
                ((fve) obj).e();
                break;
        }
    }

    @Override // android.database.DataSetObserver
    public final void onInvalidated() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((k27) obj).dismiss();
                break;
            default:
                ((fve) obj).e();
                break;
        }
    }
}
