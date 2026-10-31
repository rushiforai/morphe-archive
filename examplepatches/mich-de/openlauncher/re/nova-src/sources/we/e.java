package we;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.HandlerThread;
import java.util.ArrayDeque;

/* loaded from: classes3.dex */
public final class e extends MediaCodec.Callback {

    /* renamed from: b, reason: collision with root package name */
    public final HandlerThread f94227b;

    /* renamed from: c, reason: collision with root package name */
    public Handler f94228c;

    /* renamed from: h, reason: collision with root package name */
    public MediaFormat f94233h;

    /* renamed from: i, reason: collision with root package name */
    public MediaFormat f94234i;

    /* renamed from: j, reason: collision with root package name */
    public MediaCodec.CodecException f94235j;

    /* renamed from: k, reason: collision with root package name */
    public long f94236k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f94237l;

    /* renamed from: m, reason: collision with root package name */
    public IllegalStateException f94238m;

    /* renamed from: a, reason: collision with root package name */
    public final Object f94226a = new Object();

    /* renamed from: d, reason: collision with root package name */
    public final ma0.c f94229d = new ma0.c();

    /* renamed from: e, reason: collision with root package name */
    public final ma0.c f94230e = new ma0.c();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayDeque f94231f = new ArrayDeque();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayDeque f94232g = new ArrayDeque();

    public e(HandlerThread handlerThread) {
        this.f94227b = handlerThread;
    }

    public final void a() {
        ArrayDeque arrayDeque = this.f94232g;
        if (!arrayDeque.isEmpty()) {
            this.f94234i = (MediaFormat) arrayDeque.getLast();
        }
        ma0.c cVar = this.f94229d;
        cVar.f76181a = 0;
        cVar.f76182b = -1;
        cVar.f76183c = 0;
        ma0.c cVar2 = this.f94230e;
        cVar2.f76181a = 0;
        cVar2.f76182b = -1;
        cVar2.f76183c = 0;
        this.f94231f.clear();
        arrayDeque.clear();
        this.f94235j = null;
    }

    @Override // android.media.MediaCodec.Callback
    public final void onError(MediaCodec mediaCodec, MediaCodec.CodecException codecException) {
        synchronized (this.f94226a) {
            this.f94235j = codecException;
        }
    }

    @Override // android.media.MediaCodec.Callback
    public final void onInputBufferAvailable(MediaCodec mediaCodec, int i5) {
        synchronized (this.f94226a) {
            this.f94229d.c(i5);
        }
    }

    @Override // android.media.MediaCodec.Callback
    public final void onOutputBufferAvailable(MediaCodec mediaCodec, int i5, MediaCodec.BufferInfo bufferInfo) {
        synchronized (this.f94226a) {
            try {
                MediaFormat mediaFormat = this.f94234i;
                if (mediaFormat != null) {
                    this.f94230e.c(-2);
                    this.f94232g.add(mediaFormat);
                    this.f94234i = null;
                }
                this.f94230e.c(i5);
                this.f94231f.add(bufferInfo);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.media.MediaCodec.Callback
    public final void onOutputFormatChanged(MediaCodec mediaCodec, MediaFormat mediaFormat) {
        synchronized (this.f94226a) {
            this.f94230e.c(-2);
            this.f94232g.add(mediaFormat);
            this.f94234i = null;
        }
    }
}
