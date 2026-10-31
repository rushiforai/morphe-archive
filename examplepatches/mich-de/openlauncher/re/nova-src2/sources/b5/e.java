package b5;

import android.content.Intent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.window.OnBackInvokedDispatcher;
import c4.d0;
import c4.s;

/* loaded from: classes2.dex */
public abstract class e {
    public static Object a(Intent intent, String str, Class cls) {
        return intent.getParcelableExtra(str, cls);
    }

    public static String b(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getUniqueId();
    }

    public static boolean c(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.isTextSelectable();
    }

    public static final void d(d0 d0Var, s sVar) {
        OnBackInvokedDispatcher onBackInvokedDispatcherFindOnBackInvokedDispatcher;
        if (sVar == null || (onBackInvokedDispatcherFindOnBackInvokedDispatcher = d0Var.findOnBackInvokedDispatcher()) == null) {
            return;
        }
        onBackInvokedDispatcherFindOnBackInvokedDispatcher.registerOnBackInvokedCallback(1000000, sVar);
    }

    public static final void e(d0 d0Var, s sVar) {
        OnBackInvokedDispatcher onBackInvokedDispatcherFindOnBackInvokedDispatcher;
        if (sVar == null || (onBackInvokedDispatcherFindOnBackInvokedDispatcher = d0Var.findOnBackInvokedDispatcher()) == null) {
            return;
        }
        onBackInvokedDispatcherFindOnBackInvokedDispatcher.unregisterOnBackInvokedCallback(sVar);
    }
}
