package cj;

import android.graphics.Matrix;
import android.util.Property;
import android.widget.ImageView;

/* loaded from: classes3.dex */
public final class d extends Property {

    /* renamed from: a, reason: collision with root package name */
    public final Matrix f19958a;

    public d() {
        super(Matrix.class, "imageMatrixProperty");
        this.f19958a = new Matrix();
    }

    @Override // android.util.Property
    public final Object get(Object obj) {
        Matrix imageMatrix = ((ImageView) obj).getImageMatrix();
        Matrix matrix = this.f19958a;
        matrix.set(imageMatrix);
        return matrix;
    }

    @Override // android.util.Property
    public final void set(Object obj, Object obj2) {
        ((ImageView) obj).setImageMatrix((Matrix) obj2);
    }
}
