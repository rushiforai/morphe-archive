package defpackage;

import java.io.InputStream;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public interface zz0 extends ikc, ReadableByteChannel {
    boolean C(long j, h21 h21Var);

    InputStream D0();

    boolean H();

    long O(h21 h21Var);

    long S(xz0 xz0Var);

    kz0 a();

    String b0(Charset charset);

    String h0();

    int i0();

    String o(long j);

    yua peek();

    h21 r(long j);

    long r0();

    byte readByte();

    boolean request(long j);

    void skip(long j);

    long u0(h21 h21Var);

    int w(dw8 dw8Var);

    void x0(long j);
}
