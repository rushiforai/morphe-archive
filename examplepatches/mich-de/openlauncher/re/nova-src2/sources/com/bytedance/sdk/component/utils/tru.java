package com.bytedance.sdk.component.utils;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class tru extends Handler {
    protected WeakReference<ycx> ycx;

    public interface ycx {
        void ycx(Message message);
    }

    public tru(ycx ycxVar) {
        if (ycxVar != null) {
            this.ycx = new WeakReference<>(ycxVar);
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        ycx ycxVar;
        WeakReference<ycx> weakReference = this.ycx;
        if (weakReference == null || (ycxVar = weakReference.get()) == null || message == null) {
            return;
        }
        ycxVar.ycx(message);
    }

    public tru(Looper looper, ycx ycxVar) {
        super(looper);
        if (ycxVar != null) {
            this.ycx = new WeakReference<>(ycxVar);
        }
    }
}
