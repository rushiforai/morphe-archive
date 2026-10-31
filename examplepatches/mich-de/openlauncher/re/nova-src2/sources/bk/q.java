package bk;

import android.graphics.Matrix;
import android.graphics.Path;

/* loaded from: classes3.dex */
public final class q extends r {

    /* renamed from: b, reason: collision with root package name */
    public float f18041b;

    /* renamed from: c, reason: collision with root package name */
    public float f18042c;

    @Override // bk.r
    public final void a(Matrix matrix, Path path) {
        Matrix matrix2 = this.f18043a;
        matrix.invert(matrix2);
        path.transform(matrix2);
        path.lineTo(this.f18041b, this.f18042c);
        path.transform(matrix);
    }
}
