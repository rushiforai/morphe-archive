package com.moloco.sdk.internal.scheduling;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.r1;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final j0 f37580a = k0.a(b.a().getMainImmediate());

    @DebugMetadata(c = "com.moloco.sdk.internal.scheduling.RunOnMainDispatcherKt$runOnMainDispatcher$1", f = "RunOnMainDispatcher.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37581a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Function0<Unit> f37582b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Function0<Unit> function0, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f37582b = function0;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new a(this.f37582b, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37581a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            this.f37582b.invoke();
            return Unit.f71706a;
        }
    }

    @NotNull
    public static final r1 a(@NotNull Function0<Unit> block) {
        Intrinsics.g(block, "block");
        return m0.t(f37580a, null, null, new a(block, null), 3);
    }
}
