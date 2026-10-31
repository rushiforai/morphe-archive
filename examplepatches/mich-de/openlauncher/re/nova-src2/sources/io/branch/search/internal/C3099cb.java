package io.branch.search.internal;

import android.util.Log;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.C4;
import io.branch.search.internal.E2;
import io.branch.search.internal.Pa;
import io.branch.search.ui.ClickInfo;
import io.branch.search.ui.ImpressionInfo;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.cb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3099cb implements y40.p, InterfaceC3445x2 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final E2.d f64108e;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.r f64109a;

    /* renamed from: b, reason: collision with root package name */
    public final long f64110b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64111c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final X3<C3411v2> f64112d;

    /* renamed from: io.branch.search.internal.cb$a */
    public static final class a {
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$activate$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$b */
    public static final class b extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64113a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            b bVar = new b(continuation);
            bVar.f64113a = obj;
            return bVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            b bVar = new b((Continuation) obj2);
            bVar.f64113a = (C3411v2) obj;
            return bVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64113a).f66086e.a(true);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$appStoreRequest$1", f = "PreInitClient.kt", l = {152}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$c */
    public static final class c extends SuspendLambda implements Function2<y40.c, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64114a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f64115b;

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$appStoreRequest$1$1$1", f = "PreInitClient.kt", l = {156}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$c$a */
        public static final class a extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64117a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f64118b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64119c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ y40.c f64120d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public a(Continuation<? super y40.w> continuation, y40.c cVar, Continuation<? super a> continuation2) {
                super(2, continuation2);
                this.f64119c = continuation;
                this.f64120d = cVar;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f64119c, this.f64120d, continuation);
                aVar.f64118b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((a) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                Continuation<y40.w> continuation;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64117a;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        C3411v2 c3411v2 = (C3411v2) this.f64118b;
                        Continuation<y40.w> continuation2 = this.f64119c;
                        int i11 = Result.f71687b;
                        InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                        y40.c cVar = this.f64120d;
                        this.f64118b = continuation2;
                        this.f64117a = 1;
                        obj = interfaceC3227k4.a("io.branch.search", cVar, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        continuation = continuation2;
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        continuation = (Continuation) this.f64118b;
                        ResultKt.b(obj);
                    }
                    int i12 = Result.f71687b;
                    continuation.resumeWith(obj);
                } catch (Throwable th2) {
                    Continuation<y40.w> continuation3 = this.f64119c;
                    int i13 = Result.f71687b;
                    y40.v vVar = y40.w.Companion;
                    EmptyList emptyList = EmptyList.f71733a;
                    E2.Companion.getClass();
                    continuation3.resumeWith(y40.v.b(vVar, emptyList, E2.b.a(th2)));
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$appStoreRequest$1$1$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$c$b */
        public static final class b extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64121a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public b(Continuation<? super y40.w> continuation, Continuation<? super b> continuation2) {
                super(1, continuation2);
                this.f64121a = continuation;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new b(this.f64121a, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new b(this.f64121a, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Continuation<y40.w> continuation = this.f64121a;
                int i5 = Result.f71687b;
                continuation.resumeWith(y40.v.b(y40.w.Companion, EmptyList.f71733a, C3099cb.f64108e));
                return Unit.f71706a;
            }
        }

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            c cVar = C3099cb.this.new c(continuation);
            cVar.f64115b = obj;
            return cVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            c cVar = C3099cb.this.new c((Continuation) obj2);
            cVar.f64115b = (y40.c) obj;
            return cVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64114a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.c cVar = (y40.c) this.f64115b;
            C3099cb c3099cb = C3099cb.this;
            this.f64115b = cVar;
            this.f64114a = 1;
            SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(this));
            c3099cb.f64112d.a(new a(safeContinuation, cVar, null), new b(safeContinuation, null));
            Object objC = safeContinuation.c();
            return objC == coroutineSingletons ? coroutineSingletons : objC;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$autoSuggestRequest$1", f = "PreInitClient.kt", l = {Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$d */
    public static final class d extends SuspendLambda implements Function2<y40.e, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64122a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f64123b;

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$autoSuggestRequest$1$1$1", f = "PreInitClient.kt", l = {Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$d$a */
        public static final class a extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64125a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f64126b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64127c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ y40.e f64128d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public a(Continuation<? super y40.w> continuation, y40.e eVar, Continuation<? super a> continuation2) {
                super(2, continuation2);
                this.f64127c = continuation;
                this.f64128d = eVar;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f64127c, this.f64128d, continuation);
                aVar.f64126b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((a) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                Continuation<y40.w> continuation;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64125a;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        C3411v2 c3411v2 = (C3411v2) this.f64126b;
                        Continuation<y40.w> continuation2 = this.f64127c;
                        int i11 = Result.f71687b;
                        InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                        y40.e eVar = this.f64128d;
                        this.f64126b = continuation2;
                        this.f64125a = 1;
                        obj = interfaceC3227k4.a("io.branch.search", eVar, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        continuation = continuation2;
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        continuation = (Continuation) this.f64126b;
                        ResultKt.b(obj);
                    }
                    int i12 = Result.f71687b;
                    continuation.resumeWith(obj);
                } catch (Throwable th2) {
                    Continuation<y40.w> continuation3 = this.f64127c;
                    int i13 = Result.f71687b;
                    y40.v vVar = y40.w.Companion;
                    EmptyList emptyList = EmptyList.f71733a;
                    E2.Companion.getClass();
                    continuation3.resumeWith(y40.v.b(vVar, emptyList, E2.b.a(th2)));
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$autoSuggestRequest$1$1$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$d$b */
        public static final class b extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64129a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public b(Continuation<? super y40.w> continuation, Continuation<? super b> continuation2) {
                super(1, continuation2);
                this.f64129a = continuation;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new b(this.f64129a, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new b(this.f64129a, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Continuation<y40.w> continuation = this.f64129a;
                int i5 = Result.f71687b;
                continuation.resumeWith(y40.v.b(y40.w.Companion, EmptyList.f71733a, C3099cb.f64108e));
                return Unit.f71706a;
            }
        }

        public d(Continuation<? super d> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            d dVar = C3099cb.this.new d(continuation);
            dVar.f64123b = obj;
            return dVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            d dVar = C3099cb.this.new d((Continuation) obj2);
            dVar.f64123b = (y40.e) obj;
            return dVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64122a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.e eVar = (y40.e) this.f64123b;
            C3099cb c3099cb = C3099cb.this;
            this.f64123b = eVar;
            this.f64122a = 1;
            SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(this));
            c3099cb.f64112d.a(new a(safeContinuation, eVar, null), new b(safeContinuation, null));
            Object objC = safeContinuation.c();
            return objC == coroutineSingletons ? coroutineSingletons : objC;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$clearLocalDrawableCache$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$e */
    public static final class e extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64130a;

        public e(Continuation<? super e> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            e eVar = new e(continuation);
            eVar.f64130a = obj;
            return eVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            e eVar = new e((Continuation) obj2);
            eVar.f64130a = (C3411v2) obj;
            return eVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64130a).getClass();
            Log.e("Branch", "BranchNavigatorClient.clearLocalDrawableCache is deprecated and no-ops");
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$deactivate$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$f */
    public static final class f extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64131a;

        public f(Continuation<? super f> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            f fVar = new f(continuation);
            fVar.f64131a = obj;
            return fVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            f fVar = new f((Continuation) obj2);
            fVar.f64131a = (C3411v2) obj;
            return fVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64131a).f66086e.a(false);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$job$1", f = "PreInitClient.kt", l = {48, 54, 57}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$g */
    public static final class g extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64132a;

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$job$1$createdClient$1", f = "PreInitClient.kt", l = {49}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$g$a */
        public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super C3411v2>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64134a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ C3099cb f64135b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(C3099cb c3099cb, Continuation<? super a> continuation) {
                super(2, continuation);
                this.f64135b = c3099cb;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new a(this.f64135b, continuation);
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return new a(this.f64135b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64134a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                t70.r rVar = this.f64135b.f64109a;
                this.f64134a = 1;
                Object objL = rVar.l(this);
                return objL == coroutineSingletons ? coroutineSingletons : objL;
            }
        }

        public g(Continuation<? super g> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3099cb.this.new g(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3099cb.this.new g((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:18:0x0076, code lost:
        
            if (r9.a(r8) == r0) goto L24;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x0086, code lost:
        
            if (r1.a(r9, r8) == r0) goto L24;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64132a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3099cb c3099cb = C3099cb.this;
                long j11 = c3099cb.f64110b;
                a aVar = new a(c3099cb, null);
                this.f64132a = 1;
                obj = t70.p2.d(j11, aVar, this);
                if (obj != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 == 2) {
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                if (i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            C3411v2 c3411v2 = (C3411v2) obj;
            X3<C3411v2> x32 = C3099cb.this.f64112d;
            x32.getClass();
            t70.m0.u(EmptyCoroutineContext.f71803a, new Y3(x32, null));
            if (c3411v2 == null) {
                String msg = a2.c.i(C3099cb.this.f64110b, " ms.", new StringBuilder("Client creation timed out after "));
                C3309p1 c3309p1 = C3309p1.f65465a;
                Intrinsics.g(msg, "msg");
                C3309p1.a(a50.b.f403d, "PreInitClient", msg, (Throwable) null);
                X3<C3411v2> x33 = C3099cb.this.f64112d;
                this.f64132a = 2;
            } else {
                X3<C3411v2> x34 = C3099cb.this.f64112d;
                this.f64132a = 3;
            }
            return coroutineSingletons;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$markPackageIgnored$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$h */
    public static final class h extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64136a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f64137b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ y40.n f64138c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long[] f64139d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(String str, y40.n nVar, long[] jArr, Continuation<? super h> continuation) {
            super(2, continuation);
            this.f64137b = str;
            this.f64139d = jArr;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            h hVar = new h(this.f64137b, null, this.f64139d, continuation);
            hVar.f64136a = obj;
            return hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((h) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64136a).markPackageIgnored(this.f64137b, null, this.f64139d);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$markPackageIgnored$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$i */
    public static final class i extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ y40.n f64140a;

        public i(y40.n nVar, Continuation<? super i> continuation) {
            super(1, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
            return new i(null, continuation);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            return new i(null, (Continuation) obj).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            y40.v.b(y40.w.Companion, Boolean.FALSE, C3099cb.f64108e);
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$onClicked$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$j */
    public static final class j extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64141a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ ClickInfo f64142b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(ClickInfo clickInfo, Continuation<? super j> continuation) {
            super(2, continuation);
            this.f64142b = clickInfo;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            j jVar = new j(this.f64142b, continuation);
            jVar.f64141a = obj;
            return jVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            j jVar = new j(this.f64142b, (Continuation) obj2);
            jVar.f64141a = (C3411v2) obj;
            return jVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64141a).onClicked(this.f64142b);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$onImpressed$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$k */
    public static final class k extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64143a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ ImpressionInfo f64144b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(ImpressionInfo impressionInfo, Continuation<? super k> continuation) {
            super(2, continuation);
            this.f64144b = impressionInfo;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            k kVar = new k(this.f64144b, continuation);
            kVar.f64143a = obj;
            return kVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            k kVar = new k(this.f64144b, (Continuation) obj2);
            kVar.f64143a = (C3411v2) obj;
            return kVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64143a).onImpressed(this.f64144b);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$optIntoTracking$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$l */
    public static final class l extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64145a;

        public l(Continuation<? super l> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            l lVar = new l(continuation);
            lVar.f64145a = obj;
            return lVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            l lVar = new l((Continuation) obj2);
            lVar.f64145a = (C3411v2) obj;
            return lVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64145a).optIntoTracking();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$optOutOfTracking$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$m */
    public static final class m extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64146a;

        public m(Continuation<? super m> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            m mVar = new m(continuation);
            mVar.f64146a = obj;
            return mVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            m mVar = new m((Continuation) obj2);
            mVar.f64146a = (C3411v2) obj;
            return mVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64146a).optOutOfTracking();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$recordOpenMetadata$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$n */
    public static final class n extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64147a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C4.j.b f64148b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public n(C4.j.b bVar, Continuation<? super n> continuation) {
            super(2, continuation);
            this.f64148b = bVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            n nVar = new n(this.f64148b, continuation);
            nVar.f64147a = obj;
            return nVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            n nVar = new n(this.f64148b, (Continuation) obj2);
            nVar.f64147a = (C3411v2) obj;
            return nVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64147a).a(this.f64148b);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$searchRequest$1", f = "PreInitClient.kt", l = {86}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$o */
    public static final class o extends SuspendLambda implements Function2<y40.b0, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64149a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f64150b;

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$searchRequest$1$1$1", f = "PreInitClient.kt", l = {90}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$o$a */
        public static final class a extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64152a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f64153b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64154c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ y40.b0 f64155d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public a(Continuation<? super y40.w> continuation, y40.b0 b0Var, Continuation<? super a> continuation2) {
                super(2, continuation2);
                this.f64154c = continuation;
                this.f64155d = b0Var;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f64154c, this.f64155d, continuation);
                aVar.f64153b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((a) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                Continuation<y40.w> continuation;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64152a;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        C3411v2 c3411v2 = (C3411v2) this.f64153b;
                        Continuation<y40.w> continuation2 = this.f64154c;
                        int i11 = Result.f71687b;
                        InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                        y40.b0 b0Var = this.f64155d;
                        this.f64153b = continuation2;
                        this.f64152a = 1;
                        obj = interfaceC3227k4.a("io.branch.search", b0Var, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        continuation = continuation2;
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        continuation = (Continuation) this.f64153b;
                        ResultKt.b(obj);
                    }
                    int i12 = Result.f71687b;
                    continuation.resumeWith(obj);
                } catch (Throwable th2) {
                    Continuation<y40.w> continuation3 = this.f64154c;
                    int i13 = Result.f71687b;
                    y40.v vVar = y40.w.Companion;
                    EmptyList emptyList = EmptyList.f71733a;
                    E2.Companion.getClass();
                    continuation3.resumeWith(y40.v.b(vVar, emptyList, E2.b.a(th2)));
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$searchRequest$1$1$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$o$b */
        public static final class b extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64156a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public b(Continuation<? super y40.w> continuation, Continuation<? super b> continuation2) {
                super(1, continuation2);
                this.f64156a = continuation;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new b(this.f64156a, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new b(this.f64156a, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Continuation<y40.w> continuation = this.f64156a;
                int i5 = Result.f71687b;
                continuation.resumeWith(y40.v.b(y40.w.Companion, EmptyList.f71733a, C3099cb.f64108e));
                return Unit.f71706a;
            }
        }

        public o(Continuation<? super o> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            o oVar = C3099cb.this.new o(continuation);
            oVar.f64150b = obj;
            return oVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            o oVar = C3099cb.this.new o((Continuation) obj2);
            oVar.f64150b = (y40.b0) obj;
            return oVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64149a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.b0 b0Var = (y40.b0) this.f64150b;
            C3099cb c3099cb = C3099cb.this;
            this.f64150b = b0Var;
            this.f64149a = 1;
            SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(this));
            c3099cb.f64112d.a(new a(safeContinuation, b0Var, null), new b(safeContinuation, null));
            Object objC = safeContinuation.c();
            return objC == coroutineSingletons ? coroutineSingletons : objC;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$syncIgnoredPackages$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$p */
    public static final class p extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64157a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<String> f64158b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ y40.n f64159c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long[] f64160d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ boolean f64161e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public p(List<String> list, y40.n nVar, long[] jArr, boolean z11, Continuation<? super p> continuation) {
            super(2, continuation);
            this.f64158b = list;
            this.f64160d = jArr;
            this.f64161e = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            p pVar = new p(this.f64158b, null, this.f64160d, this.f64161e, continuation);
            pVar.f64157a = obj;
            return pVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((p) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64157a).syncIgnoredPackages(this.f64158b, null, this.f64160d, this.f64161e);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$syncIgnoredPackages$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$q */
    public static final class q extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ y40.n f64162a;

        public q(y40.n nVar, Continuation<? super q> continuation) {
            super(1, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
            return new q(null, continuation);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            return new q(null, (Continuation) obj).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            y40.v.b(y40.w.Companion, Boolean.FALSE, C3099cb.f64108e);
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$track$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$r */
    public static final class r extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64163a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ AnalyticsEvent f64164b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public r(AnalyticsEvent analyticsEvent, Continuation<? super r> continuation) {
            super(2, continuation);
            this.f64164b = analyticsEvent;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            r rVar = new r(this.f64164b, continuation);
            rVar.f64163a = obj;
            return rVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            r rVar = new r(this.f64164b, (Continuation) obj2);
            rVar.f64163a = (C3411v2) obj;
            return rVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64163a).track(this.f64164b);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$trackImpressions$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$s */
    public static final class s extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64165a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ View f64166b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ X f64167c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public s(View view, X x11, Continuation<? super s> continuation) {
            super(2, continuation);
            this.f64166b = view;
            this.f64167c = x11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            s sVar = new s(this.f64166b, this.f64167c, continuation);
            sVar.f64165a = obj;
            return sVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((s) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64165a).a(this.f64166b, this.f64167c);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$unmarkPackageIgnored$1", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$t */
    public static final class t extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f64168a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f64169b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ y40.n f64170c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public t(String str, y40.n nVar, Continuation<? super t> continuation) {
            super(2, continuation);
            this.f64169b = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            t tVar = new t(this.f64169b, null, continuation);
            tVar.f64168a = obj;
            return tVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((t) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            ((C3411v2) this.f64168a).unmarkPackageIgnored(this.f64169b, null);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$unmarkPackageIgnored$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$u */
    public static final class u extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ y40.n f64171a;

        public u(y40.n nVar, Continuation<? super u> continuation) {
            super(1, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
            return new u(null, continuation);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            return new u(null, (Continuation) obj).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            y40.v.b(y40.w.Companion, Boolean.FALSE, C3099cb.f64108e);
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.PreInitClient$zeroStateRequest$1", f = "PreInitClient.kt", l = {108}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.cb$v */
    public static final class v extends SuspendLambda implements Function2<y40.d0, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64172a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f64173b;

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$zeroStateRequest$1$1$1", f = "PreInitClient.kt", l = {112}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$v$a */
        public static final class a extends SuspendLambda implements Function2<C3411v2, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f64175a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f64176b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64177c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ y40.d0 f64178d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public a(Continuation<? super y40.w> continuation, y40.d0 d0Var, Continuation<? super a> continuation2) {
                super(2, continuation2);
                this.f64177c = continuation;
                this.f64178d = d0Var;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f64177c, this.f64178d, continuation);
                aVar.f64176b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((a) create((C3411v2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                Continuation<y40.w> continuation;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f64175a;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        C3411v2 c3411v2 = (C3411v2) this.f64176b;
                        Continuation<y40.w> continuation2 = this.f64177c;
                        int i11 = Result.f71687b;
                        InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                        y40.d0 d0Var = this.f64178d;
                        this.f64176b = continuation2;
                        this.f64175a = 1;
                        obj = interfaceC3227k4.a("io.branch.search", d0Var, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        continuation = continuation2;
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        continuation = (Continuation) this.f64176b;
                        ResultKt.b(obj);
                    }
                    int i12 = Result.f71687b;
                    continuation.resumeWith(obj);
                } catch (Throwable th2) {
                    Continuation<y40.w> continuation3 = this.f64177c;
                    int i13 = Result.f71687b;
                    y40.v vVar = y40.w.Companion;
                    EmptyList emptyList = EmptyList.f71733a;
                    E2.Companion.getClass();
                    continuation3.resumeWith(y40.v.b(vVar, emptyList, E2.b.a(th2)));
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.PreInitClient$zeroStateRequest$1$1$2", f = "PreInitClient.kt", l = {}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.cb$v$b */
        public static final class b extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.w> f64179a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public b(Continuation<? super y40.w> continuation, Continuation<? super b> continuation2) {
                super(1, continuation2);
                this.f64179a = continuation;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new b(this.f64179a, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new b(this.f64179a, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Continuation<y40.w> continuation = this.f64179a;
                int i5 = Result.f71687b;
                continuation.resumeWith(y40.v.b(y40.w.Companion, EmptyList.f71733a, C3099cb.f64108e));
                return Unit.f71706a;
            }
        }

        public v(Continuation<? super v> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            v vVar = C3099cb.this.new v(continuation);
            vVar.f64173b = obj;
            return vVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            v vVar = C3099cb.this.new v((Continuation) obj2);
            vVar.f64173b = (y40.d0) obj;
            return vVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64172a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.d0 d0Var = (y40.d0) this.f64173b;
            C3099cb c3099cb = C3099cb.this;
            this.f64173b = d0Var;
            this.f64172a = 1;
            SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(this));
            c3099cb.f64112d.a(new a(safeContinuation, d0Var, null), new b(safeContinuation, null));
            Object objC = safeContinuation.c();
            return objC == coroutineSingletons ? coroutineSingletons : objC;
        }
    }

    static {
        Pa.a aVar = Pa.Companion;
        IllegalStateException illegalStateException = new IllegalStateException("BranchNavigatorClient was never initialized");
        aVar.getClass();
        f64108e = new E2.d(Pa.a.a(illegalStateException));
    }

    public C3099cb(@NotNull t70.r clientDeferred, long j11, @NotNull t70.j0 scope) {
        Intrinsics.g(clientDeferred, "clientDeferred");
        Intrinsics.g(scope, "scope");
        this.f64109a = clientDeferred;
        this.f64110b = j11;
        this.f64111c = scope;
        this.f64112d = new X3<>(scope, 1);
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(scope, a80.d.f488c, null, new g(null), 2);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void a(@NotNull C4.j.b clickInfo) throws Throwable {
        Intrinsics.g(clickInfo, "clickInfo");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).a(clickInfo);
        } else {
            this.f64112d.a(new n(clickInfo, null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void activate() throws Throwable {
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).f66086e.a(true);
        } else {
            this.f64112d.a(new b(null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.c appStoreRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        if (this.f64109a.isCompleted()) {
            return ((C3411v2) this.f64109a.e()).appStoreRequest(query);
        }
        y40.b bVar = y40.c.Companion;
        t70.j0 scope = this.f64111c;
        c cVar = new c(null);
        bVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.c(query, false, cVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.e autoSuggestRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        if (this.f64109a.isCompleted()) {
            return ((C3411v2) this.f64109a.e()).autoSuggestRequest(query);
        }
        y40.d dVar = y40.e.Companion;
        t70.j0 scope = this.f64111c;
        d dVar2 = new d(null);
        dVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.e(query, dVar2);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    @Deprecated
    public final void clearLocalDrawableCache() throws Throwable {
        if (!this.f64109a.isCompleted()) {
            this.f64112d.a(new e(null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        } else {
            ((C3411v2) this.f64109a.e()).getClass();
            Log.e("Branch", "BranchNavigatorClient.clearLocalDrawableCache is deprecated and no-ops");
        }
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void deactivate() throws Throwable {
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).f66086e.a(false);
        } else {
            this.f64112d.a(new f(null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void markPackageIgnored(@NotNull String packageName, @NotNull y40.n nVar) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(null, "callback");
        markPackageIgnored(packageName, null, null);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void onClicked(@NotNull ClickInfo info) throws Throwable {
        Intrinsics.g(info, "info");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).onClicked(info);
        } else {
            this.f64112d.a(new j(info, null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void onImpressed(@NotNull ImpressionInfo info) throws Throwable {
        Intrinsics.g(info, "info");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).onImpressed(info);
        } else {
            this.f64112d.a(new k(info, null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void optIntoTracking() throws Throwable {
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).optIntoTracking();
        } else {
            this.f64112d.a(new l(null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void optOutOfTracking() throws Throwable {
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).optOutOfTracking();
        } else {
            this.f64112d.a(new m(null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.b0 searchRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        if (this.f64109a.isCompleted()) {
            return ((C3411v2) this.f64109a.e()).searchRequest(query);
        }
        y40.z zVar = y40.b0.Companion;
        t70.j0 scope = this.f64111c;
        o oVar = new o(null);
        zVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.b0(query, false, oVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n nVar) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(null, "callback");
        syncIgnoredPackages(packageNames, null, null, false);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void track(@NotNull AnalyticsEvent event) throws Throwable {
        Intrinsics.g(event, "event");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).track(event);
        } else {
            this.f64112d.a(new r(event, null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void unmarkPackageIgnored(@NotNull String packageName, @NotNull y40.n callback) throws Throwable {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callback, "callback");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).unmarkPackageIgnored(packageName, callback);
        } else {
            this.f64112d.a(new t(packageName, callback, null), new u(callback, null));
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.d0 zeroStateRequest() {
        if (this.f64109a.isCompleted()) {
            return ((C3411v2) this.f64109a.e()).zeroStateRequest();
        }
        y40.c0 c0Var = y40.d0.Companion;
        t70.j0 j0Var = this.f64111c;
        v vVar = new v(null);
        c0Var.getClass();
        return y40.c0.b(j0Var, vVar);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void markPackageIgnored(@NotNull String packageName, @NotNull y40.n callback, @Nullable long[] jArr) throws Throwable {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callback, "callback");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).markPackageIgnored(packageName, callback, jArr);
        } else {
            this.f64112d.a(new h(packageName, callback, jArr, null), new i(callback, null));
        }
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n nVar, boolean z11) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(null, "callback");
        syncIgnoredPackages(packageNames, null, null, z11);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n nVar, @Nullable long[] jArr) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(null, "callback");
        syncIgnoredPackages(packageNames, null, jArr, false);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void a(@NotNull View view, @NotNull X entity) throws Throwable {
        Intrinsics.g(view, "view");
        Intrinsics.g(entity, "entity");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).a(view, entity);
        } else {
            this.f64112d.a(new s(view, entity, null), (Function1<? super Continuation<? super Unit>, ? extends Object>) null);
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n callback, @Nullable long[] jArr, boolean z11) throws Throwable {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(callback, "callback");
        if (this.f64109a.isCompleted()) {
            ((C3411v2) this.f64109a.e()).syncIgnoredPackages(packageNames, callback, jArr, z11);
        } else {
            this.f64112d.a(new p(packageNames, callback, jArr, z11, null), new q(callback, null));
        }
    }
}
