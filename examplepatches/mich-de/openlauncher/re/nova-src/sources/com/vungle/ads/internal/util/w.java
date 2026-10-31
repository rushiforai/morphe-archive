package com.vungle.ads.internal.util;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public v f47716a;

    public final void a(v vVar) {
        this.f47716a = vVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        String action;
        v vVar;
        if (intent != null) {
            try {
                action = intent.getAction();
            } catch (Exception e3) {
                String localizedMessage = e3.getLocalizedMessage();
                if (localizedMessage != null) {
                    boolean z11 = u.f47714a;
                    t.b("RingerModeReceiver", localizedMessage);
                    return;
                }
                return;
            }
        } else {
            action = null;
        }
        if (Intrinsics.b(action, "android.media.RINGER_MODE_CHANGED")) {
            int intExtra = intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1);
            boolean z12 = u.f47714a;
            t.a("RingerModeReceiver", "receive ringermode: " + intExtra);
            if (intExtra == 0) {
                v vVar2 = this.f47716a;
                if (vVar2 != null) {
                    vVar2.a(true);
                    return;
                }
                return;
            }
            if (intExtra != 1) {
                if (intExtra == 2 && (vVar = this.f47716a) != null) {
                    vVar.a(false);
                    return;
                }
                return;
            }
            v vVar3 = this.f47716a;
            if (vVar3 != null) {
                vVar3.a(true);
            }
        }
    }
}
