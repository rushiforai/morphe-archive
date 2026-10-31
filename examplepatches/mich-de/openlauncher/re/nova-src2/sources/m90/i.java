package m90;

import java.io.InputStream;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public interface i extends j0, ReadableByteChannel {
    j H(long j11);

    byte[] L();

    long O(h hVar);

    String Q(Charset charset);

    boolean R(long j11, j jVar);

    j U();

    long a0();

    InputStream b0();

    g i();

    boolean j(long j11);

    void m(long j11);

    d0 peek();

    String r(long j11);

    byte readByte();

    int readInt();

    short readShort();

    void skip(long j11);

    long t(j jVar);

    int v(x xVar);

    long y(j jVar);

    String z();
}
