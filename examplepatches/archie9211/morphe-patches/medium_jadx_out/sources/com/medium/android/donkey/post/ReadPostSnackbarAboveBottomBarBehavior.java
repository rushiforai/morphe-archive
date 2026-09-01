package com.medium.android.donkey.post;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.medium.android.common.ui.ReadPostBottomAppBarBehavior;
import com.medium.reader.R;
import defpackage.da2;
import defpackage.ga2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/medium/android/donkey/post/ReadPostSnackbarAboveBottomBarBehavior;", "Lda2;", "Landroid/view/View;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReadPostSnackbarAboveBottomBarBehavior extends da2 {
    public ReadPostSnackbarAboveBottomBarBehavior(Context context, AttributeSet attributeSet) {
        context.getClass();
        attributeSet.getClass();
    }

    @Override // defpackage.da2
    public final boolean f(CoordinatorLayout coordinatorLayout, View view, View view2) {
        return view2.getId() == R.id.bottom_action_bar;
    }

    @Override // defpackage.da2
    public final boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
        view2.getClass();
        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
        ga2 ga2Var = layoutParams instanceof ga2 ? (ga2) layoutParams : null;
        da2 da2Var = ga2Var != null ? ga2Var.a : null;
        ReadPostBottomAppBarBehavior readPostBottomAppBarBehavior = da2Var instanceof ReadPostBottomAppBarBehavior ? (ReadPostBottomAppBarBehavior) da2Var : null;
        float f = readPostBottomAppBarBehavior != null ? readPostBottomAppBarBehavior.b : 0.0f;
        ViewGroup.LayoutParams layoutParams2 = view2.getLayoutParams();
        int height = (int) ((view2.getHeight() - f) + ((layoutParams2 instanceof ga2 ? (ga2) layoutParams2 : null) != null ? ((ViewGroup.MarginLayoutParams) r0).bottomMargin : 0));
        if (height < 0) {
            height = 0;
        }
        ViewGroup.LayoutParams layoutParams3 = view.getLayoutParams();
        layoutParams3.getClass();
        ga2 ga2Var2 = (ga2) layoutParams3;
        if (((ViewGroup.MarginLayoutParams) ga2Var2).bottomMargin == height) {
            return false;
        }
        ((ViewGroup.MarginLayoutParams) ga2Var2).bottomMargin = height;
        view.setLayoutParams(ga2Var2);
        view.requestLayout();
        return true;
    }
}
