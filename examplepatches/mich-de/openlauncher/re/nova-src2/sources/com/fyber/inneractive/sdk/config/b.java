package com.fyber.inneractive.sdk.config;

import android.os.Handler;
import android.os.Message;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.w1;

/* loaded from: classes.dex */
public final class b implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f27767a;

    public b(e eVar) {
        this.f27767a = eVar;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        if (message.what != 123) {
            return false;
        }
        e eVar = this.f27767a;
        if (eVar.f27792b.compareAndSet(false, true)) {
            if (eVar.f27792b.get() && eVar.f27794d != null) {
                IAlog.a("startCounting", new Object[0]);
                w1 w1Var = eVar.f27794d;
                w1Var.f31249d = false;
                w1Var.f31248c.sendEmptyMessage(1932593528);
            }
            IAlog.a("Pause signal", new Object[0]);
        }
        return true;
    }
}
