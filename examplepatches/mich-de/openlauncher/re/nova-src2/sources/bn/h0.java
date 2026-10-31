package bn;

import androidx.datastore.core.CorruptionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.ByteStreamsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.Json;

/* loaded from: classes3.dex */
public final class h0 implements t5.c1 {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f18208a;

    public h0(t0 sessionGenerator) {
        Intrinsics.g(sessionGenerator, "sessionGenerator");
        this.f18208a = sessionGenerator;
    }

    @Override // t5.c1
    public final Object getDefaultValue() {
        return new g0(this.f18208a.a(null), null, null);
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) throws CorruptionException {
        try {
            Json.Companion companion = Json.INSTANCE;
            String strX0 = r70.j.x0(ByteStreamsKt.b(inputStream));
            companion.getSerializersModule();
            return (g0) companion.decodeFromString(g0.Companion.serializer(), strX0);
        } catch (Exception e3) {
            throw new CorruptionException("Cannot parse session data", e3);
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) throws IOException {
        outputStream.write(r70.j.z0(Json.INSTANCE.encodeToString(g0.Companion.serializer(), (g0) obj)));
        return Unit.f71706a;
    }
}
