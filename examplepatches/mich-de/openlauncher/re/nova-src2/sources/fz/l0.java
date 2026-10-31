package fz;

import ads_mobile_sdk.pd;
import android.graphics.Path;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public char f56296a;

    /* renamed from: b, reason: collision with root package name */
    public float[] f56297b;

    public static void a(Path path, float f11, float f12, float f13, float f14, float f15, float f16, float f17, boolean z11, boolean z12) {
        double d5;
        double d11;
        double radians = Math.toRadians(f17);
        double dCos = Math.cos(radians);
        double dSin = Math.sin(radians);
        double d12 = f11;
        double d13 = f12;
        double d14 = f15;
        double d15 = ((d13 * dSin) + (d12 * dCos)) / d14;
        double d16 = f16;
        double d17 = ((d13 * dCos) + ((-f11) * dSin)) / d16;
        double d18 = f14;
        double d19 = ((d18 * dSin) + (f13 * dCos)) / d14;
        double d21 = ((d18 * dCos) + ((-f13) * dSin)) / d16;
        double d22 = d15 - d19;
        double d23 = d17 - d21;
        double d24 = (d15 + d19) / 2.0d;
        double d25 = (d17 + d21) / 2.0d;
        double d26 = (d23 * d23) + (d22 * d22);
        if (d26 == 0.0d) {
            return;
        }
        double d27 = (1.0d / d26) - 0.25d;
        if (d27 < 0.0d) {
            float fSqrt = (float) (Math.sqrt(d26) / 1.99999d);
            a(path, f11, f12, f13, f14, f15 * fSqrt, fSqrt * f16, f17, z11, z12);
            return;
        }
        double dSqrt = Math.sqrt(d27);
        double d28 = d22 * dSqrt;
        double d29 = dSqrt * d23;
        if (z11 == z12) {
            d5 = d24 - d29;
            d11 = d25 + d28;
        } else {
            d5 = d24 + d29;
            d11 = d25 - d28;
        }
        double dAtan2 = Math.atan2(d17 - d11, d15 - d5);
        double dAtan22 = Math.atan2(d21 - d11, d19 - d5) - dAtan2;
        if (z12 != (dAtan22 >= 0.0d)) {
            dAtan22 = dAtan22 > 0.0d ? dAtan22 - 6.283185307179586d : dAtan22 + 6.283185307179586d;
        }
        double d30 = d5 * d14;
        double d31 = d11 * d16;
        double d32 = (d30 * dCos) - (d31 * dSin);
        double d33 = (d31 * dCos) + (d30 * dSin);
        int iCeil = (int) Math.ceil(Math.abs((dAtan22 * 4.0d) / 3.141592653589793d));
        double dCos2 = Math.cos(radians);
        double dSin2 = Math.sin(radians);
        double dCos3 = Math.cos(dAtan2);
        double dSin3 = Math.sin(dAtan2);
        double d34 = -d14;
        double d35 = d34 * dCos2;
        double d36 = d16 * dSin2;
        double d37 = (d35 * dSin3) - (d36 * dCos3);
        double d38 = d34 * dSin2;
        double d39 = d16 * dCos2;
        double d40 = dAtan22 / iCeil;
        double d41 = (dCos3 * d39) + (dSin3 * d38);
        int i5 = 0;
        double d42 = d12;
        double d43 = d13;
        double d44 = dAtan2;
        while (i5 < iCeil) {
            double d45 = d44 + d40;
            double dSin4 = Math.sin(d45);
            double dCos4 = Math.cos(d45);
            double d46 = d40;
            double d47 = (((d14 * dCos2) * dCos4) + d32) - (d36 * dSin4);
            double d48 = d32;
            double d49 = (d39 * dSin4) + (d14 * dSin2 * dCos4) + d33;
            double d51 = (d35 * dSin4) - (d36 * dCos4);
            double d52 = (dCos4 * d39) + (dSin4 * d38);
            double d53 = d45 - d44;
            double dTan = Math.tan(d53 / 2.0d);
            double dSqrt2 = ((Math.sqrt(((dTan * 3.0d) * dTan) + 4.0d) - 1.0d) * Math.sin(d53)) / 3.0d;
            path.rLineTo(0.0f, 0.0f);
            path.cubicTo((float) ((d37 * dSqrt2) + d42), (float) ((d41 * dSqrt2) + d43), (float) (d47 - (dSqrt2 * d51)), (float) (d49 - (dSqrt2 * d52)), (float) d47, (float) d49);
            i5++;
            d43 = d49;
            iCeil = iCeil;
            d38 = d38;
            dCos2 = dCos2;
            d44 = d45;
            d41 = d52;
            d37 = d51;
            d32 = d48;
            d42 = d47;
            d40 = d46;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void b(l0[] l0VarArr, Path path) {
        int i5;
        int i11;
        float[] fArr;
        int i12;
        char c11;
        float f11;
        float f12;
        float[] fArr2;
        boolean z11;
        float f13;
        float f14;
        float f15;
        float f16;
        float f17;
        float f18;
        float f19;
        float f21;
        float f22;
        Path path2 = path;
        int i13 = 6;
        float[] fArr3 = new float[6];
        int i14 = 0;
        char c12 = 'm';
        int i15 = 0;
        while (i15 < l0VarArr.length) {
            l0 l0Var = l0VarArr[i15];
            char c13 = l0Var.f56296a;
            float[] fArr4 = l0Var.f56297b;
            float f23 = fArr3[i14];
            float f24 = fArr3[1];
            float f25 = fArr3[2];
            float f26 = fArr3[3];
            float f27 = fArr3[4];
            float f28 = fArr3[5];
            switch (c13) {
                case 'A':
                case pd.H0 /* 97 */:
                    i5 = 7;
                    break;
                case 'C':
                case pd.R0 /* 99 */:
                    i5 = i13;
                    break;
                case 'H':
                case 'V':
                case 'h':
                case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                    i5 = 1;
                    break;
                case 'Q':
                case 'S':
                case 'q':
                case 's':
                    i5 = 4;
                    break;
                case 'Z':
                case INVALID_ADS_ENDPOINT_VALUE:
                    path2.close();
                    path2.moveTo(f27, f28);
                    f23 = f27;
                    f25 = f23;
                    f24 = f28;
                    f26 = f24;
                default:
                    i5 = 2;
                    break;
            }
            float f29 = f24;
            float f31 = f27;
            float f32 = f28;
            float f33 = f23;
            int i16 = i14;
            while (i16 < fArr4.length) {
                if (c13 == 'A') {
                    i11 = i16;
                    fArr = fArr4;
                    i12 = i14;
                    float f34 = f29;
                    c11 = c13;
                    int i17 = i11 + 5;
                    int i18 = i11 + 6;
                    a(path, f33, f34, fArr[i17], fArr[i18], fArr[i11], fArr[i11 + 1], fArr[i11 + 2], fArr[i11 + 3] != 0.0f ? 1 : i12, fArr[i11 + 4] != 0.0f ? 1 : i12);
                    f25 = fArr[i17];
                    f33 = f25;
                    f11 = fArr[i18];
                    f26 = f11;
                } else if (c13 == 'C') {
                    i11 = i16;
                    c11 = c13;
                    fArr = fArr4;
                    i12 = i14;
                    int i19 = i11 + 2;
                    int i21 = i11 + 3;
                    int i22 = i11 + 4;
                    int i23 = i11 + 5;
                    path2.cubicTo(fArr[i11], fArr[i11 + 1], fArr[i19], fArr[i21], fArr[i22], fArr[i23]);
                    float f35 = fArr[i22];
                    float f36 = fArr[i23];
                    f33 = f35;
                    f25 = fArr[i19];
                    f26 = fArr[i21];
                    f11 = f36;
                } else if (c13 != 'H') {
                    if (c13 != 'Q') {
                        i12 = i14;
                        if (c13 == 'V') {
                            i11 = i16;
                            c11 = c13;
                            fArr = fArr4;
                            path2.lineTo(f33, fArr[i11]);
                            f11 = fArr[i11];
                        } else if (c13 != 'a') {
                            if (c13 == 'c') {
                                i11 = i16;
                                int i24 = i11 + 2;
                                int i25 = i11 + 3;
                                int i26 = i11 + 4;
                                int i27 = i11 + 5;
                                path2.rCubicTo(fArr4[i11], fArr4[i11 + 1], fArr4[i24], fArr4[i25], fArr4[i26], fArr4[i27]);
                                float f37 = fArr4[i24] + f33;
                                float f38 = f29 + fArr4[i25];
                                f33 += fArr4[i26];
                                f29 += fArr4[i27];
                                f25 = f37;
                                f26 = f38;
                            } else if (c13 != 'h') {
                                if (c13 != 'q') {
                                    if (c13 != 'v') {
                                        if (c13 == 'L') {
                                            i11 = i16;
                                            int i28 = i11 + 1;
                                            path2.lineTo(fArr4[i11], fArr4[i28]);
                                            f17 = fArr4[i11];
                                            f11 = fArr4[i28];
                                        } else if (c13 == 'M') {
                                            i11 = i16;
                                            f17 = fArr4[i11];
                                            f11 = fArr4[i11 + 1];
                                            if (i11 > 0) {
                                                path2.lineTo(f17, f11);
                                            } else {
                                                path2.moveTo(f17, f11);
                                                f33 = f17;
                                                f31 = f33;
                                                f32 = f11;
                                                c11 = c13;
                                                fArr = fArr4;
                                            }
                                        } else if (c13 == 'S') {
                                            i11 = i16;
                                            if (c12 == 'c' || c12 == 's' || c12 == 'C' || c12 == 'S') {
                                                f33 = (f33 * 2.0f) - f25;
                                                f29 = (f29 * 2.0f) - f26;
                                            }
                                            float f39 = f33;
                                            int i29 = i11 + 1;
                                            int i31 = i11 + 2;
                                            int i32 = i11 + 3;
                                            path2.cubicTo(f39, f29, fArr4[i11], fArr4[i29], fArr4[i31], fArr4[i32]);
                                            f12 = fArr4[i11];
                                            f26 = fArr4[i29];
                                            f33 = fArr4[i31];
                                            f11 = fArr4[i32];
                                            c11 = c13;
                                            fArr = fArr4;
                                        } else if (c13 == 'T') {
                                            i11 = i16;
                                            if (c12 == 'q' || c12 == 't' || c12 == 'Q' || c12 == 'T') {
                                                f33 = (f33 * 2.0f) - f25;
                                                f29 = (f29 * 2.0f) - f26;
                                            }
                                            float f40 = f29;
                                            int i33 = i11 + 1;
                                            path2.quadTo(f33, f40, fArr4[i11], fArr4[i33]);
                                            f26 = f40;
                                            c11 = c13;
                                            fArr = fArr4;
                                            f25 = f33;
                                            f33 = fArr4[i11];
                                            f11 = fArr4[i33];
                                        } else if (c13 == 'l') {
                                            i11 = i16;
                                            int i34 = i11 + 1;
                                            path2.rLineTo(fArr4[i11], fArr4[i34]);
                                            f33 += fArr4[i11];
                                            f16 = fArr4[i34];
                                        } else if (c13 == 'm') {
                                            i11 = i16;
                                            float f41 = fArr4[i11];
                                            f33 += f41;
                                            float f42 = fArr4[i11 + 1];
                                            f29 += f42;
                                            if (i11 > 0) {
                                                path2.rLineTo(f41, f42);
                                            } else {
                                                path2.rMoveTo(f41, f42);
                                                fArr = fArr4;
                                                f31 = f33;
                                                f11 = f29;
                                                f32 = f11;
                                                c11 = c13;
                                            }
                                        } else if (c13 == 's') {
                                            if (c12 == 'c' || c12 == 's' || c12 == 'C' || c12 == 'S') {
                                                f18 = f29 - f26;
                                                f19 = f33 - f25;
                                            } else {
                                                f19 = 0.0f;
                                                f18 = 0.0f;
                                            }
                                            int i35 = i16 + 1;
                                            int i36 = i16 + 2;
                                            int i37 = i16 + 3;
                                            i11 = i16;
                                            path2.rCubicTo(f19, f18, fArr4[i16], fArr4[i35], fArr4[i36], fArr4[i37]);
                                            f13 = fArr4[i11] + f33;
                                            f14 = f29 + fArr4[i35];
                                            f33 += fArr4[i36];
                                            f15 = fArr4[i37];
                                        } else if (c13 != 't') {
                                            i11 = i16;
                                        } else {
                                            if (c12 == 'q' || c12 == 't' || c12 == 'Q' || c12 == 'T') {
                                                f21 = f33 - f25;
                                                f22 = f29 - f26;
                                            } else {
                                                f22 = 0.0f;
                                                f21 = 0.0f;
                                            }
                                            int i38 = i16 + 1;
                                            path2.rQuadTo(f21, f22, fArr4[i16], fArr4[i38]);
                                            float f43 = f21 + f33;
                                            float f44 = f29 + f22;
                                            f33 += fArr4[i16];
                                            f29 += fArr4[i38];
                                            f26 = f44;
                                            i11 = i16;
                                            f25 = f43;
                                        }
                                        f33 = f17;
                                        c11 = c13;
                                        fArr = fArr4;
                                    } else {
                                        i11 = i16;
                                        path2.rLineTo(0.0f, fArr4[i11]);
                                        f16 = fArr4[i11];
                                    }
                                    f29 += f16;
                                } else {
                                    i11 = i16;
                                    int i39 = i11 + 1;
                                    int i40 = i11 + 2;
                                    int i41 = i11 + 3;
                                    path2.rQuadTo(fArr4[i11], fArr4[i39], fArr4[i40], fArr4[i41]);
                                    f13 = fArr4[i11] + f33;
                                    f14 = f29 + fArr4[i39];
                                    f33 += fArr4[i40];
                                    f15 = fArr4[i41];
                                }
                                f29 += f15;
                                f25 = f13;
                                f26 = f14;
                            } else {
                                i11 = i16;
                                path2.rLineTo(fArr4[i11], 0.0f);
                                f33 += fArr4[i11];
                            }
                            fArr = fArr4;
                            f11 = f29;
                            c11 = c13;
                        } else {
                            i11 = i16;
                            int i42 = i11 + 5;
                            float f45 = fArr4[i42] + f33;
                            int i43 = i11 + 6;
                            float f46 = fArr4[i43] + f29;
                            float f47 = fArr4[i11];
                            float f48 = fArr4[i11 + 1];
                            float f49 = fArr4[i11 + 2];
                            if (fArr4[i11 + 3] != 0.0f) {
                                fArr2 = fArr4;
                                z11 = 1;
                            } else {
                                fArr2 = fArr4;
                                z11 = i12;
                            }
                            float f51 = fArr2[i11 + 4];
                            fArr = fArr2;
                            float f52 = f33;
                            boolean z12 = f51 != 0.0f ? 1 : i12;
                            float f53 = f29;
                            c11 = c13;
                            a(path, f52, f53, f45, f46, f47, f48, f49, z11, z12);
                            f33 = f52 + fArr[i42];
                            f11 = fArr[i43] + f53;
                            f26 = f11;
                            f25 = f33;
                        }
                    } else {
                        i11 = i16;
                        c11 = c13;
                        fArr = fArr4;
                        i12 = i14;
                        int i44 = i11 + 1;
                        int i45 = i11 + 2;
                        int i46 = i11 + 3;
                        path2.quadTo(fArr[i11], fArr[i44], fArr[i45], fArr[i46]);
                        f12 = fArr[i11];
                        f26 = fArr[i44];
                        f33 = fArr[i45];
                        f11 = fArr[i46];
                    }
                    f25 = f12;
                } else {
                    i11 = i16;
                    fArr = fArr4;
                    i12 = i14;
                    f11 = f29;
                    c11 = c13;
                    path2.lineTo(fArr[i11], f11);
                    f33 = fArr[i11];
                }
                c12 = c11;
                c13 = c12;
                i14 = i12;
                fArr4 = fArr;
                f29 = f11;
                i16 = i11 + i5;
                path2 = path;
            }
            fArr3[i14] = f33;
            fArr3[1] = f29;
            fArr3[2] = f25;
            fArr3[3] = f26;
            fArr3[4] = f31;
            fArr3[5] = f32;
            c12 = l0VarArr[i15].f56296a;
            i15++;
            path2 = path;
            i13 = 6;
        }
    }

    public final String toString() {
        return "PathDataNode{" + this.f56296a + ", " + Arrays.toString(this.f56297b) + AbstractJsonLexerKt.END_OBJ;
    }
}
