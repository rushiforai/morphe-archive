package com.medium.android.common.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000*\b\b\u0000\u0010\u0002*\u00020\u00012\b\u0012\u0004\u0012\u00028\u00000\u0003B\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lcom/medium/android/common/ui/ReadPostTopAppBarBehavior;", "Landroid/view/View;", "V", "Lcom/medium/android/common/ui/ReadPostAppBarBehavior;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReadPostTopAppBarBehavior<V extends View> extends ReadPostAppBarBehavior<V> {
    public Float b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ReadPostTopAppBarBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        attributeSet.getClass();
    }

    @Override // defpackage.da2
    public final void n(CoordinatorLayout coordinatorLayout, View view, View view2, int i, int[] iArr, int i2) {
        view2.getClass();
        iArr.getClass();
        Float fValueOf = this.b;
        if (fValueOf == null) {
            fValueOf = Float.valueOf(view.getHeight());
            this.b = fValueOf;
        }
        float fFloatValue = fValueOf.floatValue();
        if (!v(view) || i <= 0) {
            view.setTranslationY(Math.min(0.0f, Math.max((-1.0f) * fFloatValue, view.getTranslationY() - i)));
        } else {
            view.setTranslationY(Math.min(0.0f, Math.max((-1.0f) * fFloatValue, view.getTranslationY() + i)));
        }
    }
}
