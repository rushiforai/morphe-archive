package io.branch.search.internal;

import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.AbstractC3491ze;
import io.branch.search.internal.C3378t3;
import io.branch.search.internal.P1;
import io.branch.search.internal.services.stub.android.AndroidBundleUpdateService;
import io.branch.search.internal.shared.BundleUpdateCompleteStatus;
import io.branch.search.internal.util.CorosKt;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.t3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3378t3 implements InterfaceC3490zd<C3429w3> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f65812a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3240l0 f65813b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final H f65814c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final P1 f65815d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final U2 f65816e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final H3 f65817f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final C3209j3 f65818g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final t70.j0 f65819h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public volatile InterfaceC3348r7 f65820i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f65821j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final Lazy f65822k;

    @DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController", f = "BundleUpdateController.kt", l = {109, 110}, m = "doStartJob")
    /* renamed from: io.branch.search.internal.t3$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3378t3 f65823a;

        /* renamed from: b, reason: collision with root package name */
        public C3429w3 f65824b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f65825c;

        /* renamed from: e, reason: collision with root package name */
        public int f65827e;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65825c = obj;
            this.f65827e |= Integer.MIN_VALUE;
            return C3378t3.this.a((String) null, (C3429w3) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController", f = "BundleUpdateController.kt", l = {179, 180}, m = "listenToGAIDUpdates")
    /* renamed from: io.branch.search.internal.t3$b */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3378t3 f65828a;

        /* renamed from: b, reason: collision with root package name */
        public String f65829b;

        /* renamed from: c, reason: collision with root package name */
        public C3429w3 f65830c;

        /* renamed from: d, reason: collision with root package name */
        public P1 f65831d;

        /* renamed from: e, reason: collision with root package name */
        public AtomicBoolean f65832e;

        /* renamed from: f, reason: collision with root package name */
        public /* synthetic */ Object f65833f;

        /* renamed from: h, reason: collision with root package name */
        public int f65835h;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65833f = obj;
            this.f65835h |= Integer.MIN_VALUE;
            return C3378t3.this.a((String) null, (C3429w3) null, (P1) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController$listenToGAIDUpdates$2", f = "BundleUpdateController.kt", l = {169}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.t3$c */
    public static final class c extends SuspendLambda implements Function2<v70.x, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65836a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65837b;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ P1 f65839d;

        /* renamed from: io.branch.search.internal.t3$c$a */
        public static final class a extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ C3378t3 f65840a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ P1 f65841b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(C3378t3 c3378t3, P1 p12) {
                super(0);
                this.f65840a = c3378t3;
                this.f65841b = p12;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                InterfaceC3348r7 interfaceC3348r7 = this.f65840a.f65820i;
                if (interfaceC3348r7 != null) {
                    this.f65841b.b(interfaceC3348r7);
                }
                this.f65840a.f65820i = null;
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(P1 p12, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f65839d = p12;
        }

        public static final void a(v70.x xVar, P1 p12) {
            ((v70.w) xVar).j(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            c cVar = C3378t3.this.new c(this.f65839d, continuation);
            cVar.f65837b = obj;
            return cVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((c) create((v70.x) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65836a;
            if (i5 == 0) {
                ResultKt.b(obj);
                final v70.x xVar = (v70.x) this.f65837b;
                C3378t3.this.f65820i = new InterfaceC3348r7() { // from class: z40.c
                    @Override // io.branch.search.internal.InterfaceC3348r7
                    public final void a(P1 p12) {
                        C3378t3.c.a(xVar, p12);
                    }
                };
                InterfaceC3348r7 interfaceC3348r7 = C3378t3.this.f65820i;
                if (interfaceC3348r7 != null) {
                    this.f65839d.a(interfaceC3348r7);
                }
                a aVar = new a(C3378t3.this, this.f65839d);
                this.f65836a = 1;
                if (v70.v.a(xVar, aVar, this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController$listenToGAIDUpdates$3", f = "BundleUpdateController.kt", l = {176}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.t3$d */
    public static final class d extends SuspendLambda implements Function2<Unit, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65842a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f65844c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ AtomicBoolean f65845d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ C3429w3 f65846e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ P1 f65847f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(String str, AtomicBoolean atomicBoolean, C3429w3 c3429w3, P1 p12, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f65844c = str;
            this.f65845d = atomicBoolean;
            this.f65846e = c3429w3;
            this.f65847f = p12;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3378t3.this.new d(this.f65844c, this.f65845d, this.f65846e, this.f65847f, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((d) create((Unit) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            Object objA;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65842a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3378t3 c3378t3 = C3378t3.this;
                String str = this.f65844c;
                AtomicBoolean atomicBoolean = this.f65845d;
                C3429w3 c3429w3 = this.f65846e;
                P1 p12 = this.f65847f;
                this.f65842a = 1;
                c3378t3.getClass();
                if (atomicBoolean.getAndSet(true)) {
                    objA = Unit.f71706a;
                } else {
                    InterfaceC3348r7 interfaceC3348r7 = c3378t3.f65820i;
                    if (interfaceC3348r7 != null) {
                        p12.b(interfaceC3348r7);
                    }
                    c3378t3.f65820i = null;
                    objA = c3378t3.a(str, c3429w3, this);
                    if (objA != coroutineSingletons) {
                        objA = Unit.f71706a;
                    }
                }
                if (objA == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.services.controllers.BundleUpdateController", f = "BundleUpdateController.kt", l = {Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE}, m = "onBundleUpdateComplete")
    /* renamed from: io.branch.search.internal.t3$e */
    public static final class e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3378t3 f65848a;

        /* renamed from: b, reason: collision with root package name */
        public boolean f65849b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f65850c;

        /* renamed from: e, reason: collision with root package name */
        public int f65852e;

        public e(Continuation<? super e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65850c = obj;
            this.f65852e |= Integer.MIN_VALUE;
            return C3378t3.this.a(false, 0L, (C3429w3) null, (Continuation<? super Boolean>) this);
        }
    }

    public C3378t3(@NotNull Context applicationContext, @NotNull C3240l0 analyticsSessionRepository, @NotNull I analyticalBufferRepository, @NotNull P1 branchConfiguration, @NotNull U2 serviceManager, @NotNull H3 cacheSystem, @NotNull C3209j3 bundleManager) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(serviceManager, "serviceManager");
        Intrinsics.g(cacheSystem, "cacheSystem");
        Intrinsics.g(bundleManager, "bundleManager");
        this.f65812a = applicationContext;
        this.f65813b = analyticsSessionRepository;
        this.f65814c = analyticalBufferRepository;
        this.f65815d = branchConfiguration;
        this.f65816e = serviceManager;
        this.f65817f = cacheSystem;
        this.f65818g = bundleManager;
        this.f65819h = t70.k0.a(new t70.i0("JobServiceWithMonitorScope").plus(t70.y0.f88884a).plus(t70.m0.d()).plus(CorosKt.a()));
        this.f65821j = new AtomicBoolean(false);
        this.f65822k = LazyKt.a(new C3361s3(this));
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x007c, code lost:
    
        if (r1.a(r2, r9, r5, r6) == r0) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, C3429w3 c3429w3, Continuation<? super Boolean> continuation) throws Throwable {
        a aVar;
        C3378t3 c3378t3;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f65827e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f65827e = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object objY = aVar2.f65825c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f65827e;
        if (i11 == 0) {
            ResultKt.b(objY);
            if (this.f65821j.getAndSet(true)) {
                this.f65814c.a(str, "BundleUpdateService.doStartJob", "attempted to start bundle download job, while the last one hasn't completed yet.");
                return Boolean.FALSE;
            }
            C3209j3 c3209j3 = this.f65818g;
            aVar2.f65823a = this;
            aVar2.f65824b = c3429w3;
            aVar2.f65827e = 1;
            C3188hf c3188hf = c3209j3.f64873g;
            objY = t70.m0.y(c3188hf.f64688a, new C3171gf(c3188hf, "io.branch.search", null), aVar2);
            if (objY != coroutineSingletons) {
                c3378t3 = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            return Boolean.TRUE;
        }
        c3429w3 = aVar2.f65824b;
        C3378t3 c3378t32 = aVar2.f65823a;
        ResultKt.b(objY);
        c3378t3 = c3378t32;
        C3429w3 c3429w32 = c3429w3;
        BundleUpdateCompleteStatus bundleUpdateCompleteStatus = (BundleUpdateCompleteStatus) objY;
        boolean success = bundleUpdateCompleteStatus.getSuccess();
        long bundleUpdateInterval = bundleUpdateCompleteStatus.getBundleUpdateInterval();
        aVar2.f65823a = null;
        aVar2.f65824b = null;
        aVar2.f65827e = 2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00c6, code lost:
    
        if (r15 == r8) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, C3429w3 c3429w3, P1 p12, Continuation<? super Boolean> continuation) throws Throwable {
        b bVar;
        C3429w3 c3429w32;
        C3378t3 c3378t3;
        String str2;
        AtomicBoolean atomicBoolean;
        Object objA;
        P1 p13 = p12;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f65835h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f65835h = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        b bVar2 = bVar;
        Object obj = bVar2.f65833f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f65835h;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (this.f65820i != null) {
                return Boolean.FALSE;
            }
            AtomicBoolean atomicBoolean2 = new AtomicBoolean(false);
            w70.u1.u(new cw.u0(10, new cw.y1(w70.u1.f(new c(p13, null)), 9), new d(str, atomicBoolean2, c3429w3, p13, null)), this.f65819h);
            bVar2.f65828a = this;
            bVar2.f65829b = str;
            c3429w32 = c3429w3;
            bVar2.f65830c = c3429w32;
            bVar2.f65831d = p13;
            bVar2.f65832e = atomicBoolean2;
            bVar2.f65835h = 1;
            if (t70.t0.b(5000L, bVar2) != coroutineSingletons) {
                c3378t3 = this;
                str2 = str;
                atomicBoolean = atomicBoolean2;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Boolean.TRUE;
        }
        atomicBoolean = bVar2.f65832e;
        P1 p14 = bVar2.f65831d;
        C3429w3 c3429w33 = bVar2.f65830c;
        String str3 = bVar2.f65829b;
        C3378t3 c3378t32 = bVar2.f65828a;
        ResultKt.b(obj);
        p13 = p14;
        c3378t3 = c3378t32;
        c3429w32 = c3429w33;
        str2 = str3;
        bVar2.f65828a = null;
        bVar2.f65829b = null;
        bVar2.f65830c = null;
        bVar2.f65831d = null;
        bVar2.f65832e = null;
        bVar2.f65835h = 2;
        c3378t3.getClass();
        if (atomicBoolean.getAndSet(true)) {
            objA = Unit.f71706a;
        } else {
            InterfaceC3348r7 interfaceC3348r7 = c3378t3.f65820i;
            if (interfaceC3348r7 != null) {
                p13.b(interfaceC3348r7);
            }
            c3378t3.f65820i = null;
            objA = c3378t3.a(str2, c3429w32, bVar2);
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, long j11, @NotNull C3429w3 c3429w3, @NotNull Continuation<? super Boolean> continuation) throws Throwable {
        e eVar;
        C3378t3 c3378t3;
        long j12;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f65852e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f65852e = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(continuation);
            }
        }
        Object obj = eVar.f65850c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f65852e;
        boolean z12 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            AbstractC3491ze abstractC3491ze = this.f65816e.f63416f.f62461g.get();
            Intrinsics.f(abstractC3491ze, "lastStateIsOffline.get()");
            boolean z13 = abstractC3491ze instanceof AbstractC3491ze.a;
            this.f65817f.a();
            C3309p1.a("BundleUpdateController", "onJobFinished: Success = " + z11 + " Backing off on failure = " + z13);
            this.f65821j.set(false);
            if (z11 || !z13) {
                EnumC3107d2.ON_BUNDLE_UPDATED.a();
                C3209j3 c3209j3 = this.f65818g;
                if (!c3429w3.f66206b) {
                    C3446x3 c3446x3 = (C3446x3) this.f65822k.getValue();
                    synchronized (c3446x3) {
                        j12 = c3446x3.f66255a.getLong("bundle_update_min_delay", 86400000L);
                    }
                    if (j12 == j11) {
                        eVar.f65848a = this;
                        eVar.f65849b = z11;
                        eVar.f65852e = 1;
                        C3188hf c3188hf = c3209j3.f64873g;
                        if (t70.m0.y(c3188hf.f64688a, new C3171gf(c3188hf, "io.branch.search", null), eVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        c3209j3.getClass();
                        t70.m0.u(EmptyCoroutineContext.f71803a, new C3226k3(c3209j3, j11, j11, true, null));
                    }
                    c3378t3 = this;
                }
                return Boolean.valueOf(z12);
            }
            z12 = false;
            return Boolean.valueOf(z12);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        z11 = eVar.f65849b;
        c3378t3 = eVar.f65848a;
        ResultKt.b(obj);
        if (z11) {
            C3446x3.Companion.a(c3378t3.f65812a).c();
        }
        return Boolean.valueOf(z12);
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Boolean a(F4 f42, Cd cd2, Exception exc) {
        C3240l0 c3240l0 = this.f65813b;
        c3240l0.getClass();
        String strB = c3240l0.f64939d.b("io.branch.search");
        this.f65814c.a(strB, AndroidBundleUpdateService.TAG, "start BundleUpdateService job error: " + exc);
        return Boolean.TRUE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00cf, code lost:
    
        if (r14 == r1) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00e4, code lost:
    
        if (r14 == r1) goto L39;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull C3429w3 c3429w3, @NotNull Continuation continuation) throws Throwable {
        C3395u3 c3395u3;
        C3429w3 c3429w32;
        String str;
        C3378t3 c3378t3;
        if (continuation instanceof C3395u3) {
            c3395u3 = (C3395u3) continuation;
            int i5 = c3395u3.f65988f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3395u3.f65988f = i5 - Integer.MIN_VALUE;
            } else {
                c3395u3 = new C3395u3(this, continuation);
            }
        }
        Object objA = c3395u3.f65986d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3395u3.f65988f;
        if (i11 == 0) {
            ResultKt.b(objA);
            StringBuilder sb2 = new StringBuilder("Starting BundleUpdateService on ");
            new F4(this.f65812a);
            sb2.append(F4.c());
            C3309p1.b("BundleUpdateController", sb2.toString());
            if (c3429w3.f66205a == 1131036410) {
                C3309p1.a("BundleUpdateController", "Immediately ending old bundle job");
                return Boolean.FALSE;
            }
            C3240l0 c3240l0 = this.f65813b;
            c3240l0.getClass();
            String strB = c3240l0.f64939d.b("io.branch.search");
            C3209j3 c3209j3 = this.f65818g;
            c3395u3.f65983a = this;
            c3395u3.f65984b = c3429w3;
            c3395u3.f65985c = strB;
            c3395u3.f65988f = 1;
            Object objA2 = c3209j3.a(c3395u3);
            if (objA2 != coroutineSingletons) {
                c3429w32 = c3429w3;
                str = strB;
                objA = objA2;
                c3378t3 = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 == 3) {
                    ResultKt.b(objA);
                    return Boolean.valueOf(!((Boolean) objA).booleanValue());
                }
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            Boolean bool = (Boolean) objA;
            bool.booleanValue();
            return bool;
        }
        str = c3395u3.f65985c;
        c3429w32 = c3395u3.f65984b;
        c3378t3 = c3395u3.f65983a;
        ResultKt.b(objA);
        if (((Number) objA).longValue() != 0) {
            C3309p1.a("BundleUpdateController", "Skip job execution, since job was already executed in defined interval");
            return Boolean.valueOf(c3429w32.f66206b);
        }
        c3378t3.f65815d.getClass();
        if (c3378t3.f65815d.f63038e == null) {
            C3309p1.a("BundleUpdateController", "GAID is null, fetch GAID, listen for completion, in case of error, timeout after GAID_WAIT_TIMEOUT_MILLIS and start the update job anyway (results will be inferior though).");
            P1 p12 = c3378t3.f65815d;
            c3395u3.f65983a = null;
            c3395u3.f65984b = null;
            c3395u3.f65985c = null;
            c3395u3.f65988f = 2;
            objA = c3378t3.a(str, c3429w32, p12, c3395u3);
        } else {
            c3395u3.f65983a = null;
            c3395u3.f65984b = null;
            c3395u3.f65985c = null;
            c3395u3.f65988f = 3;
            objA = c3378t3.a(str, c3429w32, c3395u3);
        }
        return coroutineSingletons;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final /* bridge */ /* synthetic */ Object a(F4 f42, Cd cd2, Continuation continuation) {
        return a((C3429w3) cd2, continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final void a(F4 contextDelegate, Cd cd2) {
        C3429w3 request = (C3429w3) cd2;
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(request, "request");
        InterfaceC3348r7 interfaceC3348r7 = this.f65820i;
        if (interfaceC3348r7 != null) {
            this.f65815d.b(interfaceC3348r7);
        }
    }
}
