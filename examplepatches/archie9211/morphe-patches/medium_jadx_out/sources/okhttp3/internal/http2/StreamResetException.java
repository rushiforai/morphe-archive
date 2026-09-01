package okhttp3.internal.http2;

import defpackage.b14;
import java.io.IOException;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lokhttp3/internal/http2/StreamResetException;", "Ljava/io/IOException;", "okhttp"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class StreamResetException extends IOException {
    public final b14 a;

    public StreamResetException(b14 b14Var) {
        super("stream was reset: " + b14Var);
        this.a = b14Var;
    }
}
