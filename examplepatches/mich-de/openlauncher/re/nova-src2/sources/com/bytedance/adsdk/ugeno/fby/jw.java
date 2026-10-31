package com.bytedance.adsdk.ugeno.fby;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class jw extends Handler {
    private final WeakReference<ycx> ycx;

    public interface ycx {
        void ycx(Message message);
    }

    public jw(Looper looper, ycx ycxVar) {
        super(looper);
        this.ycx = new WeakReference<>(ycxVar);
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        ycx ycxVar = this.ycx.get();
        if (ycxVar == null || message == null) {
            return;
        }
        ycxVar.ycx(message);
    }
}
