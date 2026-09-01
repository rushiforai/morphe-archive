package defpackage;

import android.graphics.Path;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i69 {
    public char a;
    public final float[] b;

    public i69(i69 i69Var) {
        this.a = i69Var.a;
        float[] fArr = i69Var.b;
        this.b = wo7.l(fArr.length, fArr);
    }

    public static void a(Path path, float f, float f2, float f3, float f4, float f5, float f6, float f7, boolean z, boolean z2) {
        double d;
        double d2;
        double radians = Math.toRadians(f7);
        double dCos = Math.cos(radians);
        double dSin = Math.sin(radians);
        double d3 = f;
        double d4 = f2;
        double d5 = f5;
        double d6 = ((d4 * dSin) + (d3 * dCos)) / d5;
        double d7 = f6;
        double d8 = ((d4 * dCos) + (((double) (-f)) * dSin)) / d7;
        double d9 = f4;
        double d10 = ((d9 * dSin) + (((double) f3) * dCos)) / d5;
        double d11 = ((d9 * dCos) + (((double) (-f3)) * dSin)) / d7;
        double d12 = d6 - d10;
        double d13 = d8 - d11;
        double d14 = (d6 + d10) / 2.0d;
        double d15 = (d8 + d11) / 2.0d;
        double d16 = (d13 * d13) + (d12 * d12);
        if (d16 == 0.0d) {
            Log.w("PathParser", " Points are coincident");
            return;
        }
        double d17 = (1.0d / d16) - 0.25d;
        if (d17 < 0.0d) {
            Log.w("PathParser", "Points are too far apart " + d16);
            float fSqrt = (float) (Math.sqrt(d16) / 1.99999d);
            a(path, f, f2, f3, f4, f5 * fSqrt, fSqrt * f6, f7, z, z2);
            return;
        }
        double dSqrt = Math.sqrt(d17);
        double d18 = dSqrt * d12;
        double d19 = dSqrt * d13;
        if (z == z2) {
            d = d14 - d19;
            d2 = d15 + d18;
        } else {
            d = d14 + d19;
            d2 = d15 - d18;
        }
        double dAtan2 = Math.atan2(d8 - d2, d6 - d);
        double dAtan22 = Math.atan2(d11 - d2, d10 - d) - dAtan2;
        if (z2 != (dAtan22 >= 0.0d)) {
            dAtan22 = dAtan22 > 0.0d ? dAtan22 - 6.283185307179586d : dAtan22 + 6.283185307179586d;
        }
        double d20 = d * d5;
        double d21 = d2 * d7;
        double d22 = (d20 * dCos) - (d21 * dSin);
        double d23 = (d21 * dCos) + (d20 * dSin);
        int iCeil = (int) Math.ceil(Math.abs((dAtan22 * 4.0d) / 3.141592653589793d));
        double dCos2 = Math.cos(radians);
        double dSin2 = Math.sin(radians);
        double dCos3 = Math.cos(dAtan2);
        double dSin3 = Math.sin(dAtan2);
        double d24 = -d5;
        double d25 = d24 * dCos2;
        double d26 = d7 * dSin2;
        double d27 = (d25 * dSin3) - (d26 * dCos3);
        double d28 = d24 * dSin2;
        double d29 = d7 * dCos2;
        double d30 = dAtan22 / ((double) iCeil);
        double d31 = (dCos3 * d29) + (dSin3 * d28);
        double d32 = d3;
        double d33 = d4;
        int i = 0;
        double d34 = dAtan2;
        while (i < iCeil) {
            double d35 = d34 + d30;
            double dSin4 = Math.sin(d35);
            double dCos4 = Math.cos(d35);
            int i2 = iCeil;
            double d36 = (((d5 * dCos2) * dCos4) + d22) - (d26 * dSin4);
            double d37 = (d29 * dSin4) + (d5 * dSin2 * dCos4) + d23;
            double d38 = (d25 * dSin4) - (d26 * dCos4);
            double d39 = (dCos4 * d29) + (dSin4 * d28);
            double d40 = d35 - d34;
            double dTan = Math.tan(d40 / 2.0d);
            double dSqrt2 = ((Math.sqrt(((dTan * 3.0d) * dTan) + 4.0d) - 1.0d) * Math.sin(d40)) / 3.0d;
            path.rLineTo(0.0f, 0.0f);
            path.cubicTo((float) ((d27 * dSqrt2) + d32), (float) ((d31 * dSqrt2) + d33), (float) (d36 - (dSqrt2 * d38)), (float) (d37 - (dSqrt2 * d39)), (float) d36, (float) d37);
            i++;
            d33 = d37;
            dCos2 = dCos2;
            d28 = d28;
            d34 = d35;
            d31 = d39;
            d32 = d36;
            iCeil = i2;
            d27 = d38;
            d30 = d30;
        }
    }

    public i69(char c, float[] fArr) {
        this.a = c;
        this.b = fArr;
    }
}
