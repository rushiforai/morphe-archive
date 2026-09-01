package defpackage;

import com.google.android.recaptcha.internal.zzacz;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lmf extends nmf {
    public final byte[] c;
    public final int d;
    public final int e;

    public lmf(byte[] bArr, int i, int i2) {
        pmf.d(i, i + i2, bArr.length);
        this.c = bArr;
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.nmf
    public final boolean F(pmf pmfVar, int i, int i2) {
        if (i2 > pmfVar.m()) {
            int length = String.valueOf(i2).length();
            int i3 = this.e;
            ygf.c(length + 18 + String.valueOf(i3).length(), i2, i3);
            return false;
        }
        int i4 = i + i2;
        if (i4 <= pmfVar.m()) {
            boolean z = pmfVar instanceof omf;
            byte[] bArr = this.c;
            int i5 = this.d;
            if (z) {
                return pmf.e(i5, i, i2, bArr, ((omf) pmfVar).c);
            }
            if (!(pmfVar instanceof lmf)) {
                return pmfVar.q(i, i4).equals(q(i5, i2 + i5));
            }
            lmf lmfVar = (lmf) pmfVar;
            return pmf.e(i5, lmfVar.d + i, i2, bArr, lmfVar.c);
        }
        int iM = pmfVar.m();
        int length2 = String.valueOf(i).length();
        StringBuilder sb = new StringBuilder(length2 + 24 + String.valueOf(i2).length() + 2 + String.valueOf(iM).length());
        sb.append("Ran off end of other: ");
        sb.append(i);
        sb.append(", ");
        sb.append(i2);
        ay0.e(b09.A(sb, iM, ", "));
        return false;
    }

    @Override // defpackage.pmf
    public final byte f(int i) {
        return this.c[this.d + i];
    }

    @Override // defpackage.pmf
    public final int m() {
        return this.e;
    }

    @Override // defpackage.pmf
    public final pmf p(int i, int i2) {
        int iD = pmf.d(i, i2, this.e);
        if (iD == 0) {
            return pmf.b;
        }
        return new lmf(this.c, this.d + i, iD);
    }

    @Override // defpackage.pmf
    public final pmf q(int i, int i2) {
        int iD = pmf.d(i, i2, this.e);
        if (iD == 0) {
            return pmf.b;
        }
        return new lmf(this.c, this.d + i, iD);
    }

    @Override // defpackage.pmf
    public final void r(int i, int i2, int i3, byte[] bArr) {
        System.arraycopy(this.c, this.d + i, bArr, i2, i3);
    }

    @Override // defpackage.pmf
    public final ByteBuffer s() {
        return ByteBuffer.wrap(this.c, this.d, this.e).asReadOnlyBuffer();
    }

    @Override // defpackage.pmf
    public final void t(h30 h30Var) throws zzacz {
        h30Var.b0(this.c, this.d, this.e);
    }

    @Override // defpackage.pmf
    public final String u() {
        Charset charset = StandardCharsets.UTF_8;
        return new String(this.c, this.d, this.e, charset);
    }

    @Override // defpackage.pmf
    public final boolean v(pmf pmfVar) {
        return ((pmfVar instanceof omf) || (pmfVar instanceof lmf)) ? F(pmfVar, 0, this.e) : pmfVar.v(this);
    }

    @Override // defpackage.pmf
    public final int x(int i, int i2, int i3) {
        return tnf.b(i, this.d + i2, i3, this.c);
    }

    @Override // defpackage.pmf
    public final up1 y() {
        return up1.H(this.c, this.d, this.e);
    }
}
