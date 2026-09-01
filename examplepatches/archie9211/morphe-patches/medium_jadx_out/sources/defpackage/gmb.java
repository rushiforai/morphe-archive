package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gmb extends ord {
    public final float a;
    public final float b;
    public final float c;
    public final float d;
    public final String e;

    public gmb(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        if (f < 0.0f || f2 < 0.0f || f3 < 0.0f || f4 < 0.0f) {
            ay0.e("All radii must be >= 0.");
            throw null;
        }
        this.e = n1b.a.b(gmb.class).d() + '-' + f + ',' + f2 + ',' + f3 + ',' + f4;
    }

    @Override // defpackage.ord
    public final String a() {
        return this.e;
    }

    @Override // defpackage.ord
    public final Bitmap b(Bitmap bitmap, cfc cfcVar) {
        long jB;
        if (g76.L(cfcVar, cfc.c)) {
            jB = f76.B(bitmap.getWidth(), bitmap.getHeight());
        } else {
            xe3 xe3Var = cfcVar.a;
            xe3 xe3Var2 = cfcVar.b;
            if ((xe3Var instanceof ue3) && (xe3Var2 instanceof ue3)) {
                jB = f76.B(((ue3) xe3Var).a, ((ue3) xe3Var2).a);
            } else {
                int width = bitmap.getWidth();
                int height = bitmap.getHeight();
                xe3 xe3Var3 = cfcVar.a;
                double dL0 = nk7.l0(width, height, xe3Var3 instanceof ue3 ? ((ue3) xe3Var3).a : Integer.MIN_VALUE, xe3Var2 instanceof ue3 ? ((ue3) xe3Var2).a : Integer.MIN_VALUE, dqb.FILL);
                jB = f76.B(nk7.v0(((double) bitmap.getWidth()) * dL0), nk7.v0(dL0 * ((double) bitmap.getHeight())));
            }
        }
        int i = (int) (jB >> 32);
        int i2 = (int) (jB & 4294967295L);
        Bitmap.Config config = bitmap.getConfig();
        if (config == null) {
            config = Bitmap.Config.ARGB_8888;
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i, i2, config);
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        Paint paintS = qq7.s(bitmap, i, i2);
        float f = this.a;
        float f2 = this.b;
        float f3 = this.d;
        float f4 = this.c;
        if (f == f2 && f2 == f4 && f4 == f3) {
            canvas.drawRoundRect(0.0f, 0.0f, i, i2, f, f, paintS);
            return bitmapCreateBitmap;
        }
        float[] fArr = {f, f, f2, f2, f3, f3, f4, f4};
        RectF rectF = new RectF(0.0f, 0.0f, i, i2);
        Path path = new Path();
        path.addRoundRect(rectF, fArr, Path.Direction.CW);
        canvas.drawPath(path, paintS);
        return bitmapCreateBitmap;
    }
}
