package defpackage;

import android.graphics.Matrix;
import android.graphics.PointF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mrd {
    public final Matrix b;
    public final Matrix c;
    public final Matrix d;
    public final float[] e;
    public final vk6 l;
    public final rn0 m;
    public final se5 n;
    public final zu1 o;
    public final zu1 p;
    public final zu1 q;
    public final zu1 r;
    public final zu1 s;
    public final zu1 t;
    public final zu1 u;
    public final zu1 v;
    public final zu1 w;
    public final boolean x;
    public final Matrix a = new Matrix();
    public float f = Float.NaN;
    public float g = Float.NaN;
    public float h = Float.NaN;
    public float i = 1.0f;
    public float j = 1.0f;
    public boolean k = true;

    public mrd(vu vuVar) {
        ru ruVar = vuVar.a;
        this.l = (vk6) (ruVar == null ? null : ruVar.w());
        xu xuVar = vuVar.b;
        this.m = xuVar == null ? null : xuVar.w();
        pu puVar = vuVar.c;
        this.n = (se5) (puVar == null ? null : puVar.w());
        qu quVar = vuVar.d;
        this.o = quVar == null ? null : quVar.w();
        qu quVar2 = vuVar.f;
        zu1 zu1VarW = quVar2 == null ? null : quVar2.w();
        this.q = zu1VarW;
        this.x = vuVar.m;
        qu quVar3 = vuVar.h;
        this.s = quVar3 == null ? null : quVar3.w();
        qu quVar4 = vuVar.i;
        this.t = quVar4 == null ? null : quVar4.w();
        qu quVar5 = vuVar.j;
        this.u = quVar5 == null ? null : quVar5.w();
        if (zu1VarW != null) {
            this.b = new Matrix();
            this.c = new Matrix();
            this.d = new Matrix();
            this.e = new float[9];
        } else {
            this.b = null;
            this.c = null;
            this.d = null;
            this.e = null;
        }
        qu quVar6 = vuVar.g;
        this.r = quVar6 == null ? null : quVar6.w();
        pu puVar2 = vuVar.e;
        if (puVar2 != null) {
            this.p = (zu1) puVar2.w();
        }
        qu quVar7 = vuVar.k;
        if (quVar7 != null) {
            this.v = quVar7.w();
        } else {
            this.v = null;
        }
        qu quVar8 = vuVar.l;
        if (quVar8 != null) {
            this.w = quVar8.w();
        } else {
            this.w = null;
        }
    }

    public final void a(tn0 tn0Var) {
        tn0Var.d(this.p);
        tn0Var.d(this.v);
        tn0Var.d(this.w);
        tn0Var.d(this.l);
        tn0Var.d(this.m);
        tn0Var.d(this.n);
        tn0Var.d(this.o);
        tn0Var.d(this.q);
        tn0Var.d(this.r);
        tn0Var.d(this.s);
        tn0Var.d(this.t);
        tn0Var.d(this.u);
    }

    public final void b(nn0 nn0Var) {
        zu1 zu1Var = this.p;
        if (zu1Var != null) {
            zu1Var.a(nn0Var);
        }
        zu1 zu1Var2 = this.v;
        if (zu1Var2 != null) {
            zu1Var2.a(nn0Var);
        }
        zu1 zu1Var3 = this.w;
        if (zu1Var3 != null) {
            zu1Var3.a(nn0Var);
        }
        vk6 vk6Var = this.l;
        if (vk6Var != null) {
            vk6Var.a(nn0Var);
        }
        rn0 rn0Var = this.m;
        if (rn0Var != null) {
            rn0Var.a(nn0Var);
        }
        se5 se5Var = this.n;
        if (se5Var != null) {
            se5Var.a(nn0Var);
        }
        zu1 zu1Var4 = this.o;
        if (zu1Var4 != null) {
            zu1Var4.a(nn0Var);
        }
        zu1 zu1Var5 = this.q;
        if (zu1Var5 != null) {
            zu1Var5.a(nn0Var);
        }
        zu1 zu1Var6 = this.r;
        if (zu1Var6 != null) {
            zu1Var6.a(nn0Var);
        }
        zu1 zu1Var7 = this.s;
        if (zu1Var7 != null) {
            zu1Var7.a(nn0Var);
            zu1Var7.a(new lrd(0, this));
        }
        zu1 zu1Var8 = this.t;
        if (zu1Var8 != null) {
            zu1Var8.a(nn0Var);
            zu1Var8.a(new lrd(1, this));
        }
        zu1 zu1Var9 = this.u;
        if (zu1Var9 != null) {
            zu1Var9.a(nn0Var);
            zu1Var9.a(new lrd(2, this));
        }
    }

    public final void c() {
        for (int i = 0; i < 9; i++) {
            this.e[i] = 0.0f;
        }
    }

    public final Matrix d() {
        PointF pointF;
        gqb gqbVar;
        PointF pointF2;
        Matrix matrix = this.a;
        matrix.reset();
        se5 se5Var = this.n;
        vk6 vk6Var = this.l;
        rn0 rn0Var = this.m;
        zu1 zu1Var = this.u;
        zu1 zu1Var2 = this.t;
        zu1 zu1Var3 = this.s;
        if ((zu1Var3 == null || zu1Var3.i() == 0.0f) && ((zu1Var2 == null || zu1Var2.i() == 0.0f) && (zu1Var == null || zu1Var.i() == 0.0f))) {
            if (rn0Var != null && (pointF2 = (PointF) rn0Var.d()) != null) {
                float f = pointF2.x;
                if (f != 0.0f || pointF2.y != 0.0f) {
                    matrix.preTranslate(f, pointF2.y);
                }
            }
            if (!this.x) {
                zu1 zu1Var4 = this.o;
                if (zu1Var4 != null) {
                    float fI = zu1Var4.i();
                    if (fI != 0.0f) {
                        matrix.preRotate(fI);
                    }
                }
            } else if (rn0Var != null) {
                float f2 = rn0Var.d;
                PointF pointF3 = (PointF) rn0Var.d();
                float f3 = pointF3.x;
                float f4 = pointF3.y;
                rn0Var.g(1.0E-4f + f2);
                PointF pointF4 = (PointF) rn0Var.d();
                rn0Var.g(f2);
                matrix.preRotate((float) Math.toDegrees(Math.atan2(pointF4.y - f4, pointF4.x - f3)));
            }
            if (this.q != null) {
                zu1 zu1Var5 = this.r;
                float fCos = zu1Var5 == null ? 0.0f : (float) Math.cos(Math.toRadians((-zu1Var5.i()) + 90.0f));
                float fSin = zu1Var5 == null ? 1.0f : (float) Math.sin(Math.toRadians((-zu1Var5.i()) + 90.0f));
                float fTan = (float) Math.tan(Math.toRadians(r4.i()));
                c();
                float[] fArr = this.e;
                fArr[0] = fCos;
                fArr[1] = fSin;
                float f5 = -fSin;
                fArr[3] = f5;
                fArr[4] = fCos;
                fArr[8] = 1.0f;
                Matrix matrix2 = this.b;
                matrix2.setValues(fArr);
                c();
                fArr[0] = 1.0f;
                fArr[3] = fTan;
                fArr[4] = 1.0f;
                fArr[8] = 1.0f;
                Matrix matrix3 = this.c;
                matrix3.setValues(fArr);
                c();
                fArr[0] = fCos;
                fArr[1] = f5;
                fArr[3] = fSin;
                fArr[4] = fCos;
                fArr[8] = 1.0f;
                Matrix matrix4 = this.d;
                matrix4.setValues(fArr);
                matrix3.preConcat(matrix2);
                matrix4.preConcat(matrix3);
                matrix.preConcat(matrix4);
            }
            if (se5Var != null && (gqbVar = (gqb) se5Var.d()) != null) {
                float f6 = gqbVar.a;
                if (f6 != 1.0f || gqbVar.b != 1.0f) {
                    matrix.preScale(f6, gqbVar.b);
                }
            }
            if (vk6Var != null && (pointF = (PointF) vk6Var.d()) != null) {
                float f7 = pointF.x;
                if (f7 != 0.0f || pointF.y != 0.0f) {
                    matrix.preTranslate(-f7, -pointF.y);
                }
            }
        } else {
            float fI2 = zu1Var3 != null ? zu1Var3.i() : 0.0f;
            float fI3 = zu1Var2 != null ? zu1Var2.i() : 0.0f;
            float fI4 = zu1Var != null ? zu1Var.i() : 0.0f;
            if (this.k || fI2 != this.f || fI3 != this.g || fI4 != this.h) {
                this.f = fI2;
                this.g = fI3;
                this.h = fI4;
                if (fI2 != 0.0f) {
                    this.i = (float) Math.cos(Math.toRadians(fI2));
                } else {
                    this.i = 1.0f;
                }
                if (fI3 != 0.0f) {
                    this.j = (float) Math.cos(Math.toRadians(fI3));
                } else {
                    this.j = 1.0f;
                }
                this.k = false;
            }
            PointF pointF5 = vk6Var == null ? null : (PointF) vk6Var.d();
            PointF pointF6 = rn0Var == null ? null : (PointF) rn0Var.d();
            gqb gqbVar2 = se5Var != null ? (gqb) se5Var.d() : null;
            float f8 = gqbVar2 != null ? gqbVar2.a : 1.0f;
            float f9 = gqbVar2 != null ? gqbVar2.b : 1.0f;
            float f10 = this.i;
            float f11 = this.j;
            matrix.reset();
            if (pointF6 != null) {
                float f12 = pointF6.x;
                if (f12 != 0.0f || pointF6.y != 0.0f) {
                    matrix.preTranslate(f12, pointF6.y);
                }
            }
            if (fI4 != 0.0f) {
                matrix.preRotate(fI4);
            }
            if (fI3 != 0.0f) {
                matrix.preScale(f11, 1.0f);
            }
            if (fI2 != 0.0f) {
                matrix.preScale(1.0f, f10);
            }
            if (f8 != 1.0f || f9 != 1.0f) {
                matrix.preScale(f8, f9);
            }
            if (pointF5 != null) {
                float f13 = pointF5.x;
                if (f13 != 0.0f || pointF5.y != 0.0f) {
                    matrix.preTranslate(-f13, -pointF5.y);
                    return matrix;
                }
            }
        }
        return matrix;
    }

    public final Matrix e(float f) {
        rn0 rn0Var = this.m;
        PointF pointF = rn0Var == null ? null : (PointF) rn0Var.d();
        se5 se5Var = this.n;
        gqb gqbVar = se5Var == null ? null : (gqb) se5Var.d();
        vk6 vk6Var = this.l;
        PointF pointF2 = vk6Var != null ? (PointF) vk6Var.d() : null;
        Matrix matrix = this.a;
        matrix.reset();
        if (pointF != null) {
            matrix.preTranslate(pointF.x * f, pointF.y * f);
        }
        zu1 zu1Var = this.s;
        float fI = zu1Var != null ? zu1Var.i() * f : 0.0f;
        zu1 zu1Var2 = this.t;
        float fI2 = zu1Var2 != null ? zu1Var2.i() * f : 0.0f;
        zu1 zu1Var3 = this.u;
        float fI3 = zu1Var3 != null ? zu1Var3.i() * f : 0.0f;
        if (fI == 0.0f && fI2 == 0.0f && fI3 == 0.0f) {
            zu1 zu1Var4 = this.o;
            if (zu1Var4 != null) {
                matrix.preRotate(((Float) zu1Var4.d()).floatValue() * f, pointF2 == null ? 0.0f : pointF2.x, pointF2 != null ? pointF2.y : 0.0f);
            }
        } else {
            float fCos = fI != 0.0f ? (float) Math.cos(Math.toRadians(fI)) : 1.0f;
            float fCos2 = fI2 != 0.0f ? (float) Math.cos(Math.toRadians(fI2)) : 1.0f;
            if (fI3 != 0.0f) {
                matrix.preRotate(fI3, pointF2 == null ? 0.0f : pointF2.x, pointF2 != null ? pointF2.y : 0.0f);
            }
            if (fI2 != 0.0f) {
                matrix.preScale(fCos2, 1.0f);
            }
            if (fI != 0.0f) {
                matrix.preScale(1.0f, fCos);
            }
        }
        if (gqbVar != null) {
            double d = f;
            matrix.preScale((float) Math.pow(gqbVar.a, d), (float) Math.pow(gqbVar.b, d));
        }
        return matrix;
    }
}
