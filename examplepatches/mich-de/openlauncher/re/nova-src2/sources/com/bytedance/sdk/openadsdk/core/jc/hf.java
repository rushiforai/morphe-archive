package com.bytedance.sdk.openadsdk.core.jc;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class hf extends GestureDetector {
    private final ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.sya.lt f25403zb;

    public static class ycx extends GestureDetector.SimpleOnGestureListener {
        boolean ycx = false;

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onSingleTapUp(MotionEvent motionEvent) {
            this.ycx = true;
            return super.onSingleTapUp(motionEvent);
        }

        public void ycx() {
            this.ycx = false;
        }

        public boolean zb() {
            return this.ycx;
        }
    }

    public hf(Context context) {
        this(context, new ycx());
    }

    @Override // android.view.GestureDetector
    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.f25403zb.ycx(motionEvent);
        return super.onTouchEvent(motionEvent);
    }

    public void ycx() {
        this.ycx.ycx();
    }

    public boolean zb() {
        return this.ycx.zb();
    }

    public hf(Context context, ycx ycxVar) {
        super(context, ycxVar);
        this.ycx = ycxVar;
        this.f25403zb = new com.bytedance.sdk.openadsdk.core.sya.lt();
        setIsLongpressEnabled(false);
    }

    public com.bytedance.sdk.openadsdk.core.model.ok ycx(Context context, View view) {
        if (this.f25403zb == null) {
            return new ok.ycx().ycx();
        }
        return new ok.ycx().lt(this.f25403zb.ycx).lud(this.f25403zb.f26149zb).dj(this.f25403zb.sya).sya(this.f25403zb.f26140dj).zb(this.f25403zb.lud).ycx(this.f25403zb.f26144lt).ycx(dc.ycx(view)).zb(dc.sya(view)).dj(this.f25403zb.f26148ul).lud(this.f25403zb.fby).lt(this.f25403zb.f26143jw).ycx(this.f25403zb.f26145ok).zb(com.bytedance.sdk.openadsdk.core.jc.zb().ycx() ? 1 : 2).ycx("vessel").ycx(dc.jw(context)).sya(dc.ea(context)).zb(dc.jc(context)).ycx();
    }
}
