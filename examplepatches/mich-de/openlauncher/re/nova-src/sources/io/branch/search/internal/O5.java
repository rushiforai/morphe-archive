package io.branch.search.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.PowerManager;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class O5 implements InterfaceC3382t7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63010a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final b f63011b;

    public static final class a {
        public static boolean a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Object systemService = context.getSystemService("power");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
            PowerManager powerManager = (PowerManager) systemService;
            return !(!powerManager.isDeviceIdleMode() && powerManager.isInteractive());
        }
    }

    public static final class b extends BroadcastReceiver {

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public InterfaceC3399u7 f63012a;

        public final void a(@NotNull Context context, @NotNull InterfaceC3399u7 idleStateListener) {
            Intrinsics.g(context, "context");
            Intrinsics.g(idleStateListener, "idleStateListener");
            this.f63012a = idleStateListener;
            try {
                context.unregisterReceiver(this);
            } catch (IllegalArgumentException unused) {
            }
            if (Build.VERSION.SDK_INT >= 33) {
                context.registerReceiver(this, new IntentFilter("android.os.action.DEVICE_IDLE_MODE_CHANGED"), 4);
            } else {
                context.registerReceiver(this, new IntentFilter("android.os.action.DEVICE_IDLE_MODE_CHANGED"));
            }
        }

        @Override // android.content.BroadcastReceiver
        public final void onReceive(@NotNull Context context, @Nullable Intent intent) {
            Intrinsics.g(context, "context");
            O5.Companion.getClass();
            if (a.a(context)) {
                InterfaceC3399u7 interfaceC3399u7 = this.f63012a;
                if (interfaceC3399u7 != null) {
                    interfaceC3399u7.e();
                    return;
                }
                return;
            }
            InterfaceC3399u7 interfaceC3399u72 = this.f63012a;
            if (interfaceC3399u72 != null) {
                interfaceC3399u72.c();
            }
        }
    }

    public O5(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f63010a = context;
        this.f63011b = new b();
    }

    @Override // io.branch.search.internal.InterfaceC3382t7
    public final boolean a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Companion.getClass();
        return a.a(context);
    }

    @Override // io.branch.search.internal.InterfaceC3382t7
    public final void a(@NotNull InterfaceC3399u7 listener, boolean z11) {
        Intrinsics.g(listener, "listener");
        this.f63011b.a(this.f63010a, listener);
        if (z11) {
            Context context = this.f63010a;
            Intrinsics.g(context, "context");
            Companion.getClass();
            if (a.a(context)) {
                listener.e();
            } else {
                listener.c();
            }
        }
    }
}
