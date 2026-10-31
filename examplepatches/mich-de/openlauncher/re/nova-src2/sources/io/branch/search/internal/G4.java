package io.branch.search.internal;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.CorosKt$withBranchCancellationSignal$2", f = "Coros.kt", l = {474}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class G4 extends SuspendLambda implements Function2<t70.j0, Continuation<Object>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62510a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1<N1, Object> f62511b;

    public static final class a extends Lambda implements Function1<Throwable, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ N1 f62512a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(N1 n12) {
            super(1);
            this.f62512a = n12;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            this.f62512a.a();
            return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public G4(Function1<? super N1, Object> function1, Continuation<? super G4> continuation) {
        super(2, continuation);
        this.f62511b = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new G4(this.f62511b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new G4(this.f62511b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62510a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        Function1<N1, Object> function1 = this.f62511b;
        this.f62510a = 1;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(this));
        mVar.t();
        N1 n12 = new N1();
        mVar.v(new a(n12));
        try {
            mVar.i(function1.invoke(n12), null);
        } catch (Exception e3) {
            int i11 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(e3));
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        return objS == coroutineSingletons ? coroutineSingletons : objS;
    }
}
