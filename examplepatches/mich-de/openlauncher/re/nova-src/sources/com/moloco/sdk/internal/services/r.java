package com.moloco.sdk.internal.services;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class r implements q {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38125b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38126a;

    public r(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f38126a = context;
    }

    @Override // com.moloco.sdk.internal.services.q
    public int a() {
        Intent intentRegisterReceiver = this.f38126a.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        if (intentRegisterReceiver != null) {
            return intentRegisterReceiver.getIntExtra("status", 1);
        }
        return 1;
    }

    @Override // com.moloco.sdk.internal.services.q
    public int b() {
        Intent intentRegisterReceiver = this.f38126a.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        if (intentRegisterReceiver != null) {
            return intentRegisterReceiver.getIntExtra("scale", -1);
        }
        return -1;
    }

    @Override // com.moloco.sdk.internal.services.q
    public boolean c() {
        Object systemService = this.f38126a.getSystemService("power");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
        return ((PowerManager) systemService).isPowerSaveMode();
    }
}
