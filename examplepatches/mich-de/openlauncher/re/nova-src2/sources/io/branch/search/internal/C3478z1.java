package io.branch.search.internal;

import io.branch.search.internal.multiprocess.BncContentProvider;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$awaitInjection$2", f = "BncContentProvider.kt", l = {82}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.z1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3478z1 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Boolean>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f66352a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BncContentProvider f66353b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3478z1(BncContentProvider bncContentProvider, Continuation<? super C3478z1> continuation) {
        super(2, continuation);
        this.f66353b = bncContentProvider;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3478z1(this.f66353b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3478z1(this.f66353b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66352a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        t70.r rVar = this.f66353b.f65221f;
        this.f66352a = 1;
        Object objL = rVar.l(this);
        return objL == coroutineSingletons ? coroutineSingletons : objL;
    }
}
