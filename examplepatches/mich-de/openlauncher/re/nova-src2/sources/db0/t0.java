package db0;

import androidx.datastore.core.CorruptionException;
import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.ByteStreamsKt;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.protobuf.ProtoBuf;
import t5.c1;
import t70.y0;

/* loaded from: classes.dex */
public final class t0 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final t0 f49204a = new t0();

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer f49205b = m0.Companion.serializer();

    @Override // t5.c1
    public final Object getDefaultValue() {
        return new m0(7, null, 0L);
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) throws CorruptionException {
        try {
            return ProtoBuf.INSTANCE.decodeFromByteArray(f49205b, ByteStreamsKt.b(inputStream));
        } catch (SerializationException e3) {
            throw new CorruptionException("Unable to read ZeroEvents", e3);
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) throws Throwable {
        a80.e eVar = y0.f88884a;
        Object objY = t70.m0.y(a80.d.f488c, new s0(outputStream, (m0) obj, null), continuationImpl);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }
}
