package r;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RatingBar;

/* loaded from: classes2.dex */
public final class x extends RatingBar {

    /* renamed from: a, reason: collision with root package name */
    public final v f84910a;

    public x(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969867);
        c2.a(getContext(), this);
        v vVar = new v(this);
        this.f84910a = vVar;
        vVar.b(attributeSet, 2130969867);
    }

    @Override // android.widget.RatingBar, android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    public final synchronized void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        Bitmap bitmap = (Bitmap) this.f84910a.f84887c;
        if (bitmap != null) {
            setMeasuredDimension(View.resolveSizeAndState(bitmap.getWidth() * getNumStars(), i5, 0), getMeasuredHeight());
        }
    }
}
