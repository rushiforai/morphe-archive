package we;

import android.media.MediaCodec;
import android.os.HandlerThread;
import java.util.ArrayDeque;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: g, reason: collision with root package name */
    public static final ArrayDeque f94218g = new ArrayDeque();

    /* renamed from: h, reason: collision with root package name */
    public static final Object f94219h = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final MediaCodec f94220a;

    /* renamed from: b, reason: collision with root package name */
    public final HandlerThread f94221b;

    /* renamed from: c, reason: collision with root package name */
    public m.h f94222c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f94223d;

    /* renamed from: e, reason: collision with root package name */
    public final bg.g f94224e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f94225f;

    public d(MediaCodec mediaCodec, HandlerThread handlerThread) {
        bg.g gVar = new bg.g();
        this.f94220a = mediaCodec;
        this.f94221b = handlerThread;
        this.f94224e = gVar;
        this.f94223d = new AtomicReference();
    }

    public static c b() {
        ArrayDeque arrayDeque = f94218g;
        synchronized (arrayDeque) {
            try {
                if (arrayDeque.isEmpty()) {
                    return new c();
                }
                return (c) arrayDeque.removeFirst();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a() {
        if (this.f94225f) {
            try {
                m.h hVar = this.f94222c;
                hVar.getClass();
                hVar.removeCallbacksAndMessages(null);
                bg.g gVar = this.f94224e;
                gVar.c();
                m.h hVar2 = this.f94222c;
                hVar2.getClass();
                hVar2.obtainMessage(2).sendToTarget();
                synchronized (gVar) {
                    while (!gVar.f17888a) {
                        gVar.wait();
                    }
                }
            } catch (InterruptedException e3) {
                Thread.currentThread().interrupt();
                throw new IllegalStateException(e3);
            }
        }
    }
}
