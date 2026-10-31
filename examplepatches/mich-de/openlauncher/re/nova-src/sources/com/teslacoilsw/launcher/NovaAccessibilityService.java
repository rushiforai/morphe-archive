package com.teslacoilsw.launcher;

import android.accessibilityservice.AccessibilityService;
import android.content.ComponentName;
import android.view.accessibility.AccessibilityEvent;

/* loaded from: classes4.dex */
public class NovaAccessibilityService extends AccessibilityService {

    /* renamed from: a, reason: collision with root package name */
    public static NovaAccessibilityService f45633a;

    static {
        new ComponentName("com.teslacoilsw.launcher", NovaAccessibilityService.class.getName());
    }

    public static NovaAccessibilityService a() {
        return f45633a;
    }

    @Override // android.accessibilityservice.AccessibilityService
    public final void onAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
    }

    @Override // android.app.Service
    public final void onCreate() {
        super.onCreate();
        f45633a = this;
    }

    @Override // android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        f45633a = null;
    }

    @Override // android.accessibilityservice.AccessibilityService
    public final void onInterrupt() {
    }
}
