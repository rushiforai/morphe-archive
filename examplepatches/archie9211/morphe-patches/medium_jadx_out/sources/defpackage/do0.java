package defpackage;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.animation.ValueAnimator;
import android.os.Handler;
import android.os.Message;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import com.google.android.material.snackbar.BaseTransientBottomBar$Behavior;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class do0 implements Handler.Callback {
    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
        int i = message.what;
        if (i == 0) {
            jo0 jo0Var = (jo0) message.obj;
            io0 io0Var = jo0Var.i;
            if (io0Var.getParent() == null) {
                ViewGroup.LayoutParams layoutParams = io0Var.getLayoutParams();
                if (layoutParams instanceof ga2) {
                    ga2 ga2Var = (ga2) layoutParams;
                    BaseTransientBottomBar$Behavior baseTransientBottomBar$Behavior = new BaseTransientBottomBar$Behavior();
                    zg7 zg7Var = baseTransientBottomBar$Behavior.i;
                    zg7Var.getClass();
                    zg7Var.b = jo0Var.t;
                    baseTransientBottomBar$Behavior.b = new md5(7, jo0Var);
                    da2 da2Var = ga2Var.a;
                    if (da2Var != baseTransientBottomBar$Behavior) {
                        if (da2Var != null) {
                            da2Var.i();
                        }
                        ga2Var.a = baseTransientBottomBar$Behavior;
                        ga2Var.b = true;
                    }
                    ga2Var.g = 80;
                }
                ViewGroup viewGroup = jo0Var.g;
                io0Var.k = true;
                viewGroup.addView(io0Var);
                io0Var.k = false;
                jo0Var.f();
                io0Var.setVisibility(4);
            }
            if (io0Var.isLaidOut()) {
                jo0Var.e();
                return true;
            }
            jo0Var.r = true;
            return true;
        }
        if (i != 1) {
            return false;
        }
        jo0 jo0Var2 = (jo0) message.obj;
        int i2 = message.arg1;
        io0 io0Var2 = jo0Var2.i;
        AccessibilityManager accessibilityManager = jo0Var2.s;
        if ((accessibilityManager != null && ((enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(1)) == null || !enabledAccessibilityServiceList.isEmpty())) || io0Var2.getVisibility() != 0) {
            jo0Var2.c();
            return true;
        }
        if (io0Var2.getAnimationMode() == 1) {
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(1.0f, 0.0f);
            valueAnimatorOfFloat.setInterpolator(jo0Var2.d);
            valueAnimatorOfFloat.addUpdateListener(new co0(jo0Var2, 0));
            valueAnimatorOfFloat.setDuration(jo0Var2.b);
            valueAnimatorOfFloat.addListener(new bo0(jo0Var2, i2, 0));
            valueAnimatorOfFloat.start();
            return true;
        }
        ValueAnimator valueAnimator = new ValueAnimator();
        io0 io0Var3 = jo0Var2.i;
        int height = io0Var3.getHeight();
        ViewGroup.LayoutParams layoutParams2 = io0Var3.getLayoutParams();
        if (layoutParams2 instanceof ViewGroup.MarginLayoutParams) {
            height += ((ViewGroup.MarginLayoutParams) layoutParams2).bottomMargin;
        }
        valueAnimator.setIntValues(0, height);
        valueAnimator.setInterpolator(jo0Var2.e);
        valueAnimator.setDuration(jo0Var2.c);
        valueAnimator.addListener(new bo0(jo0Var2, i2, 2));
        valueAnimator.addUpdateListener(new co0(jo0Var2, 3));
        valueAnimator.start();
        return true;
    }
}
