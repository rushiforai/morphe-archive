package defpackage;

import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class di4 implements cy6 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ di4(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        int i = this.a;
        Object obj = null;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                fj4 fj4Var = (fj4) obj2;
                if (ux6Var == ux6.ON_RESUME) {
                    xpc xpcVar = fj4Var.o;
                    if (xpcVar.getValue() == ni4.RequestingPermission && fj4Var.k.b()) {
                        km4.I(wld.a, null, "Permission granted in device settings", new Object[0], "Permission granted in device settings");
                        xpcVar.l(ni4.UploadingContacts);
                        break;
                    }
                }
                break;
            case 1:
                k25 k25Var = (k25) obj2;
                if (ux6Var == ux6.ON_DESTROY) {
                    j15 j15Var = (j15) iy6Var;
                    for (Object obj3 : (Iterable) k25Var.b().f.a.getValue()) {
                        if (((ba8) obj3).f.equals(j15Var.y)) {
                            obj = obj3;
                        }
                    }
                    ba8 ba8Var = (ba8) obj;
                    if (ba8Var != null) {
                        if (k25.n()) {
                            Log.v("FragmentNavigator", "Marking transition complete for entry " + ba8Var + " due to fragment " + iy6Var + " lifecycle reaching DESTROYED");
                        }
                        k25Var.b().c(ba8Var);
                    }
                }
                break;
            case 2:
                ((ly6) obj2).i();
                break;
            case 3:
                ka8 ka8Var = (ka8) obj2;
                ka8Var.q = ux6Var.getTargetState();
                if (ka8Var.c != null) {
                    for (ba8 ba8Var2 : bu1.n1(ka8Var.f)) {
                        ba8Var2.getClass();
                        da8 da8Var = ba8Var2.h;
                        da8Var.getClass();
                        ba8 ba8Var3 = da8Var.a;
                        vx6 targetState = ux6Var.getTargetState();
                        targetState.getClass();
                        ba8Var3.d = targetState;
                        da8Var.d = ux6Var.getTargetState();
                        da8Var.b();
                    }
                }
                break;
            case 4:
                lo9 lo9Var = (lo9) obj2;
                if (ux6Var == ux6.ON_RESUME) {
                    lo9Var.b();
                }
                break;
            case 5:
                gpb gpbVar = (gpb) obj2;
                if (ux6Var == ux6.ON_START) {
                    gpbVar.h = true;
                } else if (ux6Var == ux6.ON_STOP) {
                    gpbVar.h = false;
                }
                break;
            default:
                x0 x0Var = (x0) obj2;
                if (ux6Var == ux6.ON_DESTROY) {
                    x0Var.e();
                }
                break;
        }
    }
}
