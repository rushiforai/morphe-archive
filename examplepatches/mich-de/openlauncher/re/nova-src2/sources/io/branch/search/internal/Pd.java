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

@DebugMetadata(c = "io.branch.search.internal.data.local.source.branchconfiguration.SharedPreferenceBranchNavigatorCoreConfigDataSource$put$2", f = "SharedPreferenceBranchNavigatorCoreConfigDataSource.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Pd extends SuspendLambda implements Function2<t70.j0, Continuation<? super Boolean>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Nd f63095a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y40.u f63096b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Pd(Nd nd2, y40.u uVar, Continuation<? super Pd> continuation) {
        super(2, continuation);
        this.f63095a = nd2;
        this.f63096b = uVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Pd(this.f63095a, this.f63096b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Pd(this.f63095a, this.f63096b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        return Boolean.valueOf(this.f63095a.f62992c.edit().putString("BranchConfigCache", W1.a(this.f63096b).toString()).commit());
    }
}
