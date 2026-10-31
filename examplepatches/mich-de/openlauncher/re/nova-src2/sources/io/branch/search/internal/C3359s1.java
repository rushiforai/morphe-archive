package io.branch.search.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.InterfaceC3232k9;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.s1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3359s1 implements InterfaceC3247l7 {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f65716a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final a f65717b;

    /* renamed from: io.branch.search.internal.s1$a */
    public static final class a extends BroadcastReceiver {

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public InterfaceC3264m7 f65718a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final R9 f65719b;

        /* renamed from: io.branch.search.internal.s1$a$a, reason: collision with other inner class name */
        public static final class C0350a extends Lambda implements Function0<Unit> {

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ boolean f65721b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0350a(boolean z11) {
                super(0);
                this.f65721b = z11;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                try {
                    InterfaceC3264m7 interfaceC3264m7 = a.this.f65718a;
                    if (interfaceC3264m7 != null) {
                        interfaceC3264m7.b();
                    }
                } catch (Exception e3) {
                    String strP = a2.c.p(new StringBuilder("isCharging "), this.f65721b, ' ');
                    C3296o5.a aVar = C3296o5.f65426a;
                    C3296o5.a(new F6("BatteryStateReceiver.onReceive", strP, null, e3, null));
                }
                return Unit.f71706a;
            }
        }

        /* renamed from: io.branch.search.internal.s1$a$b */
        public static final class b extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public static final b f65722a = new b();

            public b() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final /* bridge */ /* synthetic */ Object invoke() {
                return Unit.f71706a;
            }
        }

        public a(long j11) {
            this.f65719b = InterfaceC3232k9.a.a(InterfaceC3232k9.Companion, j11);
        }

        public final void a(@NotNull Context context, @NotNull InterfaceC3264m7 battListener) {
            Intrinsics.g(context, "context");
            Intrinsics.g(battListener, "battListener");
            this.f65718a = battListener;
            try {
                context.unregisterReceiver(this);
            } catch (IllegalArgumentException unused) {
            }
            if (Build.VERSION.SDK_INT >= 33) {
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.intent.action.ACTION_POWER_CONNECTED");
                intentFilter.addAction("android.intent.action.ACTION_POWER_DISCONNECTED");
                Unit unit = Unit.f71706a;
                context.registerReceiver(this, intentFilter, 4);
                return;
            }
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.intent.action.ACTION_POWER_CONNECTED");
            intentFilter2.addAction("android.intent.action.ACTION_POWER_DISCONNECTED");
            Unit unit2 = Unit.f71706a;
            context.registerReceiver(this, intentFilter2);
        }

        @Override // android.content.BroadcastReceiver
        public final void onReceive(@NotNull Context context, @NotNull Intent intent) {
            Intrinsics.g(context, "context");
            Intrinsics.g(intent, "intent");
            boolean zB = Intrinsics.b(intent.getAction(), "android.intent.action.ACTION_POWER_CONNECTED");
            if (zB) {
                this.f65719b.a(new C0350a(zB));
                return;
            }
            this.f65719b.a(b.f65722a);
            InterfaceC3264m7 interfaceC3264m7 = this.f65718a;
            if (interfaceC3264m7 != null) {
                interfaceC3264m7.a();
            }
        }
    }

    /* renamed from: io.branch.search.internal.s1$b */
    public static final class b {
        public static boolean a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            IntentFilter intentFilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
            Intent intentRegisterReceiver = Build.VERSION.SDK_INT >= 33 ? context.registerReceiver(null, intentFilter, 4) : context.registerReceiver(null, intentFilter);
            return intentRegisterReceiver != null && intentRegisterReceiver.getIntExtra("plugged", -1) == 1;
        }
    }

    public /* synthetic */ C3359s1(Context context) {
        this(context, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
    }

    @Override // io.branch.search.internal.InterfaceC3247l7
    public final boolean a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Companion.getClass();
        return b.a(context);
    }

    public C3359s1(@NotNull Context context, long j11) {
        Intrinsics.g(context, "context");
        this.f65716a = context;
        this.f65717b = new a(j11);
    }

    @Override // io.branch.search.internal.InterfaceC3247l7
    public final void a(@NotNull InterfaceC3264m7 listener, boolean z11) {
        Intrinsics.g(listener, "listener");
        this.f65717b.a(this.f65716a, listener);
        if (z11) {
            Context context = this.f65716a;
            Intrinsics.g(context, "context");
            Companion.getClass();
            if (b.a(context)) {
                listener.b();
            } else {
                listener.a();
            }
        }
    }
}
