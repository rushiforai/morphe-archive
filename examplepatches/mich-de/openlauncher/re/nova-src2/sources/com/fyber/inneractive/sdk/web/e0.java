package com.fyber.inneractive.sdk.web;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class e0 extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public Context f31291a;

    /* renamed from: b, reason: collision with root package name */
    public int f31292b = -1;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i0 f31293c;

    public e0(i0 i0Var) {
        this.f31293c = i0Var;
    }

    public final void a() {
        try {
            i0 i0Var = this.f31293c;
            i0Var.getClass();
            IAlog.a("%sunregister screen broadcast receiver called", IAlog.a(i0Var));
            if (this.f31291a != null) {
                i0 i0Var2 = this.f31293c;
                i0Var2.getClass();
                IAlog.a("%sunregistering broadcast receiver", IAlog.a(i0Var2));
                this.f31291a.unregisterReceiver(this);
                this.f31291a = null;
            }
        } catch (Throwable th2) {
            IAlog.f("IAmraidWebViewControllerBase: OrientationBroadcastReceiver: unregister: exception: %s", th2.toString());
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        int iA;
        if (this.f31291a == null || !"android.intent.action.CONFIGURATION_CHANGED".equals(intent.getAction()) || (iA = com.fyber.inneractive.sdk.util.o.a()) == this.f31292b) {
            return;
        }
        this.f31292b = iA;
        i0 i0Var = this.f31293c;
        m mVar = i0Var.f31304b;
        if (mVar != null) {
            mVar.getViewTreeObserver().removeOnPreDrawListener(i0Var.f31336n0);
            i0Var.f31304b.getViewTreeObserver().addOnPreDrawListener(i0Var.f31336n0);
        }
    }
}
