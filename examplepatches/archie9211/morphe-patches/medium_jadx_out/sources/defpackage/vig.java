package defpackage;

import com.google.android.recaptcha.internal.zzqb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vig extends yig {
    public vig(String str, String str2) {
        oig oigVar = new oig(str, str2.toCharArray());
        super(oigVar, (Character) '=');
        if (oigVar.b.length == 64) {
            return;
        }
        lg8.r();
        throw null;
    }

    @Override // defpackage.yig
    public final void a(StringBuilder sb, byte[] bArr, int i) {
        int i2 = 0;
        jq7.D(0, i, bArr.length);
        for (int i3 = i; i3 >= 3; i3 -= 3) {
            int i4 = ((bArr[i2 + 1] & 255) << 8) | ((bArr[i2] & 255) << 16) | (bArr[i2 + 2] & 255);
            char[] cArr = this.a.b;
            sb.append(cArr[i4 >>> 18]);
            sb.append(cArr[(i4 >>> 12) & 63]);
            sb.append(cArr[(i4 >>> 6) & 63]);
            sb.append(cArr[i4 & 63]);
            i2 += 3;
        }
        if (i2 < i) {
            b(i2, i - i2, sb, bArr);
        }
    }

    public final int e(byte[] bArr, CharSequence charSequence) throws zzqb {
        CharSequence charSequenceC = c(charSequence);
        int length = charSequenceC.length();
        oig oigVar = this.a;
        if (!oigVar.h[length % oigVar.e]) {
            int length2 = charSequenceC.length();
            throw new zzqb(b09.A(new StringBuilder(String.valueOf(length2).length() + 21), length2, "Invalid input length "));
        }
        int i = 0;
        int i2 = 0;
        while (i < charSequenceC.length()) {
            int i3 = i2 + 1;
            int iA = (oigVar.a(charSequenceC.charAt(i + 1)) << 12) | (oigVar.a(charSequenceC.charAt(i)) << 18);
            bArr[i2] = (byte) (iA >>> 16);
            int i4 = i + 2;
            if (i4 < charSequenceC.length()) {
                int i5 = i + 3;
                int iA2 = iA | (oigVar.a(charSequenceC.charAt(i4)) << 6);
                int i6 = i2 + 2;
                bArr[i3] = (byte) ((iA2 >>> 8) & 255);
                if (i5 < charSequenceC.length()) {
                    i += 4;
                    i2 += 3;
                    bArr[i6] = (byte) ((iA2 | oigVar.a(charSequenceC.charAt(i5))) & 255);
                } else {
                    i2 = i6;
                    i = i5;
                }
            } else {
                i = i4;
                i2 = i3;
            }
        }
        return i2;
    }
}
