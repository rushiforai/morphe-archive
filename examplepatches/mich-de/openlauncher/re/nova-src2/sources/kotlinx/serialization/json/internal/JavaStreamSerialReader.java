package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.InputStream;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J \u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\tH\u0016J\u0006\u0010\u000e\u001a\u00020\u000fR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lkotlinx/serialization/json/internal/JavaStreamSerialReader;", "Lkotlinx/serialization/json/internal/InternalJsonReader;", "stream", "Ljava/io/InputStream;", "<init>", "(Ljava/io/InputStream;)V", "reader", "Lkotlinx/serialization/json/internal/CharsetReader;", "read", b.f42142b, "buffer", b.f42142b, "bufferOffset", "count", "release", b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class JavaStreamSerialReader implements InternalJsonReader {

    @NotNull
    private final CharsetReader reader;

    public JavaStreamSerialReader(@NotNull InputStream stream) {
        Intrinsics.g(stream, "stream");
        this.reader = new CharsetReader(stream, Charsets.f72000b);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonReader
    public int read(@NotNull char[] buffer, int bufferOffset, int count) {
        Intrinsics.g(buffer, "buffer");
        return this.reader.read(buffer, bufferOffset, count);
    }

    public final void release() {
        this.reader.release();
    }
}
