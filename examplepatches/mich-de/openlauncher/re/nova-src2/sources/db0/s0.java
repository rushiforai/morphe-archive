package db0;

import java.io.IOException;
import java.io.OutputStream;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.protobuf.ProtoBuf;

/* loaded from: classes5.dex */
public final class s0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ OutputStream f49201t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m0 f49202u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(OutputStream outputStream, m0 m0Var, Continuation continuation) {
        super(2, continuation);
        this.f49201t = outputStream;
        this.f49202u = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new s0(this.f49201t, this.f49202u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((s0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f49201t.write(ProtoBuf.INSTANCE.encodeToByteArray(t0.f49205b, this.f49202u));
        return Unit.f71706a;
    }
}
