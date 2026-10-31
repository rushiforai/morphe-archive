package bk;

import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;

/* loaded from: classes3.dex */
public final class p extends r {

    /* renamed from: h, reason: collision with root package name */
    public static final RectF f18034h = new RectF();

    /* renamed from: b, reason: collision with root package name */
    public final float f18035b;

    /* renamed from: c, reason: collision with root package name */
    public final float f18036c;

    /* renamed from: d, reason: collision with root package name */
    public final float f18037d;

    /* renamed from: e, reason: collision with root package name */
    public final float f18038e;

    /* renamed from: f, reason: collision with root package name */
    public float f18039f;

    /* renamed from: g, reason: collision with root package name */
    public float f18040g;

    public p(float f11, float f12, float f13, float f14) {
        this.f18035b = f11;
        this.f18036c = f12;
        this.f18037d = f13;
        this.f18038e = f14;
    }

    @Override // bk.r
    public final void a(Matrix matrix, Path path) {
        Matrix matrix2 = this.f18043a;
        matrix.invert(matrix2);
        path.transform(matrix2);
        float f11 = this.f18037d;
        float f12 = this.f18038e;
        RectF rectF = f18034h;
        rectF.set(this.f18035b, this.f18036c, f11, f12);
        path.arcTo(rectF, this.f18039f, this.f18040g, false);
        path.transform(matrix);
    }
}
