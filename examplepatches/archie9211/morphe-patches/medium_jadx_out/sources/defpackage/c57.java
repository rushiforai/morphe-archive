package defpackage;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class c57 extends g21 {
    public final byte[] b;
    public int c = 0;

    public c57(byte[] bArr) {
        this.b = bArr;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof g21) || size() != ((g21) obj).size()) {
            return false;
        }
        if (size() == 0) {
            return true;
        }
        if (obj instanceof c57) {
            return z((c57) obj, 0, size());
        }
        if (obj instanceof tlb) {
            return obj.equals(this);
        }
        String strValueOf = String.valueOf(obj.getClass());
        ay0.e(ka1.v(new StringBuilder(strValueOf.length() + 49), "Has a new type of ByteString been created? Found ", strValueOf));
        return false;
    }

    public final int hashCode() {
        int iT = this.c;
        if (iT == 0) {
            int size = size();
            iT = t(size, 0, size);
            if (iT == 0) {
                iT = 1;
            }
            this.c = iT;
        }
        return iT;
    }

    @Override // java.lang.Iterable
    public Iterator iterator() {
        return new x11(this);
    }

    @Override // defpackage.g21
    public void m(int i, int i2, int i3, byte[] bArr) {
        System.arraycopy(this.b, i, bArr, i2, i3);
    }

    @Override // defpackage.g21
    public final int p() {
        return 0;
    }

    @Override // defpackage.g21
    public final boolean q() {
        return true;
    }

    @Override // defpackage.g21
    public final boolean r() {
        byte[] bArr = this.b;
        return iq7.P(bArr, 0, bArr.length) == 0;
    }

    @Override // defpackage.g21
    public int size() {
        return this.b.length;
    }

    @Override // defpackage.g21
    public final int t(int i, int i2, int i3) {
        for (int i4 = i2; i4 < i2 + i3; i4++) {
            i = (i * 31) + this.b[i4];
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0018, code lost:
    
        if (r6[r8] > (-65)) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x001c, code lost:
    
        r8 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0049, code lost:
    
        if (r6[r8] > (-65)) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0092, code lost:
    
        if (r6[r7] > (-65)) goto L59;
     */
    @Override // defpackage.g21
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int u(int r7, int r8, int r9) {
        /*
            r6 = this;
            int r9 = r9 + r8
            byte[] r6 = r6.b
            if (r7 == 0) goto L95
            if (r8 < r9) goto L8
            return r7
        L8:
            byte r0 = (byte) r7
            r1 = -32
            r2 = -1
            r3 = -65
            if (r0 >= r1) goto L1f
            r7 = -62
            if (r0 < r7) goto L94
            int r7 = r8 + 1
            r8 = r6[r8]
            if (r8 <= r3) goto L1c
            goto L94
        L1c:
            r8 = r7
            goto L95
        L1f:
            r4 = -16
            if (r0 >= r4) goto L4c
            int r7 = r7 >> 8
            int r7 = ~r7
            byte r7 = (byte) r7
            if (r7 != 0) goto L37
            int r7 = r8 + 1
            r8 = r6[r8]
            if (r7 < r9) goto L34
            int r6 = defpackage.iq7.M(r0, r8)
            return r6
        L34:
            r5 = r8
            r8 = r7
            r7 = r5
        L37:
            if (r7 > r3) goto L94
            r4 = -96
            if (r0 != r1) goto L3f
            if (r7 < r4) goto L94
        L3f:
            r1 = -19
            if (r0 != r1) goto L45
            if (r7 >= r4) goto L94
        L45:
            int r7 = r8 + 1
            r8 = r6[r8]
            if (r8 <= r3) goto L1c
            goto L94
        L4c:
            int r1 = r7 >> 8
            int r1 = ~r1
            byte r1 = (byte) r1
            if (r1 != 0) goto L5f
            int r7 = r8 + 1
            r1 = r6[r8]
            if (r7 < r9) goto L5d
            int r6 = defpackage.iq7.M(r0, r1)
            return r6
        L5d:
            r8 = 0
            goto L65
        L5f:
            int r7 = r7 >> 16
            byte r7 = (byte) r7
            r5 = r8
            r8 = r7
            r7 = r5
        L65:
            if (r8 != 0) goto L81
            int r8 = r7 + 1
            r7 = r6[r7]
            if (r8 < r9) goto L7e
            r6 = -12
            if (r0 > r6) goto L7d
            if (r1 > r3) goto L7d
            if (r7 <= r3) goto L76
            goto L7d
        L76:
            int r6 = r1 << 8
            r6 = r6 ^ r0
            int r7 = r7 << 16
            r6 = r6 ^ r7
            return r6
        L7d:
            return r2
        L7e:
            r5 = r8
            r8 = r7
            r7 = r5
        L81:
            if (r1 > r3) goto L94
            int r0 = r0 << 28
            int r1 = r1 + 112
            int r1 = r1 + r0
            int r0 = r1 >> 30
            if (r0 != 0) goto L94
            if (r8 > r3) goto L94
            int r8 = r7 + 1
            r7 = r6[r7]
            if (r7 <= r3) goto L95
        L94:
            return r2
        L95:
            int r6 = defpackage.iq7.P(r6, r8, r9)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c57.u(int, int, int):int");
    }

    @Override // defpackage.g21
    public final int v() {
        return this.c;
    }

    @Override // defpackage.g21
    public final String w() {
        byte[] bArr = this.b;
        return new String(bArr, 0, bArr.length, "UTF-8");
    }

    @Override // defpackage.g21
    public final void y(OutputStream outputStream, int i, int i2) throws IOException {
        outputStream.write(this.b, i, i2);
    }

    public final boolean z(c57 c57Var, int i, int i2) {
        byte[] bArr = c57Var.b;
        int length = bArr.length;
        byte[] bArr2 = this.b;
        if (i2 > length) {
            ygf.c(40, i2, bArr2.length);
            return false;
        }
        if (i + i2 <= bArr.length) {
            int i3 = 0;
            while (i3 < i2) {
                if (bArr2[i3] != bArr[i]) {
                    return false;
                }
                i3++;
                i++;
            }
            return true;
        }
        int length2 = bArr.length;
        StringBuilder sb = new StringBuilder(59);
        sb.append("Ran off end of other: ");
        sb.append(i);
        sb.append(", ");
        sb.append(i2);
        ay0.e(b09.A(sb, length2, ", "));
        return false;
    }
}
