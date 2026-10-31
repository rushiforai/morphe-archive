package ka0;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f71308a = {100, 101, 120, 10, 0, 0, 0, 0};

    public static int a(byte[] bArr) {
        if (bArr.length < 8) {
            return -1;
        }
        int i5 = 0;
        while (true) {
            byte[] bArr2 = f71308a;
            if (i5 >= 4) {
                for (int i11 = 4; i11 < 7; i11++) {
                    byte b11 = bArr[i11];
                    if (b11 < 48 || b11 > 57) {
                        return -1;
                    }
                }
                if (bArr[7] != bArr2[7]) {
                    return -1;
                }
                return (bArr[6] - 48) + ((bArr[5] - 48) * 10) + ((bArr[4] - 48) * 100);
            }
            if (bArr[i5] != bArr2[i5]) {
                return -1;
            }
            i5++;
        }
    }
}
