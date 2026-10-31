package i2;

import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h implements n0 {

    /* renamed from: a, reason: collision with root package name */
    public final Path f61117a;

    /* renamed from: b, reason: collision with root package name */
    public RectF f61118b;

    /* renamed from: c, reason: collision with root package name */
    public float[] f61119c;

    /* renamed from: d, reason: collision with root package name */
    public Matrix f61120d;

    public h(Path path) {
        this.f61117a = path;
    }

    public final h2.c b() {
        if (this.f61118b == null) {
            this.f61118b = new RectF();
        }
        RectF rectF = this.f61118b;
        Intrinsics.d(rectF);
        this.f61117a.computeBounds(rectF, true);
        return new h2.c(rectF.left, rectF.top, rectF.right, rectF.bottom);
    }

    public final void c(float f11, float f12) {
        this.f61117a.lineTo(f11, f12);
    }

    public final boolean d(n0 n0Var, n0 n0Var2, int i5) {
        Path.Op op2 = ex.i.t(i5, 0) ? Path.Op.DIFFERENCE : ex.i.t(i5, 1) ? Path.Op.INTERSECT : ex.i.t(i5, 4) ? Path.Op.REVERSE_DIFFERENCE : ex.i.t(i5, 2) ? Path.Op.UNION : Path.Op.XOR;
        if (!(n0Var instanceof h)) {
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        }
        Path path = ((h) n0Var).f61117a;
        if (n0Var2 instanceof h) {
            return this.f61117a.op(path, ((h) n0Var2).f61117a, op2);
        }
        throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
    }

    public final void e() {
        this.f61117a.reset();
    }

    public final void f(int i5) {
        this.f61117a.setFillType(i5 == 1 ? Path.FillType.EVEN_ODD : Path.FillType.WINDING);
    }

    public final void g(long j11) {
        Matrix matrix = this.f61120d;
        if (matrix == null) {
            this.f61120d = new Matrix();
        } else {
            Intrinsics.d(matrix);
            matrix.reset();
        }
        Matrix matrix2 = this.f61120d;
        Intrinsics.d(matrix2);
        matrix2.setTranslate(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)));
        Matrix matrix3 = this.f61120d;
        Intrinsics.d(matrix3);
        this.f61117a.transform(matrix3);
    }
}
