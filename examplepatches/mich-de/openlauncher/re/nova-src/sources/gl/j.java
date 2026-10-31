package gl;

import com.google.android.gms.internal.measurement.a0;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class j extends a0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f57736c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(byte[] bArr, int i5, int i11) {
        super(bArr, i5);
        this.f57736c = i11;
    }

    @Override // com.google.android.gms.internal.measurement.a0
    public final int[] b(int[] iArr, int i5) {
        switch (this.f57736c) {
            case 0:
                if (iArr.length != 3) {
                    throw new IllegalArgumentException(String.format("ChaCha20 uses 96-bit nonces, but got a %d-bit nonce", Integer.valueOf(iArr.length * 32)));
                }
                int[] iArr2 = new int[16];
                int[] iArr3 = (int[]) this.f32363b;
                int[] iArr4 = i.f57735a;
                System.arraycopy(iArr4, 0, iArr2, 0, iArr4.length);
                System.arraycopy(iArr3, 0, iArr2, iArr4.length, 8);
                iArr2[12] = i5;
                System.arraycopy(iArr, 0, iArr2, 13, iArr.length);
                return iArr2;
            default:
                if (iArr.length != 6) {
                    throw new IllegalArgumentException(String.format("XChaCha20 uses 192-bit nonces, but got a %d-bit nonce", Integer.valueOf(iArr.length * 32)));
                }
                int[] iArr5 = new int[16];
                int[] iArr6 = (int[]) this.f32363b;
                int[] iArr7 = new int[16];
                int[] iArr8 = i.f57735a;
                System.arraycopy(iArr8, 0, iArr7, 0, iArr8.length);
                System.arraycopy(iArr6, 0, iArr7, iArr8.length, 8);
                iArr7[12] = iArr[0];
                iArr7[13] = iArr[1];
                iArr7[14] = iArr[2];
                iArr7[15] = iArr[3];
                i.b(iArr7);
                iArr7[4] = iArr7[12];
                iArr7[5] = iArr7[13];
                iArr7[6] = iArr7[14];
                iArr7[7] = iArr7[15];
                int[] iArrCopyOf = Arrays.copyOf(iArr7, 8);
                System.arraycopy(iArr8, 0, iArr5, 0, iArr8.length);
                System.arraycopy(iArrCopyOf, 0, iArr5, iArr8.length, 8);
                iArr5[12] = i5;
                iArr5[13] = 0;
                iArr5[14] = iArr[4];
                iArr5[15] = iArr[5];
                return iArr5;
        }
    }

    @Override // com.google.android.gms.internal.measurement.a0
    public final int d() {
        switch (this.f57736c) {
            case 0:
                return 12;
            default:
                return 24;
        }
    }
}
