package m90;

import java.nio.channels.WritableByteChannel;

/* loaded from: classes.dex */
public interface h extends h0, WritableByteChannel {
    h C(j jVar);

    h E(long j11);

    long I(j0 j0Var);

    h T(long j11);

    h Y(int i5, int i11, byte[] bArr);

    @Override // m90.h0, java.io.Flushable
    void flush();

    g i();

    h u(String str);

    h write(byte[] bArr);

    h writeByte(int i5);

    h writeInt(int i5);

    h writeShort(int i5);
}
