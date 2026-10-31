package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import io.branch.search.internal.util.CorosKt;
import java.util.LinkedList;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class X3<T> {

    /* renamed from: a, reason: collision with root package name */
    public final int f63630a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.j0 f63631b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final c80.a f63632c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final LinkedList f63633d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final LinkedList f63634e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f63635f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f63636g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f63637h;

    @DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue$bottleAction$1", f = "Coros.kt", l = {479, 426}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public c80.a f63638a;

        /* renamed from: b, reason: collision with root package name */
        public X3 f63639b;

        /* renamed from: c, reason: collision with root package name */
        public Function1 f63640c;

        /* renamed from: d, reason: collision with root package name */
        public Function2 f63641d;

        /* renamed from: e, reason: collision with root package name */
        public int f63642e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ X3<T> f63643f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Function1<Continuation<? super Unit>, Object> f63644g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Function2<T, Continuation<? super Unit>, Object> f63645h;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public a(X3<T> x32, Function1<? super Continuation<? super Unit>, ? extends Object> function1, Function2<? super T, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f63643f = x32;
            this.f63644g = function1;
            this.f63645h = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new a(this.f63643f, this.f63644g, this.f63645h, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((a) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:22:0x005f, code lost:
        
            if (r3.invoke(r8) == r0) goto L23;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r6v2, types: [c80.a] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            X3<T> x32;
            c80.d dVar;
            Function1<Continuation<? super Unit>, Object> function1;
            Function2<T, Continuation<? super Unit>, Object> function2;
            c80.a aVar;
            Throwable th2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f63642e;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    x32 = this.f63643f;
                    c80.a aVar2 = x32.f63632c;
                    Function1<Continuation<? super Unit>, Object> function12 = this.f63644g;
                    Function2<T, Continuation<? super Unit>, Object> function22 = this.f63645h;
                    this.f63638a = aVar2;
                    this.f63639b = x32;
                    this.f63640c = function12;
                    this.f63641d = function22;
                    this.f63642e = 1;
                    dVar = (c80.d) aVar2;
                    if (dVar.e(this) != coroutineSingletons) {
                        function1 = function12;
                        function2 = function22;
                    }
                    return coroutineSingletons;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = this.f63638a;
                    try {
                        ResultKt.b(obj);
                        Unit unit = Unit.f71706a;
                        ((c80.d) aVar).g(null);
                        return unit;
                    } catch (Throwable th3) {
                        th2 = th3;
                        ((c80.d) aVar).g(null);
                        throw th2;
                    }
                }
                function2 = this.f63641d;
                function1 = this.f63640c;
                x32 = this.f63639b;
                ?? r62 = this.f63638a;
                ResultKt.b(obj);
                dVar = r62;
                if (x32.f63635f) {
                    if (x32.f63633d.size() >= x32.f63630a) {
                        x32.f63633d.poll();
                    }
                    x32.f63633d.offer(function2);
                    if (function1 != null) {
                        if (x32.f63634e.size() >= x32.f63630a) {
                            x32.f63634e.poll();
                        }
                        x32.f63634e.offer(function1);
                    }
                    Unit unit2 = Unit.f71706a;
                    dVar.g(null);
                    return unit2;
                }
                if (function1 != null) {
                    this.f63638a = dVar;
                    this.f63639b = null;
                    this.f63640c = null;
                    this.f63641d = null;
                    this.f63642e = 2;
                }
                aVar = dVar;
                Unit unit3 = Unit.f71706a;
                ((c80.d) aVar).g(null);
                return unit3;
            } catch (Throwable th4) {
                aVar = dVar;
                th2 = th4;
                ((c80.d) aVar).g(null);
                throw th2;
            }
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue", f = "Coros.kt", l = {479, TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 489, 489}, m = "onFail")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public X3 f63646a;

        /* renamed from: b, reason: collision with root package name */
        public Object f63647b;

        /* renamed from: c, reason: collision with root package name */
        public c80.a f63648c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f63649d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ X3<T> f63650e;

        /* renamed from: f, reason: collision with root package name */
        public int f63651f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(X3<T> x32, Continuation<? super b> continuation) {
            super(continuation);
            this.f63650e = x32;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63649d = obj;
            this.f63651f |= Integer.MIN_VALUE;
            return this.f63650e.a(this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue$onFail$3", f = "Coros.kt", l = {TTAdConstant.IMAGE_URL_CODE}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f63652a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ X3<T> f63653b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(X3<T> x32, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f63653b = x32;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new c(this.f63653b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new c(this.f63653b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0032 -> B:12:0x001a). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            Function1 function1;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f63652a;
            if (i5 == 0) {
                ResultKt.b(obj);
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                try {
                    ResultKt.b(obj);
                } catch (Throwable th2) {
                    X3.a(this.f63653b, th2);
                }
            }
            do {
                function1 = (Function1) this.f63653b.f63634e.poll();
                if (function1 == null) {
                    return Unit.f71706a;
                }
                this.f63652a = 1;
            } while (function1.invoke(this) != coroutineSingletons);
            return coroutineSingletons;
        }
    }

    public X3(int i5, @NotNull t70.j0 scope) {
        Intrinsics.g(scope, "scope");
        this.f63630a = i5;
        this.f63631b = scope;
        this.f63632c = new c80.d();
        this.f63633d = new LinkedList();
        this.f63634e = new LinkedList();
        this.f63635f = true;
    }

    public static final void a(X3 x32, Throwable th2) {
        x32.getClass();
        if (th2 instanceof CancellationException) {
            throw th2;
        }
        try {
            t70.f0 f0Var = (t70.f0) x32.f63631b.getCoroutineContext().get(t70.e0.f88787a);
            if (f0Var != null) {
                f0Var.handleException(x32.f63631b.getCoroutineContext(), th2);
            }
        } catch (Throwable unused) {
        }
    }

    public final void a(@NotNull Function2<? super T, ? super Continuation<? super Unit>, ? extends Object> action, @Nullable Function1<? super Continuation<? super Unit>, ? extends Object> function1) throws Throwable {
        Intrinsics.g(action, "action");
        t70.m0.u(EmptyCoroutineContext.f71803a, new a(this, function1, action, null));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v18 */
    /* JADX WARN: Type inference failed for: r0v2, types: [io.branch.search.internal.X3$b, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v8, types: [io.branch.search.internal.X3] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        b bVarE;
        X3 x32;
        c80.a aVar;
        Throwable th2;
        Object obj;
        X3<T> x33;
        c80.a aVar2;
        X3 x34;
        if (continuation instanceof b) {
            b bVar = (b) continuation;
            int i5 = bVar.f63651f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f63651f = i5 - Integer.MIN_VALUE;
                bVarE = bVar;
            } else {
                bVarE = new b(this, continuation);
            }
        }
        Object obj2 = bVarE.f63649d;
        Object obj3 = CoroutineSingletons.f71806a;
        X3 x35 = bVarE.f63651f;
        try {
        } catch (Throwable th3) {
            c80.a aVar3 = x35.f63632c;
            bVarE.f63646a = x35;
            bVarE.f63647b = th3;
            bVarE.f63648c = aVar3;
            bVarE.f63651f = 4;
            c80.d dVar = (c80.d) aVar3;
            if (dVar.e(bVarE) != obj3) {
                x32 = x35;
                aVar = dVar;
                th2 = th3;
            }
        }
        try {
            if (x35 == 0) {
                ResultKt.b(obj2);
                c80.a aVar4 = this.f63632c;
                bVarE.f63646a = this;
                bVarE.f63647b = aVar4;
                bVarE.f63651f = 1;
                c80.d dVar2 = (c80.d) aVar4;
                if (dVar2.e(bVarE) != obj3) {
                    obj = dVar2;
                    x33 = this;
                }
                return obj3;
            }
            if (x35 != 1) {
                if (x35 == 2) {
                    X3 x36 = bVarE.f63646a;
                    ResultKt.b(obj2);
                    x35 = x36;
                    c80.a aVar5 = x35.f63632c;
                    bVarE.f63646a = x35;
                    bVarE.f63647b = aVar5;
                    bVarE.f63651f = 3;
                    c80.d dVar3 = (c80.d) aVar5;
                    bVarE = dVar3.e(bVarE);
                    if (bVarE != obj3) {
                        aVar2 = dVar3;
                        x34 = x35;
                        x34.f63637h = false;
                        return Unit.f71706a;
                    }
                    return obj3;
                }
                if (x35 == 3) {
                    aVar2 = (c80.a) bVarE.f63647b;
                    x34 = bVarE.f63646a;
                    ResultKt.b(obj2);
                    try {
                        x34.f63637h = false;
                        return Unit.f71706a;
                    } finally {
                    }
                }
                if (x35 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = bVarE.f63648c;
                th2 = (Throwable) bVarE.f63647b;
                x32 = bVarE.f63646a;
                ResultKt.b(obj2);
                try {
                    x32.f63637h = false;
                    Unit unit = Unit.f71706a;
                    throw th2;
                } finally {
                }
            }
            Object obj4 = (c80.a) bVarE.f63647b;
            X3<T> x37 = bVarE.f63646a;
            ResultKt.b(obj2);
            obj = obj4;
            x33 = x37;
            if (x33.f63637h) {
                return Unit.f71706a;
            }
            x33.f63637h = true;
            Unit unit2 = Unit.f71706a;
            t70.g2 g2VarT = t70.m0.t(x33.f63631b, null, null, new c(x33, null), 3);
            bVarE.f63646a = x33;
            bVarE.f63647b = null;
            bVarE.f63651f = 2;
            x35 = x33;
            if (g2VarT.K(bVarE) != obj3) {
                c80.a aVar52 = x35.f63632c;
                bVarE.f63646a = x35;
                bVarE.f63647b = aVar52;
                bVarE.f63651f = 3;
                c80.d dVar32 = (c80.d) aVar52;
                bVarE = dVar32.e(bVarE);
                if (bVarE != obj3) {
                }
            }
            return obj3;
        } finally {
        }
    }

    public /* synthetic */ X3(t70.j0 j0Var, int i5) {
        this(100, (i5 & 2) != 0 ? CorosKt.getBNCScope() : j0Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v2, types: [io.branch.search.internal.Z3, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v10, types: [io.branch.search.internal.X3] */
    /* JADX WARN: Type inference failed for: r11v22 */
    /* JADX WARN: Type inference failed for: r11v23 */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(C3411v2 c3411v2, @NotNull Continuation continuation) throws Throwable {
        Z3 z3E;
        X3 x32;
        Throwable th2;
        c80.a aVar;
        Object obj;
        X3<T> x33;
        Object obj2;
        X3 x34;
        c80.a aVar2;
        if (continuation instanceof Z3) {
            Z3 z32 = (Z3) continuation;
            int i5 = z32.f63813f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z32.f63813f = i5 - Integer.MIN_VALUE;
                z3E = z32;
            } else {
                z3E = new Z3(this, continuation);
            }
        }
        Object obj3 = z3E.f63811d;
        Object obj4 = CoroutineSingletons.f71806a;
        int i11 = z3E.f63813f;
        try {
        } catch (Throwable th3) {
            c80.a aVar3 = c3411v2.f63632c;
            z3E.f63808a = c3411v2;
            z3E.f63809b = th3;
            z3E.f63810c = aVar3;
            z3E.f63813f = 4;
            c80.d dVar = (c80.d) aVar3;
            if (dVar.e(z3E) != obj4) {
                x32 = c3411v2;
                th2 = th3;
                aVar = dVar;
            }
        }
        try {
            if (i11 == 0) {
                ResultKt.b(obj3);
                c80.a aVar4 = this.f63632c;
                z3E.f63808a = this;
                z3E.f63809b = c3411v2;
                z3E.f63810c = aVar4;
                z3E.f63813f = 1;
                c80.d dVar2 = (c80.d) aVar4;
                if (dVar2.e(z3E) != obj4) {
                    obj = c3411v2;
                    x33 = this;
                    obj2 = dVar2;
                }
                return obj4;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    X3 x35 = z3E.f63808a;
                    ResultKt.b(obj3);
                    c3411v2 = x35;
                    c80.a aVar5 = c3411v2.f63632c;
                    z3E.f63808a = c3411v2;
                    z3E.f63809b = aVar5;
                    z3E.f63813f = 3;
                    c80.d dVar3 = (c80.d) aVar5;
                    z3E = dVar3.e(z3E);
                    if (z3E != obj4) {
                        x34 = c3411v2;
                        aVar2 = dVar3;
                        x34.f63636g = false;
                        return Unit.f71706a;
                    }
                    return obj4;
                }
                if (i11 == 3) {
                    aVar2 = (c80.a) z3E.f63809b;
                    x34 = z3E.f63808a;
                    ResultKt.b(obj3);
                    try {
                        x34.f63636g = false;
                        return Unit.f71706a;
                    } finally {
                    }
                }
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = z3E.f63810c;
                th2 = (Throwable) z3E.f63809b;
                x32 = z3E.f63808a;
                ResultKt.b(obj3);
                try {
                    x32.f63636g = false;
                    Unit unit = Unit.f71706a;
                    throw th2;
                } finally {
                }
            }
            Object obj5 = z3E.f63810c;
            obj = z3E.f63809b;
            X3<T> x36 = z3E.f63808a;
            ResultKt.b(obj3);
            obj2 = obj5;
            x33 = x36;
            if (x33.f63636g) {
                return Unit.f71706a;
            }
            x33.f63636g = true;
            Unit unit2 = Unit.f71706a;
            t70.g2 g2VarT = t70.m0.t(x33.f63631b, null, null, new C3058a4(x33, obj, null), 3);
            z3E.f63808a = x33;
            z3E.f63809b = null;
            z3E.f63810c = null;
            z3E.f63813f = 2;
            c3411v2 = x33;
            if (g2VarT.K(z3E) != obj4) {
                c80.a aVar52 = c3411v2.f63632c;
                z3E.f63808a = c3411v2;
                z3E.f63809b = aVar52;
                z3E.f63813f = 3;
                c80.d dVar32 = (c80.d) aVar52;
                z3E = dVar32.e(z3E);
                if (z3E != obj4) {
                }
            }
            return obj4;
        } finally {
        }
    }
}
