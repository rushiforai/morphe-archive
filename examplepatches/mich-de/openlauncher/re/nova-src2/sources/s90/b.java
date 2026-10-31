package s90;

import android.net.http.BidirectionalStream;
import java.nio.ByteBuffer;
import java.util.Collection;
import org.chromium.net.CronetException;
import org.chromium.net.ExperimentalBidirectionalStream;

/* loaded from: classes5.dex */
public final class b extends ExperimentalBidirectionalStream {

    /* renamed from: a, reason: collision with root package name */
    public final BidirectionalStream f86876a;

    /* renamed from: b, reason: collision with root package name */
    public final h f86877b;

    /* renamed from: c, reason: collision with root package name */
    public final String f86878c;

    /* renamed from: d, reason: collision with root package name */
    public final Collection f86879d;

    public b(BidirectionalStream bidirectionalStream, h hVar, String str, Collection collection) {
        this.f86876a = bidirectionalStream;
        this.f86877b = hVar;
        this.f86878c = str;
        this.f86879d = collection;
    }

    public final void a(int i5, s sVar, CronetException cronetException) {
        m.a(this.f86877b, this.f86878c, this.f86879d, null, i5, sVar, cronetException);
    }

    @Override // org.chromium.net.BidirectionalStream
    public final void cancel() {
        this.f86876a.cancel();
    }

    @Override // org.chromium.net.BidirectionalStream
    public final void flush() {
        this.f86876a.flush();
    }

    @Override // org.chromium.net.BidirectionalStream
    public final boolean isDone() {
        return this.f86876a.isDone();
    }

    @Override // org.chromium.net.BidirectionalStream
    public final void read(ByteBuffer byteBuffer) {
        this.f86876a.read(byteBuffer);
    }

    @Override // org.chromium.net.BidirectionalStream
    public final void start() {
        this.f86876a.start();
    }

    @Override // org.chromium.net.BidirectionalStream
    public final void write(ByteBuffer byteBuffer, boolean z11) {
        this.f86876a.write(byteBuffer, z11);
    }
}
