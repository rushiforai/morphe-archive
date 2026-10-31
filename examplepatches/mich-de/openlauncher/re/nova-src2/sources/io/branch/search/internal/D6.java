package io.branch.search.internal;

import io.branch.search.internal.B2;
import io.branch.search.ui.UiContext;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class D6 {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f62340a;

        static {
            int[] iArr = new int[UiContext.values().length];
            iArr[0] = 1;
            iArr[1] = 2;
            f62340a = iArr;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.ExtensionsKt", f = "Extensions.kt", l = {ads_mobile_sdk.pd.R0, 103}, m = "awaitDependencyProviderInternal")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f62341a;

        /* renamed from: b, reason: collision with root package name */
        public int f62342b;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f62341a = obj;
            this.f62342b |= Integer.MIN_VALUE;
            return D6.a(null, 0L, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.ExtensionsKt$awaitDependencyProviderInternal$2", f = "Extensions.kt", l = {100}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Y1>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f62343a;

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new c(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return new c((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f62343a;
            if (i5 == 0) {
                ResultKt.b(obj);
                B2.a aVar = B2.Companion;
                this.f62343a = 1;
                aVar.getClass();
                obj = B2.f62102h.l(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return ((B2) obj).f62104b;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x006e, code lost:
    
        if (r12 == r1) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(@NotNull F4 f42, long j11, @NotNull Continuation<? super Y1> continuation) {
        b bVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f62342b;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f62342b = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objL = bVar.f62341a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f62342b;
        if (i11 == 0) {
            ResultKt.b(objL);
            long j12 = ((Boolean) f42.f62441d.getValue()).booleanValue() ? 2 * j11 : j11;
            if (j11 > 0) {
                c cVar = new c(null);
                bVar.f62342b = 1;
                Object objD = t70.p2.d(j12, cVar, bVar);
                if (objD != coroutineSingletons) {
                    return objD;
                }
            } else {
                B2.a aVar = B2.Companion;
                bVar.f62342b = 2;
                aVar.getClass();
                objL = B2.f62102h.l(bVar);
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objL);
            return objL;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(objL);
        return ((B2) objL).f62104b;
    }

    @Nullable
    public static final String a(@NotNull x80.k0 k0Var, @NotNull String sessionId) {
        Intrinsics.g(k0Var, "<this>");
        Intrinsics.g(sessionId, "sessionId");
        try {
            m90.g gVar = new m90.g();
            k0Var.writeTo(gVar);
            return new String(gVar.D(gVar.f76126b), Charsets.f72000b);
        } catch (Exception e3) {
            C3296o5.a(sessionId, e3, "RequestBody.flushToString");
            return null;
        }
    }
}
