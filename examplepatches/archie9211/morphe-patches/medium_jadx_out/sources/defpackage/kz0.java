package defpackage;

import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.data.notification.YMl.DtuT;
import java.io.EOFException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kz0 implements zz0, xz0, Cloneable, ByteChannel {
    public iwb a;
    public long b;

    @Override // defpackage.xz0
    public final xz0 A(long j) {
        O0(dm2.V(j));
        return this;
    }

    public final short A0() throws EOFException {
        if (this.b < 2) {
            ay0.b();
            return (short) 0;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        int i = iwbVar.b;
        int i2 = iwbVar.c;
        if (i2 - i < 2) {
            return (short) ((readByte() & 255) | ((readByte() & 255) << 8));
        }
        byte[] bArr = iwbVar.a;
        int i3 = i + 1;
        int i4 = (bArr[i] & 255) << 8;
        int i5 = i + 2;
        int i6 = (bArr[i3] & 255) | i4;
        this.b -= 2;
        if (i5 == i2) {
            this.a = iwbVar.a();
            lwb.a(iwbVar);
        } else {
            iwbVar.b = i5;
        }
        return (short) i6;
    }

    public final void B() throws EOFException {
        skip(this.b);
    }

    @Override // defpackage.zz0
    public final boolean C(long j, h21 h21Var) {
        h21Var.getClass();
        return R(h21Var.e(), j, h21Var);
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 C0(h21 h21Var) {
        J0(h21Var);
        return this;
    }

    public final long D() {
        long j = this.b;
        if (j == 0) {
            return 0L;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        iwb iwbVar2 = iwbVar.g;
        iwbVar2.getClass();
        int i = iwbVar2.c;
        return (i >= 8192 || !iwbVar2.e) ? j : j - ((long) (i - iwbVar2.b));
    }

    @Override // defpackage.zz0
    public final InputStream D0() {
        return new iz0(this, 0);
    }

    public final short E0() throws EOFException {
        short sA0 = A0();
        return (short) (((sA0 & 255) << 8) | ((65280 & sA0) >>> 8));
    }

    @Override // defpackage.xz0
    public final xz0 F(int i) {
        N0(dm2.U(i));
        return this;
    }

    public final String F0(long j, Charset charset) throws EOFException {
        charset.getClass();
        if (j < 0 || j > 2147483647L) {
            ywb.g(ho2.D(j, "byteCount: "));
            return null;
        }
        if (this.b < j) {
            ay0.b();
            return null;
        }
        if (j == 0) {
            return "";
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        int i = iwbVar.b;
        if (((long) i) + j > iwbVar.c) {
            return new String(U(j), charset);
        }
        int i2 = (int) j;
        String str = new String(iwbVar.a, i, i2, charset);
        int i3 = iwbVar.b + i2;
        iwbVar.b = i3;
        this.b -= j;
        if (i3 == iwbVar.c) {
            this.a = iwbVar.a();
            lwb.a(iwbVar);
        }
        return str;
    }

    public final String G0() {
        return F0(this.b, wk1.a);
    }

    @Override // defpackage.zz0
    public final boolean H() {
        return this.b == 0;
    }

    public final h21 H0(int i) {
        if (i == 0) {
            return h21.d;
        }
        dm2.A(this.b, 0L, i);
        iwb iwbVar = this.a;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (i3 < i) {
            iwbVar.getClass();
            int i5 = iwbVar.c;
            int i6 = iwbVar.b;
            if (i5 == i6) {
                ay0.d("s.limit == s.pos");
                return null;
            }
            i3 += i5 - i6;
            i4++;
            iwbVar = iwbVar.f;
        }
        byte[][] bArr = new byte[i4][];
        int[] iArr = new int[i4 * 2];
        iwb iwbVar2 = this.a;
        int i7 = 0;
        while (i2 < i) {
            iwbVar2.getClass();
            bArr[i7] = iwbVar2.a;
            i2 += iwbVar2.c - iwbVar2.b;
            iArr[i7] = Math.min(i2, i);
            iArr[i7 + i4] = iwbVar2.b;
            iwbVar2.d = true;
            i7++;
            iwbVar2 = iwbVar2.f;
        }
        return new mwb(bArr, iArr);
    }

    public final void I(kz0 kz0Var, long j, long j2) {
        kz0Var.getClass();
        long j3 = j;
        dm2.A(this.b, j3, j2);
        if (j2 == 0) {
            return;
        }
        kz0Var.b += j2;
        iwb iwbVar = this.a;
        while (true) {
            iwbVar.getClass();
            long j4 = iwbVar.c - iwbVar.b;
            if (j3 < j4) {
                break;
            }
            j3 -= j4;
            iwbVar = iwbVar.f;
        }
        long j5 = j2;
        while (j5 > 0) {
            iwbVar.getClass();
            iwb iwbVarC = iwbVar.c();
            int i = iwbVarC.b + ((int) j3);
            iwbVarC.b = i;
            iwbVarC.c = Math.min(i + ((int) j5), iwbVarC.c);
            iwb iwbVar2 = kz0Var.a;
            if (iwbVar2 == null) {
                iwbVarC.g = iwbVarC;
                iwbVarC.f = iwbVarC;
                kz0Var.a = iwbVarC;
            } else {
                iwb iwbVar3 = iwbVar2.g;
                iwbVar3.getClass();
                iwbVar3.b(iwbVarC);
            }
            j5 -= (long) (iwbVarC.c - iwbVarC.b);
            iwbVar = iwbVar.f;
            j3 = 0;
        }
    }

    public final iwb I0(int i) {
        if (i < 1 || i > 8192) {
            ay0.e("unexpected capacity");
            return null;
        }
        iwb iwbVar = this.a;
        if (iwbVar == null) {
            iwb iwbVarB = lwb.b();
            this.a = iwbVarB;
            iwbVarB.g = iwbVarB;
            iwbVarB.f = iwbVarB;
            return iwbVarB;
        }
        iwb iwbVar2 = iwbVar.g;
        iwbVar2.getClass();
        if (iwbVar2.c + i <= 8192 && iwbVar2.e) {
            return iwbVar2;
        }
        iwb iwbVarB2 = lwb.b();
        iwbVar2.b(iwbVarB2);
        return iwbVarB2;
    }

    @Override // defpackage.xz0
    public final long J(ikc ikcVar) {
        ikcVar.getClass();
        long j = 0;
        while (true) {
            long jQ0 = ikcVar.q0(this, 8192L);
            if (jQ0 == -1) {
                return j;
            }
            j += jQ0;
        }
    }

    public final void J0(h21 h21Var) {
        h21Var.getClass();
        h21Var.u(this, h21Var.e());
    }

    public final void K0(int i) {
        iwb iwbVarI0 = I0(1);
        byte[] bArr = iwbVarI0.a;
        int i2 = iwbVarI0.c;
        iwbVarI0.c = i2 + 1;
        bArr[i2] = (byte) i;
        this.b++;
    }

    public final byte L(long j) {
        dm2.A(this.b, j, 1L);
        iwb iwbVar = this.a;
        iwbVar.getClass();
        long j2 = this.b;
        if (j2 - j < j) {
            while (j2 > j) {
                iwbVar = iwbVar.g;
                iwbVar.getClass();
                j2 -= (long) (iwbVar.c - iwbVar.b);
            }
            return iwbVar.a[(int) ((((long) iwbVar.b) + j) - j2)];
        }
        long j3 = 0;
        while (true) {
            int i = iwbVar.c;
            int i2 = iwbVar.b;
            long j4 = ((long) (i - i2)) + j3;
            if (j4 > j) {
                return iwbVar.a[(int) ((((long) i2) + j) - j3)];
            }
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j3 = j4;
        }
    }

    public final void L0(long j) {
        boolean z;
        if (j == 0) {
            K0(48);
            return;
        }
        if (j < 0) {
            j = -j;
            if (j < 0) {
                R0("-9223372036854775808");
                return;
            }
            z = true;
        } else {
            z = false;
        }
        byte[] bArr = b.a;
        int iNumberOfLeadingZeros = ((64 - Long.numberOfLeadingZeros(j)) * 10) >>> 5;
        int i = iNumberOfLeadingZeros + (j > b.b[iNumberOfLeadingZeros] ? 1 : 0);
        if (z) {
            i++;
        }
        iwb iwbVarI0 = I0(i);
        byte[] bArr2 = iwbVarI0.a;
        int i2 = iwbVarI0.c + i;
        while (j != 0) {
            i2--;
            bArr2[i2] = b.a[(int) (j % 10)];
            j /= 10;
        }
        if (z) {
            bArr2[i2 - 1] = 45;
        }
        iwbVarI0.c += i;
        this.b += (long) i;
    }

    public final void M0(long j) {
        if (j == 0) {
            K0(48);
            return;
        }
        long j2 = (j >>> 1) | j;
        long j3 = j2 | (j2 >>> 2);
        long j4 = j3 | (j3 >>> 4);
        long j5 = j4 | (j4 >>> 8);
        long j6 = j5 | (j5 >>> 16);
        long j7 = j6 | (j6 >>> 32);
        long j8 = j7 - ((j7 >>> 1) & 6148914691236517205L);
        long j9 = ((j8 >>> 2) & 3689348814741910323L) + (j8 & 3689348814741910323L);
        long j10 = ((j9 >>> 4) + j9) & 1085102592571150095L;
        long j11 = j10 + (j10 >>> 8);
        long j12 = j11 + (j11 >>> 16);
        int i = (int) ((((j12 & 63) + ((j12 >>> 32) & 63)) + 3) / 4);
        iwb iwbVarI0 = I0(i);
        byte[] bArr = iwbVarI0.a;
        int i2 = iwbVarI0.c;
        for (int i3 = (i2 + i) - 1; i3 >= i2; i3--) {
            bArr[i3] = b.a[(int) (15 & j)];
            j >>>= 4;
        }
        iwbVarI0.c += i;
        this.b += (long) i;
    }

    public final long N(byte b, long j, long j2) {
        iwb iwbVar;
        long j3 = j;
        long j4 = j2;
        long j5 = 0;
        if (0 > j3 || j3 > j4) {
            StringBuilder sb = new StringBuilder("size=");
            sb.append(this.b);
            wgd.y(sb, " fromIndex=", j3, " toIndex=");
            sb.append(j4);
            throw new IllegalArgumentException(sb.toString().toString());
        }
        long j6 = this.b;
        if (j4 > j6) {
            j4 = j6;
        }
        long j7 = -1;
        if (j3 == j4 || (iwbVar = this.a) == null) {
            return -1L;
        }
        if (j6 - j3 < j3) {
            while (j6 > j3) {
                iwbVar = iwbVar.g;
                iwbVar.getClass();
                j6 -= (long) (iwbVar.c - iwbVar.b);
            }
            while (j6 < j4) {
                byte[] bArr = iwbVar.a;
                long j8 = j7;
                int iMin = (int) Math.min(iwbVar.c, (((long) iwbVar.b) + j4) - j6);
                for (int i = (int) ((((long) iwbVar.b) + j3) - j6); i < iMin; i++) {
                    if (bArr[i] == b) {
                        return ((long) (i - iwbVar.b)) + j6;
                    }
                }
                j6 += (long) (iwbVar.c - iwbVar.b);
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                j7 = j8;
                j3 = j6;
            }
            return j7;
        }
        while (true) {
            long j9 = ((long) (iwbVar.c - iwbVar.b)) + j5;
            if (j9 > j3) {
                break;
            }
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j5 = j9;
        }
        while (j5 < j4) {
            byte[] bArr2 = iwbVar.a;
            int iMin2 = (int) Math.min(iwbVar.c, (((long) iwbVar.b) + j4) - j5);
            for (int i2 = (int) ((((long) iwbVar.b) + j3) - j5); i2 < iMin2; i2++) {
                if (bArr2[i2] == b) {
                    return ((long) (i2 - iwbVar.b)) + j5;
                }
            }
            j5 += (long) (iwbVar.c - iwbVar.b);
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j3 = j5;
        }
        return -1L;
    }

    public final void N0(int i) {
        iwb iwbVarI0 = I0(4);
        byte[] bArr = iwbVarI0.a;
        int i2 = iwbVarI0.c;
        bArr[i2] = (byte) ((i >>> 24) & 255);
        bArr[i2 + 1] = (byte) ((i >>> 16) & 255);
        bArr[i2 + 2] = (byte) ((i >>> 8) & 255);
        bArr[i2 + 3] = (byte) (i & 255);
        iwbVarI0.c = i2 + 4;
        this.b += 4;
    }

    @Override // defpackage.zz0
    public final long O(h21 h21Var) {
        h21Var.getClass();
        return Q(0L, h21Var);
    }

    public final void O0(long j) {
        iwb iwbVarI0 = I0(8);
        byte[] bArr = iwbVarI0.a;
        int i = iwbVarI0.c;
        bArr[i] = (byte) ((j >>> 56) & 255);
        bArr[i + 1] = (byte) ((j >>> 48) & 255);
        bArr[i + 2] = (byte) ((j >>> 40) & 255);
        bArr[i + 3] = (byte) ((j >>> 32) & 255);
        bArr[i + 4] = (byte) ((j >>> 24) & 255);
        bArr[i + 5] = (byte) ((j >>> 16) & 255);
        bArr[i + 6] = (byte) ((j >>> 8) & 255);
        bArr[i + 7] = (byte) (j & 255);
        iwbVarI0.c = i + 8;
        this.b += 8;
    }

    public final void P0(int i) {
        iwb iwbVarI0 = I0(2);
        byte[] bArr = iwbVarI0.a;
        int i2 = iwbVarI0.c;
        bArr[i2] = (byte) ((i >>> 8) & 255);
        bArr[i2 + 1] = (byte) (i & 255);
        iwbVarI0.c = i2 + 2;
        this.b += 2;
    }

    public final long Q(long j, h21 h21Var) {
        h21Var.getClass();
        long j2 = 0;
        if (j < 0) {
            ywb.g(ho2.D(j, "fromIndex < 0: "));
            return 0L;
        }
        iwb iwbVar = this.a;
        if (iwbVar == null) {
            return -1L;
        }
        long j3 = this.b;
        if (j3 - j < j) {
            while (j3 > j) {
                iwbVar = iwbVar.g;
                iwbVar.getClass();
                j3 -= (long) (iwbVar.c - iwbVar.b);
            }
            if (h21Var.e() == 2) {
                byte bJ = h21Var.j(0);
                byte bJ2 = h21Var.j(1);
                while (j3 < this.b) {
                    byte[] bArr = iwbVar.a;
                    int i = iwbVar.c;
                    for (int i2 = (int) ((((long) iwbVar.b) + j) - j3); i2 < i; i2++) {
                        byte b = bArr[i2];
                        if (b == bJ || b == bJ2) {
                            return ((long) (i2 - iwbVar.b)) + j3;
                        }
                    }
                    j3 += (long) (iwbVar.c - iwbVar.b);
                    iwbVar = iwbVar.f;
                    iwbVar.getClass();
                    j = j3;
                }
            } else {
                byte[] bArrI = h21Var.i();
                while (j3 < this.b) {
                    byte[] bArr2 = iwbVar.a;
                    int i3 = iwbVar.c;
                    for (int i4 = (int) ((((long) iwbVar.b) + j) - j3); i4 < i3; i4++) {
                        byte b2 = bArr2[i4];
                        for (byte b3 : bArrI) {
                            if (b2 == b3) {
                                return ((long) (i4 - iwbVar.b)) + j3;
                            }
                        }
                    }
                    j3 += (long) (iwbVar.c - iwbVar.b);
                    iwbVar = iwbVar.f;
                    iwbVar.getClass();
                    j = j3;
                }
            }
            return -1L;
        }
        while (true) {
            long j4 = ((long) (iwbVar.c - iwbVar.b)) + j2;
            if (j4 > j) {
                break;
            }
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j2 = j4;
        }
        if (h21Var.e() == 2) {
            byte bJ3 = h21Var.j(0);
            byte bJ4 = h21Var.j(1);
            while (j2 < this.b) {
                byte[] bArr3 = iwbVar.a;
                int i5 = iwbVar.c;
                for (int i6 = (int) ((((long) iwbVar.b) + j) - j2); i6 < i5; i6++) {
                    byte b4 = bArr3[i6];
                    if (b4 == bJ3 || b4 == bJ4) {
                        return ((long) (i6 - iwbVar.b)) + j2;
                    }
                }
                j2 += (long) (iwbVar.c - iwbVar.b);
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                j = j2;
            }
        } else {
            byte[] bArrI2 = h21Var.i();
            while (j2 < this.b) {
                byte[] bArr4 = iwbVar.a;
                int i7 = iwbVar.c;
                for (int i8 = (int) ((((long) iwbVar.b) + j) - j2); i8 < i7; i8++) {
                    byte b5 = bArr4[i8];
                    for (byte b6 : bArrI2) {
                        if (b5 == b6) {
                            return ((long) (i8 - iwbVar.b)) + j2;
                        }
                    }
                }
                j2 += (long) (iwbVar.c - iwbVar.b);
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                j = j2;
            }
        }
        return -1L;
    }

    public final void Q0(int i, int i2, String str) {
        char cCharAt;
        str.getClass();
        if (i < 0) {
            ywb.g(b09.w(i, "beginIndex < 0: "));
            return;
        }
        if (i2 < i) {
            ywb.g(ev6.v("endIndex < beginIndex: ", i2, i, " < "));
            return;
        }
        if (i2 > str.length()) {
            StringBuilder sbC = ev6.C("endIndex > string.length: ", i2, " > ");
            sbC.append(str.length());
            throw new IllegalArgumentException(sbC.toString().toString());
        }
        while (i < i2) {
            char cCharAt2 = str.charAt(i);
            if (cCharAt2 < 128) {
                iwb iwbVarI0 = I0(1);
                byte[] bArr = iwbVarI0.a;
                int i3 = iwbVarI0.c - i;
                int iMin = Math.min(i2, 8192 - i3);
                int i4 = i + 1;
                bArr[i + i3] = (byte) cCharAt2;
                while (true) {
                    i = i4;
                    if (i >= iMin || (cCharAt = str.charAt(i)) >= 128) {
                        break;
                    }
                    i4 = i + 1;
                    bArr[i + i3] = (byte) cCharAt;
                }
                int i5 = iwbVarI0.c;
                int i6 = (i3 + i) - i5;
                iwbVarI0.c = i5 + i6;
                this.b += (long) i6;
            } else {
                if (cCharAt2 < 2048) {
                    iwb iwbVarI02 = I0(2);
                    byte[] bArr2 = iwbVarI02.a;
                    int i7 = iwbVarI02.c;
                    bArr2[i7] = (byte) ((cCharAt2 >> 6) | 192);
                    bArr2[i7 + 1] = (byte) ((cCharAt2 & '?') | 128);
                    iwbVarI02.c = i7 + 2;
                    this.b += 2;
                } else if (cCharAt2 < 55296 || cCharAt2 > 57343) {
                    iwb iwbVarI03 = I0(3);
                    byte[] bArr3 = iwbVarI03.a;
                    int i8 = iwbVarI03.c;
                    bArr3[i8] = (byte) ((cCharAt2 >> '\f') | CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY);
                    bArr3[i8 + 1] = (byte) ((63 & (cCharAt2 >> 6)) | 128);
                    bArr3[i8 + 2] = (byte) ((cCharAt2 & '?') | 128);
                    iwbVarI03.c = i8 + 3;
                    this.b += 3;
                } else {
                    int i9 = i + 1;
                    char cCharAt3 = i9 < i2 ? str.charAt(i9) : (char) 0;
                    if (cCharAt2 > 56319 || 56320 > cCharAt3 || cCharAt3 >= 57344) {
                        K0(63);
                        i = i9;
                    } else {
                        int i10 = (((cCharAt2 & 1023) << 10) | (cCharAt3 & 1023)) + ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
                        iwb iwbVarI04 = I0(4);
                        byte[] bArr4 = iwbVarI04.a;
                        int i11 = iwbVarI04.c;
                        bArr4[i11] = (byte) ((i10 >> 18) | 240);
                        bArr4[i11 + 1] = (byte) (((i10 >> 12) & 63) | 128);
                        bArr4[i11 + 2] = (byte) (((i10 >> 6) & 63) | 128);
                        bArr4[i11 + 3] = (byte) ((i10 & 63) | 128);
                        iwbVarI04.c = i11 + 4;
                        this.b += 4;
                        i += 2;
                    }
                }
                i++;
            }
        }
    }

    public final boolean R(int i, long j, h21 h21Var) {
        h21Var.getClass();
        if (i >= 0 && j >= 0 && ((long) i) + j <= this.b && i <= h21Var.e()) {
            return i == 0 || b.a(this, h21Var, j, j + 1, i) != -1;
        }
        return false;
    }

    public final void R0(String str) {
        str.getClass();
        Q0(0, str.length(), str);
    }

    @Override // defpackage.zz0
    public final long S(xz0 xz0Var) {
        long j = this.b;
        if (j > 0) {
            xz0Var.c0(this, j);
        }
        return j;
    }

    public final void S0(int i) {
        if (i < 128) {
            K0(i);
            return;
        }
        if (i < 2048) {
            iwb iwbVarI0 = I0(2);
            byte[] bArr = iwbVarI0.a;
            int i2 = iwbVarI0.c;
            bArr[i2] = (byte) ((i >> 6) | 192);
            bArr[i2 + 1] = (byte) ((i & 63) | 128);
            iwbVarI0.c = i2 + 2;
            this.b += 2;
            return;
        }
        if (55296 <= i && i < 57344) {
            K0(63);
            return;
        }
        if (i < 65536) {
            iwb iwbVarI02 = I0(3);
            byte[] bArr2 = iwbVarI02.a;
            int i3 = iwbVarI02.c;
            bArr2[i3] = (byte) ((i >> 12) | CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY);
            bArr2[i3 + 1] = (byte) (((i >> 6) & 63) | 128);
            bArr2[i3 + 2] = (byte) ((i & 63) | 128);
            iwbVarI02.c = i3 + 3;
            this.b += 3;
            return;
        }
        if (i > 1114111) {
            ay0.e("Unexpected code point: 0x".concat(dm2.d0(i)));
            return;
        }
        iwb iwbVarI03 = I0(4);
        byte[] bArr3 = iwbVarI03.a;
        int i4 = iwbVarI03.c;
        bArr3[i4] = (byte) ((i >> 18) | 240);
        bArr3[i4 + 1] = (byte) (((i >> 12) & 63) | 128);
        bArr3[i4 + 2] = (byte) (((i >> 6) & 63) | 128);
        bArr3[i4 + 3] = (byte) ((i & 63) | 128);
        iwbVarI03.c = i4 + 4;
        this.b += 4;
    }

    public final hz0 T(hz0 hz0Var) {
        hz0Var.getClass();
        byte[] bArr = b.a;
        if (hz0Var == dm2.b) {
            hz0Var = new hz0();
        }
        if (hz0Var.a != null) {
            ygf.f("already attached to a buffer");
            return null;
        }
        hz0Var.a = this;
        hz0Var.b = true;
        return hz0Var;
    }

    public final byte[] U(long j) throws EOFException {
        if (j < 0 || j > 2147483647L) {
            ywb.g(ho2.D(j, "byteCount: "));
            return null;
        }
        if (this.b < j) {
            ay0.b();
            return null;
        }
        byte[] bArr = new byte[(int) j];
        j0(bArr);
        return bArr;
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 W(int i, byte[] bArr) {
        write(bArr, 0, i);
        return this;
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 Y(String str) {
        R0(str);
        return this;
    }

    @Override // defpackage.zz0, defpackage.xz0
    public final kz0 a() {
        return this;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return fmd.d;
    }

    @Override // defpackage.zz0
    public final String b0(Charset charset) {
        charset.getClass();
        return F0(this.b, charset);
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) {
        iwb iwbVarB;
        kz0Var.getClass();
        if (kz0Var == this) {
            ay0.e("source == this");
            return;
        }
        dm2.A(kz0Var.b, 0L, j);
        while (j > 0) {
            iwb iwbVar = kz0Var.a;
            iwbVar.getClass();
            int i = iwbVar.c;
            iwb iwbVar2 = kz0Var.a;
            iwbVar2.getClass();
            long j2 = i - iwbVar2.b;
            int i2 = 0;
            if (j < j2) {
                iwb iwbVar3 = this.a;
                iwb iwbVar4 = iwbVar3 != null ? iwbVar3.g : null;
                if (iwbVar4 != null && iwbVar4.e) {
                    if ((((long) iwbVar4.c) + j) - ((long) (iwbVar4.d ? 0 : iwbVar4.b)) <= 8192) {
                        iwb iwbVar5 = kz0Var.a;
                        iwbVar5.getClass();
                        iwbVar5.d(iwbVar4, (int) j);
                        kz0Var.b -= j;
                        this.b += j;
                        return;
                    }
                }
                iwb iwbVar6 = kz0Var.a;
                iwbVar6.getClass();
                int i3 = (int) j;
                if (i3 <= 0 || i3 > iwbVar6.c - iwbVar6.b) {
                    ay0.e("byteCount out of range");
                    return;
                }
                if (i3 >= 1024) {
                    iwbVarB = iwbVar6.c();
                } else {
                    iwbVarB = lwb.b();
                    byte[] bArr = iwbVar6.a;
                    byte[] bArr2 = iwbVarB.a;
                    int i4 = iwbVar6.b;
                    k80.f0(0, i4, i4 + i3, bArr, bArr2);
                }
                iwbVarB.c = iwbVarB.b + i3;
                iwbVar6.b += i3;
                iwb iwbVar7 = iwbVar6.g;
                iwbVar7.getClass();
                iwbVar7.b(iwbVarB);
                kz0Var.a = iwbVarB;
            }
            iwb iwbVar8 = kz0Var.a;
            iwbVar8.getClass();
            long j3 = iwbVar8.c - iwbVar8.b;
            kz0Var.a = iwbVar8.a();
            iwb iwbVar9 = this.a;
            if (iwbVar9 == null) {
                this.a = iwbVar8;
                iwbVar8.g = iwbVar8;
                iwbVar8.f = iwbVar8;
            } else {
                iwb iwbVar10 = iwbVar9.g;
                iwbVar10.getClass();
                iwbVar10.b(iwbVar8);
                iwb iwbVar11 = iwbVar8.g;
                if (iwbVar11 == iwbVar8) {
                    ygf.f("cannot compact");
                    return;
                }
                iwbVar11.getClass();
                if (iwbVar11.e) {
                    int i5 = iwbVar8.c - iwbVar8.b;
                    iwb iwbVar12 = iwbVar8.g;
                    iwbVar12.getClass();
                    int i6 = 8192 - iwbVar12.c;
                    iwb iwbVar13 = iwbVar8.g;
                    iwbVar13.getClass();
                    if (!iwbVar13.d) {
                        iwb iwbVar14 = iwbVar8.g;
                        iwbVar14.getClass();
                        i2 = iwbVar14.b;
                    }
                    if (i5 <= i6 + i2) {
                        iwb iwbVar15 = iwbVar8.g;
                        iwbVar15.getClass();
                        iwbVar8.d(iwbVar15, i5);
                        iwbVar8.a();
                        lwb.a(iwbVar8);
                    }
                }
            }
            kz0Var.b -= j3;
            this.b += j3;
            j -= j3;
        }
    }

    public final Object clone() {
        kz0 kz0Var = new kz0();
        if (this.b == 0) {
            return kz0Var;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        iwb iwbVarC = iwbVar.c();
        kz0Var.a = iwbVarC;
        iwbVarC.g = iwbVarC;
        iwbVarC.f = iwbVarC;
        for (iwb iwbVar2 = iwbVar.f; iwbVar2 != iwbVar; iwbVar2 = iwbVar2.f) {
            iwb iwbVar3 = iwbVarC.g;
            iwbVar3.getClass();
            iwbVar2.getClass();
            iwbVar3.b(iwbVar2.c());
        }
        kz0Var.b = this.b;
        return kz0Var;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable, java.nio.channels.Channel, defpackage.bfc
    public final void close() {
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 e0(int i, int i2, String str) {
        Q0(i, i2, str);
        return this;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kz0)) {
            return false;
        }
        long j = this.b;
        kz0 kz0Var = (kz0) obj;
        if (j != kz0Var.b) {
            return false;
        }
        if (j == 0) {
            return true;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        iwb iwbVar2 = kz0Var.a;
        iwbVar2.getClass();
        int i = iwbVar.b;
        int i2 = iwbVar2.b;
        long j2 = 0;
        while (j2 < this.b) {
            long jMin = Math.min(iwbVar.c - i, iwbVar2.c - i2);
            long j3 = 0;
            while (j3 < jMin) {
                int i3 = i + 1;
                int i4 = i2 + 1;
                if (iwbVar.a[i] != iwbVar2.a[i2]) {
                    return false;
                }
                j3++;
                i = i3;
                i2 = i4;
            }
            if (i == iwbVar.c) {
                iwbVar = iwbVar.f;
                iwbVar.getClass();
                i = iwbVar.b;
            }
            if (i2 == iwbVar2.c) {
                iwbVar2 = iwbVar2.f;
                iwbVar2.getClass();
                i2 = iwbVar2.b;
            }
            j2 += jMin;
        }
        return true;
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
    
        r0 = new defpackage.kz0();
        r0.L0(r8);
        r0.K0(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x004e, code lost:
    
        if (r2 != false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0050, code lost:
    
        r0.readByte();
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0062, code lost:
    
        throw new java.lang.NumberFormatException("Number too large: ".concat(r0.G0()));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long g0() throws java.io.EOFException {
        /*
            Method dump skipped, instruction units count: 204
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kz0.g0():long");
    }

    public final int hashCode() {
        iwb iwbVar = this.a;
        if (iwbVar == null) {
            return 0;
        }
        int i = 1;
        do {
            int i2 = iwbVar.c;
            for (int i3 = iwbVar.b; i3 < i2; i3++) {
                i = (i * 31) + iwbVar.a[i3];
            }
            iwbVar = iwbVar.f;
            iwbVar.getClass();
        } while (iwbVar != this.a);
        return i;
    }

    @Override // defpackage.zz0
    public final int i0() {
        return dm2.U(p0());
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return true;
    }

    public final void j0(byte[] bArr) throws EOFException {
        bArr.getClass();
        int i = 0;
        while (i < bArr.length) {
            int i2 = read(bArr, i, bArr.length - i);
            if (i2 == -1) {
                ay0.b();
                return;
            }
            i += i2;
        }
    }

    @Override // defpackage.zz0
    public final String o(long j) {
        return F0(j, wk1.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x008d A[EDGE_INSN: B:43:0x008d->B:37:0x008d BREAK  A[LOOP:0: B:5:0x000b->B:45:?], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long o0() throws java.io.EOFException {
        /*
            r14 = this;
            long r0 = r14.b
            r2 = 0
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 == 0) goto L94
            r0 = 0
            r1 = r0
            r4 = r2
        Lb:
            iwb r6 = r14.a
            r6.getClass()
            byte[] r7 = r6.a
            int r8 = r6.b
            int r9 = r6.c
        L16:
            if (r8 >= r9) goto L79
            r10 = r7[r8]
            r11 = 48
            if (r10 < r11) goto L25
            r11 = 57
            if (r10 > r11) goto L25
            int r11 = r10 + (-48)
            goto L3a
        L25:
            r11 = 97
            if (r10 < r11) goto L30
            r11 = 102(0x66, float:1.43E-43)
            if (r10 > r11) goto L30
            int r11 = r10 + (-87)
            goto L3a
        L30:
            r11 = 65
            if (r10 < r11) goto L65
            r11 = 70
            if (r10 > r11) goto L65
            int r11 = r10 + (-55)
        L3a:
            r12 = -1152921504606846976(0xf000000000000000, double:-3.105036184601418E231)
            long r12 = r12 & r4
            int r12 = (r12 > r2 ? 1 : (r12 == r2 ? 0 : -1))
            if (r12 != 0) goto L4a
            r10 = 4
            long r4 = r4 << r10
            long r10 = (long) r11
            long r4 = r4 | r10
            int r8 = r8 + 1
            int r0 = r0 + 1
            goto L16
        L4a:
            kz0 r14 = new kz0
            r14.<init>()
            r14.M0(r4)
            r14.K0(r10)
            java.lang.NumberFormatException r0 = new java.lang.NumberFormatException
            java.lang.String r14 = r14.G0()
            java.lang.String r1 = "Number too large: "
            java.lang.String r14 = r1.concat(r14)
            r0.<init>(r14)
            throw r0
        L65:
            if (r0 == 0) goto L69
            r1 = 1
            goto L79
        L69:
            java.lang.NumberFormatException r14 = new java.lang.NumberFormatException
            java.lang.String r0 = defpackage.dm2.c0(r10)
            java.lang.String r1 = "Expected leading [0-9a-fA-F] character but was 0x"
            java.lang.String r0 = r1.concat(r0)
            r14.<init>(r0)
            throw r14
        L79:
            if (r8 != r9) goto L85
            iwb r7 = r6.a()
            r14.a = r7
            defpackage.lwb.a(r6)
            goto L87
        L85:
            r6.b = r8
        L87:
            if (r1 != 0) goto L8d
            iwb r6 = r14.a
            if (r6 != 0) goto Lb
        L8d:
            long r1 = r14.b
            long r6 = (long) r0
            long r1 = r1 - r6
            r14.b = r1
            return r4
        L94:
            defpackage.ay0.b()
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kz0.o0():long");
    }

    public final int p0() throws EOFException {
        if (this.b < 4) {
            ay0.b();
            return 0;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        int i = iwbVar.b;
        int i2 = iwbVar.c;
        if (i2 - i < 4) {
            return (readByte() & 255) | ((readByte() & 255) << 24) | ((readByte() & 255) << 16) | ((readByte() & 255) << 8);
        }
        byte[] bArr = iwbVar.a;
        int i3 = i + 3;
        int i4 = ((bArr[i + 1] & 255) << 16) | ((bArr[i] & 255) << 24) | ((bArr[i + 2] & 255) << 8);
        int i5 = i + 4;
        int i6 = (bArr[i3] & 255) | i4;
        this.b -= 4;
        if (i5 != i2) {
            iwbVar.b = i5;
            return i6;
        }
        this.a = iwbVar.a();
        lwb.a(iwbVar);
        return i6;
    }

    @Override // defpackage.zz0
    public final yua peek() {
        return new yua(new x79(this));
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        long j2 = this.b;
        if (j2 == 0) {
            return -1L;
        }
        if (j > j2) {
            j = j2;
        }
        kz0Var.c0(this, j);
        return j;
    }

    @Override // defpackage.zz0
    public final h21 r(long j) throws EOFException {
        if (j < 0 || j > 2147483647L) {
            ywb.g(ho2.D(j, "byteCount: "));
            return null;
        }
        if (this.b < j) {
            ay0.b();
            return null;
        }
        if (j < 4096) {
            return new h21(U(j));
        }
        h21 h21VarH0 = H0((int) j);
        skip(j);
        return h21VarH0;
    }

    @Override // defpackage.zz0
    public final long r0() {
        return dm2.V(z0());
    }

    public final int read(byte[] bArr, int i, int i2) {
        bArr.getClass();
        dm2.A(bArr.length, i, i2);
        iwb iwbVar = this.a;
        if (iwbVar == null) {
            return -1;
        }
        int iMin = Math.min(i2, iwbVar.c - iwbVar.b);
        byte[] bArr2 = iwbVar.a;
        int i3 = iwbVar.b;
        k80.f0(i, i3, i3 + iMin, bArr2, bArr);
        int i4 = iwbVar.b + iMin;
        iwbVar.b = i4;
        this.b -= (long) iMin;
        if (i4 == iwbVar.c) {
            this.a = iwbVar.a();
            lwb.a(iwbVar);
        }
        return iMin;
    }

    @Override // defpackage.zz0
    public final byte readByte() throws EOFException {
        if (this.b == 0) {
            ay0.b();
            return (byte) 0;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        int i = iwbVar.b;
        int i2 = iwbVar.c;
        int i3 = i + 1;
        byte b = iwbVar.a[i];
        this.b--;
        if (i3 != i2) {
            iwbVar.b = i3;
            return b;
        }
        this.a = iwbVar.a();
        lwb.a(iwbVar);
        return b;
    }

    @Override // defpackage.zz0
    public final boolean request(long j) {
        return this.b >= j;
    }

    @Override // defpackage.zz0
    public final void skip(long j) throws EOFException {
        while (j > 0) {
            iwb iwbVar = this.a;
            if (iwbVar == null) {
                ay0.b();
                return;
            }
            int iMin = (int) Math.min(j, iwbVar.c - iwbVar.b);
            long j2 = iMin;
            this.b -= j2;
            j -= j2;
            int i = iwbVar.b + iMin;
            iwbVar.b = i;
            if (i == iwbVar.c) {
                this.a = iwbVar.a();
                lwb.a(iwbVar);
            }
        }
    }

    public final String toString() {
        long j = this.b;
        if (j <= 2147483647L) {
            return H0((int) j).toString();
        }
        throw new IllegalStateException(("size > Int.MAX_VALUE: " + this.b).toString());
    }

    @Override // defpackage.zz0
    public final long u0(h21 h21Var) {
        h21Var.getClass();
        byte[] bArr = b.a;
        return b.a(this, h21Var, 0L, Long.MAX_VALUE, h21Var.e());
    }

    @Override // defpackage.zz0
    public final int w(dw8 dw8Var) throws EOFException {
        dw8Var.getClass();
        int iD = b.d(this, dw8Var, false);
        if (iD == -1) {
            return -1;
        }
        skip(dw8Var.a[iD].e());
        return iD;
    }

    public final void write(byte[] bArr, int i, int i2) {
        bArr.getClass();
        long j = i2;
        dm2.A(bArr.length, i, j);
        int i3 = i2 + i;
        while (i < i3) {
            iwb iwbVarI0 = I0(1);
            int iMin = Math.min(i3 - i, 8192 - iwbVarI0.c);
            int i4 = i + iMin;
            k80.f0(iwbVarI0.c, i, i4, bArr, iwbVarI0.a);
            iwbVarI0.c += iMin;
            i = i4;
        }
        this.b += j;
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 writeByte(int i) {
        K0(i);
        return this;
    }

    @Override // defpackage.zz0
    public final void x0(long j) throws EOFException {
        if (this.b >= j) {
            return;
        }
        ay0.b();
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 y(int i) {
        S0(i);
        return this;
    }

    @Override // defpackage.xz0
    public final /* bridge */ /* synthetic */ xz0 y0(long j) {
        L0(j);
        return this;
    }

    public final long z0() throws EOFException {
        if (this.b < 8) {
            ay0.b();
            return 0L;
        }
        iwb iwbVar = this.a;
        iwbVar.getClass();
        int i = iwbVar.b;
        int i2 = iwbVar.c;
        if (i2 - i < 8) {
            return ((((long) p0()) & 4294967295L) << 32) | (4294967295L & ((long) p0()));
        }
        byte[] bArr = iwbVar.a;
        int i3 = i + 7;
        long j = ((((long) bArr[i + 3]) & 255) << 32) | ((((long) bArr[i]) & 255) << 56) | ((((long) bArr[i + 1]) & 255) << 48) | ((((long) bArr[i + 2]) & 255) << 40) | ((((long) bArr[i + 4]) & 255) << 24) | ((((long) bArr[i + 5]) & 255) << 16) | ((((long) bArr[i + 6]) & 255) << 8);
        int i4 = i + 8;
        long j2 = j | (((long) bArr[i3]) & 255);
        this.b -= 8;
        if (i4 != i2) {
            iwbVar.b = i4;
            return j2;
        }
        this.a = iwbVar.a();
        lwb.a(iwbVar);
        return j2;
    }

    @Override // defpackage.zz0
    public final String h0() throws EOFException {
        if (Long.MAX_VALUE < 0) {
            ywb.g(ho2.D(Long.MAX_VALUE, DtuT.unsyBgecvMepHS));
            return null;
        }
        long j = Long.MAX_VALUE == Long.MAX_VALUE ? Long.MAX_VALUE : Long.MAX_VALUE + 1;
        long jN = N((byte) 10, 0L, j);
        if (jN != -1) {
            return b.c(this, jN);
        }
        if (j < this.b && L(j - 1) == 13 && L(j) == 10) {
            return b.c(this, j);
        }
        kz0 kz0Var = new kz0();
        I(kz0Var, 0L, Math.min(32L, this.b));
        throw new EOFException("\\n not found: limit=" + Math.min(this.b, Long.MAX_VALUE) + " content=" + kz0Var.r(kz0Var.b).f() + (char) 8230);
    }

    @Override // java.nio.channels.WritableByteChannel
    public final int write(ByteBuffer byteBuffer) {
        byteBuffer.getClass();
        int iRemaining = byteBuffer.remaining();
        int i = iRemaining;
        while (i > 0) {
            iwb iwbVarI0 = I0(1);
            int iMin = Math.min(i, 8192 - iwbVarI0.c);
            byteBuffer.get(iwbVarI0.a, iwbVarI0.c, iMin);
            i -= iMin;
            iwbVarI0.c += iMin;
        }
        this.b += (long) iRemaining;
        return iRemaining;
    }

    @Override // defpackage.xz0
    public final xz0 write(byte[] bArr) {
        bArr.getClass();
        write(bArr, 0, bArr.length);
        return this;
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer byteBuffer) {
        byteBuffer.getClass();
        iwb iwbVar = this.a;
        if (iwbVar == null) {
            return -1;
        }
        int iMin = Math.min(byteBuffer.remaining(), iwbVar.c - iwbVar.b);
        byteBuffer.put(iwbVar.a, iwbVar.b, iMin);
        int i = iwbVar.b + iMin;
        iwbVar.b = i;
        this.b -= (long) iMin;
        if (i == iwbVar.c) {
            this.a = iwbVar.a();
            lwb.a(iwbVar);
        }
        return iMin;
    }
}
