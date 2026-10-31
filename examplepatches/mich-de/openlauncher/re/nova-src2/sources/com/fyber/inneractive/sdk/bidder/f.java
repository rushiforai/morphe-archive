package com.fyber.inneractive.sdk.bidder;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

/* loaded from: classes.dex */
public final class f extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final e f27653a;

    public f(e eVar) {
        this.f27653a = eVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onReceive(Context context, Intent intent) {
        boolean z11;
        if (intent == null || intent.getAction() == null) {
            return;
        }
        String action = intent.getAction();
        action.getClass();
        switch (action) {
            case "android.intent.action.BATTERY_CHANGED":
                b bVar = (b) this.f27653a;
                bVar.f27622b.getClass();
                int intExtra = intent.getIntExtra("plugged", -1);
                z11 = intExtra == 1 || intExtra == 2 || intExtra == 4;
                Boolean bool = bVar.f27623c.B;
                if (bool == null || bool.booleanValue() != z11) {
                    bVar.f27623c.B = Boolean.valueOf(z11);
                    bVar.d();
                }
                bVar.f27622b.getClass();
                if (!TextUtils.equals(bVar.f27623c.C, com.fyber.inneractive.sdk.serverapi.b.a((intent.getIntExtra("level", -1) * 100) / intent.getIntExtra("scale", -1)))) {
                    d dVar = bVar.f27623c;
                    bVar.f27622b.getClass();
                    dVar.C = com.fyber.inneractive.sdk.serverapi.b.a((intent.getIntExtra("level", -1) * 100) / intent.getIntExtra("scale", -1));
                    bVar.d();
                    break;
                }
                break;
            case "android.bluetooth.adapter.action.STATE_CHANGED":
            case "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED":
                b bVar2 = (b) this.f27653a;
                bVar2.getClass();
                Boolean bool2 = intent.getIntExtra("android.bluetooth.adapter.extra.CONNECTION_STATE", Integer.MIN_VALUE) == 2 ? Boolean.TRUE : null;
                d dVar2 = bVar2.f27623c;
                if (dVar2.f27646t != bool2) {
                    dVar2.f27646t = bool2;
                    bVar2.d();
                    break;
                }
                break;
            case "android.intent.action.AIRPLANE_MODE":
                b bVar3 = (b) this.f27653a;
                bVar3.f27623c.f27649w = Boolean.valueOf(intent.getBooleanExtra("state", false));
                bVar3.d();
                break;
            case "android.os.action.POWER_SAVE_MODE_CHANGED":
                b bVar4 = (b) this.f27653a;
                bVar4.f27623c.f27647u = com.fyber.inneractive.sdk.serverapi.b.n();
                bVar4.d();
                break;
            case "android.media.RINGER_MODE_CHANGED":
                b bVar5 = (b) this.f27653a;
                bVar5.getClass();
                int intExtra2 = intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1);
                z11 = intExtra2 == 0 || intExtra2 == 1;
                Boolean bool3 = bVar5.f27623c.f27651y;
                if (bool3 == null || bool3.booleanValue() != z11) {
                    bVar5.f27623c.f27651y = Boolean.valueOf(z11);
                    bVar5.d();
                    break;
                }
                break;
            case "android.app.action.INTERRUPTION_FILTER_CHANGED":
                ((b) this.f27653a).c();
                break;
        }
    }
}
