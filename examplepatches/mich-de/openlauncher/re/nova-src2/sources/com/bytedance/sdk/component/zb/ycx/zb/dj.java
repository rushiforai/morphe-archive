package com.bytedance.sdk.component.zb.ycx.zb;

import b.c0;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Arrays;

/* loaded from: classes2.dex */
public class dj implements Serializable, Comparable<dj> {

    /* renamed from: dj, reason: collision with root package name */
    final byte[] f24224dj;

    /* renamed from: lt, reason: collision with root package name */
    transient String f24225lt;
    transient int lud;
    static final char[] ycx = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    /* renamed from: zb, reason: collision with root package name */
    public static final Charset f24223zb = Charset.forName("UTF-8");
    public static final dj sya = ycx(new byte[0]);

    public dj(byte[] bArr) {
        this.f24224dj = bArr;
    }

    public static dj ycx(byte... bArr) {
        if (bArr != null) {
            return new dj((byte[]) bArr.clone());
        }
        throw new IllegalArgumentException("data == null");
    }

    public byte[] dj() {
        return (byte[]) this.f24224dj.clone();
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof dj) {
            dj djVar = (dj) obj;
            int iSya = djVar.sya();
            byte[] bArr = this.f24224dj;
            if (iSya == bArr.length && djVar.ycx(0, bArr, 0, bArr.length)) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int i5 = this.lud;
        if (i5 != 0) {
            return i5;
        }
        int iHashCode = Arrays.hashCode(this.f24224dj);
        this.lud = iHashCode;
        return iHashCode;
    }

    public int sya() {
        return this.f24224dj.length;
    }

    public String toString() {
        if (this.f24224dj.length == 0) {
            return "[size=0]";
        }
        String strYcx = ycx();
        int iYcx = ycx(strYcx, 64);
        if (iYcx != -1) {
            String strReplace = strYcx.substring(0, iYcx).replace("\\", "\\\\").replace("\n", "\\n").replace("\r", "\\r");
            if (iYcx >= strYcx.length()) {
                return c0.l("[text=", strReplace, "]");
            }
            return "[size=" + this.f24224dj.length + " text=" + strReplace + "…]";
        }
        if (this.f24224dj.length <= 64) {
            return "[hex=" + zb() + "]";
        }
        return "[size=" + this.f24224dj.length + " hex=" + ycx(0, 64).zb() + "…]";
    }

    public String zb() {
        byte[] bArr = this.f24224dj;
        char[] cArr = new char[bArr.length * 2];
        int i5 = 0;
        for (byte b11 : bArr) {
            int i11 = i5 + 1;
            char[] cArr2 = ycx;
            cArr[i5] = cArr2[(b11 >> 4) & 15];
            i5 += 2;
            cArr[i11] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }

    public String ycx() {
        String str = this.f24225lt;
        if (str != null) {
            return str;
        }
        String str2 = new String(this.f24224dj, f24223zb);
        this.f24225lt = str2;
        return str2;
    }

    public dj ycx(int i5, int i11) {
        if (i5 >= 0) {
            byte[] bArr = this.f24224dj;
            if (i11 > bArr.length) {
                throw new IllegalArgumentException(c0.o(new StringBuilder("endIndex > length("), this.f24224dj.length, ")"));
            }
            int i12 = i11 - i5;
            if (i12 >= 0) {
                if (i5 == 0 && i11 == bArr.length) {
                    return this;
                }
                byte[] bArr2 = new byte[i12];
                System.arraycopy(bArr, i5, bArr2, 0, i12);
                return new dj(bArr2);
            }
            throw new IllegalArgumentException("endIndex < beginIndex");
        }
        throw new IllegalArgumentException("beginIndex < 0");
    }

    public byte ycx(int i5) {
        return this.f24224dj[i5];
    }

    public boolean ycx(int i5, dj djVar, int i11, int i12) {
        return djVar.ycx(i11, this.f24224dj, i5, i12);
    }

    public boolean ycx(int i5, byte[] bArr, int i11, int i12) {
        if (i5 < 0) {
            return false;
        }
        byte[] bArr2 = this.f24224dj;
        return i5 <= bArr2.length - i12 && i11 >= 0 && i11 <= bArr.length - i12 && jw.ycx(bArr2, i5, bArr, i11, i12);
    }

    @Override // java.lang.Comparable
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public int compareTo(dj djVar) {
        int iSya = sya();
        int iSya2 = djVar.sya();
        int iMin = Math.min(iSya, iSya2);
        for (int i5 = 0; i5 < iMin; i5++) {
            int iYcx = ycx(i5) & 255;
            int iYcx2 = djVar.ycx(i5) & 255;
            if (iYcx != iYcx2) {
                return iYcx < iYcx2 ? -1 : 1;
            }
        }
        if (iSya == iSya2) {
            return 0;
        }
        return iSya < iSya2 ? -1 : 1;
    }

    public static int ycx(String str, int i5) {
        int length = str.length();
        int iCharCount = 0;
        int i11 = 0;
        while (iCharCount < length) {
            if (i11 == i5) {
                return iCharCount;
            }
            int iCodePointAt = str.codePointAt(iCharCount);
            if ((Character.isISOControl(iCodePointAt) && iCodePointAt != 10 && iCodePointAt != 13) || iCodePointAt == 65533) {
                return -1;
            }
            i11++;
            iCharCount += Character.charCount(iCodePointAt);
        }
        return str.length();
    }
}
