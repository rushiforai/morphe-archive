package io.branch.search.internal;

import android.app.usage.UsageStatsManager;
import android.content.Context;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.SlidingWindowKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class I0 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f62640a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f62641b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final F2 f62642c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final N0 f62643d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3269mc f62644e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62645f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f62646g;

    public static final class a {
        @JvmStatic
        @NotNull
        public static O0 a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            int iD = new F4(context).d();
            int iCheckCallingOrSelfPermission = 0;
            boolean z11 = (iD == 2 || iD == 1) ? false : true;
            boolean z12 = iD == 3;
            if (z12) {
                iCheckCallingOrSelfPermission = context.checkCallingOrSelfPermission("android.permission.PACKAGE_USAGE_STATS");
            } else if (!z11) {
                iCheckCallingOrSelfPermission = -1;
            }
            return new O0(z11, z12, iCheckCallingOrSelfPermission);
        }
    }

    public static final class b extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public static final b f62647a = new b();

        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return "Skipping — update is already in progress";
        }
    }

    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public static final c f62648a = new c();

        public c() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return "Starting update";
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.local.appUsage.AppUsageMonitor$updateSynchronously$3", f = "AppUsageMonitor.kt", l = {89}, m = "invokeSuspend")
    public static final class d extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f62649a;

        public d(Continuation<? super d> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return I0.this.new d(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return I0.this.new d((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f62649a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3269mc c3269mc = I0.this.f62644e;
                this.f62649a = 1;
                if (c3269mc.b(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    public static final class e extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public static final e f62651a = new e();

        public e() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return "Finished update";
        }
    }

    @JvmOverloads
    public I0(@NotNull Context context, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull N0 appUsageRepository, @NotNull C3269mc ssml, @NotNull t70.j0 scope) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(appUsageRepository, "appUsageRepository");
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(scope, "scope");
        this.f62640a = context;
        this.f62641b = branchConfiguration;
        this.f62642c = remoteConfigManager;
        this.f62643d = appUsageRepository;
        this.f62644e = ssml;
        this.f62645f = scope;
        this.f62646g = new AtomicBoolean();
    }

    public final void a() {
        this.f62641b.getClass();
        Context context = this.f62640a;
        Intrinsics.g(context, "context");
        Companion.getClass();
        if (a.a(context).f62999a) {
            if (this.f62646g.getAndSet(true)) {
                C3309p1.a(EnumC3131e9.AppUsage, b.f62647a);
                return;
            }
            EnumC3131e9 enumC3131e9 = EnumC3131e9.AppUsage;
            C3309p1.a(enumC3131e9, c.f62648a);
            try {
                long jCurrentTimeMillis = System.currentTimeMillis();
                long j11 = this.f62643d.f62952c.get();
                Set setN1 = b70.g.N1(this.f62642c.a().f65376s);
                Object systemService = this.f62640a.getSystemService("usagestats");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.usage.UsageStatsManager");
                K0 k02 = new K0(new C3255lf((UsageStatsManager) systemService, C3238kf.f64934a), setN1);
                final SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1 sequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1 = new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new L0(j11, jCurrentTimeMillis, 3600000L, k02, null));
                SlidingWindowKt.a(100, 100);
                this.f62643d.a(new Sequence<List<Object>>() { // from class: kotlin.collections.SlidingWindowKt$windowedSequence$$inlined$Sequence$1
                    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
                    @Override // kotlin.sequences.Sequence
                    /* renamed from: iterator */
                    public final Iterator getF71970a() {
                        return SlidingWindowKt.b(u90.b.O(sequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1.f71969a), 100, 100);
                    }
                }, new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new M0(k02, null)), jCurrentTimeMillis);
                t70.m0.u(EmptyCoroutineContext.f71803a, new d(null));
                EnumC3107d2.ON_APP_USAGE_UPDATED.a();
                this.f62646g.set(false);
                C3309p1.a(enumC3131e9, e.f62651a);
            } catch (Throwable th2) {
                this.f62646g.set(false);
                C3309p1.a(EnumC3131e9.AppUsage, e.f62651a);
                throw th2;
            }
        }
    }
}
