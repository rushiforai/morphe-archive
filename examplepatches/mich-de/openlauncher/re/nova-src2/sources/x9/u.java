package x9;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import com.android.launcher3.dragndrop.DragLayer;
import o9.j4;
import o9.l2;
import o9.n1;

/* loaded from: classes2.dex */
public final class u extends n implements ra.e {
    public u(n1 n1Var, View view, int i5, int i11, int i12, int i13, float f11, float f12, float f13) {
        super(n1Var, view, i5, i11, i12, i13, f11, f12, f13);
    }

    public final void e(int i5, int i11, j4 j4Var, int i12) {
        int i13 = i5 - this.f95676h;
        int[] iArr = this.f95680l;
        iArr[0] = i13;
        iArr[1] = i11 - this.f95677i;
        DragLayer dragLayer = ((n1) this.o).P;
        dragLayer.getClass();
        int i14 = iArr[0];
        int i15 = iArr[1];
        float f11 = this.f95679k;
        dragLayer.p(this, i14, i15, 1.0f, f11, f11, j4Var, 0, i12, null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ((n1) this.o).M.b(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ((n1) this.o).M.o(this);
    }

    @Override // ra.e
    public final void t(ra.a aVar) {
        l2 l2Var = (l2) aVar;
        setVisibility((l2Var == l2.f79974m || l2Var == l2.n) ? 0 : 4);
    }

    public u(n1 n1Var, Drawable drawable, int i5, int i11, float f11, float f12, float f13) {
        ImageView imageView = new ImageView(n1Var);
        imageView.setImageDrawable(drawable);
        super(n1Var, imageView, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), i5, i11, f11, f12, f13);
    }
}
