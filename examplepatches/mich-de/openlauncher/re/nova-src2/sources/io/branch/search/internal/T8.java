package io.branch.search.internal;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.LocalUserManager$all$2", f = "PackageSyncManager.kt", l = {71}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class T8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<Long>>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63382a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ S8 f63383b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T8(S8 s82, Continuation<? super T8> continuation) {
        super(2, continuation);
        this.f63383b = s82;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new T8(this.f63383b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new T8(this.f63383b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63382a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        S8 s82 = this.f63383b;
        this.f63382a = 1;
        s82.getClass();
        a80.e eVar = t70.y0.f88884a;
        Object objY = t70.m0.y(a80.d.f488c, new V8(s82, null), this);
        return objY == coroutineSingletons ? coroutineSingletons : objY;
    }
}
