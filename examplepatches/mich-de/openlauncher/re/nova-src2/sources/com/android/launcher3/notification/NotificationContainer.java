package com.android.launcher3.notification;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import b00.b1;
import com.android.launcher3.popup.PopupContainerWithArrow;
import e10.n1;
import eb.b;
import ha.a;
import ha.c;
import java.util.ArrayList;
import s9.k;
import ua.h;
import ua.i;
import w20.e;

/* loaded from: classes2.dex */
public class NotificationContainer extends FrameLayout implements h {

    /* renamed from: i, reason: collision with root package name */
    public static final b f21176i = new b("notificationProgress", 1);

    /* renamed from: j, reason: collision with root package name */
    public static final Rect f21177j = new Rect();

    /* renamed from: a, reason: collision with root package name */
    public final i f21178a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f21179b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f21180c;

    /* renamed from: d, reason: collision with root package name */
    public final ObjectAnimator f21181d;

    /* renamed from: e, reason: collision with root package name */
    public float f21182e;

    /* renamed from: f, reason: collision with root package name */
    public final NotificationMainView f21183f;

    /* renamed from: g, reason: collision with root package name */
    public final NotificationMainView f21184g;

    /* renamed from: h, reason: collision with root package name */
    public PopupContainerWithArrow f21185h;

