package en;

import androidx.datastore.core.CorruptionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.ByteStreamsKt;
import kotlinx.serialization.json.Json;
import t5.c1;

/* loaded from: classes3.dex */
public final class i implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final i f52836a = new i();

    /* renamed from: b, reason: collision with root package name */
    public static final h f52837b = new h(null, null, null, null, null);

    @Override // t5.c1
    public final /* bridge */ /* synthetic */ Object getDefaultValue() {
        return f52837b;
    }

    @Override // t5.c1
    public final Object readFrom(InputStream inputStream, ContinuationImpl continuationImpl) throws CorruptionException {
        try {
            Json.Companion companion = Json.INSTANCE;
            String strX0 = r70.j.x0(ByteStreamsKt.b(inputStream));
            companion.getSerializersModule();
            return (h) companion.decodeFromString(h.Companion.serializer(), strX0);
        } catch (Exception e3) {
            throw new CorruptionException("Cannot parse session configs", e3);
        }
    }

    @Override // t5.c1
    public final Object writeTo(Object obj, OutputStream outputStream, ContinuationImpl continuationImpl) throws IOException {
        outputStream.write(r70.j.z0(Json.INSTANCE.encodeToString(h.Companion.serializer(), (h) obj)));
        return Unit.f71706a;
    }
}
