package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z4g extends f5g {
    public final char[] e;

    public z4g(x4g x4gVar) {
        super(x4gVar, (Character) null);
        this.e = new char[512];
        char[] cArr = x4gVar.b;
        if (cArr.length != 16) {
            lg8.r();
            throw null;
        }
        for (int i = 0; i < 256; i++) {
            char[] cArr2 = this.e;
            cArr2[i] = cArr[i >>> 4];
            cArr2[i | 256] = cArr[i & 15];
        }
    }

    @Override // defpackage.f5g
    public final void a(StringBuilder sb, byte[] bArr, int i) {
        jq7.A(0, i, bArr.length);
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = bArr[i2] & 255;
            char[] cArr = this.e;
            sb.append(cArr[i3]);
            sb.append(cArr[i3 | 256]);
        }
    }
}
