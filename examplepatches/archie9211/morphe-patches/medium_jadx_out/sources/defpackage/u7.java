package defpackage;

import android.view.ActionMode;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u7 implements vh3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ u7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.vh3
    public final void dispose() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                q7 q7Var = ((l7) obj).a;
                if (q7Var == null) {
                    ygf.f("Launcher has not been initialized");
                } else {
                    q7Var.b();
                }
                break;
            case 1:
                xb3 xb3Var = (xb3) obj;
                xb3Var.dismiss();
                xb3Var.h.e();
                break;
            case 2:
                dd9 dd9Var = (dd9) obj;
                dd9Var.e();
                dd9Var.setTag(R.id.view_tree_lifecycle_owner, null);
                dd9Var.p.removeViewImmediate(dd9Var);
                break;
            case 3:
                ts tsVar = (ts) obj;
                gjc gjcVar = tsVar.e;
                o19 o19Var = gjcVar.h;
                if (o19Var != null) {
                    o19Var.b();
                }
                gjcVar.a();
                ActionMode actionMode = tsVar.h;
                if (actionMode != null) {
                    actionMode.finish();
                }
                tsVar.h = null;
                break;
            case 4:
                to0 to0Var = (to0) ((uo0) obj).c.getValue();
                if (to0Var != null) {
                    to0Var.close();
                }
                break;
            case 5:
                x51 x51Var = ((pod) obj).d;
                if (x51Var != null) {
                    x51Var.l(null);
                }
                break;
            case 6:
                ((ai3) obj).b.invoke();
                break;
            case 7:
                ((lid) obj).m();
                break;
            case 8:
                ((tt6) obj).d = null;
                break;
            case 9:
                gu6 gu6Var = (gu6) obj;
                zf3 zf3Var = gu6Var.c;
                if (zf3Var != null) {
                    zf3Var.c = false;
                }
                gu6Var.c = null;
                break;
            case 10:
                ((cu6) obj).f = true;
                break;
            case 11:
                j18 j18Var = (j18) obj;
                j18Var.dismiss();
                j18Var.i.e();
                break;
            case 12:
                l78 l78Var = (l78) obj;
                if (((h0a) l78Var.getValue()) != null) {
                    l78Var.setValue(null);
                }
                break;
            default:
                ((hwb) ((b2) obj)).E0(null);
                break;
        }
    }
}
