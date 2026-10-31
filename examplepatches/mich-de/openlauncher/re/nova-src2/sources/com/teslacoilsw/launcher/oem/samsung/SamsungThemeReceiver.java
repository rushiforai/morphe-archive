package com.teslacoilsw.launcher.oem.samsung;

import a10.a;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import mc0.d;
import mx.g0;
import w20.m;

/* loaded from: classes4.dex */
public class SamsungThemeReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (!m.f93693c) {
            d.f76206a.b("Ignoring ACTION_THEME_CHANGED as not Samsung", new Object[0]);
        } else if (intent != null) {
            Context context2 = g0.f77088a;
            g0.a(new a(0));
        }
    }
}
