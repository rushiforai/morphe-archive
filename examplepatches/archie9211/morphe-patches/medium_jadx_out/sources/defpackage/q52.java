package defpackage;

import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q52 {
    public final q21 a;
    public final String b;

    public q52(q21 q21Var, int i, int i2) {
        switch (i2) {
            case 1:
                this.a = q21Var;
                String str = "start";
                if (i != -2) {
                    if (i == -1) {
                        str = "end";
                    } else if (i == 0) {
                        str = "left";
                    } else if (i != 1) {
                        Log.e("CCL", "verticalAnchorIndexToAnchorName: Unknown vertical index");
                    } else {
                        str = "right";
                    }
                }
                this.b = str;
                break;
            default:
                this.a = q21Var;
                String str2 = "top";
                if (i != 0) {
                    if (i != 1) {
                        Log.e("CCL", "horizontalAnchorIndexToAnchorName: Unknown horizontal index");
                    } else {
                        str2 = "bottom";
                    }
                }
                this.b = str2;
                break;
        }
    }

    public void a(v52 v52Var, float f, float f2) {
        int i = v52Var.b;
        String str = "top";
        if (i != 0) {
            if (i != 1) {
                Log.e("CCL", "horizontalAnchorIndexToAnchorName: Unknown horizontal index");
            } else {
                str = "bottom";
            }
        }
        k21 k21Var = new k21(new char[0]);
        k21Var.u(s21.u(v52Var.a.toString()));
        k21Var.u(s21.u(str));
        k21Var.u(new o21(f));
        k21Var.u(new o21(f2));
        this.a.I(this.b, k21Var);
    }

    public void b(w52 w52Var, float f, float f2) {
        int i = w52Var.b;
        String str = "start";
        if (i != -2) {
            if (i == -1) {
                str = "end";
            } else if (i != 1) {
                Log.e("CCL", "verticalAnchorIndexToAnchorName: Unknown vertical index");
            } else {
                str = "right";
            }
        }
        k21 k21Var = new k21(new char[0]);
        k21Var.u(s21.u(w52Var.a.toString()));
        k21Var.u(s21.u(str));
        k21Var.u(new o21(f));
        k21Var.u(new o21(f2));
        this.a.I(this.b, k21Var);
    }
}
