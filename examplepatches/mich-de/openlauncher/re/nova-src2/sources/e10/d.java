package e10;

import android.app.ActivityOptions;
import android.view.View;
import com.android.launcher3.views.FloatingIconView;
import kotlin.math.MathKt;

/* loaded from: classes.dex */
public final class d extends f {
    @Override // e10.f
    public final boolean d() {
        return true;
    }

    @Override // e10.f
    public final ActivityOptions g(o9.l lVar, View view, int i5, int i11, int i12, int i13) {
        if (view == null || !(view instanceof FloatingIconView)) {
            return ActivityOptions.makeScaleUpAnimation(view, i5, i11, i12, i13);
        }
        FloatingIconView floatingIconView = (FloatingIconView) view;
        return ActivityOptions.makeScaleUpAnimation(view, i5, i11, MathKt.b(floatingIconView.getScaleX() * i12), MathKt.b(floatingIconView.getScaleY() * i13));
    }
}
