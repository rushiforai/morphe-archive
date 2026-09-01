package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx5 extends tn0 {
    public final ao6 D;
    public final Rect E;
    public final Rect F;
    public final RectF G;
    public final tc7 H;
    public final dn3 I;
    public hp8 J;
    public ad K;

    public fx5(rc7 rc7Var, wo6 wo6Var) {
        super(rc7Var, wo6Var);
        this.D = new ao6(3, 0);
        this.E = new Rect();
        this.F = new Rect();
        this.G = new RectF();
        String str = wo6Var.g;
        bc7 bc7Var = rc7Var.a;
        this.H = bc7Var == null ? null : (tc7) ((HashMap) bc7Var.c()).get(str);
        iq1 iq1Var = this.p.x;
        if (iq1Var != null) {
            this.I = new dn3(this, this, iq1Var);
        }
    }

    @Override // defpackage.tn0, defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        Bitmap bitmapO;
        super.c(rectF, matrix, z);
        tc7 tc7Var = this.H;
        if (tc7Var != null) {
            int i = tc7Var.b;
            int i2 = tc7Var.a;
            float fC = gpe.c();
            if (this.o.k || (bitmapO = o()) == null) {
                rectF.set(0.0f, 0.0f, i2 * fC, i * fC);
            } else {
                rectF.set(0.0f, 0.0f, bitmapO.getWidth() * fC, bitmapO.getHeight() * fC);
            }
            this.n.mapRect(rectF);
        }
    }

    @Override // defpackage.tn0
    public final void i(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        tc7 tc7Var;
        Bitmap bitmapO = o();
        if (bitmapO == null || bitmapO.isRecycled() || (tc7Var = this.H) == null) {
            return;
        }
        float fC = gpe.c();
        ao6 ao6Var = this.D;
        ao6Var.setAlpha(i);
        dn3 dn3Var = this.I;
        if (dn3Var != null) {
            bn3Var = dn3Var.b(matrix, i);
        }
        int width = bitmapO.getWidth();
        int height = bitmapO.getHeight();
        Rect rect = this.E;
        rect.set(0, 0, width, height);
        boolean z = this.o.k;
        Rect rect2 = this.F;
        if (z) {
            rect2.set(0, 0, (int) (tc7Var.a * fC), (int) (tc7Var.b * fC));
        } else {
            rect2.set(0, 0, (int) (bitmapO.getWidth() * fC), (int) (bitmapO.getHeight() * fC));
        }
        boolean z2 = bn3Var != null;
        if (z2) {
            if (this.J == null) {
                this.J = new hp8();
            }
            ad adVar = this.K;
            if (adVar == null) {
                adVar = new ad(10, (byte) 0);
                this.K = adVar;
            }
            ad adVar2 = adVar;
            adVar.b = 255;
            adVar.c = null;
            bn3Var.getClass();
            bn3 bn3Var2 = new bn3(bn3Var);
            adVar2.c = bn3Var2;
            bn3Var2.b(i);
            float f = rect2.left;
            float f2 = rect2.top;
            float f3 = rect2.right;
            float f4 = rect2.bottom;
            RectF rectF = this.G;
            rectF.set(f, f2, f3, f4);
            matrix.mapRect(rectF);
            canvas = this.J.e(canvas, rectF, this.K);
        }
        canvas.save();
        canvas.concat(matrix);
        canvas.drawBitmap(bitmapO, rect, rect2, ao6Var);
        if (z2) {
            this.J.c();
            if (this.J.c == gp8.RENDER_NODE) {
                return;
            }
        }
        canvas.restore();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0023  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00ab  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap o() {
        /*
            Method dump skipped, instruction units count: 337
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fx5.o():android.graphics.Bitmap");
    }
}
