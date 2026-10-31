package e20;

import androidx.datastore.core.CorruptionException;
import java.io.InputStream;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.ByteStreamsKt;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.protobuf.ProtoBuf;

/* loaded from: classes4.dex */
public final class w extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ InputStream f52089t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(InputStream inputStream, Continuation continuation) {
        super(2, continuation);
        this.f52089t = inputStream;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new w(this.f52089t, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((w) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws CorruptionException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        try {
            return (List) ProtoBuf.INSTANCE.decodeFromByteArray(y.f52093b, ByteStreamsKt.b(this.f52089t));
        } catch (SerializationException e3) {
            throw new CorruptionException("Unable to read Dismisses", e3);
        }
    }
}
