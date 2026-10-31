package o2;

import android.graphics.Path;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes2.dex */
public abstract class e0 {
    public static final void a(i2.n0 n0Var, double d5, double d11, double d12, double d13, double d14, double d15, double d16, boolean z11, boolean z12) {
        double d17;
        double d18;
        double d19 = d14;
        double d21 = (d16 / 180) * 3.141592653589793d;
        double dCos = Math.cos(d21);
        double dSin = Math.sin(d21);
        double d22 = ((d11 * dSin) + (d5 * dCos)) / d19;
        double d23 = ((d11 * dCos) + ((-d5) * dSin)) / d15;
        double d24 = ((d13 * dSin) + (d12 * dCos)) / d19;
        double d25 = ((d13 * dCos) + ((-d12) * dSin)) / d15;
        double d26 = d22 - d24;
        double d27 = d23 - d25;
        double d28 = 2;
        double d29 = (d22 + d24) / d28;
        double d30 = (d23 + d25) / d28;
        double d31 = (d27 * d27) + (d26 * d26);
        if (d31 == 0.0d) {
            return;
        }
        double d32 = (1.0d / d31) - 0.25d;
        if (d32 < 0.0d) {
            double dSqrt = (float) (Math.sqrt(d31) / 1.99999d);
            a(n0Var, d5, d11, d12, d13, d19 * dSqrt, d15 * dSqrt, d16, z11, z12);
            return;
        }
        double dSqrt2 = Math.sqrt(d32);
        double d33 = d26 * dSqrt2;
        double d34 = dSqrt2 * d27;
        if (z11 == z12) {
            d17 = d29 - d34;
            d18 = d30 + d33;
        } else {
            d17 = d29 + d34;
            d18 = d30 - d33;
        }
        double dAtan2 = Math.atan2(d23 - d18, d22 - d17);
        double dAtan22 = Math.atan2(d25 - d18, d24 - d17) - dAtan2;
        if (z12 != (dAtan22 >= 0.0d)) {
            dAtan22 = dAtan22 > 0.0d ? dAtan22 - 6.283185307179586d : dAtan22 + 6.283185307179586d;
        }
        double d35 = d17 * d19;
        double d36 = d18 * d15;
        double d37 = (d35 * dCos) - (d36 * dSin);
        double d38 = (d36 * dCos) + (d35 * dSin);
        double d39 = 4;
        int iCeil = (int) Math.ceil(Math.abs((dAtan22 * d39) / 3.141592653589793d));
        double dCos2 = Math.cos(d21);
        double dSin2 = Math.sin(d21);
        double dCos3 = Math.cos(dAtan2);
        double dSin3 = Math.sin(dAtan2);
        double d40 = dAtan22;
        double d41 = -d19;
        double d42 = d41 * dCos2;
        double d43 = d15 * dSin2;
        double d44 = (d42 * dSin3) - (d43 * dCos3);
        double d45 = d41 * dSin2;
        double d46 = d15 * dCos2;
        double d47 = (dCos3 * d46) + (dSin3 * d45);
        double d48 = d40 / iCeil;
        double d49 = dAtan2;
        double d51 = d44;
        int i5 = 0;
        double d52 = d5;
        double d53 = d47;
        double d54 = d11;
        while (i5 < iCeil) {
            double d55 = d49 + d48;
            double dSin4 = Math.sin(d55);
            double dCos4 = Math.cos(d55);
            int i11 = i5;
            double d56 = (((d19 * dCos2) * dCos4) + d37) - (d43 * dSin4);
            int i12 = iCeil;
            double d57 = (d46 * dSin4) + (d19 * dSin2 * dCos4) + d38;
            double d58 = (d42 * dSin4) - (d43 * dCos4);
            double d59 = (dCos4 * d46) + (dSin4 * d45);
            double d61 = d55 - d49;
            double dTan = Math.tan(d61 / d28);
            double dSqrt3 = ((Math.sqrt(((3.0d * dTan) * dTan) + d39) - 1) * Math.sin(d61)) / 3;
            ((i2.h) n0Var).f61117a.cubicTo((float) ((d51 * dSqrt3) + d52), (float) ((d53 * dSqrt3) + d54), (float) (d56 - (dSqrt3 * d58)), (float) (d57 - (dSqrt3 * d59)), (float) d56, (float) d57);
            dSin2 = dSin2;
            d52 = d56;
            i5 = i11 + 1;
            d37 = d37;
            d39 = d39;
            d49 = d55;
            d53 = d59;
            d51 = d58;
            d54 = d57;
            iCeil = i12;
            d19 = d14;
        }
    }

