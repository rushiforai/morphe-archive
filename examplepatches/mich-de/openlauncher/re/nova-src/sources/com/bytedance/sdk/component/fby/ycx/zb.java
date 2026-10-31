package com.bytedance.sdk.component.fby.ycx;

import android.os.HandlerThread;
import com.bytedance.sdk.component.utils.tru;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class zb extends tru implements sya {

    /* renamed from: zb, reason: collision with root package name */
    private final HandlerThread f23749zb;

    public zb(HandlerThread handlerThread, tru.ycx ycxVar) {
        super(handlerThread.getLooper(), ycxVar);
        this.f23749zb = handlerThread;
    }

    @Override // com.bytedance.sdk.component.fby.ycx.sya
    public void ycx() {
        removeCallbacksAndMessages(null);
        WeakReference<tru.ycx> weakReference = this.ycx;
        if (weakReference != null) {
            weakReference.clear();
            this.ycx = null;
        }
    }

    public void zb() {
        HandlerThread handlerThread = this.f23749zb;
        if (handlerThread != null) {
            handlerThread.quit();
        }
    }

    public void ycx(tru.ycx ycxVar) {
        this.ycx = new WeakReference<>(ycxVar);
    }
}
