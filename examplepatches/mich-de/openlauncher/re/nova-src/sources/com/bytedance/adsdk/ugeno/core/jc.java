package com.bytedance.adsdk.ugeno.core;

import android.animation.AnimatorSet;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.bytedance.adsdk.ugeno.core.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: dj, reason: collision with root package name */
    private View f22201dj;

    /* renamed from: lt, reason: collision with root package name */
    private int f22202lt;
    private int lud;
    private AnimatorSet sya = new AnimatorSet();

    /* renamed from: ul, reason: collision with root package name */
    private String f22203ul;
    Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f22204zb;

    public jc(View view, ycx ycxVar) {
        this.f22201dj = view;
        this.f22204zb = ycxVar;
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setAntiAlias(true);
    }

    public void zb() {
        AnimatorSet animatorSet = this.sya;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0133  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx() {
        ArrayList arrayList = new ArrayList();
        List<ycx.C0013ycx> listSya = this.f22204zb.sya();
        if (listSya == null || listSya.size() <= 0) {
            return;
        }
        for (ycx.C0013ycx c0013ycx : listSya) {
            if (c0013ycx != null) {
                ObjectAnimator objectAnimator = new ObjectAnimator();
                objectAnimator.setDuration(c0013ycx.ycx());
                if (TextUtils.equals(c0013ycx.lud(), "translateX")) {
                    objectAnimator.setPropertyName("translationX");
                } else if (TextUtils.equals(c0013ycx.lud(), "translateY")) {
                    objectAnimator.setPropertyName("translationY");
                } else {
                    objectAnimator.setPropertyName(c0013ycx.lud());
                }
                objectAnimator.setStartDelay(c0013ycx.dj());
                objectAnimator.setTarget(this.f22201dj);
                char c11 = 0;
                if (TextUtils.equals(c0013ycx.lud(), "backgroundColor")) {
                    objectAnimator.setIntValues((int) c0013ycx.lt(), (int) c0013ycx.ul());
                    c0013ycx.lt();
                    c0013ycx.ul();
                } else {
                    objectAnimator.setFloatValues(c0013ycx.lt(), c0013ycx.ul());
                }
                int iZb = (int) this.f22204zb.zb();
                if (iZb != 0) {
                    objectAnimator.setRepeatCount(iZb);
                } else {
                    objectAnimator.setRepeatCount((int) c0013ycx.zb());
                }
                if (TextUtils.equals(c0013ycx.lud(), "backgroundColor")) {
                    objectAnimator.setEvaluator(new ArgbEvaluator());
                }
                String strLt = this.f22204zb.lt();
                if (TextUtils.isEmpty(strLt)) {
                    strLt = c0013ycx.sya();
                }
                if (TextUtils.equals(strLt, "reverse")) {
                    objectAnimator.setRepeatMode(2);
                } else {
                    objectAnimator.setRepeatMode(1);
                }
                if (c0013ycx.fby() != null && c0013ycx.fby().length > 0) {
                    objectAnimator.setFloatValues(c0013ycx.fby());
                }
                if (TextUtils.equals(c0013ycx.lud(), "rotationX")) {
                    this.f22201dj.post(new Runnable() { // from class: com.bytedance.adsdk.ugeno.core.jc.1
                        @Override // java.lang.Runnable
                        public void run() {
                            jc.this.f22201dj.setPivotX(jc.this.f22201dj.getWidth() / 2.0f);
                            jc.this.f22201dj.setPivotY(jc.this.f22201dj.getHeight());
                        }
                    });
                }
                if (TextUtils.equals(c0013ycx.lud(), "ripple")) {
                    this.f22203ul = c0013ycx.jc();
                }
                String strJw = c0013ycx.jw();
                strJw.getClass();
                switch (strJw.hashCode()) {
                    case -1354466595:
                        if (!strJw.equals("accelerate")) {
                            c11 = 65535;
                            break;
                        }
                        break;
                    case -1263948740:
                        if (strJw.equals("decelerate")) {
                            c11 = 1;
                            break;
                        }
                        break;
                    case -1102672091:
                        if (strJw.equals("linear")) {
                            c11 = 2;
                            break;
                        }
                        break;
                    case 475910905:
                        if (strJw.equals("accelerateDecelerate")) {
                            c11 = 3;
                            break;
                        }
                        break;
                    case 1312628413:
                        if (strJw.equals("standard")) {
                            c11 = 4;
                            break;
                        }
                        break;
                }
                switch (c11) {
                    case 0:
                        objectAnimator.setInterpolator(new AccelerateInterpolator());
                        break;
                    case 1:
                        objectAnimator.setInterpolator(new DecelerateInterpolator());
                        break;
                    case 2:
                    case 4:
                        objectAnimator.setInterpolator(new LinearInterpolator());
                        break;
                    case 3:
                        objectAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
                        break;
                }
                arrayList.add(objectAnimator);
            }
        }
        if (this.f22204zb.dj() != 0) {
            this.sya.setDuration(this.f22204zb.dj());
        }
        this.sya.setStartDelay(this.f22204zb.lud());
        if (TextUtils.equals(this.f22204zb.ycx(), "sequentially")) {
            this.sya.playSequentially(arrayList);
        } else {
            this.sya.playTogether(arrayList);
        }
        this.sya.start();
    }

    public void ycx(Canvas canvas, IAnimation iAnimation) {
        try {
            if (iAnimation.getRipple() == 0.0f || TextUtils.isEmpty(this.f22203ul)) {
                return;
            }
            this.ycx.setColor(com.bytedance.adsdk.ugeno.fby.ycx.ycx(this.f22203ul));
            this.ycx.setAlpha(90);
            ((ViewGroup) this.f22201dj.getParent()).setClipChildren(true);
            canvas.drawCircle(this.lud, this.f22202lt, Math.min(r0, r2) * 2 * iAnimation.getRipple(), this.ycx);
        } catch (Throwable th2) {
            th2.getMessage();
        }
    }

    public void ycx(int i5, int i11) {
        this.lud = i5 / 2;
        this.f22202lt = i11 / 2;
    }
}
