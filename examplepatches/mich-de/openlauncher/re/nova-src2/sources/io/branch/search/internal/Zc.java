package io.branch.search.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.PowerManager;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.InterfaceC3232k9;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Zc implements InterfaceC3450x7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63831a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final b f63832b;

    public static final class a {
        public static boolean a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Object systemService = context.getSystemService("power");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
            return ((PowerManager) systemService).isInteractive();
        }
    }

    public static final class b extends BroadcastReceiver {

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public InterfaceC3467y7 f63833a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final R9 f63834b;

        /* renamed from: c, reason: collision with root package name */
        public boolean f63835c = true;

        public static final class a extends Lambda implements Function0<Unit> {

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ boolean f63837b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(boolean z11) {
                super(0);
                this.f63837b = z11;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                try {
                    InterfaceC3467y7 interfaceC3467y7 = b.this.f63833a;
                    if (interfaceC3467y7 != null) {
                        interfaceC3467y7.d();
                    }
                } catch (Exception e3) {
                    String strP = a2.c.p(new StringBuilder("isScreenOn "), this.f63837b, ' ');
                    C3296o5.a aVar = C3296o5.f65426a;
                    C3296o5.a(new F6("ScreenStateReceiver.onReceive", strP, null, e3, null));
                }
                return Unit.f71706a;
            }
        }

        /* renamed from: io.branch.search.internal.Zc$b$b, reason: collision with other inner class name */
        public static final class C0333b extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public static final C0333b f63838a = new C0333b();

            public C0333b() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final /* bridge */ /* synthetic */ Object invoke() {
                return Unit.f71706a;
            }
        }

        public b(long j11) {
            this.f63834b = InterfaceC3232k9.a.a(InterfaceC3232k9.Companion, j11);
        }

        public final void a(@NotNull Context context, @NotNull InterfaceC3467y7 scrnStateListener, boolean z11) {
            Intrinsics.g(context, "context");
            Intrinsics.g(scrnStateListener, "scrnStateListener");
            this.f63833a = scrnStateListener;
            this.f63835c = z11;
            try {
                context.unregisterReceiver(this);
            } catch (IllegalArgumentException unused) {
            }
            if (Build.VERSION.SDK_INT >= 33) {
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.intent.action.SCREEN_ON");
                intentFilter.addAction("android.intent.action.SCREEN_OFF");
                Unit unit = Unit.f71706a;
                context.registerReceiver(this, intentFilter, 4);
                return;
            }
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.intent.action.SCREEN_ON");
            intentFilter2.addAction("android.intent.action.SCREEN_OFF");
            Unit unit2 = Unit.f71706a;
            context.registerReceiver(this, intentFilter2);
        }

        @Override // android.content.BroadcastReceiver
        public final void onReceive(@Nullable Context context, @Nullable Intent intent) {
            if (context != null) {
                boolean zB = Intrinsics.b(intent != null ? intent.getAction() : null, "android.intent.action.SCREEN_ON");
                if (!zB) {
                    this.f63834b.a(C0333b.f63838a);
                    InterfaceC3467y7 interfaceC3467y7 = this.f63833a;
                    if (interfaceC3467y7 != null) {
                        interfaceC3467y7.f();
                        return;
                    }
                    return;
                }
                if (this.f63835c) {
                    this.f63834b.a(new a(zB));
                    return;
                }
                InterfaceC3467y7 interfaceC3467y72 = this.f63833a;
                if (interfaceC3467y72 != null) {
                    interfaceC3467y72.d();
                }
            }
        }
    }

    public /* synthetic */ Zc(Context context) {
        this(context, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
    }

    @Override // io.branch.search.internal.InterfaceC3450x7
    public final boolean a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Companion.getClass();
        return a.a(context);
    }

    public Zc(@NotNull Context context, long j11) {
        Intrinsics.g(context, "context");
        this.f63831a = context;
        this.f63832b = new b(j11);
    }

    @Override // io.branch.search.internal.InterfaceC3450x7
    public final void a(@NotNull InterfaceC3467y7 listener, boolean z11, boolean z12) {
        Intrinsics.g(listener, "listener");
        this.f63832b.a(this.f63831a, listener, z12);
        if (z11) {
            Context context = this.f63831a;
            Intrinsics.g(context, "context");
            Companion.getClass();
            if (a.a(context)) {
                listener.d();
            } else {
                listener.f();
            }
        }
    }
}
