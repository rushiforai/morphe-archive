package defpackage;

import com.google.android.recaptcha.internal.zzacz;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class omf extends nmf {
    public final byte[] c;

    public omf(byte[] bArr) {
        bArr.getClass();
        this.c = bArr;
    }

    @Override // defpackage.nmf
    public final boolean F(pmf pmfVar, int i, int i2) {
        int iM = pmfVar.m();
        byte[] bArr = this.c;
        if (i2 > iM) {
            int length = String.valueOf(i2).length();
            int length2 = bArr.length;
            ygf.c(length + 18 + String.valueOf(length2).length(), i2, length2);
            return false;
        }
        int i3 = i + i2;
        if (i3 <= pmfVar.m()) {
            if (pmfVar instanceof omf) {
                return pmf.e(0, i, i2, bArr, ((omf) pmfVar).c);
            }
            if (!(pmfVar instanceof lmf)) {
                return pmfVar.q(i, i3).equals(q(0, i2));
            }
            lmf lmfVar = (lmf) pmfVar;
            return pmf.e(0, lmfVar.d + i, i2, bArr, lmfVar.c);
        }
        int iM2 = pmfVar.m();
        int length3 = String.valueOf(i).length();
        StringBuilder sb = new StringBuilder(length3 + 24 + String.valueOf(i2).length() + 2 + String.valueOf(iM2).length());
        sb.append("Ran off end of other: ");
        sb.append(i);
        sb.append(", ");
        sb.append(i2);
        ay0.e(b09.A(sb, iM2, ", "));
        return false;
    }

    @Override // defpackage.pmf
    public final byte f(int i) {
        return this.c[i];
    }

    @Override // defpackage.pmf
    public final int m() {
        return this.c.length;
    }

    @Override // defpackage.pmf
    public final pmf p(int i, int i2) {
        byte[] bArr = this.c;
        int iD = pmf.d(i, i2, bArr.length);
        return iD == 0 ? pmf.b : new lmf(bArr, i, iD);
    }

    @Override // defpackage.pmf
    public final pmf q(int i, int i2) {
        byte[] bArr = this.c;
        int iD = pmf.d(i, i2, bArr.length);
        return iD == 0 ? pmf.b : new lmf(bArr, i, iD);
    }

    @Override // defpackage.pmf
    public final void r(int i, int i2, int i3, byte[] bArr) {
        System.arraycopy(this.c, i, bArr, i2, i3);
    }

    @Override // defpackage.pmf
    public final ByteBuffer s() {
        return ByteBuffer.wrap(this.c).asReadOnlyBuffer();
    }

    @Override // defpackage.pmf
    public final void t(h30 h30Var) throws zzacz {
        byte[] bArr = this.c;
        h30Var.b0(bArr, 0, bArr.length);
    }

    @Override // defpackage.pmf
    public final String u() {
        return new String(this.c, StandardCharsets.UTF_8);
    }

    @Override // defpackage.pmf
    public final boolean v(pmf pmfVar) {
        boolean z = pmfVar instanceof omf;
        byte[] bArr = this.c;
        return z ? Arrays.equals(bArr, ((omf) pmfVar).c) : pmfVar instanceof lmf ? F(pmfVar, 0, bArr.length) : pmfVar.v(this);
    }

    @Override // defpackage.pmf
    public final int x(int i, int i2, int i3) {
        return tnf.b(i, i2, i3, this.c);
    }

    @Override // defpackage.pmf
    public final up1 y() {
        byte[] bArr = this.c;
        return up1.H(bArr, 0, bArr.length);
    }
}
