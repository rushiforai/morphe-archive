package defpackage;

import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.Display;
import android.view.ViewGroup;
import android.view.WindowManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eo0 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ jo0 b;

    public /* synthetic */ eo0(jo0 jo0Var, int i) {
        this.a = i;
        this.b = jo0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Rect rect;
        int i = this.a;
        jo0 jo0Var = this.b;
        switch (i) {
            case 0:
                io0 io0Var = jo0Var.i;
                if (io0Var != null) {
                    WindowManager windowManager = (WindowManager) jo0Var.h.getSystemService("window");
                    if (Build.VERSION.SDK_INT >= 30) {
                        rect = u4.b(windowManager);
                    } else {
                        Display defaultDisplay = windowManager.getDefaultDisplay();
                        Point point = new Point();
                        defaultDisplay.getRealSize(point);
                        rect = new Rect();
                        rect.right = point.x;
                        rect.bottom = point.y;
                    }
                    int iHeight = rect.height();
                    int[] iArr = new int[2];
                    io0Var.getLocationInWindow(iArr);
                    int height = (iHeight - (io0Var.getHeight() + iArr[1])) + ((int) io0Var.getTranslationY());
                    int i2 = jo0Var.p;
                    if (height < i2) {
                        ViewGroup.LayoutParams layoutParams = io0Var.getLayoutParams();
                        if (!(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
                            Log.w(jo0.z, "Unable to apply gesture inset because layout params are not MarginLayoutParams");
                        } else {
                            int i3 = jo0Var.p;
                            jo0Var.q = i3;
                            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                            marginLayoutParams.bottomMargin = (i3 - height) + marginLayoutParams.bottomMargin;
                            io0Var.requestLayout();
                        }
                    } else {
                        jo0Var.q = i2;
                    }
                }
                break;
            case 1:
                jo0Var.c();
                break;
            default:
                io0 io0Var2 = jo0Var.i;
                if (io0Var2 != null) {
                    if (io0Var2.getParent() != null) {
                        io0Var2.setVisibility(0);
                    }
                    if (io0Var2.getAnimationMode() != 1) {
                        int height2 = io0Var2.getHeight();
                        ViewGroup.LayoutParams layoutParams2 = io0Var2.getLayoutParams();
                        if (layoutParams2 instanceof ViewGroup.MarginLayoutParams) {
                            height2 += ((ViewGroup.MarginLayoutParams) layoutParams2).bottomMargin;
                        }
                        io0Var2.setTranslationY(height2);
                        ValueAnimator valueAnimator = new ValueAnimator();
                        valueAnimator.setIntValues(height2, 0);
                        valueAnimator.setInterpolator(jo0Var.e);
                        valueAnimator.setDuration(jo0Var.c);
                        valueAnimator.addListener(new bo0(jo0Var, 1));
                        valueAnimator.addUpdateListener(new co0(jo0Var, 2));
                        valueAnimator.start();
                    } else {
                        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
                        valueAnimatorOfFloat.setInterpolator(jo0Var.d);
                        valueAnimatorOfFloat.addUpdateListener(new co0(jo0Var, 0));
                        ValueAnimator valueAnimatorOfFloat2 = ValueAnimator.ofFloat(0.8f, 1.0f);
                        valueAnimatorOfFloat2.setInterpolator(jo0Var.f);
                        valueAnimatorOfFloat2.addUpdateListener(new co0(jo0Var, 1));
                        AnimatorSet animatorSet = new AnimatorSet();
                        animatorSet.playTogether(valueAnimatorOfFloat, valueAnimatorOfFloat2);
                        animatorSet.setDuration(jo0Var.a);
                        animatorSet.addListener(new bo0(jo0Var, 3));
                        animatorSet.start();
                    }
                    break;
                }
                break;
        }
    }
}
