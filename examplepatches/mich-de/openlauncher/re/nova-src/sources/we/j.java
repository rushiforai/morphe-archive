package we;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.Handler;
import android.view.Surface;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public interface j {
    MediaFormat a();

    void b(ea.a aVar, Handler handler);

    void c(int i5);

    ByteBuffer d(int i5);

    void e(Surface surface);

    void f(int i5, ie.c cVar, long j11);

    void flush();

    void g(Bundle bundle);

    void h(int i5, long j11);

    int i();

    int j(MediaCodec.BufferInfo bufferInfo);

    void k(int i5, int i11, int i12, long j11);

    void l(int i5, boolean z11);

    ByteBuffer m(int i5);

    void release();
}
