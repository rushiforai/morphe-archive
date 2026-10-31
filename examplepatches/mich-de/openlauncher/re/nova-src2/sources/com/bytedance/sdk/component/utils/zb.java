package com.bytedance.sdk.component.utils;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.view.View;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public class zb {
    private static ycx ycx;

    public interface ycx {
        ExecutorService sya();

        boolean ycx();

        boolean zb();
    }

    /* renamed from: com.bytedance.sdk.component.utils.zb$zb, reason: collision with other inner class name */
    public interface InterfaceC0044zb {
        void ycx();

        void ycx(Throwable th2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean sya(Context context, Intent intent, InterfaceC0044zb interfaceC0044zb) {
        if (context != null && intent != null) {
            try {
                if (!(context instanceof Activity)) {
                    intent.addFlags(268435456);
                }
                context.startActivity(intent);
                if (interfaceC0044zb == null) {
                    return true;
                }
                interfaceC0044zb.ycx();
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "eu05nBW1fd61Xt5R", "X+EegQKufeaDXt5LhQW5", 67);
                if (interfaceC0044zb != null) {
                    interfaceC0044zb.ycx(th2);
                }
            }
        }
        return false;
    }

    public static void ycx(ycx ycxVar) {
        ycx = ycxVar;
    }

    public static void ycx(final Context context, final Intent intent, final InterfaceC0044zb interfaceC0044zb) {
        ExecutorService executorServiceSya;
        ycx ycxVar = ycx;
        if (ycxVar == null || !ycxVar.zb() || (executorServiceSya = ycx.sya()) == null) {
            sya(context, intent, interfaceC0044zb);
        } else {
            executorServiceSya.execute(new Runnable() { // from class: com.bytedance.sdk.component.utils.zb.1
                @Override // java.lang.Runnable
                public void run() {
                    zb.sya(context, intent, interfaceC0044zb);
                }
            });
        }
    }

    public static boolean ycx(final Context context, final Intent intent, final InterfaceC0044zb interfaceC0044zb, boolean z11) {
        ycx ycxVar;
        ExecutorService executorServiceSya;
        if (z11 && (ycxVar = ycx) != null && ycxVar.ycx() && (executorServiceSya = ycx.sya()) != null) {
            executorServiceSya.execute(new Runnable() { // from class: com.bytedance.sdk.component.utils.zb.2
                @Override // java.lang.Runnable
                public void run() {
                    zb.sya(context, intent, interfaceC0044zb);
                }
            });
            return true;
        }
        return sya(context, intent, interfaceC0044zb);
    }

    public static Activity ycx(View view) {
        View viewFindViewById;
        Context context;
        if (view == null) {
            return null;
        }
        Context context2 = view.getContext();
        if (context2 instanceof Activity) {
            return (Activity) context2;
        }
        View rootView = view.getRootView();
        if (rootView == null || (viewFindViewById = rootView.findViewById(16908290)) == null || (context = viewFindViewById.getContext()) == null) {
            return null;
        }
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof ContextWrapper) {
            Context baseContext = ((ContextWrapper) context).getBaseContext();
            if (baseContext instanceof Activity) {
                return (Activity) baseContext;
            }
        }
        return null;
    }

    public static boolean ycx(Activity activity) {
        return activity == null || activity.isFinishing() || activity.isDestroyed();
    }
}
