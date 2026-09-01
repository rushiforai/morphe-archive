package defpackage;

import android.graphics.Matrix;
import android.view.View;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s31 implements r31 {
    public final int[] a;
    public final float[] b;

    public s31(ArrayList arrayList, ArrayList arrayList2) {
        int size = arrayList.size();
        this.a = new int[size];
        this.b = new float[size];
        for (int i = 0; i < size; i++) {
            this.a[i] = ((Integer) arrayList.get(i)).intValue();
            this.b[i] = ((Float) arrayList2.get(i)).floatValue();
        }
    }

    @Override // defpackage.r31
    public void a(View view, float[] fArr) {
        pk7.d(fArr);
        b(view, fArr);
    }

    public void b(View view, float[] fArr) {
        Object parent = view.getParent();
        boolean z = parent instanceof View;
        float[] fArr2 = this.b;
        if (z) {
            b((View) parent, fArr);
            pk7.d(fArr2);
            pk7.h(fArr2, -view.getScrollX(), -view.getScrollY());
            bo.b0(fArr, fArr2);
            float left = view.getLeft();
            float top = view.getTop();
            pk7.d(fArr2);
            pk7.h(fArr2, left, top);
            bo.b0(fArr, fArr2);
        } else {
            int[] iArr = this.a;
            view.getLocationInWindow(iArr);
            pk7.d(fArr2);
            pk7.h(fArr2, -view.getScrollX(), -view.getScrollY());
            bo.b0(fArr, fArr2);
            float f = iArr[0];
            float f2 = iArr[1];
            pk7.d(fArr2);
            pk7.h(fArr2, f, f2);
            bo.b0(fArr, fArr2);
        }
        Matrix matrix = view.getMatrix();
        if (matrix.isIdentity()) {
            return;
        }
        t40.N(matrix, fArr2);
        bo.b0(fArr, fArr2);
    }

    public s31(int i, int i2) {
        this.a = new int[]{i, i2};
        this.b = new float[]{0.0f, 1.0f};
    }

    public s31(int i, int i2, int i3) {
        this.a = new int[]{i, i2, i3};
        this.b = new float[]{0.0f, 0.5f, 1.0f};
    }

    public s31(float[] fArr) {
        this.b = fArr;
        this.a = new int[2];
    }
}
