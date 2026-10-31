package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Handler;
import android.util.Pair;
import android.view.Surface;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.nio.ByteBuffer;

/* renamed from: com.facebook.ads.redexgen.X.Sn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public interface InterfaceC1231Sn {
    @MetaExoPlayerCustomization
    void A5h(MediaFormat mediaFormat, Surface surface, MediaCrypto mediaCrypto, int i5, Object obj);

    int A6R();

    int A6T(MediaCodec.BufferInfo bufferInfo);

    ByteBuffer A8v(int i5);

    ByteBuffer A9H(int i5);

    MediaFormat A9I();

    @MetaExoPlayerCustomization
    Pair<Long, Integer> A9M();

    @MetaExoPlayerCustomization
    int A9x();

    void AIV(int i5, int i11, int i12, long j11, int i13);

    void AIX(int i5, int i11, C1114No c1114No, long j11, int i12);

    void AIp();

    void AIv(int i5, long j11);

    void AIw(int i5, boolean z11);

    void AKs(InterfaceC1230Sm interfaceC1230Sm, Handler handler);

    void AKt(Surface surface);

    void ALA(int i5);

    void flush();

    @MetaExoPlayerCustomization
    @Deprecated
    void reset();

    @MetaExoPlayerCustomization
    void start();

    @MetaExoPlayerCustomization
    @Deprecated
    void stop();
}
