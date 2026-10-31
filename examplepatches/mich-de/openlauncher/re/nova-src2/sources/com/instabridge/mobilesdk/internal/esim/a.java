package com.instabridge.mobilesdk.internal.esim;

import android.view.accessibility.AccessibilityManager$AccessibilityServicesStateChangeListener;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class a {
    public static /* bridge */ /* synthetic */ AccessibilityManager$AccessibilityServicesStateChangeListener h(Object obj) {
        return (AccessibilityManager$AccessibilityServicesStateChangeListener) obj;
    }

    public static /* bridge */ /* synthetic */ OnBackInvokedCallback i(Object obj) {
        return (OnBackInvokedCallback) obj;
    }

    public static /* bridge */ /* synthetic */ OnBackInvokedDispatcher n(Object obj) {
        return (OnBackInvokedDispatcher) obj;
    }

    public static /* bridge */ /* synthetic */ boolean z(Object obj) {
        return obj instanceof OnBackInvokedCallback;
    }
}
