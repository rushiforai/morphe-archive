package e20;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.protobuf.ProtoBuf;

/* loaded from: classes4.dex */
public final class x extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ OutputStream f52090t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ List f52091u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(OutputStream outputStream, List list, Continuation continuation) {
        super(2, continuation);
        this.f52090t = outputStream;
        this.f52091u = list;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new x(this.f52090t, this.f52091u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((x) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f52090t.write(ProtoBuf.INSTANCE.encodeToByteArray(y.f52093b, this.f52091u));
        return Unit.f71706a;
    }
}
