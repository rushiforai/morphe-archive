package defpackage;

import android.app.Activity;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class a20 {
    public static OnBackInvokedDispatcher a(Activity activity) {
        return activity.getOnBackInvokedDispatcher();
    }

    public static OnBackInvokedCallback b(Object obj, f20 f20Var) {
        Objects.requireNonNull(f20Var);
        xy xyVar = new xy(1, f20Var);
        z10.f(obj).registerOnBackInvokedCallback(1000000, xyVar);
        return xyVar;
    }

    public static void c(Object obj, Object obj2) {
        z10.f(obj).unregisterOnBackInvokedCallback((OnBackInvokedCallback) obj2);
    }
}
