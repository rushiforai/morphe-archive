package defpackage;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import javax.crypto.AEADBadTagException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i8g {
    public static final mag d = mag.zza;
    public final up1 a;
    public final up1 b;
    public final /* synthetic */ int c;

    public i8g(byte[] bArr, int i) throws GeneralSecurityException {
        this.c = i;
        if (!d.zza()) {
            ygf.l("Can not use ChaCha20Poly1305 in FIPS-mode.");
            throw null;
        }
        this.a = a(1, bArr);
        this.b = a(0, bArr);
    }

    public static byte[] d(byte[] bArr, ByteBuffer byteBuffer) {
        int length = bArr.length % 16 == 0 ? bArr.length : (bArr.length + 16) - (bArr.length % 16);
        int iRemaining = byteBuffer.remaining();
        int i = iRemaining % 16;
        int i2 = (i == 0 ? iRemaining : (iRemaining + 16) - i) + length;
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(i2 + 16).order(ByteOrder.LITTLE_ENDIAN);
        byteBufferOrder.put(bArr);
        byteBufferOrder.position(length);
        byteBufferOrder.put(byteBuffer);
        byteBufferOrder.position(i2);
        byteBufferOrder.putLong(bArr.length);
        byteBufferOrder.putLong(iRemaining);
        return byteBufferOrder.array();
    }

    public final up1 a(int i, byte[] bArr) {
        switch (this.c) {
            case 0:
                return new c8g(bArr, i, 0);
            default:
                return new c8g(bArr, i, 1);
        }
    }

    public final void b(ByteBuffer byteBuffer, byte[] bArr, byte[] bArr2, byte[] bArr3) {
        if (byteBuffer.remaining() < bArr2.length + 16) {
            ay0.e("Given ByteBuffer output is too small");
            return;
        }
        int iPosition = byteBuffer.position();
        up1 up1Var = this.a;
        up1Var.getClass();
        if (byteBuffer.remaining() < bArr2.length) {
            ay0.e("Given ByteBuffer output is too small");
            return;
        }
        up1Var.P(bArr, byteBuffer, ByteBuffer.wrap(bArr2));
        byteBuffer.position(iPosition);
        byteBuffer.limit(byteBuffer.limit() - 16);
        if (bArr3 == null) {
            bArr3 = new byte[0];
        }
        ByteBuffer byteBufferN = this.b.N(0, bArr);
        byte[] bArr4 = new byte[32];
        byteBufferN.get(bArr4);
        byte[] bArrZ = gp7.z(bArr4, d(bArr3, byteBuffer));
        byteBuffer.limit(byteBuffer.limit() + 16);
        byteBuffer.put(bArrZ);
    }

    public final byte[] c(ByteBuffer byteBuffer, byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (byteBuffer.remaining() < 16) {
            ygf.l("ciphertext too short");
            return null;
        }
        int iPosition = byteBuffer.position();
        byte[] bArr3 = new byte[16];
        byteBuffer.position(byteBuffer.limit() - 16);
        byteBuffer.get(bArr3);
        byteBuffer.position(iPosition);
        byteBuffer.limit(byteBuffer.limit() - 16);
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        try {
            byte[] bArr4 = new byte[32];
            this.b.N(0, bArr).get(bArr4);
            if (!MessageDigest.isEqual(gp7.z(bArr4, d(bArr2, byteBuffer)), bArr3)) {
                throw new GeneralSecurityException("invalid MAC");
            }
            byteBuffer.position(iPosition);
            up1 up1Var = this.a;
            up1Var.getClass();
            ByteBuffer byteBufferAllocate = ByteBuffer.allocate(byteBuffer.remaining());
            up1Var.P(bArr, byteBufferAllocate, byteBuffer);
            return byteBufferAllocate.array();
        } catch (GeneralSecurityException e) {
            throw new AEADBadTagException(e.toString());
        }
    }
}
