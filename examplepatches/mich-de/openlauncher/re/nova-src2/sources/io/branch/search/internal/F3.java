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
import org.json.JSONException;

@DebugMetadata(c = "io.branch.search.internal.cache.CacheScope$getOrPut$2$1$1", f = "CacheSystem.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class F3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3 f62435a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f62436b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f62437c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public F3(C3 c32, Object obj, Object obj2, Continuation<? super F3> continuation) {
        super(2, continuation);
        this.f62435a = c32;
        this.f62436b = obj;
        this.f62437c = obj2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new F3(this.f62435a, this.f62436b, this.f62437c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((F3) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws JSONException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        C3 c32 = this.f62435a;
        Object obj2 = this.f62436b;
        Object obj3 = this.f62437c;
        c32.getClass();
        long jA = C3.a(obj3);
        C3309p1.c(EnumC3131e9.Cache, "Calculated size : " + jA);
        c32.f62194f.put(obj2, Long.valueOf(jA));
        c32.f62197i.addAndGet(jA);
        return Unit.f71706a;
    }
}
