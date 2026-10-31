package mh;

/* loaded from: classes3.dex */
public final class d0 extends e0 {
    /* JADX WARN: Illegal instructions before constructor call */
    public d0(String str, String str2) {
        char[] charArray = str2.toCharArray();
        super(new b0(str, charArray), (Character) '=');
        if (charArray.length != 64) {
            throw new IllegalArgumentException();
        }
    }

    @Override // mh.e0
    public final void a(StringBuilder sb2, byte[] bArr, int i5) {
        int i11 = 0;
        a.m(0, i5, bArr.length);
        for (int i12 = i5; i12 >= 3; i12 -= 3) {
            int i13 = ((bArr[i11 + 1] & 255) << 8) | ((bArr[i11] & 255) << 16) | (bArr[i11 + 2] & 255);
            b0 b0Var = this.f76330a;
            char[] cArr = b0Var.f76315b;
            char[] cArr2 = b0Var.f76315b;
            sb2.append(cArr[i13 >>> 18]);
            sb2.append(cArr2[(i13 >>> 12) & 63]);
            sb2.append(cArr2[(i13 >>> 6) & 63]);
            sb2.append(cArr2[i13 & 63]);
            i11 += 3;
        }
        if (i11 < i5) {
            b(sb2, bArr, i11, i5 - i11);
        }
    }
}
