package bk;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.os.UserHandle;
import com.google.android.gms.internal.consent_sdk.e0;
import fe.c1;
import fe.d1;
import fe.h0;
import fe.p1;
import fe.z1;
import gf.a0;
import gf.v0;
import gf.x;
import gf.z;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import vf.g0;
import wf.v;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public boolean f18016a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f18017b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f18018c;

    /* renamed from: d, reason: collision with root package name */
    public final Serializable f18019d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f18020e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f18021f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f18022g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f18023h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f18024i;

    /* renamed from: j, reason: collision with root package name */
    public final Object f18025j;

    /* renamed from: k, reason: collision with root package name */
    public Object f18026k;

    /* renamed from: l, reason: collision with root package name */
    public Object f18027l;

    /* JADX WARN: Type inference failed for: r2v8, types: [android.graphics.Matrix[], java.io.Serializable] */
    public l(int i5) throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        Class<?> cls;
        Class<?> cls2;
        Method declaredMethod;
        Method declaredMethod2;
        Constructor<?> constructor;
        Method declaredMethod3;
        switch (i5) {
            case 2:
                Class<?> cls3 = Class.forName("miui.content.res.IconCustomizer");
                this.f18017b = cls3;
                Method declaredMethod4 = cls3.getDeclaredMethod("getIconNames", String.class, String.class);
                declaredMethod4.setAccessible(true);
                this.f18018c = declaredMethod4;
                Class<?> cls4 = Class.forName("miui.content.res.ThemeResources");
                this.f18019d = cls4;
                Class<?> cls5 = null;
                this.f18020e = cls4.getDeclaredMethod("getSystem", null);
                this.f18027l = Class.forName("miui.maml.FancyDrawable");
                try {
                    cls2 = Class.forName("miui.maml.util.AppIconsHelper");
                    declaredMethod = cls2.getDeclaredMethod("getIconDrawable", Context.class, String.class, String.class, Long.TYPE, UserHandle.class);
                    cls = Class.forName("miui.content.res.IconCustomizer");
                    declaredMethod2 = cls.getDeclaredMethod("getIcon", Context.class, String.class, String.class, Integer.TYPE, ApplicationInfo.class, Boolean.TYPE);
                } catch (Exception unused) {
                    cls = null;
                    cls2 = null;
                    declaredMethod = null;
                    declaredMethod2 = null;
                }
                this.f18023h = cls2;
                this.f18024i = declaredMethod;
                this.f18025j = cls;
                this.f18026k = declaredMethod2;
                if (cls2 == null) {
                    try {
                        Class<?> cls6 = Class.forName("android.content.res.MiuiResources$ThemeFileInfoOption");
                        constructor = cls6.getConstructor(Boolean.TYPE);
                        declaredMethod3 = Class.forName("miui.content.res.ThemeResourcesSystem").getDeclaredMethod("getIcon", cls6, String.class);
                        declaredMethod3.setAccessible(true);
                        cls5 = cls6;
                    } catch (Exception unused2) {
                    }
                } else {
                    declaredMethod3 = null;
                    constructor = null;
                }
                this.f18021f = constructor;
                this.f18022g = declaredMethod3;
                if (cls2 == null) {
                    cls5.getClass();
                }
                this.f18016a = cls2 != null;
                break;
            default:
                this.f18017b = new t[4];
                this.f18018c = new Matrix[4];
                this.f18019d = new Matrix[4];
                this.f18020e = new PointF();
                this.f18021f = new Path();
                this.f18022g = new Path();
                this.f18025j = new t();
                this.f18026k = new float[2];
                this.f18027l = new float[2];
                this.f18023h = new Path();
                this.f18024i = new Path();
                this.f18016a = true;
                for (int i11 = 0; i11 < 4; i11++) {
                    ((t[]) this.f18017b)[i11] = new t();
                    ((Matrix[]) this.f18018c)[i11] = new Matrix();
                    ((Matrix[]) this.f18019d)[i11] = new Matrix();
                }
                break;
        }
    }

    public z1 a(int i5, ArrayList arrayList, v0 v0Var) {
        ArrayList arrayList2 = (ArrayList) this.f18018c;
        if (!arrayList.isEmpty()) {
            this.f18026k = v0Var;
            for (int i11 = i5; i11 < arrayList.size() + i5; i11++) {
                d1 d1Var = (d1) arrayList.get(i11 - i5);
                if (i11 > 0) {
                    d1 d1Var2 = (d1) arrayList2.get(i11 - 1);
                    d1Var.f54743d = d1Var2.f54740a.o.f57534b.o() + d1Var2.f54743d;
                    d1Var.f54744e = false;
                    d1Var.f54742c.clear();
                } else {
                    d1Var.f54743d = 0;
                    d1Var.f54744e = false;
                    d1Var.f54742c.clear();
                }
                int iO = d1Var.f54740a.o.f57534b.o();
                for (int i12 = i11; i12 < arrayList2.size(); i12++) {
                    ((d1) arrayList2.get(i12)).f54743d += iO;
                }
                arrayList2.add(i11, d1Var);
                ((HashMap) this.f18020e).put(d1Var.f54741b, d1Var);
                if (this.f18016a) {
                    g(d1Var);
                    if (((IdentityHashMap) this.f18019d).isEmpty()) {
                        ((HashSet) this.f18025j).add(d1Var);
                    } else {
                        c1 c1Var = (c1) ((HashMap) this.f18024i).get(d1Var);
                        if (c1Var != null) {
                            c1Var.f54733a.b(c1Var.f54734b);
                        }
                    }
                }
            }
        }
        return c();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1 */
    /* JADX WARN: Type inference failed for: r16v5 */
    public void b(j jVar, float f11, RectF rectF, a5.d dVar, Path path) {
        int i5;
        boolean z11;
        float f12;
        a5.d dVar2;
        boolean z12;
        a5.d dVar3 = dVar;
        Matrix[] matrixArr = (Matrix[]) this.f18019d;
        float[] fArr = (float[]) this.f18026k;
        t[] tVarArr = (t[]) this.f18017b;
        Matrix[] matrixArr2 = (Matrix[]) this.f18018c;
        path.rewind();
        Path path2 = (Path) this.f18021f;
        path2.rewind();
        Path path3 = (Path) this.f18022g;
        path3.rewind();
        path3.addRect(rectF, Path.Direction.CW);
        int i11 = 0;
        while (true) {
            z11 = 0;
            if (i11 >= 4) {
                break;
            }
            PointF pointF = (PointF) this.f18020e;
            c cVar = i11 != 1 ? i11 != 2 ? i11 != 3 ? jVar.f18008f : jVar.f18007e : jVar.f18010h : jVar.f18009g;
            e0 e0Var = i11 != 1 ? i11 != 2 ? i11 != 3 ? jVar.f18004b : jVar.f18003a : jVar.f18006d : jVar.f18005c;
            t tVar = tVarArr[i11];
            e0Var.getClass();
            Matrix[] matrixArr3 = matrixArr;
            e0Var.D(tVar, f11, cVar.a(rectF));
            int i12 = i11 + 1;
            float f13 = (i12 % 4) * 90;
            matrixArr2[i11].reset();
            if (i11 == 1) {
                pointF.set(rectF.right, rectF.bottom);
            } else if (i11 == 2) {
                pointF.set(rectF.left, rectF.bottom);
            } else if (i11 != 3) {
                pointF.set(rectF.right, rectF.top);
            } else {
                pointF.set(rectF.left, rectF.top);
            }
            matrixArr2[i11].setTranslate(pointF.x, pointF.y);
            matrixArr2[i11].preRotate(f13);
            t tVar2 = tVarArr[i11];
            fArr[0] = tVar2.f18047b;
            fArr[1] = tVar2.f18048c;
            matrixArr2[i11].mapPoints(fArr);
            matrixArr3[i11].reset();
            matrixArr3[i11].setTranslate(fArr[0], fArr[1]);
            matrixArr3[i11].preRotate(f13);
            i11 = i12;
            matrixArr = matrixArr3;
        }
        Matrix[] matrixArr4 = matrixArr;
        int i13 = 0;
        for (i5 = 4; i13 < i5; i5 = 4) {
            t tVar3 = tVarArr[i13];
            tVar3.getClass();
            fArr[z11] = 0.0f;
            fArr[1] = tVar3.f18046a;
            matrixArr2[i13].mapPoints(fArr);
            if (i13 == 0) {
                path.moveTo(fArr[z11], fArr[1]);
            } else {
                path.lineTo(fArr[z11], fArr[1]);
            }
            tVarArr[i13].b(matrixArr2[i13], path);
            if (dVar3 != null) {
                t tVar4 = tVarArr[i13];
                Matrix matrix = matrixArr2[i13];
                g gVar = (g) dVar3.f267b;
                BitSet bitSet = gVar.f17983d;
                tVar4.getClass();
                f12 = 0.0f;
                bitSet.set(i13, z11);
                s[] sVarArr = gVar.f17981b;
                tVar4.a(tVar4.f18050e);
                sVarArr[i13] = new m(new ArrayList(tVar4.f18052g), new Matrix(matrix));
            } else {
                f12 = 0.0f;
            }
            Path path4 = (Path) this.f18023h;
            t tVar5 = (t) this.f18025j;
            int i14 = i13 + 1;
            int i15 = i14 % 4;
            t tVar6 = tVarArr[i13];
            fArr[0] = tVar6.f18047b;
            fArr[1] = tVar6.f18048c;
            matrixArr2[i13].mapPoints(fArr);
            float[] fArr2 = (float[]) this.f18027l;
            t tVar7 = tVarArr[i15];
            tVar7.getClass();
            fArr2[0] = f12;
            fArr2[1] = tVar7.f18046a;
            matrixArr2[i15].mapPoints(fArr2);
            t[] tVarArr2 = tVarArr;
            Matrix[] matrixArr5 = matrixArr2;
            float fMax = Math.max(((float) Math.hypot(fArr[0] - fArr2[0], fArr[1] - fArr2[1])) - 0.001f, f12);
            t tVar8 = tVarArr2[i13];
            fArr[0] = tVar8.f18047b;
            fArr[1] = tVar8.f18048c;
            matrixArr5[i13].mapPoints(fArr);
            if (i13 == 1 || i13 == 3) {
                rectF.centerX();
                float f14 = fArr[0];
            } else {
                rectF.centerY();
                float f15 = fArr[1];
            }
            tVar5.d(0.0f, 270.0f, 0.0f);
            (i13 != 1 ? i13 != 2 ? i13 != 3 ? jVar.f18012j : jVar.f18011i : jVar.f18014l : jVar.f18013k).getClass();
            tVar5.c(fMax, 0.0f);
            path4.reset();
            tVar5.b(matrixArr4[i13], path4);
            if (this.f18016a && (f(i13, path4) || f(i15, path4))) {
                path4.op(path4, path3, Path.Op.DIFFERENCE);
                fArr[0] = 0.0f;
                fArr[1] = tVar5.f18046a;
                matrixArr4[i13].mapPoints(fArr);
                path2.moveTo(fArr[0], fArr[1]);
                tVar5.b(matrixArr4[i13], path2);
            } else {
                tVar5.b(matrixArr4[i13], path);
            }
            if (dVar != null) {
                Matrix matrix2 = matrixArr4[i13];
                dVar2 = dVar;
                g gVar2 = (g) dVar2.f267b;
                z12 = false;
                gVar2.f17983d.set(i13 + 4, false);
                s[] sVarArr2 = gVar2.f17982c;
                tVar5.a(tVar5.f18050e);
                sVarArr2[i13] = new m(new ArrayList(tVar5.f18052g), new Matrix(matrix2));
            } else {
                dVar2 = dVar;
                z12 = false;
            }
            z11 = z12;
            dVar3 = dVar2;
            i13 = i14;
            tVarArr = tVarArr2;
            matrixArr2 = matrixArr5;
        }
        path.close();
        path2.close();
        if (path2.isEmpty()) {
            return;
        }
        path.op(path2, Path.Op.UNION);
    }

    public z1 c() {
        ArrayList arrayList = (ArrayList) this.f18018c;
        if (arrayList.isEmpty()) {
            return z1.f55127a;
        }
        int iO = 0;
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            d1 d1Var = (d1) arrayList.get(i5);
            d1Var.f54743d = iO;
            iO += d1Var.f54740a.o.f57534b.o();
        }
        return new p1(arrayList, (v0) this.f18026k);
    }

    public void d() {
        Iterator it = ((HashSet) this.f18025j).iterator();
        while (it.hasNext()) {
            d1 d1Var = (d1) it.next();
            if (d1Var.f54742c.isEmpty()) {
                c1 c1Var = (c1) ((HashMap) this.f18024i).get(d1Var);
                if (c1Var != null) {
                    c1Var.f54733a.b(c1Var.f54734b);
                }
                it.remove();
            }
        }
    }

    public void e(d1 d1Var) {
        if (d1Var.f54744e && d1Var.f54742c.isEmpty()) {
            c1 c1Var = (c1) ((HashMap) this.f18024i).remove(d1Var);
            c1Var.getClass();
            tm.o oVar = c1Var.f54735c;
            gf.a aVar = c1Var.f54733a;
            aVar.n(c1Var.f54734b);
            aVar.q(oVar);
            aVar.p(oVar);
            ((HashSet) this.f18025j).remove(d1Var);
        }
    }

    public boolean f(int i5, Path path) {
        Path path2 = (Path) this.f18024i;
        path2.reset();
        ((t[]) this.f18017b)[i5].b(((Matrix[]) this.f18018c)[i5], path2);
        RectF rectF = new RectF();
        path.computeBounds(rectF, true);
        path2.computeBounds(rectF, true);
        path.op(path2, Path.Op.INTERSECT);
        path.computeBounds(rectF, true);
        return !rectF.isEmpty() || (rectF.width() > 1.0f && rectF.height() > 1.0f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [fe.b1, gf.x] */
    public void g(d1 d1Var) {
        gf.q qVar = d1Var.f54740a;
        ?? r12 = new x() { // from class: fe.b1
            @Override // gf.x
            public final void a(gf.a aVar, z1 z1Var) {
                ((h0) this.f54717a.f18021f).f54816h.c(22);
            }
        };
        tm.o oVar = new tm.o(this, d1Var);
        ((HashMap) this.f18024i).put(d1Var, new c1(qVar, r12, oVar));
        int i5 = v.f94376a;
        Looper looperMyLooper = Looper.myLooper();
        if (looperMyLooper == null) {
            looperMyLooper = Looper.getMainLooper();
        }
        Handler handler = new Handler(looperMyLooper, null);
        qVar.getClass();
        a0 a0Var = qVar.f57446c;
        a0Var.getClass();
        CopyOnWriteArrayList copyOnWriteArrayList = a0Var.f57453c;
        z zVar = new z();
        zVar.f57669a = handler;
        zVar.f57670b = oVar;
        copyOnWriteArrayList.add(zVar);
        Looper looperMyLooper2 = Looper.myLooper();
        if (looperMyLooper2 == null) {
            looperMyLooper2 = Looper.getMainLooper();
        }
        new Handler(looperMyLooper2, null);
        a0 a0Var2 = qVar.f57447d;
        a0Var2.getClass();
        CopyOnWriteArrayList copyOnWriteArrayList2 = a0Var2.f57453c;
        je.a aVar = new je.a();
        aVar.f69482a = oVar;
        copyOnWriteArrayList2.add(aVar);
        qVar.j(r12, (g0) this.f18027l, (ge.m) this.f18017b);
    }

    public void h(gf.t tVar) {
        IdentityHashMap identityHashMap = (IdentityHashMap) this.f18019d;
        d1 d1Var = (d1) identityHashMap.remove(tVar);
        d1Var.getClass();
        d1Var.f54740a.m(tVar);
        d1Var.f54742c.remove(((gf.n) tVar).f57567a);
        if (!identityHashMap.isEmpty()) {
            d();
        }
        e(d1Var);
    }

    public void i(int i5, int i11) {
        ArrayList arrayList = (ArrayList) this.f18018c;
        for (int i12 = i11 - 1; i12 >= i5; i12--) {
            d1 d1Var = (d1) arrayList.remove(i12);
            ((HashMap) this.f18020e).remove(d1Var.f54741b);
            int i13 = -d1Var.f54740a.o.f57534b.o();
            for (int i14 = i12; i14 < arrayList.size(); i14++) {
                ((d1) arrayList.get(i14)).f54743d += i13;
            }
            d1Var.f54744e = true;
            if (this.f18016a) {
                e(d1Var);
            }
        }
    }

    public l(h0 h0Var, ge.f fVar, Handler handler, ge.m mVar) {
        this.f18017b = mVar;
        this.f18021f = h0Var;
        this.f18026k = new v0();
        this.f18019d = new IdentityHashMap();
        this.f18020e = new HashMap();
        this.f18018c = new ArrayList();
        a0 a0Var = new a0(0);
        this.f18022g = a0Var;
        a0 a0Var2 = new a0(1);
        this.f18023h = a0Var2;
        this.f18024i = new HashMap();
        this.f18025j = new HashSet();
        fVar.getClass();
        z zVar = new z();
        zVar.f57669a = handler;
        zVar.f57670b = fVar;
        a0Var.f57453c.add(zVar);
        je.a aVar = new je.a();
        aVar.f69482a = fVar;
        a0Var2.f57453c.add(aVar);
    }
}
