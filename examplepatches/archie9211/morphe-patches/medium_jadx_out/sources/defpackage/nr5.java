package defpackage;

import android.graphics.Path;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nr5 implements m3c {
    public static final nr5 b = new nr5(0);
    public static final nr5 c = new nr5(1);
    public final /* synthetic */ int a;

    public /* synthetic */ nr5(int i) {
        this.a = i;
    }

    @Override // defpackage.m3c
    public final er7 a(long j, ip6 ip6Var, m73 m73Var) {
        switch (this.a) {
            case 0:
                float fI0 = m73Var.i0(30.0f);
                return new ow8(new zwa(0.0f, -fI0, Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)) + fI0));
            case 1:
                float fI02 = m73Var.i0(30.0f);
                return new ow8(new zwa(-fI02, 0.0f, Float.intBitsToFloat((int) (j >> 32)) + fI02, Float.intBitsToFloat((int) (j & 4294967295L))));
            case 2:
                ip6Var.getClass();
                m73Var.getClass();
                int i = (int) (j >> 32);
                float fIntBitsToFloat = (Float.intBitsToFloat(i) - m73Var.Z(2.0f)) / 2.0f;
                br brVarA = er.a();
                brVarA.d(0.0f, 0.0f);
                int i2 = (int) (j & 4294967295L);
                brVarA.c(fIntBitsToFloat, Float.intBitsToFloat(i2) - m73Var.Z(1.0f));
                float fIntBitsToFloat2 = Float.intBitsToFloat(i2) - m73Var.Z(0.5f);
                float fZ = m73Var.Z(2.0f) + fIntBitsToFloat;
                float fIntBitsToFloat3 = Float.intBitsToFloat(i2) - m73Var.Z(1.0f);
                RectF rectF = brVarA.b;
                if (rectF == null) {
                    rectF = new RectF();
                    brVarA.b = rectF;
                }
                rectF.set(fIntBitsToFloat, fIntBitsToFloat2, fZ, fIntBitsToFloat3);
                Path path = brVarA.a;
                RectF rectF2 = brVarA.b;
                rectF2.getClass();
                path.arcTo(rectF2, -180.0f, 180.0f, false);
                brVarA.c(Float.intBitsToFloat(i), 0.0f);
                brVarA.a();
                return new nw8(brVarA);
            case 3:
                ip6Var.getClass();
                m73Var.getClass();
                int i3 = (int) (j >> 32);
                float fIntBitsToFloat4 = (Float.intBitsToFloat(i3) - m73Var.Z(2.0f)) / 2.0f;
                br brVarA2 = er.a();
                int i4 = (int) (j & 4294967295L);
                brVarA2.d(0.0f, Float.intBitsToFloat(i4));
                brVarA2.c(fIntBitsToFloat4, m73Var.Z(1.0f));
                float fZ2 = m73Var.Z(0.5f);
                float fZ3 = m73Var.Z(2.0f) + fIntBitsToFloat4;
                float fZ4 = m73Var.Z(1.0f);
                RectF rectF3 = brVarA2.b;
                if (rectF3 == null) {
                    rectF3 = new RectF();
                    brVarA2.b = rectF3;
                }
                rectF3.set(fIntBitsToFloat4, fZ2, fZ3, fZ4);
                Path path2 = brVarA2.a;
                RectF rectF4 = brVarA2.b;
                rectF4.getClass();
                path2.arcTo(rectF4, -180.0f, 180.0f, false);
                brVarA2.c(Float.intBitsToFloat(i3), Float.intBitsToFloat(i4));
                brVarA2.a();
                return new nw8(brVarA2);
            case 4:
                ip6Var.getClass();
                m73Var.getClass();
                float fZ5 = m73Var.Z(8.0f);
                float fZ6 = m73Var.Z(16.0f);
                ip6 ip6Var2 = ip6.Ltr;
                float fZ7 = ip6Var == ip6Var2 ? m73Var.Z(16.0f) : Float.intBitsToFloat((int) (j >> 32)) - m73Var.Z(16.0f);
                float fZ8 = m73Var.Z(7.0f);
                if (ip6Var != ip6Var2) {
                    fZ8 = -fZ8;
                }
                float f = fZ8 + fZ7;
                float fIntBitsToFloat5 = Float.intBitsToFloat((int) (j >> 32));
                int i5 = (int) (j & 4294967295L);
                float fIntBitsToFloat6 = Float.intBitsToFloat(i5) - fZ5;
                br brVarA3 = er.a();
                float fZ9 = m73Var.Z(8.0f);
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fZ9)) << 32) | (((long) Float.floatToRawIntBits(fZ9)) & 4294967295L);
                long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)))) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)))) & 4294967295L);
                b09.n(brVarA3, new wlb(0.0f, 0.0f, fIntBitsToFloat5, fIntBitsToFloat6, jFloatToRawIntBits2, jFloatToRawIntBits2, jFloatToRawIntBits2, jFloatToRawIntBits2));
                brVarA3.d(fZ7, Float.intBitsToFloat(i5) - fZ5);
                brVarA3.c(f, Float.intBitsToFloat(i5) - m73Var.Z(1.0f));
                float fIntBitsToFloat7 = Float.intBitsToFloat(i5) - m73Var.Z(1.0f);
                float fZ10 = m73Var.Z(2.0f);
                if (ip6Var != ip6Var2) {
                    fZ10 = -fZ10;
                }
                float f2 = fZ10 + f;
                float fIntBitsToFloat8 = Float.intBitsToFloat(i5) - m73Var.Z(0.5f);
                RectF rectF5 = brVarA3.b;
                if (rectF5 == null) {
                    rectF5 = new RectF();
                    brVarA3.b = rectF5;
                }
                rectF5.set(f, fIntBitsToFloat7, f2, fIntBitsToFloat8);
                Path path3 = brVarA3.a;
                RectF rectF6 = brVarA3.b;
                rectF6.getClass();
                path3.arcTo(rectF6, 180.0f, -180.0f, false);
                if (ip6Var != ip6Var2) {
                    fZ6 = -fZ6;
                }
                brVarA3.c(fZ7 + fZ6, Float.intBitsToFloat(i5) - fZ5);
                brVarA3.a();
                return new nw8(brVarA3);
            default:
                return new ow8(lk7.l(0L, j));
        }
    }

    public String toString() {
        switch (this.a) {
            case 5:
                return "RectangleShape";
            default:
                return super.toString();
        }
    }
}
