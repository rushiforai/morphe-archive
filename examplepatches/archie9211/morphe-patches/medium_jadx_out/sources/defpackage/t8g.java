package defpackage;

import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t8g implements lwf {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public t8g(int i, byte[] bArr, byte[] bArr2) {
        this.a = i;
        switch (i) {
            case 2:
                this.b = new i8g(bArr, 1);
                this.c = bArr2;
                break;
            default:
                this.b = new i8g(bArr, 0);
                this.c = bArr2;
                break;
        }
    }

    public byte[] a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr.length < 28) {
            ygf.l("ciphertext too short");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr, 12);
        return ((i8g) this.b).c(ByteBuffer.wrap(bArr, 12, bArr.length - 12), bArrCopyOf, bArr2);
    }

    @Override // defpackage.lwf
    public final byte[] b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        int i = this.a;
        byte[] bArrB = null;
        Object obj = this.c;
        switch (i) {
            case 0:
                Iterator it2 = ((vhg) obj).a(bArr).iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        ygf.l("decryption failed");
                        break;
                    } else {
                        try {
                            bArrB = ((p8g) it2.next()).a.b(bArr, bArr2);
                            break;
                        } catch (GeneralSecurityException unused) {
                        }
                    }
                }
                break;
            case 1:
                byte[] bArr3 = (byte[]) obj;
                if (bArr3.length != 0) {
                    if (!ejg.b(bArr3, bArr)) {
                        ygf.l("Decryption failed (OutputPrefix mismatch).");
                    }
                }
                break;
            default:
                byte[] bArr4 = (byte[]) obj;
                if (bArr4.length != 0) {
                    if (!ejg.b(bArr4, bArr)) {
                        ygf.l("Decryption failed (OutputPrefix mismatch).");
                    }
                }
                break;
        }
        return null;
    }

    @Override // defpackage.lwf
    public final byte[] c(byte[] bArr, byte[] bArr2) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                byte[] bArrC = ((p8g) obj2).a.c(bArr, bArr2);
                int length = bArr.length;
                return bArrC;
            case 1:
                ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArr.length + 28);
                byte[] bArrA = qig.a(12);
                byteBufferAllocate.put(bArrA);
                ((i8g) obj2).b(byteBufferAllocate, bArrA, bArr, bArr2);
                byte[] bArrArray = byteBufferAllocate.array();
                byte[] bArr3 = (byte[]) obj;
                return bArr3.length == 0 ? bArrArray : il7.H(bArr3, bArrArray);
            default:
                ByteBuffer byteBufferAllocate2 = ByteBuffer.allocate(bArr.length + 40);
                byte[] bArrA2 = qig.a(24);
                byteBufferAllocate2.put(bArrA2);
                ((i8g) obj2).b(byteBufferAllocate2, bArrA2, bArr, bArr2);
                byte[] bArrArray2 = byteBufferAllocate2.array();
                byte[] bArr4 = (byte[]) obj;
                return bArr4.length == 0 ? bArrArray2 : il7.H(bArr4, bArrArray2);
        }
    }

    public byte[] d(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        if (bArr.length < 40) {
            ygf.l("ciphertext too short");
            return null;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr, 24);
        return ((i8g) this.b).c(ByteBuffer.wrap(bArr, 24, bArr.length - 24), bArrCopyOf, bArr2);
    }

    public t8g(p8g p8gVar, vhg vhgVar) {
        this.a = 0;
        this.b = p8gVar;
        this.c = vhgVar;
    }
}
