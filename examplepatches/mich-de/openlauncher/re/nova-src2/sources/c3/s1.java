package c3;

import android.graphics.Matrix;
import android.view.View;
import android.view.ViewParent;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class s1 implements q1 {

    /* renamed from: a, reason: collision with root package name */
    public final Matrix f19420a = new Matrix();

    /* renamed from: b, reason: collision with root package name */
    public final int[] f19421b = new int[2];

    @Override // c3.q1
    public void a(@NotNull View view, @NotNull float[] fArr) {
        Matrix matrix = this.f19420a;
        matrix.reset();
        view.transformMatrixToGlobal(matrix);
        ViewParent parent = view.getParent();
        while (parent instanceof View) {
            view = parent;
            parent = view.getParent();
        }
        int[] iArr = this.f19421b;
        view.getLocationOnScreen(iArr);
        int i5 = iArr[0];
        int i11 = iArr[1];
        view.getLocationInWindow(iArr);
        matrix.postTranslate(iArr[0] - i5, iArr[1] - i11);
        i2.r0.o(matrix, fArr);
    }
}
