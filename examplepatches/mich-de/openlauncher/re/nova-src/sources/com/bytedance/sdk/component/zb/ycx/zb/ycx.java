package com.bytedance.sdk.component.zb.ycx.zb;

import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.charset.Charset;

/* loaded from: classes2.dex */
public final class ycx implements sya, zb, Cloneable, ByteChannel {
    private static final byte[] sya = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};
    lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    long f24232zb;

    @Override // java.io.Closeable, java.lang.AutoCloseable, java.nio.channels.Channel
    public void close() {
    }

    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public ycx clone() {
        ycx ycxVar = new ycx();
        if (this.f24232zb == 0) {
            return ycxVar;
        }
        lud ludVarYcx = this.ycx.ycx();
        ycxVar.ycx = ludVarYcx;
        ludVarYcx.f24229ul = ludVarYcx;
        ludVarYcx.f24228lt = ludVarYcx;
        lud ludVar = this.ycx;
        while (true) {
            ludVar = ludVar.f24228lt;
            if (ludVar == this.ycx) {
                ycxVar.f24232zb = this.f24232zb;
                return ycxVar;
            }
            ycxVar.ycx.f24229ul.ycx(ludVar.ycx());
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ycx)) {
            return false;
        }
        ycx ycxVar = (ycx) obj;
        long j11 = this.f24232zb;
        if (j11 != ycxVar.f24232zb) {
            return false;
        }
        long j12 = 0;
        if (j11 == 0) {
            return true;
        }
        lud ludVar = this.ycx;
        lud ludVar2 = ycxVar.ycx;
        int i5 = ludVar.f24230zb;
        int i11 = ludVar2.f24230zb;
        while (j12 < this.f24232zb) {
            long jMin = Math.min(ludVar.sya - i5, ludVar2.sya - i11);
            int i12 = 0;
            while (i12 < jMin) {
                int i13 = i5 + 1;
                int i14 = i11 + 1;
                if (ludVar.ycx[i5] != ludVar2.ycx[i11]) {
                    return false;
                }
                i12++;
                i5 = i13;
                i11 = i14;
            }
            if (i5 == ludVar.sya) {
                ludVar = ludVar.f24228lt;
                i5 = ludVar.f24230zb;
            }
            if (i11 == ludVar2.sya) {
                ludVar2 = ludVar2.f24228lt;
                i11 = ludVar2.f24230zb;
            }
            j12 += jMin;
        }
        return true;
    }

    @Override // java.io.Flushable
    public void flush() {
    }

    public int hashCode() {
        lud ludVar = this.ycx;
        if (ludVar == null) {
            return 0;
        }
        int i5 = 1;
        do {
            int i11 = ludVar.sya;
            for (int i12 = ludVar.f24230zb; i12 < i11; i12++) {
                i5 = (i5 * 31) + ludVar.ycx[i12];
            }
            ludVar = ludVar.f24228lt;
        } while (ludVar != this.ycx);
        return i5;
    }

    @Override // java.nio.channels.Channel
    public boolean isOpen() {
        return true;
    }

    public final dj lud() {
        long j11 = this.f24232zb;
        if (j11 <= 2147483647L) {
            return dj((int) j11);
        }
        throw new IllegalArgumentException("size > Integer.MAX_VALUE: " + this.f24232zb);
    }

    @Override // java.nio.channels.ReadableByteChannel
    public int read(ByteBuffer byteBuffer) throws IOException {
        lud ludVar = this.ycx;
        if (ludVar == null) {
            return -1;
        }
        int iMin = Math.min(byteBuffer.remaining(), ludVar.sya - ludVar.f24230zb);
        byteBuffer.put(ludVar.ycx, ludVar.f24230zb, iMin);
        int i5 = ludVar.f24230zb + iMin;
        ludVar.f24230zb = i5;
        this.f24232zb -= iMin;
        if (i5 == ludVar.sya) {
            this.ycx = ludVar.zb();
            lt.ycx(ludVar);
        }
        return iMin;
    }

    public String sya() {
        try {
            return ycx(this.f24232zb, jw.ycx);
        } catch (EOFException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bCrM=", "efsrkwau", "SesskTaob58=", 54);
            throw new AssertionError(e3);
        }
    }

    public String toString() {
        return lud().toString();
    }

    @Override // java.nio.channels.WritableByteChannel
    public int write(ByteBuffer byteBuffer) throws IOException {
        if (byteBuffer == null) {
            throw new IllegalArgumentException("source == null");
        }
        int iRemaining = byteBuffer.remaining();
        int i5 = iRemaining;
        while (i5 > 0) {
            lud ludVarSya = sya(1);
            int iMin = Math.min(i5, 8192 - ludVarSya.sya);
            byteBuffer.get(ludVarSya.ycx, ludVarSya.sya, iMin);
            i5 -= iMin;
            ludVarSya.sya += iMin;
        }
        this.f24232zb += iRemaining;
        return iRemaining;
    }

    public boolean ycx() {
        return this.f24232zb == 0;
    }

    public byte zb() {
        long j11 = this.f24232zb;
        if (j11 == 0) {
            throw new IllegalStateException("size == 0");
        }
        lud ludVar = this.ycx;
        int i5 = ludVar.f24230zb;
        int i11 = ludVar.sya;
        int i12 = i5 + 1;
        byte b11 = ludVar.ycx[i5];
        this.f24232zb = j11 - 1;
        if (i12 != i11) {
            ludVar.f24230zb = i12;
            return b11;
        }
        this.ycx = ludVar.zb();
        lt.ycx(ludVar);
        return b11;
    }

    public String ycx(long j11, Charset charset) throws EOFException {
        jw.ycx(this.f24232zb, 0L, j11);
        if (charset == null) {
            throw new IllegalArgumentException("charset == null");
        }
        if (j11 > 2147483647L) {
            throw new IllegalArgumentException("byteCount > Integer.MAX_VALUE: ".concat(String.valueOf(j11)));
        }
        if (j11 == 0) {
            return b.f42142b;
        }
        lud ludVar = this.ycx;
        int i5 = ludVar.f24230zb;
        if (i5 + j11 > ludVar.sya) {
            return new String(ycx(j11), charset);
        }
        String str = new String(ludVar.ycx, i5, (int) j11, charset);
        int i11 = (int) (ludVar.f24230zb + j11);
        ludVar.f24230zb = i11;
        this.f24232zb -= j11;
        if (i11 == ludVar.sya) {
            this.ycx = ludVar.zb();
            lt.ycx(ludVar);
        }
        return str;
    }

    public lud sya(int i5) {
        if (i5 > 0 && i5 <= 8192) {
            lud ludVar = this.ycx;
            if (ludVar == null) {
                lud ludVarYcx = lt.ycx();
                this.ycx = ludVarYcx;
                ludVarYcx.f24229ul = ludVarYcx;
                ludVarYcx.f24228lt = ludVarYcx;
                return ludVarYcx;
            }
            lud ludVar2 = ludVar.f24229ul;
            return (ludVar2.sya + i5 > 8192 || !ludVar2.lud) ? ludVar2.ycx(lt.ycx()) : ludVar2;
        }
        throw new IllegalArgumentException();
    }

    public final dj dj(int i5) {
        if (i5 == 0) {
            return dj.sya;
        }
        return new ul(this, i5);
    }

    public ycx zb(byte[] bArr, int i5, int i11) {
        if (bArr != null) {
            long j11 = i11;
            jw.ycx(bArr.length, i5, j11);
            int i12 = i11 + i5;
            while (i5 < i12) {
                lud ludVarSya = sya(1);
                int iMin = Math.min(i12 - i5, 8192 - ludVarSya.sya);
                System.arraycopy(bArr, i5, ludVarSya.ycx, ludVarSya.sya, iMin);
                i5 += iMin;
                ludVarSya.sya += iMin;
            }
            this.f24232zb += j11;
            return this;
        }
        throw new IllegalArgumentException("source == null");
    }

    public byte[] ycx(long j11) throws EOFException {
        jw.ycx(this.f24232zb, 0L, j11);
        if (j11 <= 2147483647L) {
            byte[] bArr = new byte[(int) j11];
            ycx(bArr);
            return bArr;
        }
        throw new IllegalArgumentException("byteCount > Integer.MAX_VALUE: ".concat(String.valueOf(j11)));
    }

    public void ycx(byte[] bArr) throws EOFException {
        int i5 = 0;
        while (i5 < bArr.length) {
            int iYcx = ycx(bArr, i5, bArr.length - i5);
            if (iYcx == -1) {
                throw new EOFException();
            }
            i5 += iYcx;
        }
    }

    public ycx zb(int i5) {
        lud ludVarSya = sya(1);
        byte[] bArr = ludVarSya.ycx;
        int i11 = ludVarSya.sya;
        ludVarSya.sya = i11 + 1;
        bArr[i11] = (byte) i5;
        this.f24232zb++;
        return this;
    }

    public int ycx(byte[] bArr, int i5, int i11) {
        jw.ycx(bArr.length, i5, i11);
        lud ludVar = this.ycx;
        if (ludVar == null) {
            return -1;
        }
        int iMin = Math.min(i11, ludVar.sya - ludVar.f24230zb);
        System.arraycopy(ludVar.ycx, ludVar.f24230zb, bArr, i5, iMin);
        int i12 = ludVar.f24230zb + iMin;
        ludVar.f24230zb = i12;
        this.f24232zb -= iMin;
        if (i12 == ludVar.sya) {
            this.ycx = ludVar.zb();
            lt.ycx(ludVar);
        }
        return iMin;
    }

    public ycx zb(long j11) {
        if (j11 == 0) {
            return zb(48);
        }
        int iNumberOfTrailingZeros = (Long.numberOfTrailingZeros(Long.highestOneBit(j11)) / 4) + 1;
        lud ludVarSya = sya(iNumberOfTrailingZeros);
        byte[] bArr = ludVarSya.ycx;
        int i5 = ludVarSya.sya;
        for (int i11 = (i5 + iNumberOfTrailingZeros) - 1; i11 >= i5; i11--) {
            bArr[i11] = sya[(int) (15 & j11)];
            j11 >>>= 4;
        }
        ludVarSya.sya += iNumberOfTrailingZeros;
        this.f24232zb += iNumberOfTrailingZeros;
        return this;
    }

    public ycx ycx(String str) {
        return ycx(str, 0, str.length());
    }

    public ycx ycx(String str, int i5, int i11) {
        char cCharAt;
        if (str == null) {
            throw new IllegalArgumentException("string == null");
        }
        if (i5 < 0) {
            throw new IllegalArgumentException("beginIndex < 0: ".concat(String.valueOf(i5)));
        }
        if (i11 >= i5) {
            if (i11 > str.length()) {
                StringBuilder sbJ = u4.j(i11, "endIndex > string.length: ", " > ");
                sbJ.append(str.length());
                throw new IllegalArgumentException(sbJ.toString());
            }
            while (i5 < i11) {
                char cCharAt2 = str.charAt(i5);
                if (cCharAt2 < 128) {
                    lud ludVarSya = sya(1);
                    byte[] bArr = ludVarSya.ycx;
                    int i12 = ludVarSya.sya - i5;
                    int iMin = Math.min(i11, 8192 - i12);
                    int i13 = i5 + 1;
                    bArr[i5 + i12] = (byte) cCharAt2;
                    while (true) {
                        i5 = i13;
                        if (i5 >= iMin || (cCharAt = str.charAt(i5)) >= 128) {
                            break;
                        }
                        i13 = i5 + 1;
                        bArr[i5 + i12] = (byte) cCharAt;
                    }
                    int i14 = ludVarSya.sya;
                    int i15 = (i12 + i5) - i14;
                    ludVarSya.sya = i14 + i15;
                    this.f24232zb += i15;
                } else {
                    if (cCharAt2 < 2048) {
                        zb((cCharAt2 >> 6) | 192);
                        zb((cCharAt2 & '?') | 128);
                    } else if (cCharAt2 >= 55296 && cCharAt2 <= 57343) {
                        int i16 = i5 + 1;
                        char cCharAt3 = i16 < i11 ? str.charAt(i16) : (char) 0;
                        if (cCharAt2 <= 56319 && cCharAt3 >= 56320 && cCharAt3 <= 57343) {
                            int i17 = (((cCharAt2 & 10239) << 10) | (9215 & cCharAt3)) + SQLiteDatabase.OPEN_FULLMUTEX;
                            zb((i17 >> 18) | 240);
                            zb(((i17 >> 12) & 63) | 128);
                            zb(((i17 >> 6) & 63) | 128);
                            zb((i17 & 63) | 128);
                            i5 += 2;
                        } else {
                            zb(63);
                            i5 = i16;
                        }
                    } else {
                        zb((cCharAt2 >> '\f') | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                        zb(((cCharAt2 >> 6) & 63) | 128);
                        zb((cCharAt2 & '?') | 128);
                    }
                    i5++;
                }
            }
            return this;
        }
        throw new IllegalArgumentException(c0.g(i11, i5, "endIndex < beginIndex: ", " < "));
    }

    public ycx ycx(int i5) {
        if (i5 < 128) {
            zb(i5);
            return this;
        }
        if (i5 < 2048) {
            zb((i5 >> 6) | 192);
            zb((i5 & 63) | 128);
            return this;
        }
        if (i5 < 65536) {
            if (i5 >= 55296 && i5 <= 57343) {
                zb(63);
                return this;
            }
            zb((i5 >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
            zb(((i5 >> 6) & 63) | 128);
            zb((i5 & 63) | 128);
            return this;
        }
        if (i5 <= 1114111) {
            zb((i5 >> 18) | 240);
            zb(((i5 >> 12) & 63) | 128);
            zb(((i5 >> 6) & 63) | 128);
            zb((i5 & 63) | 128);
            return this;
        }
        throw new IllegalArgumentException("Unexpected code point: " + Integer.toHexString(i5));
    }

    public ycx ycx(String str, int i5, int i11, Charset charset) {
        if (str == null) {
            throw new IllegalArgumentException("string == null");
        }
        if (i5 < 0) {
            throw new IllegalAccessError("beginIndex < 0: ".concat(String.valueOf(i5)));
        }
        if (i11 >= i5) {
            if (i11 > str.length()) {
                StringBuilder sbJ = u4.j(i11, "endIndex > string.length: ", " > ");
                sbJ.append(str.length());
                throw new IllegalArgumentException(sbJ.toString());
            }
            if (charset != null) {
                if (charset.equals(jw.ycx)) {
                    return ycx(str, i5, i11);
                }
                byte[] bytes = str.substring(i5, i11).getBytes(charset);
                return zb(bytes, 0, bytes.length);
            }
            throw new IllegalArgumentException("charset == null");
        }
        throw new IllegalArgumentException(c0.g(i11, i5, "endIndex < beginIndex: ", " < "));
    }
}
