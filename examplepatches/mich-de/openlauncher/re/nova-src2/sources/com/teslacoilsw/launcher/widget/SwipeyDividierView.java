package com.teslacoilsw.launcher.widget;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;

/* loaded from: classes4.dex */
public class SwipeyDividierView extends View {

    /* renamed from: a, reason: collision with root package name */
    public final int f46489a;

    /* renamed from: b, reason: collision with root package name */
    public final VelocityTracker f46490b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f46491c;

    /* renamed from: d, reason: collision with root package name */
    public float f46492d;

    /* renamed from: e, reason: collision with root package name */
    public final int f46493e;

    /* renamed from: f, reason: collision with root package name */
    public final float f46494f;

    public SwipeyDividierView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46489a = 2000;
        this.f46491c = false;
        this.f46490b = VelocityTracker.obtain();
        this.f46493e = ViewConfiguration.get(context).getScaledPagingTouchSlop();
        this.f46494f = context.getResources().getDisplayMetrics().density;
        if (getBackground() == null) {
            setBackgroundResource(2131232328);
        }
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0062, code lost:
    
        if (r0 != 4) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0014, code lost:
    
        if (r0 != 3) goto L24;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11 = this.f46491c;
        VelocityTracker velocityTracker = this.f46490b;
        if (!z11) {
            int action = motionEvent.getAction();
            if (action == 0) {
                this.f46491c = false;
                velocityTracker.clear();
                velocityTracker.addMovement(motionEvent);
                this.f46492d = motionEvent.getX();
                return true;
            }
            if (action != 1) {
                if (action == 2) {
                    velocityTracker.addMovement(motionEvent);
                    if (Math.abs(motionEvent.getX() - this.f46492d) > this.f46493e) {
                        this.f46491c = true;
                        this.f46492d = motionEvent.getX() - getTranslationX();
                        getParent().requestDisallowInterceptTouchEvent(true);
                        return true;
                    }
                }
            }
            this.f46491c = false;
            return true;
        }
        velocityTracker.addMovement(motionEvent);
        int action2 = motionEvent.getAction();
        if (action2 != 1) {
            if (action2 != 2) {
                if (action2 != 3) {
                }
            }
            float x11 = motionEvent.getX() - this.f46492d;
            float fAbs = Math.abs(x11);
            float measuredWidth = getMeasuredWidth();
            float fSin = 0.15f * measuredWidth;
            if (fAbs < measuredWidth) {
                fSin *= (float) Math.sin((x11 / measuredWidth) * 1.5707963267948966d);
            } else if (x11 <= 0.0f) {
                fSin = -fSin;
            }
            setTranslationX(fSin);
            return true;
        }
        this.f46491c = false;
        velocityTracker.computeCurrentVelocity(1000, this.f46489a * this.f46494f);
        velocityTracker.getXVelocity();
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, "translationX", 0.0f);
        objectAnimatorOfFloat.setDuration(PerAppFeatureCatalog.MAX_TOOLS);
        objectAnimatorOfFloat.start();
        return true;
        return true;
    }
}
