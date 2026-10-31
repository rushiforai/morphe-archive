package com.bytedance.adsdk.ugeno.ycx;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import com.bytedance.adsdk.ugeno.ycx.sya;
import com.bytedance.adsdk.ugeno.ycx.ycx.ycx;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends AnimatorListenerAdapter {

    /* renamed from: dj, reason: collision with root package name */
    private Context f22550dj;
    private String fby;

    /* renamed from: jw, reason: collision with root package name */
    private zb f22551jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f22552lt = 1;
    private int lud;
    private ValueAnimator sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.ycx.ycx.ycx f22553ul;
    private com.bytedance.adsdk.ugeno.zb.sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private sya f22554zb;

    public ycx(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, sya syaVar2) {
        this.ycx = syaVar;
        this.f22554zb = syaVar2;
        this.f22550dj = context;
    }

    public ValueAnimator dj() {
        String key;
        com.bytedance.adsdk.ugeno.ycx.zb.ycx syaVar;
        sya syaVar2 = this.f22554zb;
        if (syaVar2 == null || this.ycx == null) {
            return null;
        }
        Map<String, TreeMap<Float, String>> mapZb = syaVar2.zb();
        ArrayList arrayList = new ArrayList();
        if (mapZb != null && !mapZb.isEmpty()) {
            for (Map.Entry<String, TreeMap<Float, String>> entry : mapZb.entrySet()) {
                if (entry != null) {
                    key = entry.getKey();
                    String strSya = lud.ycx(key).sya();
                    strSya.getClass();
                    switch (strSya) {
                        case "int":
                            syaVar = new com.bytedance.adsdk.ugeno.ycx.zb.sya(this.f22550dj, this.ycx, key, entry.getValue());
                            break;
                        case "float":
                            syaVar = new com.bytedance.adsdk.ugeno.ycx.zb.zb(this.f22550dj, this.ycx, key, entry.getValue());
                            break;
                        case "point":
                            syaVar = new com.bytedance.adsdk.ugeno.ycx.zb.dj(this.f22550dj, this.ycx, key, entry.getValue());
                            break;
                        default:
                            syaVar = null;
                            break;
                    }
                    if (syaVar != null) {
                        arrayList.addAll(syaVar.lud());
                    }
                }
            }
        }
        JSONObject jSONObjectYcx = this.f22554zb.ycx();
        if (jSONObjectYcx != null) {
            com.bytedance.adsdk.ugeno.ycx.ycx.ycx ycxVarYcx = ycx.C0021ycx.ycx(this.ycx, jSONObjectYcx);
            this.f22553ul = ycxVarYcx;
            if (ycxVarYcx != null) {
                arrayList.addAll(ycxVarYcx.sya());
            }
        }
        final View viewEa = this.ycx.ea();
        if (viewEa == null) {
            return null;
        }
        final sya.ycx ycxVarUl = this.f22554zb.ul();
        if (ycxVarUl != null) {
            viewEa.post(new Runnable() { // from class: com.bytedance.adsdk.ugeno.ycx.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    int width = viewEa.getWidth();
                    int height = viewEa.getHeight();
                    viewEa.setPivotX(dj.ycx(ycxVarUl.ycx, width));
                    viewEa.setPivotY(dj.ycx(ycxVarUl.f22549zb, height));
                }
            });
        }
        ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(viewEa, (PropertyValuesHolder[]) arrayList.toArray(new PropertyValuesHolder[0]));
        this.lud = dj.ycx(this.f22554zb.dj());
        objectAnimatorOfPropertyValuesHolder.setDuration(this.f22554zb.sya());
        int i5 = this.lud;
        if (i5 != Integer.MIN_VALUE) {
            objectAnimatorOfPropertyValuesHolder.setRepeatCount(i5);
        }
        this.f22552lt = this.f22554zb.jc();
        this.fby = this.f22554zb.jw();
        objectAnimatorOfPropertyValuesHolder.setStartDelay(this.f22554zb.lt());
        objectAnimatorOfPropertyValuesHolder.setRepeatMode(dj.ycx(this.f22554zb.lud()));
        objectAnimatorOfPropertyValuesHolder.setInterpolator(dj.zb(this.f22554zb.fby()));
        objectAnimatorOfPropertyValuesHolder.addListener(this);
        this.sya = objectAnimatorOfPropertyValuesHolder;
        return objectAnimatorOfPropertyValuesHolder;
    }

    public String lud() {
        return this.fby;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        super.onAnimationEnd(animator);
        zb zbVar = this.f22551jw;
        if (zbVar != null) {
            zbVar.zb();
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        super.onAnimationStart(animator);
        zb zbVar = this.f22551jw;
        if (zbVar != null) {
            zbVar.ycx();
        }
    }

    public void sya() {
        ValueAnimator valueAnimator = this.sya;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
    }

    public void ycx() {
        ValueAnimator valueAnimator = this.sya;
        if (valueAnimator == null || this.f22552lt == 0 || this.lud == Integer.MIN_VALUE) {
            return;
        }
        valueAnimator.start();
    }

    public void zb() {
        ValueAnimator valueAnimator = this.sya;
        if (valueAnimator != null) {
            valueAnimator.start();
        }
    }

    public void zb(Canvas canvas) {
        com.bytedance.adsdk.ugeno.ycx.ycx.ycx ycxVar = this.f22553ul;
        if (ycxVar != null) {
            ycxVar.zb(canvas);
        }
    }

    public void ycx(zb zbVar) {
        this.f22551jw = zbVar;
    }

    public void ycx(Canvas canvas) {
        com.bytedance.adsdk.ugeno.ycx.ycx.ycx ycxVar = this.f22553ul;
        if (ycxVar != null) {
            ycxVar.ycx(canvas);
        }
    }

    public void ycx(int i5, int i11) {
        com.bytedance.adsdk.ugeno.ycx.ycx.ycx ycxVar = this.f22553ul;
        if (ycxVar != null) {
            ycxVar.ycx(i5, i11);
        }
    }
}
