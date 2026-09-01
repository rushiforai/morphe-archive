package defpackage;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f82 implements qm3, l59, nn0 {
    public final ad a;
    public final RectF b;
    public final hp8 c;
    public final Matrix d;
    public final Path e;
    public final RectF f;
    public final boolean g;
    public final ArrayList h;
    public final rc7 i;
    public ArrayList j;
    public final mrd k;

    public f82(rc7 rc7Var, tn0 tn0Var, boolean z, ArrayList arrayList, vu vuVar) {
        this.a = new ad(10, (byte) 0);
        this.b = new RectF();
        this.c = new hp8();
        this.d = new Matrix();
        this.e = new Path();
        this.f = new RectF();
        this.i = rc7Var;
        this.g = z;
        this.h = arrayList;
        if (vuVar != null) {
            mrd mrdVar = new mrd(vuVar);
            this.k = mrdVar;
            mrdVar.a(tn0Var);
            mrdVar.b(this);
        }
        ArrayList arrayList2 = new ArrayList();
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            v72 v72Var = (v72) arrayList.get(size);
            if (v72Var instanceof xf5) {
                arrayList2.add((xf5) v72Var);
            }
        }
        for (int size2 = arrayList2.size() - 1; size2 >= 0; size2--) {
            ((xf5) arrayList2.get(size2)).d(arrayList.listIterator(arrayList.size()));
        }
    }

    @Override // defpackage.nn0
    public final void a() {
        this.i.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        int size = list.size();
        ArrayList arrayList = this.h;
        ArrayList arrayList2 = new ArrayList(arrayList.size() + size);
        arrayList2.addAll(list);
        for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
            v72 v72Var = (v72) arrayList.get(size2);
            v72Var.b(arrayList2, arrayList.subList(0, size2));
            arrayList2.add(v72Var);
        }
    }

    @Override // defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        Matrix matrix2 = this.d;
        matrix2.set(matrix);
        mrd mrdVar = this.k;
        if (mrdVar != null) {
            matrix2.preConcat(mrdVar.d());
        }
        RectF rectF2 = this.f;
        rectF2.set(0.0f, 0.0f, 0.0f, 0.0f);
        ArrayList arrayList = this.h;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            v72 v72Var = (v72) arrayList.get(size);
            if (v72Var instanceof qm3) {
                ((qm3) v72Var).c(rectF2, matrix2, z);
                rectF.union(rectF2);
            }
        }
    }

    public final List d() {
        if (this.j == null) {
            this.j = new ArrayList();
            int i = 0;
            while (true) {
                ArrayList arrayList = this.h;
                if (i >= arrayList.size()) {
                    break;
                }
                v72 v72Var = (v72) arrayList.get(i);
                if (v72Var instanceof l59) {
                    this.j.add((l59) v72Var);
                }
                i++;
            }
        }
        return this.j;
    }

    @Override // defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        if (this.g) {
            return;
        }
        Matrix matrix2 = this.d;
        matrix2.set(matrix);
        mrd mrdVar = this.k;
        if (mrdVar != null) {
            matrix2.preConcat(mrdVar.d());
            i = (int) (((((mrdVar.p == null ? 100 : ((Integer) r1.d()).intValue()) / 100.0f) * i) / 255.0f) * 255.0f);
        }
        rc7 rc7Var = this.i;
        boolean z = (rc7Var.p && f() && i != 255) || (bn3Var != null && rc7Var.q && f());
        int i2 = z ? 255 : i;
        hp8 hp8Var = this.c;
        if (z) {
            RectF rectF = this.b;
            rectF.set(0.0f, 0.0f, 0.0f, 0.0f);
            c(rectF, matrix, true);
            ad adVar = this.a;
            adVar.b = i;
            if (bn3Var != null) {
                if (Color.alpha(bn3Var.d) > 0) {
                    adVar.c = bn3Var;
                } else {
                    adVar.c = null;
                }
                bn3Var = null;
            } else {
                adVar.c = null;
            }
            canvas = hp8Var.e(canvas, rectF, adVar);
        } else if (bn3Var != null) {
            bn3 bn3Var2 = new bn3(bn3Var);
            bn3Var2.b(i2);
            bn3Var = bn3Var2;
        }
        ArrayList arrayList = this.h;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            Object obj = arrayList.get(size);
            if (obj instanceof qm3) {
                ((qm3) obj).e(canvas, matrix2, i2, bn3Var);
            }
        }
        if (z) {
            hp8Var.c();
        }
    }

    public final boolean f() {
        int i = 0;
        int i2 = 0;
        while (true) {
            ArrayList arrayList = this.h;
            if (i >= arrayList.size()) {
                return false;
            }
            if ((arrayList.get(i) instanceof qm3) && (i2 = i2 + 1) >= 2) {
                return true;
            }
            i++;
        }
    }

    @Override // defpackage.l59
    public final Path h() {
        Matrix matrix = this.d;
        matrix.reset();
        mrd mrdVar = this.k;
        if (mrdVar != null) {
            matrix.set(mrdVar.d());
        }
        Path path = this.e;
        path.reset();
        if (!this.g) {
            ArrayList arrayList = this.h;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                v72 v72Var = (v72) arrayList.get(size);
                if (v72Var instanceof l59) {
                    path.addPath(((l59) v72Var).h(), matrix);
                }
            }
        }
        return path;
    }

    public f82(rc7 rc7Var, tn0 tn0Var, x3c x3cVar, bc7 bc7Var) {
        vu vuVar;
        String str = x3cVar.a;
        boolean z = x3cVar.c;
        List list = x3cVar.b;
        ArrayList arrayList = new ArrayList(list.size());
        int i = 0;
        for (int i2 = 0; i2 < list.size(); i2++) {
            v72 v72VarA = ((r82) list.get(i2)).a(rc7Var, bc7Var, tn0Var);
            if (v72VarA != null) {
                arrayList.add(v72VarA);
            }
        }
        while (true) {
            if (i >= list.size()) {
                vuVar = null;
                break;
            }
            r82 r82Var = (r82) list.get(i);
            if (r82Var instanceof vu) {
                vuVar = (vu) r82Var;
                break;
            }
            i++;
        }
        this(rc7Var, tn0Var, z, arrayList, vuVar);
    }
}
