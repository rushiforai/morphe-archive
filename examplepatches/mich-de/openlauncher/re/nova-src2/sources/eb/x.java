package eb;

import android.view.View;

/* loaded from: classes2.dex */
public final class x extends View {

    /* renamed from: a, reason: collision with root package name */
    public a f52527a;

    /* renamed from: b, reason: collision with root package name */
    public int f52528b;

    @Override // android.view.View
    public final void offsetTopAndBottom(int i5) {
        super.offsetTopAndBottom(i5);
        a aVar = this.f52527a;
        if (aVar != null) {
            aVar.run();
        }
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        a aVar = this.f52527a;
        if (aVar != null) {
            aVar.run();
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, View.MeasureSpec.makeMeasureSpec(this.f52528b, 1073741824));
    }

    @Override // android.view.View
    public final void setTranslationY(float f11) {
        super.setTranslationY(f11);
        a aVar = this.f52527a;
        if (aVar != null) {
            aVar.run();
        }
    }
}
