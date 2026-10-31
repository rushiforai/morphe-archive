package com.android.launcher3.icons;

import aa.g0;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.LauncherActivityInfo;
import android.os.UserHandle;
import ba.d;
import o9.t1;
import ya.h0;

/* loaded from: classes.dex */
public class LauncherActivityCachingLogic implements d, h0 {
    @Override // ba.d
    /* renamed from: a */
    public CharSequence d(LauncherActivityInfo launcherActivityInfo) {
        return launcherActivityInfo.getLabel();
    }

    @Override // ba.d
    /* renamed from: b */
    public BitmapInfo e(Context context, LauncherActivityInfo launcherActivityInfo) {
        g0 g0VarW = g0.w(context);
        try {
            BitmapInfo bitmapInfoC = g0VarW.c(((t1) t1.f80131h.h(context)).f80134c.c(launcherActivityInfo, g0VarW.f550g), launcherActivityInfo.getUser(), launcherActivityInfo.getApplicationInfo().targetSdkVersion);
            g0VarW.D();
            return bitmapInfoC;
        } catch (Throwable th2) {
            try {
                g0VarW.D();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    @Override // ba.d
    public final UserHandle i(Object obj) {
        return ((LauncherActivityInfo) obj).getUser();
    }

    @Override // ba.d
    public final ComponentName m(Object obj) {
        return ((LauncherActivityInfo) obj).getComponentName();
    }
}
