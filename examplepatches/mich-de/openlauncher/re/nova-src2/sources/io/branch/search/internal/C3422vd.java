package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import io.branch.search.internal.multiprocess.CannotBindException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$close$1", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.vd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3422vd extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f66187a;

    /* renamed from: b, reason: collision with root package name */
    public C3456xd f66188b;

    /* renamed from: c, reason: collision with root package name */
    public int f66189c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3456xd f66190d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3422vd(C3456xd c3456xd, Continuation<? super C3422vd> continuation) {
        super(2, continuation);
        this.f66190d = c3456xd;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3422vd(this.f66190d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3422vd(this.f66190d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        C3456xd c3456xd;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66189c;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3456xd c3456xd2 = this.f66190d;
            c80.a aVar = c3456xd2.f66294b;
            this.f66187a = aVar;
            this.f66188b = c3456xd2;
            this.f66189c = 1;
            c80.d dVar = (c80.d) aVar;
            if (dVar.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3456xd = c3456xd2;
            obj2 = dVar;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3456xd = this.f66188b;
            Object obj3 = this.f66187a;
            ResultKt.b(obj);
            obj2 = obj3;
        }
        try {
            if (c3456xd.f66297e) {
                return Unit.f71706a;
            }
            ((t70.s) c3456xd.f66295c).j0(new CannotBindException("Connection has been closed"));
            C3456xd.b(c3456xd);
            c3456xd.f66297e = true;
            return Unit.f71706a;
        } finally {
            ((c80.d) obj2).g(null);
        }
    }
}
