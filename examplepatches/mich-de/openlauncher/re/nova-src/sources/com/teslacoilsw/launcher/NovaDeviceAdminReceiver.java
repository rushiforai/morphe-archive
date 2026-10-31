package com.teslacoilsw.launcher;

import android.app.admin.DeviceAdminReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;

/* loaded from: classes4.dex */
public class NovaDeviceAdminReceiver extends DeviceAdminReceiver {

    /* renamed from: a, reason: collision with root package name */
    public static final ComponentName f45645a = new ComponentName("com.teslacoilsw.launcher", NovaDeviceAdminReceiver.class.getName());

    @Override // android.app.admin.DeviceAdminReceiver, android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
    }
}
