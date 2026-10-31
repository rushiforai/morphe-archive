package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.SoftReference;

/* loaded from: classes2.dex */
public class ycx implements View.OnTouchListener {
    private static int sya = 10;

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23504dj;
    private int lud;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23509zb;

    /* renamed from: lt, reason: collision with root package name */
    private RectF f23507lt = new RectF();

    /* renamed from: ul, reason: collision with root package name */
    private long f23508ul = 0;
    private final int fby = 200;

    /* renamed from: jw, reason: collision with root package name */
    private final int f23506jw = 3;

    /* renamed from: jc, reason: collision with root package name */
    private SoftReference<ViewGroup> f23505jc = new SoftReference<>(null);

    public ycx(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, int i5, final ViewGroup viewGroup) {
        this.lud = sya;
        this.f23504dj = fbyVar;
        if (i5 > 0) {
            this.lud = i5;
        }
        if (viewGroup != null) {
            viewGroup.post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.ycx.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.f23505jc = new SoftReference(viewGroup);
                }
            });
        }
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f23507lt = ycx(this.f23505jc.get());
            this.ycx = motionEvent.getRawX();
            this.f23509zb = motionEvent.getRawY();
            this.f23508ul = System.currentTimeMillis();
        } else if (action == 1) {
            RectF rectF = this.f23507lt;
            if (rectF != null && !rectF.contains(this.ycx, this.f23509zb)) {
                return false;
            }
            float rawX = motionEvent.getRawX();
            float rawY = motionEvent.getRawY();
            float fAbs = Math.abs(rawX - this.ycx);
            float fAbs2 = Math.abs(rawY - this.f23509zb);
            int i5 = this.lud;
            if (fAbs >= i5 && fAbs2 >= i5) {
                com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar2 = this.f23504dj;
                if (fbyVar2 != null) {
                    fbyVar2.ycx();
                }
            } else if ((System.currentTimeMillis() - this.f23508ul < 200 || (fAbs < 3.0f && fAbs2 < 3.0f)) && (fbyVar = this.f23504dj) != null) {
                fbyVar.ycx();
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
