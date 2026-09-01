package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c5g extends f5g {
    /* JADX WARN: Illegal instructions before constructor call */
    public c5g(String str, String str2) {
        char[] charArray = str2.toCharArray();
        super(new x4g(str, charArray), (Character) '=');
        if (charArray.length == 64) {
            return;
        }
        lg8.r();
        throw null;
    }

    @Override // defpackage.f5g
    public final void a(StringBuilder sb, byte[] bArr, int i) {
        int i2 = 0;
        jq7.A(0, i, bArr.length);
        for (int i3 = i; i3 >= 3; i3 -= 3) {
            int i4 = ((bArr[i2 + 1] & 255) << 8) | ((bArr[i2] & 255) << 16) | (bArr[i2 + 2] & 255);
            x4g x4gVar = this.a;
            char[] cArr = x4gVar.b;
            char[] cArr2 = x4gVar.b;
            sb.append(cArr[i4 >>> 18]);
            sb.append(cArr2[(i4 >>> 12) & 63]);
            sb.append(cArr2[(i4 >>> 6) & 63]);
            sb.append(cArr2[i4 & 63]);
            i2 += 3;
        }
        if (i2 < i) {
            b(i2, i - i2, sb, bArr);
        }
    }
}
