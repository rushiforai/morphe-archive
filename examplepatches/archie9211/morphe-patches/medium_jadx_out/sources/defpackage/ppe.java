package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ppe {
    public static final long a = h72.b(0, 0, 0, 0, 5);
    public static final /* synthetic */ int b = 0;

    public static final k90 a(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        if (!((Boolean) p65Var.j(l36.a)).booleanValue()) {
            p65Var.Y(2019129125);
            p65Var.p(false);
            return null;
        }
        p65Var.Y(2019071620);
        k90 k90Var = (k90) p65Var.j(u57.a);
        p65Var.p(false);
        return k90Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.lfc b(defpackage.w82 r2, defpackage.x12 r3) {
        /*
            jl4 r0 = defpackage.v82.f
            boolean r2 = defpackage.g76.L(r2, r0)
            p65 r3 = (defpackage.p65) r3
            boolean r0 = r3.g(r2)
            java.lang.Object r1 = r3.M()
            if (r0 != 0) goto L16
            uob r0 = defpackage.w12.a
            if (r1 != r0) goto L30
        L16:
            if (r2 == 0) goto L1c
            sva r2 = defpackage.lfc.a
        L1a:
            r1 = r2
            goto L2d
        L1c:
            j72 r2 = new j72
            r2.<init>()
            long r0 = defpackage.ppe.a
            r2.b = r0
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            r2.c = r0
            goto L1a
        L2d:
            r3.j0(r1)
        L30:
            lfc r1 = (defpackage.lfc) r1
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ppe.b(w82, x12):lfc");
    }

    public static final rx5 c(Object obj, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(1319639034);
        if (obj instanceof rx5) {
            p65Var.Y(1530922508);
            rx5 rx5Var = (rx5) obj;
            p65Var.p(false);
            p65Var.p(false);
            return rx5Var;
        }
        p65Var.Y(1530961754);
        Context context = (Context) p65Var.j(eo.b);
        boolean zF = p65Var.f(context) | p65Var.f(obj);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            nx5 nx5Var = new nx5(context);
            nx5Var.c = obj;
            objM = nx5Var.a();
            p65Var.j0(objM);
        }
        rx5 rx5Var2 = (rx5) objM;
        p65Var.p(false);
        p65Var.p(false);
        return rx5Var2;
    }

    public static final long d(long j) {
        int iW0 = nk7.w0(Float.intBitsToFloat((int) (j >> 32)));
        return (((long) nk7.w0(Float.intBitsToFloat((int) (j & 4294967295L)))) & 4294967295L) | (((long) iW0) << 32);
    }

    public static void e(String str) {
        throw new IllegalArgumentException(lv8.r("Unsupported type: ", str, ". ", ev6.x("If you wish to display this ", str, ", use androidx.compose.foundation.Image.")));
    }

    public static final void f(rx5 rx5Var) {
        Object obj = rx5Var.b;
        if (obj instanceof nx5) {
            ay0.e("Unsupported type: ImageRequest.Builder. Did you forget to call ImageRequest.Builder.build()?");
            return;
        }
        if (obj instanceof wp) {
            e("ImageBitmap");
            throw null;
        }
        if (obj instanceof by5) {
            e("ImageVector");
            throw null;
        }
        if (obj instanceof c09) {
            e("Painter");
            throw null;
        }
        if (rx5Var.c != null) {
            ay0.e("request.target must be null.");
        } else {
            if (((wx6) k40.b0(rx5Var, wx5.e)) == null) {
                return;
            }
            ay0.e("request.lifecycle must be null.");
        }
    }
}