    public NotificationContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f21179b = new ArrayList();
        this.f21180c = false;
        this.f21182e = 0.0f;
        i iVar = new i(getContext(), this, i.f90767x);
        this.f21178a = iVar;
        iVar.f90770u = 3;
        iVar.o = false;
        this.f21181d = ObjectAnimator.ofFloat(this, f21176i, 0.0f);
        NotificationMainView notificationMainView = (NotificationMainView) View.inflate(getContext(), 2131624266, null);
        this.f21183f = notificationMainView;
        NotificationMainView notificationMainView2 = (NotificationMainView) View.inflate(getContext(), 2131624266, null);
        this.f21184g = notificationMainView2;
        notificationMainView2.setAlpha(0.0f);
        addView(notificationMainView2);
        addView(notificationMainView);
    }

    public final boolean a(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            int left = getLeft();
            int top = getTop();
            int right = getRight();
            int bottom = getBottom();
            Rect rect = f21177j;
            rect.set(left, top, right, bottom);
            boolean zContains = rect.contains((int) motionEvent.getX(), (int) motionEvent.getY());
            this.f21180c = !zContains;
            if (zContains) {
                this.f21185h.getParent().requestDisallowInterceptTouchEvent(true);
            }
        }
        if (this.f21180c || this.f21183f.f21186a == null) {
            return false;
        }
        i iVar = this.f21178a;
        iVar.g(motionEvent);
        return iVar.d();
    }

    public final void b(MotionEvent motionEvent) {
        if (this.f21180c || this.f21183f.f21186a == null) {
            return;
        }
        this.f21178a.g(motionEvent);
    }

    public final void c(PopupContainerWithArrow popupContainerWithArrow) {
        this.f21185h = popupContainerWithArrow;
        if (popupContainerWithArrow.L.f51700l) {
            setPadding(0, e.k(16), 0, 0);
            setBackground(new LayerDrawable(new Drawable[]{new ColorDrawable(this.f21185h.L.f51693e)}));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0025  */
    @Override // ua.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(float f11, float f12) {
        boolean z11;
        NotificationMainView notificationMainView = this.f21183f;
        float translationX = notificationMainView.getTranslationX();
        float width = getWidth();
        c cVar = notificationMainView.f21186a;
        float f13 = 0.0f;
        if (cVar == null || !cVar.f59572g) {
            z11 = false;
        } else {
            if (this.f21178a.e(f11, f12)) {
                f13 = f11 < 0.0f ? -width : width;
            } else {
                if (Math.abs(translationX) > width / 2.0f) {
                    if (translationX < 0.0f) {
                    }
                }
                z11 = false;
            }
            z11 = true;
        }
        long jA = ua.c.a(f11, (f13 - translationX) / width);
        ObjectAnimator objectAnimator = this.f21181d;
        objectAnimator.removeAllListeners();
        objectAnimator.setDuration(jA).setInterpolator(k.b(f11));
        objectAnimator.setFloatValues(translationX, f13);
        objectAnimator.addListener(new a(this, z11, notificationMainView));
        objectAnimator.start();
    }

    public final void e(int i5, AnimatorSet animatorSet) {
        NotificationMainView notificationMainView = this.f21183f;
        ValueAnimator valueAnimatorOfArgb = ValueAnimator.ofArgb(notificationMainView.f21187b, i5);
        valueAnimatorOfArgb.addUpdateListener(new b1(notificationMainView, 4));
        animatorSet.play(valueAnimatorOfArgb);
        NotificationMainView notificationMainView2 = this.f21184g;
        ValueAnimator valueAnimatorOfArgb2 = ValueAnimator.ofArgb(notificationMainView2.f21187b, i5);
        valueAnimatorOfArgb2.addUpdateListener(new b1(notificationMainView2, 4));
        animatorSet.play(valueAnimatorOfArgb2);
        n1 n1Var = this.f21185h.L;
        float f11 = n1Var.f51694f;
        if (n1Var.f51700l) {
            f11 = 0.0f;
        }
        notificationMainView.f21198m.setCornerRadius(f11);
        notificationMainView.setOutlineProvider(new ha.h(notificationMainView, f11, 1));
        notificationMainView2.f21198m.setCornerRadius(f11);
        notificationMainView2.setOutlineProvider(new ha.h(notificationMainView2, f11, 1));
    }

    public final void f(int i5) {
        String strValueOf;
        int i11;
        NotificationMainView notificationMainView = this.f21183f;
        notificationMainView.getClass();
        int i12 = 0;
        String strValueOf2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i5 <= 1) {
            i11 = 4;
            strValueOf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            strValueOf = String.valueOf(i5);
            i11 = 0;
        }
        notificationMainView.f21193h.setText(strValueOf);
        notificationMainView.f21193h.setVisibility(i11);
        int i13 = i5 - 1;
        NotificationMainView notificationMainView2 = this.f21184g;
        notificationMainView2.getClass();
        if (i13 <= 1) {
            i12 = 4;
        } else {
            strValueOf2 = String.valueOf(i13);
        }
        notificationMainView2.f21193h.setText(strValueOf2);
        notificationMainView2.f21193h.setVisibility(i12);
    }

    @Override // ua.h
    public final boolean g(float f11) {
        int iRound;
        NotificationMainView notificationMainView = this.f21183f;
        c cVar = notificationMainView.f21186a;
        if (cVar == null || !cVar.f59572g) {
            int width = getWidth();
            if (Float.compare(f11, 0.0f) == 0) {
                iRound = 0;
            } else {
                float f12 = width;
                float f13 = f11 / f12;
                float fAbs = f13 / Math.abs(f13);
                float fAbs2 = Math.abs(f13) - 1.0f;
                float fAbs3 = ((fAbs2 * fAbs2 * fAbs2) + 1.0f) * fAbs;
                if (Math.abs(fAbs3) >= 1.0f) {
                    fAbs3 /= Math.abs(fAbs3);
                }
                iRound = Math.round(fAbs3 * 0.07f * f12);
            }
            f11 = iRound;
        }
        float width2 = f11 / getWidth();
        notificationMainView.c(width2);
        NotificationMainView notificationMainView2 = this.f21184g;
        if (notificationMainView2.f21186a == null) {
            notificationMainView2.setAlpha(0.0f);
        } else {
            notificationMainView2.d(width2);
        }
        this.f21181d.cancel();
        return true;
    }

    @Override // ua.h
    public final void m(float f11, boolean z11) {
        this.f21185h.f71263u.setVisibility(4);
    }
}
