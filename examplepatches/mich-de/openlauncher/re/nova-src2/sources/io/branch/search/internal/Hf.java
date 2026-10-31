package io.branch.search.internal;

import kotlin.Result;
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

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ZeroStateCacheConfigRepository$updateConfig$1", f = "ZeroStateCacheConfig.kt", l = {57, 142}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Hf extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public Nf f62591a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f62592b;

    /* renamed from: c, reason: collision with root package name */
    public int f62593c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f62594d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Ff f62595e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Nf f62596f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Hf(Ff ff, Nf nf2, Continuation<? super Hf> continuation) {
        super(2, continuation);
        this.f62595e = ff;
        this.f62596f = nf2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        Hf hf2 = new Hf(this.f62595e, this.f62596f, continuation);
        hf2.f62594d = obj;
        return hf2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((Hf) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0092  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        Object objA;
        Throwable thA;
        Ff ff;
        Nf remote;
        c80.a aVar;
        Ff ff2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62593c;
        try {
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (i5 == 0) {
            ResultKt.b(obj);
            ff = this.f62595e;
            remote = this.f62596f;
            int i12 = Result.f71687b;
            this.f62594d = ff;
            this.f62591a = remote;
            this.f62593c = 1;
            if (Ff.a(ff, remote, this) == coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = this.f62592b;
            remote = this.f62591a;
            ff2 = (Ff) this.f62594d;
            ResultKt.b(obj);
            try {
                Cf.Companion.getClass();
                Intrinsics.g(remote, "remote");
                ff2.f62484c = new Cf(ag.valueOf(remote.f62997a));
                objA = Unit.f71706a;
                ((c80.d) aVar).g(null);
                int i13 = Result.f71687b;
                thA = Result.a(objA);
                if (thA != null) {
                    C3309p1 c3309p1 = C3309p1.f65465a;
                    C3309p1.a(a50.b.f402c, "ZeroStateCacheConfig", "Failed to update zero state cache config", thA);
                }
                return Unit.f71706a;
            } catch (Throwable th3) {
                ((c80.d) aVar).g(null);
                throw th3;
            }
        }
        remote = this.f62591a;
        Ff ff3 = (Ff) this.f62594d;
        ResultKt.b(obj);
        ff = ff3;
        c80.a aVar2 = ff.f62485d;
        this.f62594d = ff;
        this.f62591a = remote;
        this.f62592b = aVar2;
        this.f62593c = 2;
        c80.d dVar = (c80.d) aVar2;
        if (dVar.e(this) != coroutineSingletons) {
            aVar = dVar;
            ff2 = ff;
            Cf.Companion.getClass();
            Intrinsics.g(remote, "remote");
            ff2.f62484c = new Cf(ag.valueOf(remote.f62997a));
            objA = Unit.f71706a;
            ((c80.d) aVar).g(null);
            int i132 = Result.f71687b;
            thA = Result.a(objA);
            if (thA != null) {
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
