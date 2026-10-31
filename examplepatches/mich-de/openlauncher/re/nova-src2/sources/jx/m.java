package jx;

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
import t70.j0;

/* loaded from: classes4.dex */
public final class m extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ OutputStream f70416t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ List f70417u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(OutputStream outputStream, List list, Continuation continuation) {
        super(2, continuation);
        this.f70416t = outputStream;
        this.f70417u = list;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new m(this.f70416t, this.f70417u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((m) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f70416t.write(ProtoBuf.INSTANCE.encodeToByteArray(n.f70419b, this.f70417u));
        return Unit.f71706a;
    }
}
