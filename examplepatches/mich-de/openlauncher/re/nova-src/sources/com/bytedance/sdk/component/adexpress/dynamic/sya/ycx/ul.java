package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.SoftReference;

/* loaded from: classes2.dex */
public class ul implements View.OnTouchListener {
    private static int sya = 10;

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23497dj;
    private int lud;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23502zb;

    /* renamed from: lt, reason: collision with root package name */
    private RectF f23500lt = new RectF();

    /* renamed from: ul, reason: collision with root package name */
    private long f23501ul = 0;
    private final int fby = 200;

    /* renamed from: jw, reason: collision with root package name */
    private final int f23499jw = 3;

    /* renamed from: jc, reason: collision with root package name */
    private SoftReference<View> f23498jc = new SoftReference<>(null);

    public ul(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, int i5, final ViewGroup viewGroup) {
        this.lud = sya;
        this.f23497dj = fbyVar;
        if (i5 > 0) {
            this.lud = i5;
        }
        if (viewGroup != null) {
            viewGroup.post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.ul.1
                @Override // java.lang.Runnable
                public void run() {
                    View viewFindViewById = viewGroup.findViewById(2097610746);
                    ul.this.f23498jc = new SoftReference(viewFindViewById);
                }
            });
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar2;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f23500lt = ycx(this.f23498jc.get());
            this.ycx = motionEvent.getRawX();
            this.f23502zb = motionEvent.getRawY();
            this.f23501ul = System.currentTimeMillis();
        } else if (action == 1) {
            RectF rectF = this.f23500lt;
            if (rectF != null && !rectF.contains(this.ycx, this.f23502zb)) {
                return false;
            }
            float rawX = motionEvent.getRawX();
            float rawY = motionEvent.getRawY();
            float fAbs = Math.abs(rawX - this.ycx);
            float fAbs2 = Math.abs(rawY - this.f23502zb);
            int iZb = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs(rawX - this.ycx));
            int i5 = sya;
            if (fAbs < i5 || fAbs2 < i5) {
                if ((System.currentTimeMillis() - this.f23501ul < 200 || (fAbs < 3.0f && fAbs2 < 3.0f)) && (fbyVar = this.f23497dj) != null) {
                    fbyVar.ycx();
                }
            } else if (rawX > this.ycx && iZb > this.lud && (fbyVar2 = this.f23497dj) != null) {
                fbyVar2.ycx();
            }
        }
        return true;
    }

    private RectF ycx(View view) {
        if (view == null) {
            return new RectF();
        }
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        return new RectF(iArr[0], iArr[1], view.getWidth() + r2, view.getHeight() + iArr[1]);
    }
}
