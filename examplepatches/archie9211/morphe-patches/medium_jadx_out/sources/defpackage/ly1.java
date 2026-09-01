package defpackage;

import android.util.Log;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ly1 implements cy6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ly1(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                xy1.j((iq8) obj2, (xy1) obj, iy6Var, ux6Var);
                break;
            case 1:
                k25 k25Var = (k25) obj2;
                ba8 ba8Var = (ba8) obj;
                if (ux6Var == ux6.ON_RESUME && ((List) k25Var.b().e.a.getValue()).contains(ba8Var)) {
                    if (k25.n()) {
                        Log.v("FragmentNavigator", "Marking transition complete for entry " + ba8Var + " due to fragment " + iy6Var + " view lifecycle reaching RESUMED");
                    }
                    k25Var.b().c(ba8Var);
                }
                if (ux6Var == ux6.ON_DESTROY) {
                    if (k25.n()) {
                        Log.v("FragmentNavigator", "Marking transition complete for entry " + ba8Var + " due to fragment " + iy6Var + " view lifecycle reaching DESTROYED");
                    }
                    k25Var.b().c(ba8Var);
                }
                break;
            default:
                px7 px7Var = (px7) obj2;
                ly7 ly7Var = (ly7) obj;
                px7Var.getClass();
                if (ux6Var == ux6.ON_DESTROY) {
                    px7Var.b(ly7Var);
                }
                break;
        }
    }
}
