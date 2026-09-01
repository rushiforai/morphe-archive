package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z4b implements qm3, l59, xf5, nn0, v72 {
    public final Matrix a = new Matrix();
    public final Path b = new Path();
    public final rc7 c;
    public final tn0 d;
    public final boolean e;
    public final zu1 f;
    public final zu1 g;
    public final mrd h;
    public f82 i;

    public z4b(rc7 rc7Var, tn0 tn0Var, exa exaVar) {
        this.c = rc7Var;
        this.d = tn0Var;
        this.e = exaVar.c;
        zu1 zu1VarW = exaVar.b.w();
        this.f = zu1VarW;
        tn0Var.d(zu1VarW);
        zu1VarW.a(this);
        zu1 zu1VarW2 = ((qu) exaVar.d).w();
        this.g = zu1VarW2;
        tn0Var.d(zu1VarW2);
        zu1VarW2.a(this);
        vu vuVar = (vu) exaVar.e;
        vuVar.getClass();
        mrd mrdVar = new mrd(vuVar);
        this.h = mrdVar;
        mrdVar.a(tn0Var);
        mrdVar.b(this);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.c.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        this.i.b(list, list2);
    }

    @Override // defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        this.i.c(rectF, matrix, z);
    }

    @Override // defpackage.xf5
    public final void d(ListIterator listIterator) {
        if (this.i != null) {
            return;
        }
        while (listIterator.hasPrevious() && listIterator.previous() != this) {
        }
        ArrayList arrayList = new ArrayList();
        while (listIterator.hasPrevious()) {
            arrayList.add((v72) listIterator.previous());
            listIterator.remove();
        }
        Collections.reverse(arrayList);
        this.i = new f82(this.c, this.d, this.e, arrayList, null);
    }

    @Override // defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        float fFloatValue = ((Float) this.f.d()).floatValue();
        float fFloatValue2 = ((Float) this.g.d()).floatValue();
        mrd mrdVar = this.h;
        float fFloatValue3 = ((Float) mrdVar.v.d()).floatValue() / 100.0f;
        float fFloatValue4 = ((Float) mrdVar.w.d()).floatValue() / 100.0f;
        for (int i2 = ((int) fFloatValue) - 1; i2 >= 0; i2--) {
            Matrix matrix2 = this.a;
            matrix2.set(matrix);
            float f = i2;
            matrix2.preConcat(mrdVar.e(f + fFloatValue2));
            this.i.e(canvas, matrix2, (int) (a18.e(fFloatValue3, fFloatValue4, f / fFloatValue) * i), bn3Var);
        }
    }

    @Override // defpackage.l59
    public final Path h() {
        Path pathH = this.i.h();
        Path path = this.b;
        path.reset();
        float fFloatValue = ((Float) this.f.d()).floatValue();
        float fFloatValue2 = ((Float) this.g.d()).floatValue();
        for (int i = ((int) fFloatValue) - 1; i >= 0; i--) {
            Matrix matrixE = this.h.e(i + fFloatValue2);
            Matrix matrix = this.a;
            matrix.set(matrixE);
            path.addPath(pathH, matrix);
        }
        return path;
    }
}
