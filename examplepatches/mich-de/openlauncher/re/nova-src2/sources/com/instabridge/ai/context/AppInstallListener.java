package com.instabridge.ai.context;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00007\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\b\u0003*\u0001\u001a\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\nJ\u000e\u0010\u0018\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000RL\u0010\b\u001a4\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f\u0018\u00010\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013RL\u0010\u0014\u001a4\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f\u0018\u00010\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0011\"\u0004\b\u0016\u0010\u0013R\u0010\u0010\u0019\u001a\u00020\u001aX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001b¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/context/AppInstallListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "registered", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onAppInstalled", "Lkotlin/Function2;", "Landroid/content/Context;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "context", "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getOnAppInstalled", "()Lkotlin/jvm/functions/Function2;", "setOnAppInstalled", "(Lkotlin/jvm/functions/Function2;)V", "onAppUninstalled", "getOnAppUninstalled", "setOnAppUninstalled", "register", "unregister", "receiver", "com/instabridge/ai/context/AppInstallListener$receiver$1", "Lcom/instabridge/ai/context/AppInstallListener$receiver$1;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AppInstallListener {

    @NotNull
    private static final String TAG = "AppInstallListener";

    @Nullable
    private static Function2<? super Context, ? super String, Unit> onAppInstalled;

    @Nullable
    private static Function2<? super Context, ? super String, Unit> onAppUninstalled;
    private static boolean registered;

    @NotNull
    public static final AppInstallListener INSTANCE = new AppInstallListener();

    @NotNull
    private static final AppInstallListener$receiver$1 receiver = new BroadcastReceiver() { // from class: com.instabridge.ai.context.AppInstallListener$receiver$1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Uri data;
            String schemeSpecificPart;
            Function2<Context, String, Unit> onAppUninstalled2;
            Function2<Context, String, Unit> onAppInstalled2;
            Intrinsics.g(context, "context");
            if (intent == null || (data = intent.getData()) == null || (schemeSpecificPart = data.getSchemeSpecificPart()) == null) {
                return;
            }
            boolean booleanExtra = intent.getBooleanExtra("android.intent.extra.REPLACING", false);
            String action = intent.getAction();
            if (action != null) {
                int iHashCode = action.hashCode();
                if (iHashCode == 525384130) {
                    if (!action.equals("android.intent.action.PACKAGE_REMOVED") || booleanExtra || (onAppUninstalled2 = AppInstallListener.INSTANCE.getOnAppUninstalled()) == null) {
                        return;
                    }
                    onAppUninstalled2.invoke(context, schemeSpecificPart);
                    return;
                }
                if (iHashCode == 1544582882 && action.equals("android.intent.action.PACKAGE_ADDED") && !booleanExtra && (onAppInstalled2 = AppInstallListener.INSTANCE.getOnAppInstalled()) != null) {
                    onAppInstalled2.invoke(context, schemeSpecificPart);
                }
            }
        }
    };
    public static final int $stable = 8;

    private AppInstallListener() {
    }

    @Nullable
    public final Function2<Context, String, Unit> getOnAppInstalled() {
        return onAppInstalled;
    }

    @Nullable
    public final Function2<Context, String, Unit> getOnAppUninstalled() {
        return onAppUninstalled;
    }

    public final void register(@NotNull Context context) {
        Intrinsics.g(context, "context");
        if (registered) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter.addDataScheme("package");
        o4.a.c(context.getApplicationContext(), receiver, intentFilter, null, 4);
        registered = true;
    }

    public final void setOnAppInstalled(@Nullable Function2<? super Context, ? super String, Unit> function2) {
        onAppInstalled = function2;
    }

    public final void setOnAppUninstalled(@Nullable Function2<? super Context, ? super String, Unit> function2) {
        onAppUninstalled = function2;
    }

    public final void unregister(@NotNull Context context) {
        Intrinsics.g(context, "context");
        if (registered) {
            try {
                context.getApplicationContext().unregisterReceiver(receiver);
            } catch (Exception unused) {
            }
            registered = false;
        }
    }
}
