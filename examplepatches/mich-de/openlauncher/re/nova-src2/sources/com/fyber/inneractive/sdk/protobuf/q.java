package com.fyber.inneractive.sdk.protobuf;

import java.nio.charset.Charset;

/* loaded from: classes.dex */
public class q extends p {
    private static final long serialVersionUID = 1;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f30874d;

    public q(byte[] bArr) {
        bArr.getClass();
        this.f30874d = bArr;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public void a(int i5, byte[] bArr) {
        System.arraycopy(this.f30874d, 0, bArr, 0, i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public byte c(int i5) {
        return this.f30874d[i5];
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public byte d(int i5) {
        return this.f30874d[i5];
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final s e(int i5) {
        int iA = s.a(0, i5, size());
        return iA == 0 ? s.f30889b : new n(this.f30874d, g(), iA);
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof s) || size() != ((s) obj).size()) {
            return false;
        }
        if (size() == 0) {
            return true;
        }
        if (!(obj instanceof q)) {
            return obj.equals(this);
        }
        q qVar = (q) obj;
        int i5 = this.f30891a;
        int i11 = qVar.f30891a;
        if (i5 != 0 && i11 != 0 && i5 != i11) {
            return false;
        }
        int size = size();
        if (size > qVar.size()) {
            throw new IllegalArgumentException("Length too large: " + size + size());
        }
        if (size > qVar.size()) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Ran off end of other: 0, ", size, ", ");
            sbA.append(qVar.size());
            throw new IllegalArgumentException(sbA.toString());
        }
        byte[] bArr = this.f30874d;
        byte[] bArr2 = qVar.f30874d;
        int iG = g() + size;
        int iG2 = g();
        int iG3 = qVar.g();
        while (iG2 < iG) {
            if (bArr[iG2] != bArr2[iG3]) {
                return false;
            }
            iG2++;
            iG3++;
        }
        return true;
    }

    public int g() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public int size() {
        return this.f30874d.length;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final void a(k kVar) {
        kVar.a(this.f30874d, g(), size());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final boolean c() {
        int iG = g();
        return d4.f30786a.b(this.f30874d, iG, size() + iG);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final w d() {
        byte[] bArr = this.f30874d;
        int iG = g();
        int size = size();
        t tVar = new t(bArr, iG, size, true);
        try {
            tVar.d(size);
            return tVar;
        } catch (n1 e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final int a(int i5, int i11) {
        byte[] bArr = this.f30874d;
        int iG = g();
        Charset charset = l1.f30847a;
        for (int i12 = iG; i12 < iG + i11; i12++) {
            i5 = (i5 * 31) + bArr[i12];
        }
        return i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s
    public final String e() {
        return new String(this.f30874d, g(), size(), l1.f30847a);
    }
}
