package mh;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class o0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final k0 f76366a;

    public o0(k0 k0Var) {
        this.f76366a = k0Var;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        s0 s0Var = (s0) obj;
        int iZza = s0Var.zza();
        int iC = s0.c((byte) 64);
        if (iC != iZza) {
            return iC - s0Var.zza();
        }
        k0 k0Var = ((o0) s0Var).f76366a;
        k0 k0Var2 = this.f76366a;
        byte[] bArr = k0Var2.f76353b;
        int length = bArr.length;
        byte[] bArr2 = k0Var.f76353b;
        if (length != bArr2.length) {
            return bArr.length - bArr2.length;
        }
        return h0.f76341a.compare(k0Var2.l(), k0Var.l());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && o0.class == obj.getClass()) {
            return this.f76366a.equals(((o0) obj).f76366a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(s0.c((byte) 64)), this.f76366a});
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final String toString() {
        b0 b0Var;
        int i5;
        boolean z11;
        c0 c0Var = e0.f76329d;
        e0 c0Var2 = c0Var.f76332c;
        if (c0Var2 == null) {
            b0 b0Var2 = c0Var.f76330a;
            char[] cArr = b0Var2.f76315b;
            int i11 = 0;
            while (true) {
                if (i11 >= cArr.length) {
                    b0Var = b0Var2;
                    break;
                }
                char c11 = cArr[i11];
                if (c11 < 'a' || c11 > 'z') {
                    i11++;
                } else {
                    int i12 = 0;
                    while (true) {
                        if (i12 >= cArr.length) {
                            z11 = false;
                            break;
                        }
                        char c12 = cArr[i12];
                        if (c12 >= 'A' && c12 <= 'Z') {
                            z11 = true;
                            break;
                        }
                        i12++;
                    }
                    if (z11) {
                        throw new IllegalStateException("Cannot call upperCase() on a mixed-case alphabet");
                    }
                    char[] cArr2 = new char[cArr.length];
                    for (int i13 = 0; i13 < cArr.length; i13++) {
                        char c13 = cArr[i13];
                        if (c13 >= 97 && c13 <= 122) {
                            c13 ^= 32;
                        }
                        cArr2[i13] = (char) c13;
                    }
                    b0Var = new b0(b0Var2.f76314a.concat(".upperCase()"), cArr2);
                    byte[] bArr = b0Var.f76320g;
                    if (b0Var2.f76321h && !b0Var.f76321h) {
                        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                        for (i5 = 65; i5 <= 90; i5++) {
                            int i14 = i5 | 32;
                            byte b11 = bArr[i5];
                            byte b12 = bArr[i14];
                            if (b11 == -1) {
                                bArrCopyOf[i5] = b12;
                            } else {
                                char c14 = (char) i5;
                                char c15 = (char) i14;
                                if (b12 != -1) {
                                    throw new IllegalStateException(a.c("Can't ignoreCase() since '%s' and '%s' encode different values", Character.valueOf(c14), Character.valueOf(c15)));
                                }
                                bArrCopyOf[i14] = b11;
                            }
                        }
                        b0Var = new b0(b0Var.f76314a.concat(".ignoreCase()"), b0Var.f76315b, bArrCopyOf, true);
                    }
                }
            }
            c0Var2 = b0Var == b0Var2 ? c0Var : new c0(b0Var);
            c0Var.f76332c = c0Var2;
        }
        byte[] bArrL = this.f76366a.l();
        return b.c0.l("h'", c0Var2.c(bArrL.length, bArrL), "'");
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c((byte) 64);
    }
}
