package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;
import com.google.android.recaptcha.internal.zzaek;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class pmf implements Iterable, Serializable {
    public static final omf b = new omf(tnf.a);
    public int a = 0;

    static {
        int i = gmf.a;
    }

    public static omf C(byte[] bArr, int i, int i2) {
        try {
            return D(bArr, i, i2);
        } catch (zzaek e) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
        }
    }

    public static omf D(byte[] bArr, int i, int i2) {
        if (i2 == 0) {
            return b;
        }
        d(i, i + i2, bArr.length);
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        return new omf(bArr2);
    }

    public static int d(int i, int i2, int i3) {
        int i4 = i2 - i;
        if ((i | i2 | i4 | (i3 - i2)) >= 0) {
            return i4;
        }
        if (i < 0) {
            StringBuilder sb = new StringBuilder(String.valueOf(i).length() + 21);
            sb.append("Beginning index: ");
            sb.append(i);
            sb.append(" < 0");
            throw new IndexOutOfBoundsException(sb.toString());
        }
        if (i2 < i) {
            ygf.d(String.valueOf(i).length() + 44 + String.valueOf(i2).length(), "Beginning index larger than ending index: ", i, ", ", i2);
            return 0;
        }
        ygf.d(String.valueOf(i2).length() + 15 + String.valueOf(i3).length(), "End index: ", i2, " >= ", i3);
        return 0;
    }

    public static /* synthetic */ boolean e(int i, int i2, int i3, byte[] bArr, byte[] bArr2) {
        int i4 = i + i3;
        d(i, i4, bArr.length);
        d(i2, i3 + i2, bArr2.length);
        while (i < i4) {
            if (bArr[i] != bArr2[i2]) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    public static pmf w(Iterator it2, int i) {
        if (i <= 0) {
            Locale locale = Locale.ROOT;
            ay0.e(ev6.w("length (", i, ") must be >= 1"));
            return null;
        }
        if (i == 1) {
            return (pmf) it2.next();
        }
        int i2 = i >>> 1;
        pmf pmfVarW = w(it2, i2);
        pmf pmfVarW2 = w(it2, i - i2);
        if (Integer.MAX_VALUE - pmfVarW.m() < pmfVarW2.m()) {
            int iM = pmfVarW.m();
            int iM2 = pmfVarW2.m();
            StringBuilder sb = new StringBuilder(String.valueOf(iM).length() + 31 + String.valueOf(iM2).length());
            sb.append("ByteString would be too long: ");
            sb.append(iM);
            sb.append("+");
            sb.append(iM2);
            throw new IllegalArgumentException(sb.toString());
        }
        if (pmfVarW2.m() == 0) {
            return pmfVarW;
        }
        if (pmfVarW.m() == 0) {
            return pmfVarW2;
        }
        int iM3 = pmfVarW2.m() + pmfVarW.m();
        omf omfVar = b;
        if (iM3 < 128) {
            int iM4 = pmfVarW.m();
            int iM5 = pmfVarW2.m();
            int i3 = iM4 + iM5;
            byte[] bArr = new byte[i3];
            d(0, iM4, pmfVarW.m());
            d(0, iM4, i3);
            if (iM4 > 0) {
                pmfVarW.r(0, 0, iM4, bArr);
            }
            d(0, iM5, pmfVarW2.m());
            d(iM4, i3, i3);
            if (iM5 > 0) {
                pmfVarW2.r(0, iM4, iM5, bArr);
            }
            if (i3 == 0) {
                return omfVar;
            }
            try {
                return new omf(bArr);
            } catch (zzaek e) {
                throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
            }
        }
        if (pmfVarW instanceof uof) {
            uof uofVar = (uof) pmfVarW;
            pmf pmfVar = uofVar.d;
            pmf pmfVar2 = uofVar.e;
            if (pmfVarW2.m() + pmfVar2.m() < 128) {
                int iM6 = pmfVar2.m();
                int iM7 = pmfVarW2.m();
                int i4 = iM6 + iM7;
                byte[] bArr2 = new byte[i4];
                d(0, iM6, pmfVar2.m());
                d(0, iM6, i4);
                if (iM6 > 0) {
                    pmfVar2.r(0, 0, iM6, bArr2);
                }
                d(0, iM7, pmfVarW2.m());
                d(iM6, i4, i4);
                if (iM7 > 0) {
                    pmfVarW2.r(0, iM6, iM7, bArr2);
                }
                if (i4 != 0) {
                    try {
                        omfVar = new omf(bArr2);
                    } catch (zzaek e2) {
                        throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e2);
                    }
                }
                return new uof(pmfVar, omfVar);
            }
            if (pmfVar.z() > pmfVar2.z() && uofVar.g > pmfVarW2.z()) {
                return new uof(pmfVar, new uof(pmfVar2, pmfVarW2));
            }
        }
        if (iM3 >= uof.F(Math.max(pmfVarW.z(), pmfVarW2.z()) + 1)) {
            return new uof(pmfVarW, pmfVarW2);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        il7.I(pmfVarW, arrayDeque);
        il7.I(pmfVarW2, arrayDeque);
        pmf uofVar2 = (pmf) arrayDeque.pop();
        while (!arrayDeque.isEmpty()) {
            uofVar2 = new uof((pmf) arrayDeque.pop(), uofVar2);
        }
        return uofVar2;
    }

    public abstract boolean A();

    @Override // java.lang.Iterable
    /* JADX INFO: renamed from: B, reason: merged with bridge method [inline-methods] */
    public ugf iterator() {
        return new kmf(this);
    }

    public final byte[] E() {
        int iM = m();
        if (iM == 0) {
            return tnf.a;
        }
        byte[] bArr = new byte[iM];
        r(0, 0, iM, bArr);
        return bArr;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof pmf)) {
            return false;
        }
        pmf pmfVar = (pmf) obj;
        int iM = m();
        if (iM != pmfVar.m()) {
            return false;
        }
        if (iM == 0) {
            return true;
        }
        int i = this.a;
        int i2 = pmfVar.a;
        if (i == 0 || i2 == 0 || i == i2) {
            return v(pmfVar);
        }
        return false;
    }

    public abstract byte f(int i);

    public final int hashCode() {
        int iX = this.a;
        if (iX == 0) {
            int iM = m();
            iX = x(iM, 0, iM);
            if (iX == 0) {
                iX = 1;
            }
            this.a = iX;
        }
        return iX;
    }

    public abstract int m();

    public abstract pmf p(int i, int i2);

    public abstract pmf q(int i, int i2);

    public abstract void r(int i, int i2, int i3, byte[] bArr);

    public abstract ByteBuffer s();

    public abstract void t(h30 h30Var);

    public abstract String u();

    public abstract boolean v(pmf pmfVar);

    public abstract int x(int i, int i2, int i3);

    public abstract up1 y();

    public abstract int z();

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return ka1.v(y30.t(m(), bPUi.cBNMsw, hexString, " size=", " contents=\""), m() <= 50 ? vn7.m0(E()) : vn7.m0(q(0, 47).E()).concat("..."), "\">");
    }
}
