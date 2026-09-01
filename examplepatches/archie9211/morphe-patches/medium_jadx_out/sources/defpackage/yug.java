package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yug implements lwf {
    public final kug a;
    public final nvg b;
    public final int c;
    public final byte[] d;

    public yug(kug kugVar, nvg nvgVar, int i, byte[] bArr) {
        this.a = kugVar;
        this.b = nvgVar;
        this.c = i;
        this.d = bArr;
    }

    public static yug a(u0g u0gVar) throws InvalidAlgorithmParameterException {
        byte[] bArrB = ((qvg) u0gVar.i.b).b();
        f1g f1gVar = u0gVar.h;
        kug kugVar = new kug(bArrB, f1gVar.c);
        lvg lvgVar = new lvg("HMAC".concat(String.valueOf(f1gVar.f)), new SecretKeySpec(((qvg) u0gVar.j.b).b(), "HMAC"));
        int i = f1gVar.d;
        nvg nvgVar = new nvg();
        nvgVar.b = lvgVar;
        nvgVar.a = i;
        nvgVar.c = new byte[0];
        nvgVar.d = new byte[0];
        if (i < 10) {
            throw new InvalidAlgorithmParameterException("tag size too small, need at least 10 bytes");
        }
        lvgVar.O(i, new byte[0]);
        return new yug(kugVar, nvgVar, i, u0gVar.k.b());
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int length = bArr.length;
        byte[] bArr3 = this.d;
        int length2 = bArr3.length;
        int i = this.c;
        if (length < length2 + i) {
            ygf.l("Decryption failed (ciphertext too short).");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Decryption failed (OutputPrefix mismatch).");
            return null;
        }
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, bArr3.length, bArr.length - i);
        byte[] bArrCopyOfRange2 = Arrays.copyOfRange(bArr, bArr.length - i, bArr.length);
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        if (!MessageDigest.isEqual(this.b.e(il7.H(bArr2, bArrCopyOfRange, Arrays.copyOf(ByteBuffer.allocate(8).putLong(((long) bArr2.length) * 8).array(), 8))), bArrCopyOfRange2)) {
            ygf.l("invalid MAC");
            return null;
        }
        int length3 = bArrCopyOfRange.length;
        kug kugVar = this.a;
        int i2 = kugVar.b;
        if (length3 < i2) {
            ygf.l(kSWQKWZ.TbvvaYtsy);
            return null;
        }
        byte[] bArr4 = new byte[i2];
        System.arraycopy(bArrCopyOfRange, 0, bArr4, 0, i2);
        int length4 = bArrCopyOfRange.length;
        int i3 = kugVar.b;
        byte[] bArr5 = new byte[length4 - i3];
        kugVar.a(bArrCopyOfRange, i3, bArrCopyOfRange.length - i3, bArr5, 0, bArr4, false);
        return bArr5;
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int length = bArr.length;
        kug kugVar = this.a;
        int i = kugVar.b;
        int i2 = Integer.MAX_VALUE - i;
        if (length > i2) {
            throw new GeneralSecurityException(b09.w(i2, "plaintext length can not exceed "));
        }
        byte[] bArr3 = new byte[bArr.length + i];
        byte[] bArrA = qig.a(i);
        System.arraycopy(bArrA, 0, bArr3, 0, i);
        kugVar.a(bArr, 0, bArr.length, bArr3, kugVar.b, bArrA, true);
        if (bArr2 == null) {
            bArr2 = new byte[0];
        }
        return il7.H(this.d, bArr3, this.b.e(il7.H(bArr2, bArr3, Arrays.copyOf(ByteBuffer.allocate(8).putLong(((long) bArr2.length) * 8).array(), 8))));
    }
}
