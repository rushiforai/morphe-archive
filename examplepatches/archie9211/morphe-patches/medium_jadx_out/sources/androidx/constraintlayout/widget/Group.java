package androidx.constraintlayout.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewParent;
import defpackage.p52;
import defpackage.t52;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Group extends p52 {
    public Group(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.a = new int[32];
        this.g = new HashMap();
        this.c = context;
        super.g(attributeSet);
    }

    @Override // defpackage.p52
    public final void e(ConstraintLayout constraintLayout) {
        d(constraintLayout);
    }

    @Override // defpackage.p52
    public final void i() {
        t52 t52Var = (t52) getLayoutParams();
        t52Var.p0.S(0);
        t52Var.p0.N(0);
    }

    @Override // defpackage.p52, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ConstraintLayout)) {
            return;
        }
        d((ConstraintLayout) parent);
    }

    @Override // android.view.View
    public void setElevation(float f) {
        super.setElevation(f);
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ConstraintLayout)) {
            return;
        }
        d((ConstraintLayout) parent);
    }

    @Override // android.view.View
    public void setVisibility(int i) {
        super.setVisibility(i);
        ViewParent parent = getParent();
        if (parent == null || !(parent instanceof ConstraintLayout)) {
            return;
        }
        d((ConstraintLayout) parent);
    }

    public Group(Context context) {
        super(context);
    }
}
