package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.B2;
import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.services.SelfInitializeJobImpl$selfInit$1", f = "SelfInitializeJob.kt", l = {23, 29}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.qd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3338qd extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f65572a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3321pd f65573b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f65574c;

    @DebugMetadata(c = "io.branch.search.internal.services.SelfInitializeJobImpl$selfInit$1$1$1", f = "SelfInitializeJob.kt", l = {30}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.qd$a */
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65575a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ y40.u f65576b;

        /* renamed from: io.branch.search.internal.qd$a$a, reason: collision with other inner class name */
        public static final class C0349a implements y40.r {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Continuation<y40.s> f65577a;

            public C0349a(SafeContinuation safeContinuation) {
                this.f65577a = safeContinuation;
            }

            @Override // y40.r
            public final void onComplete(@Nullable y40.s sVar, @Nullable Throwable th2) {
                Unit unit;
                if (sVar != null) {
                    Continuation<y40.s> continuation = this.f65577a;
                    int i5 = Result.f71687b;
                    continuation.resumeWith(sVar);
                    unit = Unit.f71706a;
                } else {
                    unit = null;
                }
                if (unit == null) {
                    Continuation<y40.s> continuation2 = this.f65577a;
                    int i11 = Result.f71687b;
                    if (th2 == null) {
                        th2 = new NoSuchElementException("No branch SDK instance available!");
                    }
                    continuation2.resumeWith(ResultKt.a(th2));
                }
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(y40.u uVar, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f65576b = uVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new a(this.f65576b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new a(this.f65576b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65575a;
            if (i5 == 0) {
                ResultKt.b(obj);
                y40.u uVar = this.f65576b;
                this.f65575a = 1;
                SafeContinuation safeContinuation = new SafeContinuation(IntrinsicsKt.b(this));
                y40.q qVar = y40.s.Companion;
                C0349a c0349a = new C0349a(safeContinuation);
                qVar.getClass();
                y40.q.a(uVar, c0349a);
                if (safeContinuation.c() == coroutineSingletons) {
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

    @DebugMetadata(c = "io.branch.search.internal.services.SelfInitializeJobImpl$selfInit$1$branchNavigatorCoreConfig$1", f = "SelfInitializeJob.kt", l = {26}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.qd$b */
    public static final class b extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.u>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65578a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Context f65579b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Context context, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f65579b = context;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new b(this.f65579b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new b(this.f65579b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65578a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            B2.a aVar = B2.Companion;
            Context context = this.f65579b;
            aVar.getClass();
            C3462y2 c3462y2A = B2.a.a(context);
            this.f65578a = 1;
            Nd nd2 = c3462y2A.f66304a;
            Object objY = t70.m0.y(nd2.f62991b, new Od(nd2, null), this);
            return objY == coroutineSingletons ? coroutineSingletons : objY;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3338qd(C3321pd c3321pd, Context context, Continuation<? super C3338qd> continuation) {
        super(2, continuation);
        this.f65573b = c3321pd;
        this.f65574c = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3338qd(this.f65573b, this.f65574c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3338qd(this.f65573b, this.f65574c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0047, code lost:
    
        if (t70.m0.y(r1, r4, r6) == r0) goto L17;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f65572a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.c0 c0Var = this.f65573b.f65486a;
            b bVar = new b(this.f65574c, null);
            this.f65572a = 1;
            obj = t70.m0.y(c0Var, bVar, this);
            if (obj != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        y40.u uVar = (y40.u) obj;
        if (uVar != null) {
            a80.e eVar = t70.y0.f88884a;
            u70.d dVar = y70.o.f96819a;
            a aVar = new a(uVar, null);
            this.f65572a = 2;
        }
        return Unit.f71706a;
    }
}
