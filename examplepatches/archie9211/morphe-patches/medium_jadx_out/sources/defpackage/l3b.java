package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Looper;
import android.os.Trace;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l3b {
    public Object a;
    public Object b;
    public final Object c;
    public Object d;
    public final Object e;
    public final Object f;
    public Object g;
    public Object h;
    public Object i;
    public Object j;
    public Object k;

    public l3b(int i) {
        switch (i) {
            case 1:
                this.a = new j4c[4];
                this.b = new Matrix[4];
                this.c = new Matrix[4];
                this.d = new PointF();
                this.e = new Path();
                this.f = new Path();
                this.g = new j4c();
                this.h = new float[2];
                this.i = new float[2];
                this.j = new Path();
                this.k = new Path();
                for (int i2 = 0; i2 < 4; i2++) {
                    ((j4c[]) this.a)[i2] = new j4c();
                    ((Matrix[]) this.b)[i2] = new Matrix();
                    ((Matrix[]) this.c)[i2] = new Matrix();
                }
                break;
            default:
                o78 o78Var = new o78(new t65[16]);
                this.c = o78Var;
                g78 g78Var = iqb.a;
                this.g = new g78();
                this.d = o78Var;
                this.e = new o78(new Object[16]);
                this.f = new o78(new m45[16]);
                break;
        }
    }

    public static final boolean g(t65 t65Var, o78 o78Var) {
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            p3b p3bVar = ((t65) objArr[i2]).a;
            if (p3bVar instanceof m69) {
                o78 o78Var2 = ((m69) p3bVar).b;
                if (o78Var2.l(t65Var) || g(t65Var, o78Var2)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static l3b h() {
        return Looper.getMainLooper().getThread() == Thread.currentThread() ? q3c.a : new l3b(1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void a(p3c p3cVar, float[] fArr, float f, RectF rectF, my6 my6Var, Path path) {
        int i;
        char c;
        float f2;
        my6 my6Var2;
        char c2;
        my6 my6Var3 = my6Var;
        Matrix[] matrixArr = (Matrix[]) this.c;
        float[] fArr2 = (float[]) this.h;
        j4c[] j4cVarArr = (j4c[]) this.a;
        Matrix[] matrixArr2 = (Matrix[]) this.b;
        path.rewind();
        Path path2 = (Path) this.e;
        path2.rewind();
        Path path3 = (Path) this.f;
        path3.rewind();
        path3.addRect(rectF, Path.Direction.CW);
        int i2 = 0;
        while (true) {
            c = 0;
            if (i2 >= 4) {
                break;
            }
            PointF pointF = (PointF) this.d;
            eb2 dm1Var = fArr == null ? i2 != 1 ? i2 != 2 ? i2 != 3 ? p3cVar.f : p3cVar.e : p3cVar.h : p3cVar.g : new dm1(fArr[i2]);
            gsa gsaVar = i2 != 1 ? i2 != 2 ? i2 != 3 ? p3cVar.b : p3cVar.a : p3cVar.d : p3cVar.c;
            j4c j4cVar = j4cVarArr[i2];
            gsaVar.getClass();
            Matrix[] matrixArr3 = matrixArr;
            gsaVar.f0(j4cVar, f, dm1Var.a(rectF));
            int i3 = i2 + 1;
            float f3 = (i3 % 4) * 90;
            matrixArr2[i2].reset();
            if (i2 == 1) {
                pointF.set(rectF.right, rectF.bottom);
            } else if (i2 == 2) {
                pointF.set(rectF.left, rectF.bottom);
            } else if (i2 != 3) {
                pointF.set(rectF.right, rectF.top);
            } else {
                pointF.set(rectF.left, rectF.top);
            }
            matrixArr2[i2].setTranslate(pointF.x, pointF.y);
            matrixArr2[i2].preRotate(f3);
            j4c j4cVar2 = j4cVarArr[i2];
            fArr2[0] = j4cVar2.b;
            fArr2[1] = j4cVar2.c;
            matrixArr2[i2].mapPoints(fArr2);
            matrixArr3[i2].reset();
            matrixArr3[i2].setTranslate(fArr2[0], fArr2[1]);
            matrixArr3[i2].preRotate(f3);
            i2 = i3;
            matrixArr = matrixArr3;
        }
        Matrix[] matrixArr4 = matrixArr;
        int i4 = 0;
        for (i = 4; i4 < i; i = 4) {
            j4c j4cVar3 = j4cVarArr[i4];
            j4cVar3.getClass();
            fArr2[c] = 0.0f;
            fArr2[1] = j4cVar3.a;
            matrixArr2[i4].mapPoints(fArr2);
            if (i4 == 0) {
                path.moveTo(fArr2[c], fArr2[1]);
            } else {
                path.lineTo(fArr2[c], fArr2[1]);
            }
            j4cVarArr[i4].b(matrixArr2[i4], path);
            if (my6Var3 != null) {
                j4c j4cVar4 = j4cVarArr[i4];
                Matrix matrix = matrixArr2[i4];
                dk7 dk7Var = (dk7) my6Var3.a;
                BitSet bitSet = dk7Var.e;
                j4cVar4.getClass();
                f2 = 0.0f;
                bitSet.set(i4, (boolean) c);
                i4c[] i4cVarArr = dk7Var.c;
                j4cVar4.a(j4cVar4.e);
                i4cVarArr[i4] = new c4c(new ArrayList(j4cVar4.g), new Matrix(matrix));
            } else {
                f2 = 0.0f;
            }
            Path path4 = (Path) this.j;
            j4c j4cVar5 = (j4c) this.g;
            int i5 = i4 + 1;
            int i6 = i5 % 4;
            j4c j4cVar6 = j4cVarArr[i4];
            fArr2[0] = j4cVar6.b;
            fArr2[1] = j4cVar6.c;
            matrixArr2[i4].mapPoints(fArr2);
            float[] fArr3 = (float[]) this.i;
            j4c j4cVar7 = j4cVarArr[i6];
            j4cVar7.getClass();
            fArr3[0] = f2;
            fArr3[1] = j4cVar7.a;
            matrixArr2[i6].mapPoints(fArr3);
            j4c[] j4cVarArr2 = j4cVarArr;
            Matrix[] matrixArr5 = matrixArr2;
            float fMax = Math.max(((float) Math.hypot(fArr2[0] - fArr3[0], fArr2[1] - fArr3[1])) - 0.001f, f2);
            j4c j4cVar8 = j4cVarArr2[i4];
            fArr2[0] = j4cVar8.b;
            fArr2[1] = j4cVar8.c;
            matrixArr5[i4].mapPoints(fArr2);
            if (i4 == 1 || i4 == 3) {
                Math.abs(rectF.centerX() - fArr2[0]);
            } else {
                Math.abs(rectF.centerY() - fArr2[1]);
            }
            j4cVar5.d(0.0f, 270.0f, 0.0f);
            (i4 != 1 ? i4 != 2 ? i4 != 3 ? p3cVar.j : p3cVar.i : p3cVar.l : p3cVar.k).getClass();
            j4cVar5.c(fMax, 0.0f);
            path4.reset();
            j4cVar5.b(matrixArr4[i4], path4);
            if (i(path4, i4) || i(path4, i6)) {
                path4.op(path4, path3, Path.Op.DIFFERENCE);
                fArr2[0] = 0.0f;
                fArr2[1] = j4cVar5.a;
                matrixArr4[i4].mapPoints(fArr2);
                path2.moveTo(fArr2[0], fArr2[1]);
                j4cVar5.b(matrixArr4[i4], path2);
            } else {
                j4cVar5.b(matrixArr4[i4], path);
            }
            if (my6Var != null) {
                Matrix matrix2 = matrixArr4[i4];
                my6Var2 = my6Var;
                dk7 dk7Var2 = (dk7) my6Var2.a;
                c2 = 0;
                dk7Var2.e.set(i4 + 4, false);
                i4c[] i4cVarArr2 = dk7Var2.d;
                j4cVar5.a(j4cVar5.e);
                i4cVarArr2[i4] = new c4c(new ArrayList(j4cVar5.g), new Matrix(matrix2));
            } else {
                my6Var2 = my6Var;
                c2 = 0;
            }
            c = c2;
            my6Var3 = my6Var2;
            i4 = i5;
            j4cVarArr = j4cVarArr2;
            matrixArr2 = matrixArr5;
        }
        path.close();
        path2.close();
        if (path2.isEmpty()) {
            return;
        }
        path.op(path2, Path.Op.UNION);
    }

    public void b() {
        this.a = null;
        this.b = null;
        o78 o78Var = (o78) this.c;
        o78Var.i();
        ((g78) this.g).b();
        this.d = o78Var;
        ((o78) this.e).i();
        ((o78) this.f).i();
        this.h = null;
        this.j = null;
        this.k = null;
    }

    public void c() {
        Set set = (Set) this.a;
        if (set == null || set.isEmpty()) {
            return;
        }
        Trace.beginSection("Compose:abandons");
        try {
            Iterator it2 = set.iterator();
            while (it2.hasNext()) {
                p3b p3bVar = (p3b) it2.next();
                it2.remove();
                p3bVar.b();
            }
        } finally {
            Trace.endSection();
        }
    }

    public void d() {
        o78 o78Var = (o78) this.c;
        o78 o78Var2 = (o78) this.e;
        Set set = (Set) this.a;
        if (set == null) {
            return;
        }
        this.i = null;
        int i = 28;
        if (o78Var2.c != 0) {
            Trace.beginSection("Compose:onForgotten");
            try {
                g78 g78Var = (g78) this.h;
                int i2 = o78Var2.c;
                while (true) {
                    i2--;
                    if (-1 >= i2) {
                        break;
                    }
                    Object obj = o78Var2.a[i2];
                    try {
                        if (obj instanceof t65) {
                            p3b p3bVar = ((t65) obj).a;
                            set.remove(p3bVar);
                            p3bVar.c();
                        }
                        if (obj instanceof f12) {
                            if (g78Var == null || !g78Var.c(obj)) {
                                ((f12) obj).b();
                            } else {
                                ((f12) obj).a();
                            }
                        }
                    } catch (Throwable th) {
                        o22 o22Var = (o22) this.b;
                        if (o22Var != null) {
                            hlg.V(th, new n(o22Var, i, obj));
                        }
                        throw th;
                    }
                }
            } finally {
                Trace.endSection();
            }
        }
        if (o78Var.c != 0) {
            Trace.beginSection("Compose:onRemembered");
            try {
                Set set2 = (Set) this.a;
                if (set2 != null) {
                    Object[] objArr = o78Var.a;
                    int i3 = o78Var.c;
                    for (int i4 = 0; i4 < i3; i4++) {
                        t65 t65Var = (t65) objArr[i4];
                        p3b p3bVar2 = t65Var.a;
                        set2.remove(p3bVar2);
                        try {
                            p3bVar2.d();
                        } catch (Throwable th2) {
                            o22 o22Var2 = (o22) this.b;
                            if (o22Var2 != null) {
                                hlg.V(th2, new n(o22Var2, i, t65Var));
                            }
                            throw th2;
                        }
                    }
                }
            } finally {
            }
        }
    }

    public void e() {
        o78 o78Var = (o78) this.f;
        if (o78Var.c != 0) {
            Trace.beginSection("Compose:sideeffects");
            try {
                Object[] objArr = o78Var.a;
                int i = o78Var.c;
                for (int i2 = 0; i2 < i; i2++) {
                    ((m45) objArr[i2]).invoke();
                }
                o78Var.i();
            } finally {
                Trace.endSection();
            }
        }
    }

    public void f(t65 t65Var) {
        o78 o78Var = (o78) this.c;
        if (!((g78) this.g).c(t65Var)) {
            g78 g78Var = (g78) this.i;
            if (g78Var == null || !g78Var.c(t65Var)) {
                ((o78) this.e).b(t65Var);
                return;
            }
            return;
        }
        ((g78) this.g).l(t65Var);
        if (!((o78) this.d).l(t65Var) && !o78Var.l(t65Var)) {
            g(t65Var, o78Var);
        }
        Set set = (Set) this.a;
        if (set == null) {
            return;
        }
        set.add(t65Var.a);
    }

    public boolean i(Path path, int i) {
        Path path2 = (Path) this.k;
        path2.reset();
        ((j4c[]) this.a)[i].b(((Matrix[]) this.b)[i], path2);
        RectF rectF = new RectF();
        path.computeBounds(rectF, true);
        path2.computeBounds(rectF, true);
        path.op(path2, Path.Op.INTERSECT);
        path.computeBounds(rectF, true);
        return !rectF.isEmpty() || (rectF.width() > 1.0f && rectF.height() > 1.0f);
    }

    public void j(Set set, o22 o22Var) {
        b();
        this.a = set;
        this.b = o22Var;
    }
}
