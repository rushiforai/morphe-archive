package io.branch.search.internal;

import android.util.Log;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.C4;
import io.branch.search.internal.E2;
import io.branch.search.internal.W;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.ClickInfo;
import io.branch.search.ui.Impressable;
import io.branch.search.ui.ImpressionInfo;
import io.branch.search.ui.LauncherActivity;
import java.util.List;
import kotlin.Deprecated;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3411v2 implements y40.p, InterfaceC3445x2 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f66082a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3227k4 f66083b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f66084c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3158g2 f66085d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3377t2 f66086e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final InterfaceC3133eb f66087f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final t70.j0 f66088g;

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$appStoreRequest$1", f = "BranchNavigatorClientImpl.kt", l = {87}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$a */
    public static final class a extends SuspendLambda implements Function2<y40.c, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66089a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f66090b;

        public a(Continuation<? super a> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            a aVar = C3411v2.this.new a(continuation);
            aVar.f66090b = obj;
            return aVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            a aVar = C3411v2.this.new a((Continuation) obj2);
            aVar.f66090b = (y40.c) obj;
            return aVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66089a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.c cVar = (y40.c) this.f66090b;
            C3411v2 c3411v2 = C3411v2.this;
            InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
            String packageName = c3411v2.f66082a.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            this.f66089a = 1;
            Object objA = interfaceC3227k4.a(packageName, cVar, this);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$autoSuggestRequest$1", f = "BranchNavigatorClientImpl.kt", l = {85}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$b */
    public static final class b extends SuspendLambda implements Function2<y40.e, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66092a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f66093b;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            b bVar = C3411v2.this.new b(continuation);
            bVar.f66093b = obj;
            return bVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            b bVar = C3411v2.this.new b((Continuation) obj2);
            bVar.f66093b = (y40.e) obj;
            return bVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66092a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.e eVar = (y40.e) this.f66093b;
            C3411v2 c3411v2 = C3411v2.this;
            InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
            String packageName = c3411v2.f66082a.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            this.f66092a = 1;
            Object objA = interfaceC3227k4.a(packageName, eVar, this);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$markPackageIgnored$1", f = "BranchNavigatorClientImpl.kt", l = {115}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$c */
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66095a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f66097c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long[] f66098d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ y40.n f66099e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(String str, long[] jArr, y40.n nVar, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f66097c = str;
            this.f66098d = jArr;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new c(this.f66097c, this.f66098d, null, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((c) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66095a;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                    String str = this.f66097c;
                    long[] jArr = this.f66098d;
                    this.f66095a = 1;
                    obj = interfaceC3227k4.a(str, jArr, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
            } catch (Exception e3) {
                y40.v vVar = y40.w.Companion;
                Boolean bool = Boolean.FALSE;
                E2.Companion.getClass();
                y40.v.b(vVar, bool, E2.b.a(e3));
            }
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$onClicked$1", f = "BranchNavigatorClientImpl.kt", l = {160}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$d */
    public static final class d extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66100a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ ClickInfo f66102c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(ClickInfo clickInfo, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f66102c = clickInfo;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new d(this.f66102c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3411v2.this.new d(this.f66102c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66100a;
            if (i5 == 0) {
                ResultKt.b(obj);
                InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                ClickInfo clickInfo = this.f66102c;
                this.f66100a = 1;
                if (interfaceC3227k4.a(clickInfo, this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$optIntoTracking$1", f = "BranchNavigatorClientImpl.kt", l = {91}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$e */
    public static final class e extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66103a;

        public e(Continuation<? super e> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new e(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3411v2.this.new e((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66103a;
            if (i5 == 0) {
                ResultKt.b(obj);
                InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                this.f66103a = 1;
                if (interfaceC3227k4.c(this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$optOutOfTracking$1", f = "BranchNavigatorClientImpl.kt", l = {ads_mobile_sdk.pd.H0}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$f */
    public static final class f extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66105a;

        public f(Continuation<? super f> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new f(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3411v2.this.new f((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66105a;
            if (i5 == 0) {
                ResultKt.b(obj);
                InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                this.f66105a = 1;
                if (interfaceC3227k4.b(this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$recordOpenMetadata$1", f = "BranchNavigatorClientImpl.kt", l = {172}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$g */
    public static final class g extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66107a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C4.j.b f66108b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ C3411v2 f66109c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public g(C4.j.b bVar, C3411v2 c3411v2, Continuation<? super g> continuation) {
            super(2, continuation);
            this.f66108b = bVar;
            this.f66109c = c3411v2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new g(this.f66108b, this.f66109c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new g(this.f66108b, this.f66109c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66107a;
            if (i5 == 0) {
                ResultKt.b(obj);
                if (this.f66108b.f62264d) {
                    C3309p1.d(EnumC3131e9.ContentProviderRequests, "Empty ClickInfo — dropping it");
                    return Unit.f71706a;
                }
                C3411v2 c3411v2 = this.f66109c;
                InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                String packageName = c3411v2.f66082a.f62438a.getPackageName();
                Intrinsics.f(packageName, "context.packageName");
                C4.j.b bVar = this.f66108b;
                this.f66107a = 1;
                if (interfaceC3227k4.a(packageName, bVar, this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$searchRequest$1", f = "BranchNavigatorClientImpl.kt", l = {81}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$h */
    public static final class h extends SuspendLambda implements Function2<y40.b0, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66110a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f66111b;

        public h(Continuation<? super h> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            h hVar = C3411v2.this.new h(continuation);
            hVar.f66111b = obj;
            return hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            h hVar = C3411v2.this.new h((Continuation) obj2);
            hVar.f66111b = (y40.b0) obj;
            return hVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66110a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.b0 b0Var = (y40.b0) this.f66111b;
            C3411v2 c3411v2 = C3411v2.this;
            InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
            String packageName = c3411v2.f66082a.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            this.f66110a = 1;
            Object objA = interfaceC3227k4.a(packageName, b0Var, this);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$syncIgnoredPackages$1", f = "BranchNavigatorClientImpl.kt", l = {Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$i */
    public static final class i extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66113a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ List<String> f66115c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long[] f66116d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ boolean f66117e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ y40.n f66118f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(List<String> list, long[] jArr, boolean z11, y40.n nVar, Continuation<? super i> continuation) {
            super(2, continuation);
            this.f66115c = list;
            this.f66116d = jArr;
            this.f66117e = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new i(this.f66115c, this.f66116d, this.f66117e, null, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((i) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66113a;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                    List<String> list = this.f66115c;
                    long[] jArr = this.f66116d;
                    boolean z11 = this.f66117e;
                    this.f66113a = 1;
                    obj = interfaceC3227k4.a(list, jArr, z11, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
            } catch (Exception e3) {
                y40.v vVar = y40.w.Companion;
                Boolean bool = Boolean.FALSE;
                E2.Companion.getClass();
                y40.v.b(vVar, bool, E2.b.a(e3));
            }
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$track$1", f = "BranchNavigatorClientImpl.kt", l = {103}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$j */
    public static final class j extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66119a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ AnalyticsEvent f66121c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(AnalyticsEvent analyticsEvent, Continuation<? super j> continuation) {
            super(2, continuation);
            this.f66121c = analyticsEvent;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new j(this.f66121c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3411v2.this.new j(this.f66121c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66119a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3411v2 c3411v2 = C3411v2.this;
                InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
                String packageName = c3411v2.f66082a.f62438a.getPackageName();
                Intrinsics.f(packageName, "context.packageName");
                AnalyticsEvent analyticsEvent = this.f66121c;
                this.f66119a = 1;
                if (interfaceC3227k4.a(packageName, analyticsEvent, this) == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$unmarkPackageIgnored$1", f = "BranchNavigatorClientImpl.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$k */
    public static final class k extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66122a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f66124c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ y40.n f66125d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(String str, y40.n nVar, Continuation<? super k> continuation) {
            super(2, continuation);
            this.f66124c = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3411v2.this.new k(this.f66124c, null, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((k) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66122a;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    InterfaceC3227k4 interfaceC3227k4 = C3411v2.this.f66083b;
                    String str = this.f66124c;
                    this.f66122a = 1;
                    obj = interfaceC3227k4.d(str, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
            } catch (Exception e3) {
                y40.v vVar = y40.w.Companion;
                Boolean bool = Boolean.FALSE;
                E2.Companion.getClass();
                y40.v.b(vVar, bool, E2.b.a(e3));
            }
            throw null;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.BranchNavigatorClientImpl$zeroStateRequest$1", f = "BranchNavigatorClientImpl.kt", l = {83}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v2$l */
    public static final class l extends SuspendLambda implements Function2<y40.d0, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f66126a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f66127b;

        public l(Continuation<? super l> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            l lVar = C3411v2.this.new l(continuation);
            lVar.f66127b = obj;
            return lVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            l lVar = C3411v2.this.new l((Continuation) obj2);
            lVar.f66127b = (y40.d0) obj;
            return lVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f66126a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            y40.d0 d0Var = (y40.d0) this.f66127b;
            C3411v2 c3411v2 = C3411v2.this;
            InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
            String packageName = c3411v2.f66082a.f62438a.getPackageName();
            Intrinsics.f(packageName, "context.packageName");
            this.f66126a = 1;
            Object objA = interfaceC3227k4.a(packageName, d0Var, this);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        }
    }

    public C3411v2(@NotNull F4 context, @NotNull InterfaceC3227k4 executorDelegate, boolean z11, @NotNull C3158g2 impressionTracking, @NotNull InterfaceC3377t2 lifecycleController, @NotNull InterfaceC3133eb processHandler, @NotNull t70.j0 bgScope) {
        Intrinsics.g(context, "context");
        Intrinsics.g(executorDelegate, "executorDelegate");
        Intrinsics.g(impressionTracking, "impressionTracking");
        Intrinsics.g(lifecycleController, "lifecycleController");
        Intrinsics.g(processHandler, "processHandler");
        Intrinsics.g(bgScope, "bgScope");
        this.f66082a = context;
        this.f66083b = executorDelegate;
        this.f66084c = z11;
        this.f66085d = impressionTracking;
        this.f66086e = lifecycleController;
        this.f66087f = processHandler;
        this.f66088g = bgScope;
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void a(@NotNull C4.j.b clickInfo) {
        Intrinsics.g(clickInfo, "clickInfo");
        t70.m0.t(this.f66088g, null, null, new g(clickInfo, this, null), 3);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void activate() {
        this.f66086e.a(true);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.c appStoreRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        y40.b bVar = y40.c.Companion;
        t70.j0 scope = this.f66088g;
        a aVar = new a(null);
        bVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.c(query, false, aVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.e autoSuggestRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        y40.d dVar = y40.e.Companion;
        t70.j0 scope = this.f66088g;
        b bVar = new b(null);
        dVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.e(query, bVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    @Deprecated
    public final void clearLocalDrawableCache() {
        Log.e("Branch", "BranchNavigatorClient.clearLocalDrawableCache is deprecated and no-ops");
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void deactivate() {
        this.f66086e.a(false);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void markPackageIgnored(@NotNull String packageName, @NotNull y40.n nVar) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(null, "callback");
        markPackageIgnored(packageName, null, null);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void onClicked(@NotNull ClickInfo info) {
        Intrinsics.g(info, "info");
        t70.m0.t(this.f66088g, null, null, new d(info, null), 3);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void onImpressed(@NotNull ImpressionInfo info) {
        W.b bVar;
        Long l9;
        Intrinsics.g(info, "info");
        Impressable impressable = info.f66488a;
        if (impressable instanceof BranchEntity) {
            t70.m0.t(this.f66088g, null, null, new C3428w2(this, new C4.d.a(((BranchEntity) impressable).getF66462a().a()), null), 3);
        }
        C3158g2 c3158g2 = this.f66085d;
        c3158g2.getClass();
        Impressable impressable2 = info.f66488a;
        if (!(impressable2 instanceof BranchEntity)) {
            if (impressable2 instanceof LauncherActivity) {
                synchronized (c3158g2.f64550g) {
                    c3158g2.f64550g.add(info);
                }
                return;
            }
            return;
        }
        if (c3158g2.a(((BranchEntity) impressable2).getF66462a())) {
            c3158g2.a(((BranchEntity) info.f66488a).getF66462a(), info.f66490c, info.f66491d);
            int iC = ((BranchEntity) info.f66488a).getF66462a().c();
            long j11 = info.f66492e + info.f66491d;
            List list = (List) c3158g2.f64547d.get(Integer.valueOf(iC));
            if (list == null || (l9 = (bVar = (W.b) a2.c.e(1, list)).f63550c) != null) {
                return;
            }
            if (l9 != null) {
                C3308p0.a("encounter being completed again");
            } else {
                bVar.f63550c = Long.valueOf(j11 - bVar.f63549b);
            }
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void optIntoTracking() {
        t70.m0.t(this.f66088g, null, null, new e(null), 3);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void optOutOfTracking() {
        t70.m0.t(this.f66088g, null, null, new f(null), 3);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.b0 searchRequest(@NotNull String query) {
        Intrinsics.g(query, "query");
        y40.z zVar = y40.b0.Companion;
        t70.j0 scope = this.f66088g;
        h hVar = new h(null);
        zVar.getClass();
        Intrinsics.g(scope, "scope");
        return new y40.b0(query, false, hVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n nVar) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(null, "callback");
        syncIgnoredPackages(packageNames, null, null, false);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void track(@NotNull AnalyticsEvent event) {
        Intrinsics.g(event, "event");
        t70.m0.t(this.f66088g, null, null, new j(event, null), 3);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void unmarkPackageIgnored(@NotNull String packageName, @NotNull y40.n callback) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callback, "callback");
        t70.j0 j0Var = this.f66088g;
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(j0Var, y70.o.f96819a, null, new k(packageName, callback, null), 2);
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    @NotNull
    public final y40.d0 zeroStateRequest() {
        y40.c0 c0Var = y40.d0.Companion;
        t70.j0 j0Var = this.f66088g;
        l lVar = new l(null);
        c0Var.getClass();
        return y40.c0.b(j0Var, lVar);
    }

    @Override // io.branch.search.internal.InterfaceC3445x2
    public final void a(@NotNull View view, @NotNull X entity) {
        Intrinsics.g(view, "view");
        Intrinsics.g(entity, "entity");
        C3158g2 c3158g2 = this.f66085d;
        wm.b bVar = new wm.b(this, 10);
        c3158g2.getClass();
        if (c3158g2.f64544a.containsKey(view)) {
            Object obj = c3158g2.f64544a.get(view);
            Intrinsics.d(obj);
            Af af = (Af) obj;
            af.b();
            af.f62050g = entity;
            af.f62054k = af.f62044a.a(entity.c());
            return;
        }
        Af af2 = new Af(view, entity, c3158g2, bVar);
        synchronized (c3158g2.f64545b) {
        }
    }

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void markPackageIgnored(@NotNull String packageName, @NotNull y40.n callback, @Nullable long[] jArr) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(callback, "callback");
        t70.j0 j0Var = this.f66088g;
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(j0Var, y70.o.f96819a, null, new c(packageName, jArr, callback, null), 2);
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

    @Override // y40.p, io.branch.search.internal.InterfaceC3445x2
    public final void syncIgnoredPackages(@NotNull List<String> packageNames, @NotNull y40.n callback, @Nullable long[] jArr, boolean z11) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(callback, "callback");
        t70.j0 j0Var = this.f66088g;
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(j0Var, y70.o.f96819a, null, new i(packageNames, jArr, z11, callback, null), 2);
    }

    public static final void a(C3411v2 this$0, List list) {
        Intrinsics.g(this$0, "this$0");
        t70.m0.t(this$0.f66088g, null, null, new C3428w2(this$0, new C4.d.a(list), null), 3);
    }
}
