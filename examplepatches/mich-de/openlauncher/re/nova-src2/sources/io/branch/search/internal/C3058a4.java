package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.ChampagneQueue$uncork$3", f = "Coros.kt", l = {391}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.a4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3058a4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63885a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ X3<Object> f63886b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f63887c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3058a4(X3<Object> x32, Object obj, Continuation<? super C3058a4> continuation) {
        super(2, continuation);
        this.f63886b = x32;
        this.f63887c = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3058a4(this.f63886b, this.f63887c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3058a4(this.f63886b, this.f63887c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0034 -> B:12:0x001a). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Function2 function2;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63885a;
        if (i5 == 0) {
            ResultKt.b(obj);
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            try {
                ResultKt.b(obj);
            } catch (Throwable th2) {
                X3.a(this.f63886b, th2);
            }
        }
        do {
            function2 = (Function2) this.f63886b.f63633d.poll();
            if (function2 == null) {
                return Unit.f71706a;
            }
            obj2 = this.f63887c;
            this.f63885a = 1;
        } while (function2.invoke(obj2, this) != coroutineSingletons);
        return coroutineSingletons;
    }
}
