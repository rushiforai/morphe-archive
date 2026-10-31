package com.google.android.material.transformation;

import aa.i0;
import android.animation.AnimatorSet;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

@Deprecated
/* loaded from: classes3.dex */
public abstract class ExpandableTransformationBehavior extends ExpandableBehavior {

    /* renamed from: b, reason: collision with root package name */
    public AnimatorSet f34533b;

    public ExpandableTransformationBehavior() {
    }

    @Override // com.google.android.material.transformation.ExpandableBehavior
    public void w(View view, View view2, boolean z11, boolean z12) {
        AnimatorSet animatorSet = this.f34533b;
        boolean z13 = animatorSet != null;
        if (z13) {
            animatorSet.cancel();
        }
        AnimatorSet animatorSetX = x(view, view2, z11, z13);
        this.f34533b = animatorSetX;
        animatorSetX.addListener(new i0(this, 9));
        this.f34533b.start();
        if (z12) {
            return;
        }
        this.f34533b.end();
    }

    public abstract AnimatorSet x(View view, View view2, boolean z11, boolean z12);

    public ExpandableTransformationBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }
}
