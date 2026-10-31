package com.moloco.sdk.internal.utils;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.l0;
import t70.m0;

/* loaded from: classes.dex */
public final class a {

    /* JADX INFO: Add missing generic type declarations: [T] */
    @DebugMetadata(c = "com.moloco.sdk.internal.utils.CoroutineUtilsKt$withReentrantLock$2", f = "CoroutineUtils.kt", l = {54, 37}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.internal.utils.a$a, reason: collision with other inner class name */
    public static final class C0179a<T> extends SuspendLambda implements Function2<j0, Continuation<? super T>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Object f38203a;

        /* renamed from: b, reason: collision with root package name */
        public Object f38204b;

        /* renamed from: c, reason: collision with root package name */
        public int f38205c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ c80.a f38206d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Function1<Continuation<? super T>, Object> f38207e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C0179a(c80.a aVar, Function1<? super Continuation<? super T>, ? extends Object> function1, Continuation<? super C0179a> continuation) {
            super(2, continuation);
            this.f38206d = aVar;
            this.f38207e = function1;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super T> continuation) {
            return ((C0179a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C0179a(this.f38206d, this.f38207e, continuation);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v3, types: [c80.a] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws Throwable {
            Function1<Continuation<? super T>, Object> function1;
            c80.d dVar;
            c80.a aVar;
            Throwable th2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f38205c;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    c80.a aVar2 = this.f38206d;
                    function1 = this.f38207e;
                    this.f38203a = aVar2;
                    this.f38204b = function1;
                    this.f38205c = 1;
                    dVar = (c80.d) aVar2;
                    if (dVar.e(this) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = (c80.a) this.f38203a;
                    try {
                        ResultKt.b(obj);
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        ((c80.d) aVar).g(null);
                        throw th2;
                    }
                }
                function1 = (Function1) this.f38204b;
                ?? r32 = (c80.a) this.f38203a;
                ResultKt.b(obj);
                dVar = r32;
                this.f38203a = dVar;
                this.f38204b = null;
                this.f38205c = 2;
                Object objInvoke = function1.invoke(this);
                if (objInvoke != coroutineSingletons) {
                    aVar = dVar;
                    obj = objInvoke;
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                aVar = dVar;
                th2 = th4;
                ((c80.d) aVar).g(null);
                throw th2;
            }
        }
    }

    public static /* synthetic */ void a(j0 j0Var, CoroutineContext context, l0 start, Function2 block, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            context = EmptyCoroutineContext.f71803a;
        }
        if ((i5 & 2) != 0) {
            start = l0.f88813a;
        }
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        Intrinsics.g(start, "start");
        Intrinsics.g(block, "block");
        m0.s(j0Var, context, start, block);
    }

    public static final void a(@NotNull j0 j0Var, @NotNull CoroutineContext context, @NotNull l0 start, @NotNull Function2<? super j0, ? super Continuation<? super Unit>, ? extends Object> block) {
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        Intrinsics.g(start, "start");
        Intrinsics.g(block, "block");
        m0.s(j0Var, context, start, block);
    }

    @Nullable
    public static final <T> Object a(@NotNull c80.a aVar, @NotNull Function1<? super Continuation<? super T>, ? extends Object> function1, @NotNull Continuation<? super T> continuation) {
        d dVar = new d(aVar);
        return continuation.getContext().get(dVar) != null ? function1.invoke(continuation) : m0.y(new c(dVar), new C0179a(aVar, function1, null), continuation);
    }
}
