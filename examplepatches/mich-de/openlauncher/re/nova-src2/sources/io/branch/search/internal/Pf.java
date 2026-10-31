package io.branch.search.internal;

import android.os.UserHandle;
import io.branch.search.internal.C3250la;
import io.branch.search.internal.Jf;
import io.branch.search.internal.O3;
import io.branch.search.internal.multiprocess.ZeroStateCacheModel;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
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

/* loaded from: classes4.dex */
public final class Pf implements C3250la.d {

    @NotNull
    public static final C3046b Companion = new C3046b();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final If f63100a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3227k4 f63101b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3441wf f63102c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3356rf f63103d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final t70.j0 f63104e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final t70.c0 f63105f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Jf f63106g;

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {544}, m = "onShortcutsChanged")
    public static final class A extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public String f63107a;

        /* renamed from: b, reason: collision with root package name */
        public Object f63108b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f63109c;

        /* renamed from: e, reason: collision with root package name */
        public int f63111e;

        public A(Continuation<? super A> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63109c = obj;
            this.f63111e |= Integer.MIN_VALUE;
            return Pf.this.a((String) null, (UserHandle) null, (List<C3460y0>) null, this);
        }
    }

    public static final class B extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63112a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63113b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public B(String str, UserHandle userHandle) {
            super(0);
            this.f63112a = str;
            this.f63113b = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for shortcuts changed pkg=" + this.f63112a + " user=" + this.f63113b;
        }
    }

    public static final class C extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63114a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63115b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63116c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C(String str, UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63114a = str;
            this.f63115b = userHandle;
            this.f63116c = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for shortcuts changed pkg=" + this.f63114a + " user=" + this.f63115b + " entity=" + this.f63116c;
        }
    }

    public static final class D extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63117a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63118b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ O3 f63119c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public D(String str, UserHandle userHandle, O3 o32) {
            super(0);
            this.f63117a = str;
            this.f63118b = userHandle;
            this.f63119c = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after shortcuts changed pkg=" + this.f63117a + " user=" + this.f63118b + ": debugInfo=" + this.f63119c.a();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {439}, m = "verifyCacheContentValid")
    public static final class E extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f63120a;

        /* renamed from: c, reason: collision with root package name */
        public int f63122c;

        public E(Continuation<? super E> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63120a = obj;
            this.f63122c |= Integer.MIN_VALUE;
            return Pf.this.b(this);
        }
    }

    public static final class F extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public static final F f63123a = new F();

        public F() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return "Cache setup validity check triggered";
        }
    }

    public static final class G extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63124a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public G(BranchEntity branchEntity) {
            super(0);
            this.f63124a = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for cache setup validity check entity=" + this.f63124a;
        }
    }

    public static final class H extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ O3 f63125a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public H(O3 o32) {
            super(0);
            this.f63125a = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after setup validity check: debugInfo=" + this.f63125a.a();
        }
    }

    /* renamed from: io.branch.search.internal.Pf$a, reason: case insensitive filesystem */
    public final class C3045a extends Jf.b {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final y40.d0 f63126b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Pf f63127c;

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$ApiRegenerateTask$execute$newRequest$1", f = "ZeroStateCache.kt", l = {262}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.Pf$a$a, reason: collision with other inner class name */
        public static final class C0326a extends SuspendLambda implements Function2<y40.d0, Continuation<? super y40.w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f63128a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f63129b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Pf f63130c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0326a(Pf pf2, Continuation<? super C0326a> continuation) {
                super(2, continuation);
                this.f63130c = pf2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                C0326a c0326a = new C0326a(this.f63130c, continuation);
                c0326a.f63129b = obj;
                return c0326a;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                C0326a c0326a = new C0326a(this.f63130c, (Continuation) obj2);
                c0326a.f63129b = (y40.d0) obj;
                return c0326a.invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f63128a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                y40.d0 d0Var = (y40.d0) this.f63129b;
                InterfaceC3227k4 interfaceC3227k4 = this.f63130c.f63101b;
                this.f63128a = 1;
                Object objA = interfaceC3227k4.a("io.branch.search", d0Var, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        public C3045a(Pf pf2, @NotNull y40.d0 request) {
            Intrinsics.g(request, "request");
            this.f63127c = pf2;
            this.f63126b = request;
        }

        @Override // io.branch.search.internal.Jf.b
        @Nullable
        public final Object a(@NotNull Continuation<? super O3> continuation) {
            C3309p1.a("ZeroStateCache", "Running cache regenerate for api request");
            y40.c0 c0Var = y40.d0.Companion;
            Pf pf2 = this.f63127c;
            t70.j0 j0Var = pf2.f63104e;
            C0326a c0326a = new C0326a(pf2, null);
            c0Var.getClass();
            y40.d0 d0VarB = y40.c0.b(j0Var, c0326a);
            Pf pf3 = this.f63127c;
            y40.d0 request = this.f63126b;
            pf3.getClass();
            Intrinsics.g(request, "request");
            y40.g gVar = request.f96660b;
            if (gVar != null) {
                d0VarB.f96660b = gVar;
            }
            y40.k kVar = request.f96661c;
            if (kVar != null) {
                d0VarB.f96661c = kVar;
            }
            y40.i iVar = request.f96662d;
            if (iVar != null) {
                d0VarB.f96662d = iVar;
            }
            d0VarB.f96664f = request.f96664f;
            Pf pf4 = this.f63127c;
            return t70.m0.y(pf4.f63105f, new Yf(d0VarB, pf4, null), (ContinuationImpl) continuation);
        }
    }

    /* renamed from: io.branch.search.internal.Pf$b, reason: case insensitive filesystem */
    public static final class C3046b {
    }

    /* renamed from: io.branch.search.internal.Pf$c, reason: case insensitive filesystem */
    public final class C3047c extends Jf.b {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final ZeroStateCacheModel f63131b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Pf f63132c;

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$InvalidRegenerateTask$execute$request$1", f = "ZeroStateCache.kt", l = {282}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.Pf$c$a */
        public static final class a extends SuspendLambda implements Function2<y40.d0, Continuation<? super y40.w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f63133a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f63134b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Pf f63135c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Pf pf2, Continuation<? super a> continuation) {
                super(2, continuation);
                this.f63135c = pf2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f63135c, continuation);
                aVar.f63134b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                a aVar = new a(this.f63135c, (Continuation) obj2);
                aVar.f63134b = (y40.d0) obj;
                return aVar.invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f63133a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                y40.d0 d0Var = (y40.d0) this.f63134b;
                InterfaceC3227k4 interfaceC3227k4 = this.f63135c.f63101b;
                this.f63133a = 1;
                Object objA = interfaceC3227k4.a("io.branch.search", d0Var, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        public C3047c(Pf pf2, @NotNull ZeroStateCacheModel fullCacheModel) {
            Intrinsics.g(fullCacheModel, "fullCacheModel");
            this.f63132c = pf2;
            this.f63131b = fullCacheModel;
        }

        @Override // io.branch.search.internal.Jf.b
        @Nullable
        public final Object a(@NotNull Continuation<? super O3> continuation) {
            C3309p1.a("ZeroStateCache", "Running cache regenerate for invalid content");
            y40.c0 c0Var = y40.d0.Companion;
            Pf pf2 = this.f63132c;
            t70.j0 j0Var = pf2.f63104e;
            a aVar = new a(pf2, null);
            c0Var.getClass();
            y40.d0 d0VarB = y40.c0.b(j0Var, aVar);
            Pf pf3 = this.f63132c;
            ZeroStateCacheModel zeroStateCacheModel = this.f63131b;
            pf3.getClass();
            Pf.a(d0VarB, zeroStateCacheModel);
            Pf pf4 = this.f63132c;
            return t70.m0.y(pf4.f63105f, new Yf(d0VarB, pf4, null), (ContinuationImpl) continuation);
        }
    }

    /* renamed from: io.branch.search.internal.Pf$d, reason: case insensitive filesystem */
    public final class C3048d extends Jf.b {

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$ServiceRegenerateTask", f = "ZeroStateCache.kt", l = {274}, m = "execute")
        /* renamed from: io.branch.search.internal.Pf$d$a */
        public static final class a extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public /* synthetic */ Object f63137a;

            /* renamed from: c, reason: collision with root package name */
            public int f63139c;

            public a(Continuation<? super a> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f63137a = obj;
                this.f63139c |= Integer.MIN_VALUE;
                return C3048d.this.a(this);
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository$ServiceRegenerateTask$execute$2$request$1", f = "ZeroStateCache.kt", l = {272}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.Pf$d$b */
        public static final class b extends SuspendLambda implements Function2<y40.d0, Continuation<? super y40.w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f63140a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f63141b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ Pf f63142c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(Pf pf2, Continuation<? super b> continuation) {
                super(2, continuation);
                this.f63142c = pf2;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                b bVar = new b(this.f63142c, continuation);
                bVar.f63141b = obj;
                return bVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                b bVar = new b(this.f63142c, (Continuation) obj2);
                bVar.f63141b = (y40.d0) obj;
                return bVar.invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f63140a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                y40.d0 d0Var = (y40.d0) this.f63141b;
                InterfaceC3227k4 interfaceC3227k4 = this.f63142c.f63101b;
                this.f63140a = 1;
                Object objA = interfaceC3227k4.a("io.branch.search", d0Var, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        public C3048d() {
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Override // io.branch.search.internal.Jf.b
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object a(@NotNull Continuation<? super O3> continuation) throws Throwable {
            a aVar;
            if (continuation instanceof a) {
                aVar = (a) continuation;
                int i5 = aVar.f63139c;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aVar.f63139c = i5 - Integer.MIN_VALUE;
                } else {
                    aVar = new a(continuation);
                }
            }
            Object objY = aVar.f63137a;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aVar.f63139c;
            if (i11 == 0) {
                ResultKt.b(objY);
                C3309p1.a("ZeroStateCache", "Running cache regenerate for service job");
                ZeroStateCacheModel zeroStateCacheModelB = Pf.this.f63100a.b();
                if (zeroStateCacheModelB != null) {
                    Pf pf2 = Pf.this;
                    y40.c0 c0Var = y40.d0.Companion;
                    t70.j0 j0Var = pf2.f63104e;
                    b bVar = new b(pf2, null);
                    c0Var.getClass();
                    y40.d0 d0VarB = y40.c0.b(j0Var, bVar);
                    Pf.a(d0VarB, zeroStateCacheModelB);
                    aVar.f63139c = 1;
                    objY = t70.m0.y(pf2.f63105f, new Yf(d0VarB, pf2, null), aVar);
                    if (objY == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return O3.a.b.f63006a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            O3 o32 = (O3) objY;
            if (o32 != null) {
                return o32;
            }
            return O3.a.b.f63006a;
        }
    }

    /* renamed from: io.branch.search.internal.Pf$e, reason: case insensitive filesystem */
    public static final class C3049e extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public static final C3049e f63143a = new C3049e();

        public C3049e() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return "Initial sync completed, start processing regenerate tasks";
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {499}, m = "onPackageAdded")
    /* renamed from: io.branch.search.internal.Pf$f, reason: case insensitive filesystem */
    public static final class C3050f extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public String f63144a;

        /* renamed from: b, reason: collision with root package name */
        public Object f63145b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f63146c;

        /* renamed from: e, reason: collision with root package name */
        public int f63148e;

        public C3050f(Continuation<? super C3050f> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63146c = obj;
            this.f63148e |= Integer.MIN_VALUE;
            return Pf.this.a(null, null, null, null, this);
        }
    }

    /* renamed from: io.branch.search.internal.Pf$g, reason: case insensitive filesystem */
    public static final class C3051g extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63149a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63150b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3051g(String str, UserHandle userHandle) {
            super(0);
            this.f63149a = str;
            this.f63150b = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for package added pkg=" + this.f63149a + " user=" + this.f63150b;
        }
    }

    /* renamed from: io.branch.search.internal.Pf$h, reason: case insensitive filesystem */
    public static final class C3052h extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63151a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63152b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63153c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3052h(String str, UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63151a = str;
            this.f63152b = userHandle;
            this.f63153c = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for package added pkg=" + this.f63151a + " user=" + this.f63152b + " entity=" + this.f63153c;
        }
    }

    public static final class i extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63154a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63155b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ O3 f63156c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(String str, UserHandle userHandle, O3 o32) {
            super(0);
            this.f63154a = str;
            this.f63155b = userHandle;
            this.f63156c = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after package added pkg=" + this.f63154a + " user=" + this.f63155b + ": debugInfo=" + this.f63156c.a();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {516}, m = "onPackageChanged")
    public static final class j extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public String f63157a;

        /* renamed from: b, reason: collision with root package name */
        public Object f63158b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f63159c;

        /* renamed from: e, reason: collision with root package name */
        public int f63161e;

        public j(Continuation<? super j> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63159c = obj;
            this.f63161e |= Integer.MIN_VALUE;
            return Pf.this.b(null, null, null, null, this);
        }
    }

    public static final class k extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63162a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63163b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(String str, UserHandle userHandle) {
            super(0);
            this.f63162a = str;
            this.f63163b = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for package changed pkg=" + this.f63162a + " user=" + this.f63163b;
        }
    }

    public static final class l extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63164a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63165b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63166c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public l(String str, UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63164a = str;
            this.f63165b = userHandle;
            this.f63166c = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for package changed pkg=" + this.f63164a + " user=" + this.f63165b + " entity=" + this.f63166c;
        }
    }

    public static final class m extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63167a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63168b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ O3 f63169c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public m(String str, UserHandle userHandle, O3 o32) {
            super(0);
            this.f63167a = str;
            this.f63168b = userHandle;
            this.f63169c = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after package changed pkg=" + this.f63167a + " user=" + this.f63168b + ": debugInfo=" + this.f63169c.a();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {529}, m = "onPackageRemoved")
    public static final class n extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public String f63170a;

        /* renamed from: b, reason: collision with root package name */
        public Object f63171b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f63172c;

        /* renamed from: e, reason: collision with root package name */
        public int f63174e;

        public n(Continuation<? super n> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63172c = obj;
            this.f63174e |= Integer.MIN_VALUE;
            return Pf.this.a((String) null, (UserHandle) null, this);
        }
    }

    public static final class o extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63175a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63176b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public o(String str, UserHandle userHandle) {
            super(0);
            this.f63175a = str;
            this.f63176b = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for package removed pkg=" + this.f63175a + " user=" + this.f63176b;
        }
    }

    public static final class p extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63177a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63178b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63179c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public p(String str, UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63177a = str;
            this.f63178b = userHandle;
            this.f63179c = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for package removed pkg=" + this.f63177a + " user=" + this.f63178b + " entity=" + this.f63179c;
        }
    }

    public static final class q extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63180a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63181b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ O3 f63182c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public q(String str, UserHandle userHandle, O3 o32) {
            super(0);
            this.f63180a = str;
            this.f63181b = userHandle;
            this.f63182c = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after  removed pkg=" + this.f63180a + " user=" + this.f63181b + ": debugInfo=" + this.f63182c.a();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {471}, m = "onProfileRemoved")
    public static final class r extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f63183a;

        /* renamed from: c, reason: collision with root package name */
        public int f63185c;

        public r(Continuation<? super r> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63183a = obj;
            this.f63185c |= Integer.MIN_VALUE;
            return Pf.this.a(0L, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {480}, m = "onProfileRemoved")
    public static final class s extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f63186a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f63187b;

        /* renamed from: d, reason: collision with root package name */
        public int f63189d;

        public s(Continuation<? super s> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63187b = obj;
            this.f63189d |= Integer.MIN_VALUE;
            return Pf.this.c(null, this);
        }
    }

    public static final class t extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63190a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public t(UserHandle userHandle) {
            super(0);
            this.f63190a = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for profile removed user=" + this.f63190a;
        }
    }

    public static final class u extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63191a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63192b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public u(UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63191a = userHandle;
            this.f63192b = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for profile removed user=" + this.f63191a + " entity=" + this.f63192b;
        }
    }

    public static final class v extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63193a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ O3 f63194b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public v(UserHandle userHandle, O3 o32) {
            super(0);
            this.f63193a = userHandle;
            this.f63194b = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after profile removed user=" + this.f63193a + ": debugInfo=" + this.f63194b.a();
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheRepository", f = "ZeroStateCache.kt", l = {566}, m = "onProfileUnavailable")
    public static final class w extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f63195a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f63196b;

        /* renamed from: d, reason: collision with root package name */
        public int f63198d;

        public w(Continuation<? super w> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63196b = obj;
            this.f63198d |= Integer.MIN_VALUE;
            return Pf.this.b(null, this);
        }
    }

    public static final class x extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63199a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public x(UserHandle userHandle) {
            super(0);
            this.f63199a = userHandle;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Check valid for profile unavailable user=" + this.f63199a;
        }
    }

    public static final class y extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63200a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ BranchEntity f63201b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public y(UserHandle userHandle, BranchEntity branchEntity) {
            super(0);
            this.f63200a = userHandle;
            this.f63201b = branchEntity;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Regenerate for profile unavailable user=" + this.f63200a + " entity=" + this.f63201b;
        }
    }

    public static final class z extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ UserHandle f63202a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ O3 f63203b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public z(UserHandle userHandle, O3 o32) {
            super(0);
            this.f63202a = userHandle;
            this.f63203b = o32;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "Cache regenerate after profile unavailable user=" + this.f63202a + ": debugInfo=" + this.f63203b.a();
        }
    }

    public Pf(@NotNull If zeroStateCacheDataSource, @NotNull A5 requestExecutor, @NotNull C3441wf validationProxy, @NotNull C3356rf userHandleRepository, @NotNull t70.j0 bgScope, @NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(zeroStateCacheDataSource, "zeroStateCacheDataSource");
        Intrinsics.g(requestExecutor, "requestExecutor");
        Intrinsics.g(validationProxy, "validationProxy");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        Intrinsics.g(bgScope, "bgScope");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f63100a = zeroStateCacheDataSource;
        this.f63101b = requestExecutor;
        this.f63102c = validationProxy;
        this.f63103d = userHandleRepository;
        this.f63104e = bgScope;
        this.f63105f = ioDispatcher;
        this.f63106g = new Jf(bgScope, ioDispatcher);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Pf pf2, ZeroStateCacheModel zeroStateCacheModel, RequestMetadata requestMetadata, Continuation continuation) {
        Uf uf2;
        pf2.getClass();
        if (continuation instanceof Uf) {
            uf2 = (Uf) continuation;
            int i5 = uf2.f63463d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uf2.f63463d = i5 - Integer.MIN_VALUE;
            } else {
                uf2 = new Uf(pf2, continuation);
            }
        }
        Object objA = uf2.f63461b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uf2.f63463d;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (zeroStateCacheModel.getRequestId() != null && zeroStateCacheModel.getForCacheUpdate() && !Intrinsics.b(zeroStateCacheModel.getRequestId(), requestMetadata.getRequestId())) {
                InterfaceC3227k4 interfaceC3227k4 = pf2.f63101b;
                String requestId = zeroStateCacheModel.getRequestId();
                uf2.f63460a = zeroStateCacheModel;
                uf2.f63463d = 1;
                objA = interfaceC3227k4.a(requestId, uf2);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        zeroStateCacheModel = uf2.f63460a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache", new Vf((y40.w) objA, zeroStateCacheModel));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        j jVar;
        Object obj;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i5 = jVar.f63161e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f63161e = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(continuation);
            }
        }
        Object objA = jVar.f63159c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = jVar.f63161e;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new k(str, userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null) {
                List<BranchContainer<BranchEntity>> results = zeroStateCacheModelB.getResults();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = results.iterator();
                while (it.hasNext()) {
                    b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Object next = it2.next();
                    BranchEntity branchEntity = (BranchEntity) next;
                    b50.a aVarF = branchEntity.getF66462a().f();
                    if (Intrinsics.b(aVarF != null ? aVarF.f17556a : null, str)) {
                        b50.a aVarF2 = branchEntity.getF66462a().f();
                        if (Intrinsics.b(aVarF2 != null ? aVarF2.f17557b : null, userHandle)) {
                            arrayList2.add(next);
                        }
                    }
                }
                Iterator it3 = arrayList2.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    Object next2 = it3.next();
                    if (!this.f63102c.a((BranchEntity) next2)) {
                        obj = next2;
                        break;
                    }
                }
                BranchEntity branchEntity2 = (BranchEntity) obj;
                if (branchEntity2 != null) {
                    C3309p1.a("ZeroStateCache.invalid", new l(str, userHandle, branchEntity2));
                    jVar.f63157a = str;
                    jVar.f63158b = userHandle;
                    jVar.f63161e = 1;
                    objA = a(zeroStateCacheModelB, jVar);
                    if (objA == obj2) {
                        return obj2;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) jVar.f63158b;
        str = jVar.f63157a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new m(str, userHandle, (O3) objA));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        s sVar;
        Object obj;
        if (continuation instanceof s) {
            sVar = (s) continuation;
            int i5 = sVar.f63189d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f63189d = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(continuation);
            }
        }
        Object objA = sVar.f63187b;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = sVar.f63189d;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new t(userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null) {
                List<BranchContainer<BranchEntity>> results = zeroStateCacheModelB.getResults();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = results.iterator();
                while (it.hasNext()) {
                    b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
                }
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Object next = it2.next();
                    b50.a aVarF = ((BranchEntity) next).getF66462a().f();
                    if (Intrinsics.b(aVarF != null ? aVarF.f17557b : null, userHandle)) {
                        obj = next;
                        break;
                    }
                }
                BranchEntity branchEntity = (BranchEntity) obj;
                if (branchEntity != null) {
                    C3309p1.a("ZeroStateCache.invalid", new u(userHandle, branchEntity));
                    sVar.f63186a = userHandle;
                    sVar.f63189d = 1;
                    objA = a(zeroStateCacheModelB, sVar);
                    if (objA == obj2) {
                        return obj2;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) sVar.f63186a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new v(userHandle, (O3) objA));
        return Unit.f71706a;
    }

    public static void a(@NotNull y40.d0 d0Var, @NotNull ZeroStateCacheModel model) {
        Intrinsics.g(d0Var, "<this>");
        Intrinsics.g(model, "model");
        if (model.getSuggestedAppsRowCount() != null && model.getSuggestedAppsItemPerRow() != null) {
            d0Var.f96660b = new y40.g(model.getSuggestedAppsRowCount().intValue(), model.getSuggestedAppsItemPerRow().intValue());
        }
        if (model.getSuggestedLinksRowCount() != null) {
            d0Var.f96661c = new y40.k(model.getSuggestedLinksRowCount().intValue());
        }
        if (model.getSuggestedInstallsRowCount() != null && model.getSuggestedInstallsItemPerRow() != null) {
            d0Var.f96662d = new y40.i(model.getSuggestedInstallsRowCount().intValue(), model.getSuggestedInstallsItemPerRow().intValue());
        }
        d0Var.f96664f = model.getDisableOrganicZeroState();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        w wVar;
        Object obj;
        if (continuation instanceof w) {
            wVar = (w) continuation;
            int i5 = wVar.f63198d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f63198d = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(continuation);
            }
        }
        Object objA = wVar.f63196b;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = wVar.f63198d;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new x(userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null) {
                List<BranchContainer<BranchEntity>> results = zeroStateCacheModelB.getResults();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = results.iterator();
                while (it.hasNext()) {
                    b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
                }
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Object next = it2.next();
                    b50.a aVarF = ((BranchEntity) next).getF66462a().f();
                    if (Intrinsics.b(aVarF != null ? aVarF.f17557b : null, userHandle)) {
                        obj = next;
                        break;
                    }
                }
                BranchEntity branchEntity = (BranchEntity) obj;
                if (branchEntity != null) {
                    C3309p1.a("ZeroStateCache.invalid", new y(userHandle, branchEntity));
                    wVar.f63195a = userHandle;
                    wVar.f63198d = 1;
                    objA = a(zeroStateCacheModelB, wVar);
                    if (objA == obj2) {
                        return obj2;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) wVar.f63195a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new z(userHandle, (O3) objA));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull Continuation<? super Unit> continuation) {
        C3309p1.a("ZeroStateCache.sync", C3049e.f63143a);
        Jf jf2 = this.f63106g;
        if (jf2.f62754c == null) {
            jf2.f62754c = t70.m0.t(jf2.f62752a, new t70.i0("RegenerateQueue").plus(jf2.f62753b), null, new Mf(jf2, null), 2);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        C3050f c3050f;
        BranchEntity branchEntityA;
        if (continuation instanceof C3050f) {
            c3050f = (C3050f) continuation;
            int i5 = c3050f.f63148e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3050f.f63148e = i5 - Integer.MIN_VALUE;
            } else {
                c3050f = new C3050f(continuation);
            }
        }
        Object objA = c3050f.f63146c;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c3050f.f63148e;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new C3051g(str, userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null && (branchEntityA = a(zeroStateCacheModelB, str, userHandle)) != null) {
                C3309p1.a("ZeroStateCache.invalid", new C3052h(str, userHandle, branchEntityA));
                c3050f.f63144a = str;
                c3050f.f63145b = userHandle;
                c3050f.f63148e = 1;
                objA = a(zeroStateCacheModelB, c3050f);
                if (objA == obj) {
                    return obj;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) c3050f.f63145b;
        str = c3050f.f63144a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new i(str, userHandle, (O3) objA));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        n nVar;
        BranchEntity branchEntityA;
        if (continuation instanceof n) {
            nVar = (n) continuation;
            int i5 = nVar.f63174e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f63174e = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(continuation);
            }
        }
        Object objA = nVar.f63172c;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = nVar.f63174e;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new o(str, userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null && (branchEntityA = a(zeroStateCacheModelB, str, userHandle)) != null) {
                C3309p1.a("ZeroStateCache.invalid", new p(str, userHandle, branchEntityA));
                nVar.f63170a = str;
                nVar.f63171b = userHandle;
                nVar.f63174e = 1;
                objA = a(zeroStateCacheModelB, nVar);
                if (objA == obj) {
                    return obj;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) nVar.f63171b;
        str = nVar.f63170a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new q(str, userHandle, (O3) objA));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(@NotNull Continuation<? super Unit> continuation) {
        E e3;
        Object next;
        if (continuation instanceof E) {
            e3 = (E) continuation;
            int i5 = e3.f63122c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e3.f63122c = i5 - Integer.MIN_VALUE;
            } else {
                e3 = new E(continuation);
            }
        }
        Object objA = e3.f63120a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = e3.f63122c;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.invalid", F.f63123a);
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null) {
                List<BranchContainer<BranchEntity>> results = zeroStateCacheModelB.getResults();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = results.iterator();
                while (it.hasNext()) {
                    b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
                }
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it2.next();
                    if (!this.f63102c.a((BranchEntity) next)) {
                        break;
                    }
                }
                BranchEntity branchEntity = (BranchEntity) next;
                if (branchEntity != null) {
                    C3309p1.a("ZeroStateCache.invalid", new G(branchEntity));
                    e3.f63122c = 1;
                    objA = a(zeroStateCacheModelB, e3);
                    if (objA == obj) {
                        return obj;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new H((O3) objA));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
        r rVar;
        if (continuation instanceof r) {
            rVar = (r) continuation;
            int i5 = rVar.f63185c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f63185c = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(continuation);
            }
        }
        Object obj = rVar.f63183a;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = rVar.f63185c;
        if (i11 == 0) {
            ResultKt.b(obj);
            UserHandle userHandle = this.f63103d.f65680a.getUserHandle(j11);
            if (userHandle != null) {
                rVar.f63185c = 1;
                if (c(userHandle, rVar) == obj2) {
                    return obj2;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3460y0> list, @NotNull Continuation<? super Unit> continuation) {
        A a11;
        Object obj;
        if (continuation instanceof A) {
            a11 = (A) continuation;
            int i5 = a11.f63111e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a11.f63111e = i5 - Integer.MIN_VALUE;
            } else {
                a11 = new A(continuation);
            }
        }
        Object objA = a11.f63109c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = a11.f63111e;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3309p1.a("ZeroStateCache.sync", new B(str, userHandle));
            ZeroStateCacheModel zeroStateCacheModelB = this.f63100a.b();
            if (zeroStateCacheModelB != null) {
                List<BranchContainer<BranchEntity>> results = zeroStateCacheModelB.getResults();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = results.iterator();
                while (it.hasNext()) {
                    b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Object next = it2.next();
                    BranchEntity branchEntity = (BranchEntity) next;
                    if (branchEntity instanceof BranchEntity.Shortcut) {
                        InterfaceC3331q6 interfaceC3331q6 = ((BranchEntity.Shortcut) branchEntity).f66450a;
                        b50.a aVarF = interfaceC3331q6.f();
                        if (Intrinsics.b(aVarF != null ? aVarF.f17556a : null, str)) {
                            b50.a aVarF2 = interfaceC3331q6.f();
                            if (Intrinsics.b(aVarF2 != null ? aVarF2.f17557b : null, userHandle)) {
                                arrayList2.add(next);
                            }
                        }
                    }
                }
                Iterator it3 = arrayList2.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    Object next2 = it3.next();
                    if (!this.f63102c.a((BranchEntity) next2)) {
                        obj = next2;
                        break;
                    }
                }
                BranchEntity branchEntity2 = (BranchEntity) obj;
                if (branchEntity2 != null) {
                    C3309p1.a("ZeroStateCache.invalid", new C(str, userHandle, branchEntity2));
                    a11.f63107a = str;
                    a11.f63108b = userHandle;
                    a11.f63111e = 1;
                    objA = a(zeroStateCacheModelB, a11);
                    if (objA == obj2) {
                        return obj2;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        userHandle = (UserHandle) a11.f63108b;
        str = a11.f63107a;
        ResultKt.b(objA);
        C3309p1.a("ZeroStateCache.invalid", new D(str, userHandle, (O3) objA));
        return Unit.f71706a;
    }

    @Nullable
    public final Object a(@NotNull ZeroStateCacheModel zeroStateCacheModel, @NotNull ContinuationImpl continuationImpl) {
        return t70.m0.y(this.f63105f, new Sf(this, zeroStateCacheModel, null), continuationImpl);
    }

    public static BranchEntity a(ZeroStateCacheModel zeroStateCacheModel, String str, UserHandle userHandle) {
        Object obj;
        List<BranchContainer<BranchEntity>> results = zeroStateCacheModel.getResults();
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = results.iterator();
        while (it.hasNext()) {
            b70.d.z0(((BranchContainer) it.next()).getContent(), arrayList);
        }
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            BranchEntity branchEntity = (BranchEntity) next;
            b50.a aVarF = branchEntity.getF66462a().f();
            if (Intrinsics.b(aVarF != null ? aVarF.f17556a : null, str)) {
                b50.a aVarF2 = branchEntity.getF66462a().f();
                if (Intrinsics.b(aVarF2 != null ? aVarF2.f17557b : null, userHandle)) {
                    obj = next;
                    break;
                }
            }
        }
        return (BranchEntity) obj;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }
}
