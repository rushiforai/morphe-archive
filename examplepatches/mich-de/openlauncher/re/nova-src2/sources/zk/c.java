package zk;

import com.google.common.io.BaseEncoding$DecodingException;
import vk.b0;

/* loaded from: classes.dex */
public final class c extends d {
    public c(String str, String str2) {
        this(new a(str, str2.toCharArray()), (Character) '=');
    }

    @Override // zk.d
    public final int b(byte[] bArr, CharSequence charSequence) throws BaseEncoding$DecodingException {
        CharSequence charSequenceH = h(charSequence);
        int length = charSequenceH.length();
        a aVar = this.f98550a;
        if (!aVar.f98544h[length % aVar.f98541e]) {
            throw new BaseEncoding$DecodingException("Invalid input length " + charSequenceH.length());
        }
        int i5 = 0;
        int i11 = 0;
        while (i5 < charSequenceH.length()) {
            int i12 = i5 + 2;
            int iA = (aVar.a(charSequenceH.charAt(i5 + 1)) << 12) | (aVar.a(charSequenceH.charAt(i5)) << 18);
            int i13 = i11 + 1;
            bArr[i11] = (byte) (iA >>> 16);
            if (i12 < charSequenceH.length()) {
                int i14 = i5 + 3;
                int iA2 = iA | (aVar.a(charSequenceH.charAt(i12)) << 6);
                int i15 = i11 + 2;
                bArr[i13] = (byte) ((iA2 >>> 8) & 255);
                if (i14 < charSequenceH.length()) {
                    i5 += 4;
                    i11 += 3;
                    bArr[i15] = (byte) ((iA2 | aVar.a(charSequenceH.charAt(i14))) & 255);
                } else {
                    i11 = i15;
                    i5 = i14;
                }
            } else {
                i11 = i13;
                i5 = i12;
            }
        }
        return i11;
    }

    @Override // zk.d
    public final void e(StringBuilder sb2, byte[] bArr, int i5) {
        int i11 = 0;
        b0.i(0, i5, bArr.length);
        for (int i12 = i5; i12 >= 3; i12 -= 3) {
            int i13 = i11 + 2;
            int i14 = ((bArr[i11 + 1] & 255) << 8) | ((bArr[i11] & 255) << 16);
            i11 += 3;
            int i15 = i14 | (bArr[i13] & 255);
            a aVar = this.f98550a;
            char[] cArr = aVar.f98538b;
            char[] cArr2 = aVar.f98538b;
            sb2.append(cArr[i15 >>> 18]);
            sb2.append(cArr2[(i15 >>> 12) & 63]);
            sb2.append(cArr2[(i15 >>> 6) & 63]);
            sb2.append(cArr2[i15 & 63]);
        }
        if (i11 < i5) {
            d(sb2, bArr, i11, i5 - i11);
        }
    }

    @Override // zk.d
    public final d g(a aVar, Character ch) {
        return new c(aVar, ch);
    }

    public c(a aVar, Character ch) {
        super(aVar, ch);
        b0.c(aVar.f98538b.length == 64);
    }
}
