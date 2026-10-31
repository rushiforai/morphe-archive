package com.pgl.ssdk;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
public class a3 extends Handler {

    /* renamed from: a, reason: collision with root package name */
    protected WeakReference<a> f42244a;

    /* loaded from: classes4.dex */
    public interface a {
        void a(Message message);
    }

    public a3(Looper looper, a aVar) {
        super(looper);
        if (aVar != null) {
            this.f42244a = new WeakReference<>(aVar);
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        a aVar;
        WeakReference<a> weakReference = this.f42244a;
        if (weakReference == null || (aVar = weakReference.get()) == null || message == null) {
            return;
        }
        aVar.a(message);
    }
}
