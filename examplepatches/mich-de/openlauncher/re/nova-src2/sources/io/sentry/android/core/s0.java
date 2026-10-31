package io.sentry.android.core;

import android.telephony.PhoneStateListener;
import io.sentry.g3;

/* loaded from: classes4.dex */
public final class s0 extends PhoneStateListener {

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.b0 f67068a = io.sentry.b0.f67112a;

    @Override // android.telephony.PhoneStateListener
    public final void onCallStateChanged(int i5, String str) {
        if (i5 == 1) {
            io.sentry.e eVar = new io.sentry.e();
            eVar.f67199d = "system";
            eVar.f67201f = "device.event";
            eVar.b("CALL_STATE_RINGING", "action");
            eVar.f67198c = "Device ringing";
            eVar.f67203h = g3.INFO;
            this.f67068a.a(eVar);
        }
    }
}
