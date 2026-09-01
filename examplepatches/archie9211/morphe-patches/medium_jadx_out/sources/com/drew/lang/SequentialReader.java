package com.drew.lang;

import com.drew.metadata.StringValue;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class SequentialReader {
    private boolean _isMotorolaByteOrder = true;

    public abstract int available();

    public abstract byte getByte();

    public abstract void getBytes(byte[] bArr, int i, int i2);

    public abstract byte[] getBytes(int i);

    public final double getDouble64() {
        return Double.longBitsToDouble(getInt64());
    }

    public final float getFloat32() {
        return Float.intBitsToFloat(getInt32());
    }

    public final short getInt16() {
        int i;
        int i2;
        if (this._isMotorolaByteOrder) {
            i = (getByte() << 8) & (-256);
            i2 = getByte() & 255;
        } else {
            i = getByte() & 255;
            i2 = (getByte() << 8) & (-256);
        }
        return (short) (i2 | i);
    }

    public final int getInt32() {
        int i;
        int i2;
        if (this._isMotorolaByteOrder) {
            i = ((getByte() << 24) & (-16777216)) | (16711680 & (getByte() << 16)) | (65280 & (getByte() << 8));
            i2 = getByte() & 255;
        } else {
            i = (getByte() & 255) | (65280 & (getByte() << 8)) | ((getByte() << 16) & 16711680);
            i2 = (getByte() << 24) & (-16777216);
        }
        return i2 | i;
    }

    public final long getInt64() {
        long j;
        long j2;
        if (this._isMotorolaByteOrder) {
            j = ((((long) getByte()) << 56) & (-72057594037927936L)) | ((((long) getByte()) << 48) & 71776119061217280L) | ((((long) getByte()) << 40) & 280375465082880L) | ((((long) getByte()) << 32) & 1095216660480L) | ((((long) getByte()) << 24) & 4278190080L) | ((((long) getByte()) << 16) & 16711680) | ((((long) getByte()) << 8) & 65280);
            j2 = ((long) getByte()) & 255;
        } else {
            j = (((long) getByte()) & 255) | ((((long) getByte()) << 8) & 65280) | ((((long) getByte()) << 16) & 16711680) | ((((long) getByte()) << 24) & 4278190080L) | ((((long) getByte()) << 32) & 1095216660480L) | ((((long) getByte()) << 40) & 280375465082880L) | ((((long) getByte()) << 48) & 71776119061217280L);
            j2 = (((long) getByte()) << 56) & (-72057594037927936L);
        }
        return j | j2;
    }

    public final byte getInt8() {
        return getByte();
    }

    public final byte[] getNullTerminatedBytes(int i, boolean z) {
        byte[] bytes;
        int i2;
        if (z) {
            bytes = getBytes(i);
            i2 = 0;
            while (i2 < bytes.length && bytes[i2] != 0) {
                i2++;
            }
        } else {
            byte[] bArr = new byte[i];
            int i3 = 0;
            while (i3 < i) {
                byte b = getByte();
                bArr[i3] = b;
                if (b == 0) {
                    break;
                }
                i3++;
            }
            bytes = bArr;
            i2 = i3;
        }
        if (i2 == i) {
            return bytes;
        }
        byte[] bArr2 = new byte[i2];
        if (i2 > 0) {
            System.arraycopy(bytes, 0, bArr2, 0, i2);
        }
        return bArr2;
    }

    public final String getNullTerminatedString(int i, Charset charset, boolean z) {
        return getNullTerminatedStringValue(i, charset, z).toString();
    }

    public final StringValue getNullTerminatedStringValue(int i, Charset charset, boolean z) {
        return new StringValue(getNullTerminatedBytes(i, z), charset);
    }

    public abstract long getPosition();

    public final float getS15Fixed16() {
        double d;
        double d2;
        if (this._isMotorolaByteOrder) {
            float f = ((getByte() & 255) << 8) | (getByte() & 255);
            d = f;
            d2 = (getByte() & 255) | ((getByte() & 255) << 8);
        } else {
            d2 = (getByte() & 255) | ((getByte() & 255) << 8);
        }
        return (float) ((d2 / 65536.0d) + d);
    }

    public final String getString(int i, String str) {
        byte[] bytes = getBytes(i);
        try {
            return new String(bytes, str);
        } catch (UnsupportedEncodingException unused) {
            return new String(bytes);
        }
    }

    public final StringValue getStringValue(int i, Charset charset) {
        return new StringValue(getBytes(i), charset);
    }

    public final int getUInt16() {
        int i;
        int i2;
        if (this._isMotorolaByteOrder) {
            i = (getByte() << 8) & 65280;
            i2 = getByte() & 255;
        } else {
            i = getByte() & 255;
            i2 = (getByte() << 8) & 65280;
        }
        return i2 | i;
    }

    public final long getUInt32() {
        if (!this._isMotorolaByteOrder) {
            return (255 & ((long) getByte())) | (65280 & (((long) getByte()) << 8)) | ((((long) getByte()) << 16) & 16711680) | ((((long) getByte()) << 24) & 4278190080L);
        }
        return (255 & ((long) getByte())) | (65280 & (((long) getByte()) << 8)) | (16711680 & (((long) getByte()) << 16)) | (4278190080L & (((long) getByte()) << 24));
    }

    public final short getUInt8() {
        return (short) (getByte() & 255);
    }

    public final boolean isMotorolaByteOrder() {
        return this._isMotorolaByteOrder;
    }

    public final void setMotorolaByteOrder(boolean z) {
        this._isMotorolaByteOrder = z;
    }

    public abstract void skip(long j);

    public abstract boolean trySkip(long j);

    public final String getString(int i) {
        return new String(getBytes(i));
    }

    public final String getString(int i, Charset charset) {
        return new String(getBytes(i), charset);
    }
}
