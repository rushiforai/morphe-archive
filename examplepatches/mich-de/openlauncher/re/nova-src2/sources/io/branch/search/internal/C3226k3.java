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

@DebugMetadata(c = "io.branch.search.internal.bundle.BundleManager$scheduleJob$1", f = "BundleManager.kt", l = {51}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.k3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3226k3 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f64911a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3209j3 f64912b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f64913c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f64914d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f64915e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3226k3(C3209j3 c3209j3, long j11, long j12, boolean z11, Continuation<? super C3226k3> continuation) {
        super(2, continuation);
        this.f64912b = c3209j3;
        this.f64913c = j11;
        this.f64914d = j12;
        this.f64915e = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3226k3(this.f64912b, this.f64913c, this.f64914d, this.f64915e, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3226k3) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64911a;
        if (i5 == 0) {
            ResultKt.b(obj);
            InterfaceC3164g8 interfaceC3164g8 = this.f64912b.f64872f;
            long j11 = this.f64913c;
            long j12 = this.f64914d;
            boolean z11 = this.f64915e;
            this.f64911a = 1;
            if (interfaceC3164g8.a(j11, j12, z11, this) == coroutineSingletons) {
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
