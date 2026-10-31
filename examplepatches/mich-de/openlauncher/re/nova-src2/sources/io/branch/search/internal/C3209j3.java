package io.branch.search.internal;

import android.content.Context;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteFullException;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.C3446x3;
import io.branch.search.internal.shared.BranchAndroidDependentUtilsKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.j3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3209j3 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f64867a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3454xb f64868b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3193i3 f64869c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f64870d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Q7 f64871e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final InterfaceC3164g8 f64872f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final C3188hf f64873g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64874h;

    @DebugMetadata(c = "io.branch.search.internal.bundle.BundleManager", f = "BundleManager.kt", l = {106}, m = "getTimeLeftToReachScheduledBundleJob")
    /* renamed from: io.branch.search.internal.j3$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3209j3 f64875a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f64876b;

        /* renamed from: d, reason: collision with root package name */
        public int f64878d;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64876b = obj;
            this.f64878d |= Integer.MIN_VALUE;
            return C3209j3.this.a(this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.bundle.BundleManager$initializeBundle$1", f = "BundleManager.kt", l = {45, 43}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.j3$b */
    public static final class b extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Q7 f64879a;

        /* renamed from: b, reason: collision with root package name */
        public Context f64880b;

        /* renamed from: c, reason: collision with root package name */
        public int f64881c;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3209j3.this.new b(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3209j3.this.new b((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:26:0x0090, code lost:
        
            if (r11 == r0) goto L27;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            Q7 q72;
            Context context;
            boolean zB0;
            Object objA;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64881c;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3209j3 c3209j3 = C3209j3.this;
                q72 = c3209j3.f64871e;
                context = c3209j3.f64867a.f62438a;
                this.f64879a = q72;
                this.f64880b = context;
                this.f64881c = 1;
                obj = c3209j3.a(this);
                if (obj != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            context = this.f64880b;
            q72 = this.f64879a;
            ResultKt.b(obj);
            long jLongValue = ((Number) obj).longValue();
            this.f64879a = null;
            this.f64880b = null;
            this.f64881c = 2;
            C3446x3.a aVar = C3446x3.Companion;
            Context context2 = q72.f63212a;
            String version = BranchAndroidDependentUtilsKt.getSDKVersion();
            synchronized (aVar) {
                Intrinsics.g(context2, "context");
                Intrinsics.g(version, "version");
                zB0 = r70.j.B0(aVar.a(context2).f66255a.getString("CURR_SDK_VERSION", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), version, false);
            }
            if (zB0) {
                objA = q72.a(false, jLongValue, this);
                if (objA != coroutineSingletons) {
                    objA = Unit.f71706a;
                }
            } else {
                aVar.a(context).a();
                aVar.a(context, BranchAndroidDependentUtilsKt.getSDKVersion());
                objA = q72.a(true, jLongValue, this);
                if (objA != coroutineSingletons) {
                    objA = Unit.f71706a;
                }
            }
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.bundle.BundleManager$scheduleBundleUpdateIfDbWasCompromise$1", f = "BundleManager.kt", l = {63}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.j3$c */
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64883a;

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3209j3.this.new c(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3209j3.this.new c((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            boolean z11;
            boolean z12;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64883a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3446x3 c3446x3A = C3446x3.Companion.a(C3209j3.this.f64867a.f62438a);
                synchronized (c3446x3A) {
                    z11 = false;
                    z12 = c3446x3A.f66255a.getBoolean("KEY_REMOTE_BUNDLE", false);
                }
                if (z12) {
                    C3454xb c3454xb = C3209j3.this.f64868b;
                    c3454xb.getClass();
                    C3352rb c3352rb = c3454xb.f66278b;
                    Be storageMonitor = c3454xb.f66279c;
                    Intrinsics.g(c3352rb, "<this>");
                    Intrinsics.g(storageMonitor, "storageMonitor");
                    try {
                        c3352rb.a(new C3369sb(c3352rb));
                        z11 = true;
                    } catch (SQLiteDatabaseCorruptException e3) {
                        C3296o5.a(c3352rb.f65633c + ".isDatabaseIntegrityOk", e3, "Exception: ");
                    } catch (SQLiteDiskIOException e11) {
                        storageMonitor.a();
                        C3296o5.a(c3352rb.f65633c + ".isDatabaseIntegrityOk", e11, "Exception: ");
                    } catch (SQLiteFullException e12) {
                        storageMonitor.a();
                        C3296o5.a(c3352rb.f65633c + ".isDatabaseIntegrityOk", e12, "Exception: ");
                    }
                    Boolean boolValueOf = Boolean.valueOf(z11);
                    Pair pair = new Pair(c3352rb, boolValueOf);
                    try {
                        if (!boolValueOf.booleanValue()) {
                            c3352rb = null;
                        }
                        if (Intrinsics.b(c3352rb, c3454xb.a(c3352rb))) {
                            c3352rb = null;
                        }
                    } catch (Throwable th2) {
                        c3454xb.a();
                        c3352rb = ((Boolean) pair.f71684b).booleanValue() ? (C3352rb) pair.f71683a : null;
                        C3296o5.a aVar = C3296o5.f65426a;
                        C3296o5.a(new F6("RawSqliteState.wasCompromised", "Unable to initialize statements", null, th2, null));
                    }
                    C3352rb c3352rb2 = !((Boolean) pair.f71684b).booleanValue() ? (C3352rb) pair.f71683a : null;
                    if (c3352rb2 != null) {
                        c3352rb = c3352rb2;
                    }
                    if (c3352rb != null) {
                        String dbName = c3352rb.f65633c;
                        Intrinsics.g(dbName, "dbName");
                        C3352rb c3352rb3 = Intrinsics.b(c3454xb.f66278b.f65634d, dbName) ? c3454xb.f66278b : null;
                        if (c3352rb3 == null) {
                            c3454xb.f66284h.deleteDatabase(dbName);
                        } else {
                            try {
                                c3352rb3.f65631a.f65567a.l();
                            } catch (IllegalStateException e13) {
                                C3296o5.a aVar2 = C3296o5.f65426a;
                                C3296o5.a(new F6("RawSqliteState.delete", "failed to close db prior to deletion.", null, e13, null));
                            }
                        }
                    }
                    if (c3352rb != null) {
                        String strM = b.c0.m("DB RECOVERY: integrity check failed: ", c3352rb2 != null ? c3352rb2.f65634d : null, ", preload query failed: ", c3352rb.f65634d);
                        C3296o5.a aVar3 = C3296o5.f65426a;
                        C3296o5.a(new F6("io.branch.search", "RawSqliteState.wasCompromised", strM, null));
                        InterfaceC3164g8 interfaceC3164g8 = C3209j3.this.f64872f;
                        this.f64883a = 1;
                        if (interfaceC3164g8.a(this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
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

    public C3209j3(@NotNull F4 contextDelegate, @NotNull C3454xb state, @NotNull C3193i3 bundleJobScheduleRepository, @NotNull C3277n3 bundleRepository, @NotNull C3261m4 clock, @NotNull Q7 initializeBundleCommand, @NotNull InterfaceC3164g8 jobManager, @NotNull C3188hf updateBundleUseCase, @NotNull t70.c0 ioDispatcher, @NotNull t70.j0 coroutineScope) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(state, "state");
        Intrinsics.g(bundleJobScheduleRepository, "bundleJobScheduleRepository");
        Intrinsics.g(bundleRepository, "bundleRepository");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(initializeBundleCommand, "initializeBundleCommand");
        Intrinsics.g(jobManager, "jobManager");
        Intrinsics.g(updateBundleUseCase, "updateBundleUseCase");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f64867a = contextDelegate;
        this.f64868b = state;
        this.f64869c = bundleJobScheduleRepository;
        this.f64870d = clock;
        this.f64871e = initializeBundleCommand;
        this.f64872f = jobManager;
        this.f64873g = updateBundleUseCase;
        this.f64874h = coroutineScope;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Continuation<? super Long> continuation) {
        a aVar;
        C3209j3 c3209j3;
        long j11;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f64878d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f64878d = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object objA = aVar.f64876b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f64878d;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3193i3 c3193i3 = this.f64869c;
            aVar.f64875a = this;
            aVar.f64878d = 1;
            objA = c3193i3.a(aVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3209j3 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3209j3 = aVar.f64875a;
            ResultKt.b(objA);
        }
        Bc bc2 = (Bc) objA;
        if (bc2 != null) {
            long j12 = bc2.f62149a;
            long j13 = bc2.f62150b;
            long currentTimeMillis = c3209j3.f64870d.getCurrentTimeMillis();
            long j14 = j12 + j13;
            j11 = j14 > currentTimeMillis ? j14 - currentTimeMillis : 0L;
        }
        return new Long(j11);
    }

    public final void b() {
        t70.m0.t(this.f64874h, null, null, new c(null), 3);
    }

    public final void a() {
        t70.m0.t(this.f64874h, null, null, new b(null), 3);
    }
}
