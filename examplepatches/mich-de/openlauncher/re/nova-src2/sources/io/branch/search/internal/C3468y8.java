package io.branch.search.internal;

import io.branch.search.internal.multiprocess.LifecycleNotifier;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.LifecycleNotifier$onResume$1", f = "LifecycleNotifier.kt", l = {66}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.y8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3468y8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f66320a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LifecycleNotifier f66321b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3468y8(LifecycleNotifier lifecycleNotifier, Continuation<? super C3468y8> continuation) {
        super(2, continuation);
        this.f66321b = lifecycleNotifier;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3468y8(this.f66321b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3468y8(this.f66321b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66320a;
        if (i5 == 0) {
            ResultKt.b(obj);
            InterfaceC3227k4 interfaceC3227k4 = this.f66321b.f65287a;
            this.f66320a = 1;
            if (interfaceC3227k4.a(this) == coroutineSingletons) {
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
