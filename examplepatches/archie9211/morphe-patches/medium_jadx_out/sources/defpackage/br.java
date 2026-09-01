package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class br {
    public final Path a;
    public RectF b;
    public float[] c;
    public Matrix d;

    public br(Path path) {
        this.a = path;
    }

    public final void a() {
        this.a.close();
    }

    public final zwa b() {
        RectF rectF = this.b;
        if (rectF == null) {
            rectF = new RectF();
            this.b = rectF;
        }
        this.a.computeBounds(rectF, true);
        return new zwa(rectF.left, rectF.top, rectF.right, rectF.bottom);
    }

    public final void c(float f, float f2) {
        this.a.lineTo(f, f2);
    }

    public final void d(float f, float f2) {
        this.a.moveTo(f, f2);
    }

    public final boolean e(br brVar, br brVar2, int i) {
        Path.Op op = i == 0 ? Path.Op.DIFFERENCE : i == 1 ? Path.Op.INTERSECT : i == 4 ? Path.Op.REVERSE_DIFFERENCE : i == 2 ? Path.Op.UNION : Path.Op.XOR;
        if (!(brVar instanceof br)) {
            ik4.k("Unable to obtain android.graphics.Path");
            return false;
        }
        Path path = brVar.a;
        if (brVar2 instanceof br) {
            return this.a.op(path, brVar2.a, op);
        }
        ik4.k("Unable to obtain android.graphics.Path");
        return false;
    }

    public final void f() {
        this.a.reset();
    }

    public final void g(int i) {
        this.a.setFillType(i == 1 ? Path.FillType.EVEN_ODD : Path.FillType.WINDING);
    }

    public final void h(long j) {
        Matrix matrix = this.d;
        if (matrix == null) {
            this.d = new Matrix();
        } else {
            matrix.reset();
        }
        Matrix matrix2 = this.d;
        matrix2.getClass();
        matrix2.setTranslate(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)));
        Matrix matrix3 = this.d;
        matrix3.getClass();
        this.a.transform(matrix3);
    }
}
