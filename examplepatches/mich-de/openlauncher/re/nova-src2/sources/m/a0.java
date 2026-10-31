package m;

import android.app.Activity;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import java.util.Objects;

/* loaded from: classes2.dex */
public abstract class a0 {
    public static OnBackInvokedDispatcher a(Activity activity) {
        return activity.getOnBackInvokedDispatcher();
    }

    public static OnBackInvokedCallback b(Object obj, f0 f0Var) {
        Objects.requireNonNull(f0Var);
        z zVar = new z(f0Var, 0);
        com.instabridge.mobilesdk.internal.esim.a.n(obj).registerOnBackInvokedCallback(1000000, zVar);
        return zVar;
    }

    public static void c(Object obj, Object obj2) {
        com.instabridge.mobilesdk.internal.esim.a.n(obj).unregisterOnBackInvokedCallback(com.instabridge.mobilesdk.internal.esim.a.i(obj2));
    }
}
