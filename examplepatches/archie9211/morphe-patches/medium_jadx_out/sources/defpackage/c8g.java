package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c8g extends up1 {
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c8g(byte[] bArr, int i, int i2) {
        super(bArr, i);
        this.d = i2;
    }

    @Override // defpackage.up1
    public final int L() {
        switch (this.d) {
            case 0:
                return 12;
            default:
                return 24;
        }
    }

    @Override // defpackage.up1
    public final int[] Q(int i, int[] iArr) {
        switch (this.d) {
            case 0:
                if (iArr.length != 3) {
                    fm3.e("ChaCha20 uses 96-bit nonces, but got a %d-bit nonce", new Object[]{Integer.valueOf(iArr.length << 5)});
                } else {
                    int[] iArr2 = new int[16];
                    int[] iArr3 = (int[]) this.c;
                    int[] iArr4 = y7g.a;
                    System.arraycopy(iArr4, 0, iArr2, 0, iArr4.length);
                    System.arraycopy(iArr3, 0, iArr2, iArr4.length, 8);
                    iArr2[12] = i;
                    System.arraycopy(iArr, 0, iArr2, 13, iArr.length);
                }
                break;
            default:
                if (iArr.length != 6) {
                    fm3.e("XChaCha20 uses 192-bit nonces, but got a %d-bit nonce", new Object[]{Integer.valueOf(iArr.length << 5)});
                } else {
                    int[] iArr5 = new int[16];
                    int[] iArrE = y7g.e((int[]) this.c, iArr);
                    int[] iArr6 = y7g.a;
                    System.arraycopy(iArr6, 0, iArr5, 0, iArr6.length);
                    System.arraycopy(iArrE, 0, iArr5, iArr6.length, 8);
                    iArr5[12] = i;
                    iArr5[13] = 0;
                    iArr5[14] = iArr[4];
                    iArr5[15] = iArr[5];
                }
                break;
        }
        return null;
    }
}
