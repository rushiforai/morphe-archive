package aa;

import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;

/* loaded from: classes.dex */
public class k {

    /* renamed from: a, reason: collision with root package name */
    public final float f598a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f599b;

    /* renamed from: c, reason: collision with root package name */
    public final Bitmap f600c;

    /* renamed from: d, reason: collision with root package name */
    public final float f601d;

    public k(Path path, int i5) {
        this.f599b = new Paint(3);
        int i11 = i5 <= 0 ? 1 : i5;
        l0 l0Var = new l0();
        l0Var.f608b = 88;
        l0Var.d(i11);
        this.f600c = l0Var.a(i11, i11, i11 / 2.0f, 0, null);
        this.f598a = l0Var.f612f;
        this.f601d = (-r8.getHeight()) * 0.5f;
        float f11 = 100;
        a(path, f11, -1.0f);
        a(path, f11, 1.0f);
    }

    public static void a(Path path, float f11, float f12) {
        float f13 = f11 / 2.0f;
        float f14 = (f12 * f13) + f13;
        Path path2 = new Path();
        path2.moveTo(f13, f13);
        path2.lineTo((f12 * 1.0f) + f14, 0.0f);
        path2.lineTo(f14, -1.0f);
        path2.close();
        path2.op(path, Path.Op.INTERSECT);
        float[] fArr = new float[2];
        new PathMeasure(path2, false).getPosTan(0.0f, fArr, null);
        fArr[0] = fArr[0] / f11;
        fArr[1] = fArr[1] / f11;
    }

    public k(int i5, Path path) {
        this(path, Math.round(i5 * 0.228f));
    }
}
