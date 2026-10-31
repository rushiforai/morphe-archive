package com.bytedance.adsdk.ugeno.core.zb;

import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: classes2.dex */
public class ycx {
    public String ycx = "GesThrough_";

    /* renamed from: zb, reason: collision with root package name */
    private List<MotionEvent> f22270zb = new ArrayList();
    private Set<String> sya = Collections.synchronizedSet(new HashSet());

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        if (syaVar == null || motionEvent == null || this.f22270zb == null) {
            return;
        }
        ycx(syaVar.ea(), syaVar.rmy(), motionEvent);
    }

    public void ycx(View view, String str, MotionEvent motionEvent) {
        if (view == null || motionEvent == null || this.f22270zb == null) {
            return;
        }
        this.ycx = "GesThrough_".concat(String.valueOf(str));
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        int i5 = iArr[0];
        int i11 = iArr[1];
        if (motionEvent.getAction() == 0) {
            ycx();
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        motionEventObtain.offsetLocation(i5, i11);
        this.f22270zb.add(motionEventObtain);
    }

    public boolean ycx(MotionEvent motionEvent) {
        if (motionEvent == null || this.sya == null) {
            return false;
        }
        int pointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
        return this.sya.contains(motionEvent.getDownTime() + "_" + pointerId);
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        if (this.f22270zb.isEmpty() || this.sya == null || syaVar == null || syaVar.ea() == null || syaVar.ea().getRootView() == null) {
            return;
        }
        ycx(syaVar.ea());
    }

    public void ycx(View view) {
        if (this.f22270zb.isEmpty() || this.sya == null || view == null || view.getRootView() == null) {
            return;
        }
        final View rootView = view.getRootView();
        this.f22270zb.size();
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.bytedance.adsdk.ugeno.core.zb.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                for (MotionEvent motionEvent : ycx.this.f22270zb) {
                    if (motionEvent != null) {
                        int pointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
                        ycx.this.sya.add(motionEvent.getDownTime() + "_" + pointerId);
                        rootView.dispatchTouchEvent(motionEvent);
                        motionEvent.recycle();
                    }
                }
                ycx.this.ycx();
            }
        }, 300L);
    }

    public void ycx() {
        List<MotionEvent> list = this.f22270zb;
        if (list != null) {
            list.clear();
        }
    }
}
