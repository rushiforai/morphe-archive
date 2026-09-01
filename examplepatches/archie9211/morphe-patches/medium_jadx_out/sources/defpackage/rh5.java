package defpackage;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rh5 extends View {
    public boolean a;

    public rh5(Context context) {
        super(context);
        this.a = true;
        super.setVisibility(8);
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        setMeasuredDimension(0, 0);
    }

    public void setFilterRedundantCalls(boolean z) {
        this.a = z;
    }

    public void setGuidelineBegin(int i) {
        t52 t52Var = (t52) getLayoutParams();
        if (this.a && t52Var.a == i) {
            return;
        }
        t52Var.a = i;
        setLayoutParams(t52Var);
    }

    public void setGuidelineEnd(int i) {
        t52 t52Var = (t52) getLayoutParams();
        if (this.a && t52Var.b == i) {
            return;
        }
        t52Var.b = i;
        setLayoutParams(t52Var);
    }

    public void setGuidelinePercent(float f) {
        t52 t52Var = (t52) getLayoutParams();
        if (this.a && t52Var.c == f) {
            return;
        }
        t52Var.c = f;
        setLayoutParams(t52Var);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
    }

    @Override // android.view.View
    public void setVisibility(int i) {
    }
}
