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

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onAppForegrounded$1", f = "PackageSyncManager.kt", l = {583}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ta, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3385ta extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f65873a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3250la f65874b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3385ta(C3250la c3250la, Continuation<? super C3385ta> continuation) {
        super(2, continuation);
        this.f65874b = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3385ta(this.f65874b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3385ta(this.f65874b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f65873a;
        if (i5 == 0) {
            ResultKt.b(obj);
            if (this.f65874b.f64969f.a()) {
                C3250la c3250la = this.f65874b;
                this.f65873a = 1;
                if (C3250la.b(c3250la, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
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
