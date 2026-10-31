package c3;

import android.graphics.Matrix;
import android.view.View;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class r1 implements q1 {

    /* renamed from: a, reason: collision with root package name */
    public final int[] f19415a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f19416b;

    public r1(ArrayList arrayList, ArrayList arrayList2) {
        int size = arrayList.size();
        this.f19415a = new int[size];
        this.f19416b = new float[size];
        for (int i5 = 0; i5 < size; i5++) {
            this.f19415a[i5] = ((Integer) arrayList.get(i5)).intValue();
            this.f19416b[i5] = ((Float) arrayList2.get(i5)).floatValue();
        }
    }

    @Override // c3.q1
    public void a(View view, float[] fArr) {
        i2.h0.d(fArr);
        b(view, fArr);
    }

    public void b(View view, float[] fArr) {
        Object parent = view.getParent();
        boolean z11 = parent instanceof View;
        float[] fArr2 = this.f19416b;
        if (z11) {
            b((View) parent, fArr);
            i2.h0.d(fArr2);
            i2.h0.f(fArr2, -view.getScrollX(), -view.getScrollY());
            t0.d(fArr, fArr2);
            float left = view.getLeft();
            float top = view.getTop();
            i2.h0.d(fArr2);
            i2.h0.f(fArr2, left, top);
            t0.d(fArr, fArr2);
        } else {
            int[] iArr = this.f19415a;
            view.getLocationInWindow(iArr);
            i2.h0.d(fArr2);
            i2.h0.f(fArr2, -view.getScrollX(), -view.getScrollY());
            t0.d(fArr, fArr2);
            float f11 = iArr[0];
            float f12 = iArr[1];
            i2.h0.d(fArr2);
            i2.h0.f(fArr2, f11, f12);
            t0.d(fArr, fArr2);
        }
        Matrix matrix = view.getMatrix();
        if (matrix.isIdentity()) {
            return;
        }
        i2.r0.o(matrix, fArr2);
        t0.d(fArr, fArr2);
    }

    public r1(int i5, int i11) {
        this.f19415a = new int[]{i5, i11};
        this.f19416b = new float[]{0.0f, 1.0f};
    }

    public r1(int i5, int i11, int i12) {
        this.f19415a = new int[]{i5, i11, i12};
        this.f19416b = new float[]{0.0f, 0.5f, 1.0f};
    }

    public r1(float[] fArr) {
        this.f19416b = fArr;
        this.f19415a = new int[2];
    }
}
