package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iq0 extends jn0 {
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ iq0(q62 q62Var, int i) {
        super(q62Var);
        this.b = i;
    }

    @Override // defpackage.o52
    public final boolean c(c8f c8fVar) {
        int i = this.b;
        c8fVar.getClass();
        switch (i) {
            case 0:
                return c8fVar.j.c;
            case 1:
                return c8fVar.j.e;
            case 2:
                return c8fVar.j.a == te8.CONNECTED;
            case 3:
                return c8fVar.j.a == te8.UNMETERED;
            default:
                return c8fVar.j.f;
        }
    }

    @Override // defpackage.jn0
    public final int d() {
        switch (this.b) {
            case 0:
                return 6;
            case 1:
                return 5;
            case 2:
                return 7;
            case 3:
                return 7;
            default:
                return 9;
        }
    }

    @Override // defpackage.jn0
    public final boolean e(Object obj) {
        boolean zBooleanValue;
        switch (this.b) {
            case 0:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
            case 1:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
            case 2:
                oe8 oe8Var = (oe8) obj;
                oe8Var.getClass();
                return oe8Var.e || !oe8Var.a || (Build.VERSION.SDK_INT >= 26 && !oe8Var.b);
            case 3:
                oe8 oe8Var2 = (oe8) obj;
                oe8Var2.getClass();
                return !oe8Var2.a || oe8Var2.c || oe8Var2.e;
            default:
                zBooleanValue = ((Boolean) obj).booleanValue();
                break;
        }
        return !zBooleanValue;
    }
}
