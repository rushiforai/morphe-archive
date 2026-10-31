package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.AbstractC3491ze;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.random.Random;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class F9 implements InterfaceC3264m7, InterfaceC3467y7, InterfaceC3399u7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: j, reason: collision with root package name */
    public static final long f62452j;

    /* renamed from: k, reason: collision with root package name */
    public static final long f62453k;

    /* renamed from: l, reason: collision with root package name */
    public static final long f62454l;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f62455a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final y40.m f62456b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Function0<C3282n8> f62457c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final InterfaceC3247l7 f62458d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3450x7 f62459e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final InterfaceC3382t7 f62460f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AtomicReference<AbstractC3491ze> f62461g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public InterfaceC3416v7 f62462h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f62463i;

    public static final class a {
    }

    public /* synthetic */ class b {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f62464a;

        static {
            int[] iArr = new int[y40.m.values().length];
            iArr[2] = 1;
            iArr[1] = 2;
            f62464a = iArr;
        }
    }

    static {
        TimeUnit timeUnit = TimeUnit.HOURS;
        Random.f71890a.getClass();
        f62452j = timeUnit.toMillis(24 - Random.f71891b.f(4));
        f62453k = timeUnit.toMillis(8L);
        f62454l = TimeUnit.DAYS.toMillis(365L) * 10;
    }

    public /* synthetic */ F9(Context context, y40.m mVar, Function0 function0) {
        this(context, mVar, function0, new C3359s1(context), new Zc(context), new O5(context));
    }

    public static AbstractC3491ze a(F9 f92, boolean z11, boolean z12, boolean z13, boolean z14, int i5) {
        if ((i5 & 1) != 0) {
            z11 = f92.f62458d.a(f92.f62455a);
        }
        if ((i5 & 2) != 0) {
            z12 = f92.f62459e.a(f92.f62455a);
        }
        if ((i5 & 4) != 0) {
            z13 = f92.f62460f.a(f92.f62455a);
        }
        boolean z15 = (i5 & 8) != 0 ? false : z14;
        if (!f92.f62463i) {
            return new AbstractC3491ze.a(f62454l, 0L, 0L, z15, 14);
        }
        int i11 = b.f62464a[f92.f62456b.ordinal()];
        return i11 != 1 ? i11 != 2 ? new AbstractC3491ze.b(false) : z13 ? new AbstractC3491ze.a(((C3282n8) f92.f62457c.invoke()).B, f62452j, f62453k, z15, 8) : new AbstractC3491ze.b(false) : (z11 || z12) ? new AbstractC3491ze.b(false) : new AbstractC3491ze.a(((C3282n8) f92.f62457c.invoke()).B, 0L, 0L, z15, 14);
    }

    @Override // io.branch.search.internal.InterfaceC3264m7
    public final void b() {
        a(true, a(this, true, false, false, false, 14));
    }

    @Override // io.branch.search.internal.InterfaceC3399u7
    public final void c() {
        a(true, a(this, false, false, false, false, 11));
    }

    @Override // io.branch.search.internal.InterfaceC3467y7
    public final void d() {
        a(true, a(this, false, true, false, false, 13));
    }

    @Override // io.branch.search.internal.InterfaceC3399u7
    public final void e() {
        a(true, a(this, false, false, true, false, 11));
    }

    @Override // io.branch.search.internal.InterfaceC3467y7
    public final void f() {
        a(true, a(this, false, false, false, false, 13));
    }

    @JvmOverloads
    public F9(@NotNull Context context, @NotNull y40.m jobPolicy, @NotNull Function0<C3282n8> remoteConfigProvider, @NotNull InterfaceC3247l7 batteryStateMonitor, @NotNull InterfaceC3450x7 screenStateMonitor, @NotNull InterfaceC3382t7 idleStateMonitor) {
        Intrinsics.g(context, "context");
        Intrinsics.g(jobPolicy, "jobPolicy");
        Intrinsics.g(remoteConfigProvider, "remoteConfigProvider");
        Intrinsics.g(batteryStateMonitor, "batteryStateMonitor");
        Intrinsics.g(screenStateMonitor, "screenStateMonitor");
        Intrinsics.g(idleStateMonitor, "idleStateMonitor");
        this.f62455a = context;
        this.f62456b = jobPolicy;
        this.f62457c = remoteConfigProvider;
        this.f62458d = batteryStateMonitor;
        this.f62459e = screenStateMonitor;
        this.f62460f = idleStateMonitor;
        AtomicReference<AbstractC3491ze> atomicReference = new AtomicReference<>();
        this.f62461g = atomicReference;
        this.f62463i = true;
        atomicReference.set(a(this, false, false, false, false, 15));
        int i5 = b.f62464a[jobPolicy.ordinal()];
        if (i5 == 1) {
            batteryStateMonitor.a(this, true);
            screenStateMonitor.a(this, true, (2 & 4) != 0);
        } else {
            if (i5 != 2) {
                return;
            }
            idleStateMonitor.a(this, true);
            screenStateMonitor.a(this, true, (2 & 4) != 0);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3264m7
    public final void a() {
        a(true, a(this, false, false, false, false, 14));
    }

    public final void a(@NotNull InterfaceC3416v7 listener, boolean z11) {
        Intrinsics.g(listener, "listener");
        this.f62462h = listener;
        if (z11) {
            a(false, a(this, false, false, false, false, 15));
        }
    }

    public final void a(boolean z11, AbstractC3491ze abstractC3491ze) {
        if (z11) {
            Class<?> cls = this.f62461g.get().getClass();
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            if (!Intrinsics.b(reflectionFactory.getOrCreateKotlinClass(cls), reflectionFactory.getOrCreateKotlinClass(abstractC3491ze.getClass()))) {
                this.f62461g.set(abstractC3491ze);
                Objects.toString(this.f62461g.get());
                InterfaceC3416v7 interfaceC3416v7 = this.f62462h;
                if (interfaceC3416v7 != null) {
                    AbstractC3491ze abstractC3491ze2 = this.f62461g.get();
                    Intrinsics.f(abstractC3491ze2, "lastStateIsOffline.get()");
                    interfaceC3416v7.a(abstractC3491ze2);
                    return;
                }
                return;
            }
            Objects.toString(this.f62461g.get());
            return;
        }
        this.f62461g.set(abstractC3491ze);
        Objects.toString(this.f62461g.get());
        InterfaceC3416v7 interfaceC3416v72 = this.f62462h;
        if (interfaceC3416v72 != null) {
            AbstractC3491ze abstractC3491ze3 = this.f62461g.get();
            Intrinsics.f(abstractC3491ze3, "lastStateIsOffline.get()");
            interfaceC3416v72.a(abstractC3491ze3);
        }
    }
}