    public static final void b(List list, i2.n0 n0Var) {
        Path path;
        int i5;
        float f11;
        int i11;
        d0 d0Var;
        float f12;
        float f13;
        float f14;
        float f15;
        float f16;
        float f17;
        float f18;
        float f19;
        List list2 = list;
        i2.h hVar = (i2.h) n0Var;
        Path path2 = hVar.f61117a;
        Path path3 = hVar.f61117a;
        int i12 = path2.getFillType() == Path.FillType.EVEN_ODD ? 1 : 0;
        path3.rewind();
        hVar.f(i12);
        d0 d0Var2 = list2.isEmpty() ? l.f79317c : (d0) list2.get(0);
        int size = list2.size();
        float f21 = 0.0f;
        int i13 = 0;
        float f22 = 0.0f;
        float f23 = 0.0f;
        float f24 = 0.0f;
        float f25 = 0.0f;
        float f26 = 0.0f;
        float f27 = 0.0f;
        while (i13 < size) {
            d0 d0Var3 = (d0) list2.get(i13);
            if (d0Var3 instanceof l) {
                path3.close();
                path = path3;
                i5 = size;
                f11 = f21;
                i11 = i13;
                d0Var = d0Var3;
                f22 = f26;
                f24 = f22;
                f23 = f27;
                f25 = f23;
            } else {
                if (d0Var3 instanceof x) {
                    x xVar = (x) d0Var3;
                    float f28 = xVar.f79375c;
                    f24 += f28;
                    float f29 = xVar.f79376d;
                    f25 += f29;
                    path3.rMoveTo(f28, f29);
                    path = path3;
                    i5 = size;
                    f11 = f21;
                    i11 = i13;
                    f26 = f24;
                    f27 = f25;
                } else {
                    if (d0Var3 instanceof p) {
                        p pVar = (p) d0Var3;
                        float f31 = pVar.f79347c;
                        float f32 = pVar.f79348d;
                        path3.moveTo(f31, f32);
                        f25 = f32;
                        f27 = f25;
                        path = path3;
                        f24 = f31;
                        f26 = f24;
                    } else {
                        if (d0Var3 instanceof w) {
                            w wVar = (w) d0Var3;
                            float f33 = wVar.f79374d;
                            float f34 = wVar.f79373c;
                            path3.rLineTo(f34, f33);
                            f24 += f34;
                            f25 += f33;
                        } else if (d0Var3 instanceof o) {
                            o oVar = (o) d0Var3;
                            float f35 = oVar.f79346d;
                            float f36 = oVar.f79345c;
                            hVar.c(f36, f35);
                            f24 = f36;
                            path = path3;
                            f25 = f35;
                        } else if (d0Var3 instanceof v) {
                            float f37 = ((v) d0Var3).f79372c;
                            path3.rLineTo(f37, f21);
                            f24 += f37;
                        } else if (d0Var3 instanceof n) {
                            float f38 = ((n) d0Var3).f79331c;
                            hVar.c(f38, f25);
                            f24 = f38;
                        } else {
                            if (d0Var3 instanceof b0) {
                                f19 = ((b0) d0Var3).f79208c;
                                path3.rLineTo(f21, f19);
                            } else if (d0Var3 instanceof c0) {
                                float f39 = ((c0) d0Var3).f79225c;
                                hVar.c(f24, f39);
                                f25 = f39;
                            } else if (d0Var3 instanceof u) {
                                u uVar = (u) d0Var3;
                                path3.rCubicTo(uVar.f79366c, uVar.f79367d, uVar.f79368e, uVar.f79369f, uVar.f79370g, uVar.f79371h);
                                f22 = uVar.f79368e + f24;
                                f23 = uVar.f79369f + f25;
                                f24 += uVar.f79370g;
                                f19 = uVar.f79371h;
                            } else {
                                if (d0Var3 instanceof m) {
                                    m mVar = (m) d0Var3;
                                    path3.cubicTo(mVar.f79318c, mVar.f79319d, mVar.f79320e, mVar.f79321f, mVar.f79322g, mVar.f79323h);
                                    f22 = mVar.f79320e;
                                    f23 = mVar.f79321f;
                                    f15 = mVar.f79322g;
                                    f16 = mVar.f79323h;
                                } else if (d0Var3 instanceof z) {
                                    if (d0Var2.f79236a) {
                                        f18 = f25 - f23;
                                        f17 = f24 - f22;
                                    } else {
                                        f17 = f21;
                                        f18 = f17;
                                    }
                                    z zVar = (z) d0Var3;
                                    path3.rCubicTo(f17, f18, zVar.f79381c, zVar.f79382d, zVar.f79383e, zVar.f79384f);
                                    f22 = zVar.f79381c + f24;
                                    f23 = zVar.f79382d + f25;
                                    f24 += zVar.f79383e;
                                    f19 = zVar.f79384f;
                                } else if (d0Var3 instanceof r) {
                                    if (d0Var2.f79236a) {
                                        float f40 = 2;
                                        f24 = (f24 * f40) - f22;
                                        f25 = (f40 * f25) - f23;
                                    }
                                    r rVar = (r) d0Var3;
                                    path3.cubicTo(f24, f25, rVar.f79353c, rVar.f79354d, rVar.f79355e, rVar.f79356f);
                                    f22 = rVar.f79353c;
                                    f23 = rVar.f79354d;
                                    f15 = rVar.f79355e;
                                    f16 = rVar.f79356f;
                                } else if (d0Var3 instanceof y) {
                                    y yVar = (y) d0Var3;
                                    float f41 = yVar.f79380f;
                                    float f42 = yVar.f79379e;
                                    float f43 = yVar.f79378d;
                                    float f44 = yVar.f79377c;
                                    path3.rQuadTo(f44, f43, f42, f41);
                                    float f45 = f44 + f24;
                                    float f46 = f43 + f25;
                                    f24 += f42;
                                    f25 += f41;
                                    f22 = f45;
                                    path = path3;
                                    f23 = f46;
                                } else {
                                    if (d0Var3 instanceof q) {
                                        q qVar = (q) d0Var3;
                                        float f47 = qVar.f79352f;
                                        float f48 = qVar.f79351e;
                                        float f49 = qVar.f79350d;
                                        f14 = qVar.f79349c;
                                        path3.quadTo(f14, f49, f48, f47);
                                        path = path3;
                                        f25 = f47;
                                        f24 = f48;
                                        f23 = f49;
                                    } else if (d0Var3 instanceof a0) {
                                        if (d0Var2.f79237b) {
                                            f12 = f24 - f22;
                                            f13 = f25 - f23;
                                        } else {
                                            f12 = f21;
                                            f13 = f12;
                                        }
                                        a0 a0Var = (a0) d0Var3;
                                        float f51 = a0Var.f79205d;
                                        float f52 = a0Var.f79204c;
                                        path3.rQuadTo(f12, f13, f52, f51);
                                        f14 = f12 + f24;
                                        float f53 = f13 + f25;
                                        f24 += f52;
                                        f25 += f51;
                                        path = path3;
                                        f23 = f53;
                                    } else if (d0Var3 instanceof s) {
                                        if (d0Var2.f79237b) {
                                            float f54 = 2;
                                            f24 = (f24 * f54) - f22;
                                            f25 = (f54 * f25) - f23;
                                        }
                                        s sVar = (s) d0Var3;
                                        float f55 = sVar.f79358d;
                                        float f56 = sVar.f79357c;
                                        path3.quadTo(f24, f25, f56, f55);
                                        path = path3;
                                        i5 = size;
                                        f11 = f21;
                                        i11 = i13;
                                        f23 = f25;
                                        d0Var = d0Var3;
                                        f25 = f55;
                                        f22 = f24;
                                        f24 = f56;
                                    } else if (d0Var3 instanceof t) {
                                        t tVar = (t) d0Var3;
                                        float f57 = tVar.f79364h + f24;
                                        float f58 = tVar.f79365i + f25;
                                        path = path3;
                                        i11 = i13;
                                        f11 = 0.0f;
                                        i5 = size;
                                        hVar = hVar;
                                        a(hVar, f24, f25, f57, f58, tVar.f79359c, tVar.f79360d, tVar.f79361e, tVar.f79362f, tVar.f79363g);
                                        f22 = f57;
                                        f24 = f22;
                                        f23 = f58;
                                        f25 = f23;
                                        d0Var = d0Var3;
                                    } else {
                                        path = path3;
                                        i5 = size;
                                        f11 = f21;
                                        i11 = i13;
                                        if (!(d0Var3 instanceof k)) {
                                            throw new NoWhenBranchMatchedException();
                                        }
                                        k kVar = (k) d0Var3;
                                        float f59 = kVar.f79315i;
                                        float f61 = kVar.f79314h;
                                        d0Var = d0Var3;
                                        hVar = hVar;
                                        a(hVar, f24, f25, f61, f59, kVar.f79309c, kVar.f79310d, kVar.f79311e, kVar.f79312f, kVar.f79313g);
                                        f23 = f59;
                                        f25 = f23;
                                        f22 = f61;
                                        f24 = f22;
                                    }
                                    i5 = size;
                                    f11 = f21;
                                    i11 = i13;
                                    d0Var = d0Var3;
                                    f22 = f14;
                                }
                                f25 = f16;
                                path = path3;
                                f24 = f15;
                            }
                            f25 += f19;
                        }
                        path = path3;
                    }
                    i5 = size;
                    f11 = f21;
                    i11 = i13;
                }
                d0Var = d0Var3;
            }
            i13 = i11 + 1;
            list2 = list;
            path3 = path;
            size = i5;
            d0Var2 = d0Var;
            f21 = f11;
        }
    }
}
