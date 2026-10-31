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

@DebugMetadata(c = "io.branch.search.internal.cache.CacheScope$store$2", f = "CacheSystem.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class G3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3 f62507a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f62508b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f62509c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public G3(C3 c32, Object obj, Object obj2, Continuation<? super G3> continuation) {
        super(2, continuation);
        this.f62507a = c32;
        this.f62508b = obj;
        this.f62509c = obj2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new G3(this.f62507a, this.f62508b, this.f62509c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((G3) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws JSONException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        C3 c32 = this.f62507a;
        Object obj2 = this.f62508b;
        Object obj3 = this.f62509c;
        c32.getClass();
        long jA = C3.a(obj3);
        C3309p1.c(EnumC3131e9.Cache, "Calculated size : " + jA);
        c32.f62194f.put(obj2, Long.valueOf(jA));
        c32.f62197i.addAndGet(jA);
        return Unit.f71706a;
    }
}
