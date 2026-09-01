package com.drew.lang;

import com.drew.metadata.StringValue;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class RandomAccessReader {
    private boolean _isMotorolaByteOrder = true;

    public final boolean getBit(int i) {
        int i2 = i / 8;
        validateIndex(i2, 1);
        return ((getByte(i2) >> (i % 8)) & 1) == 1;
    }

    public abstract byte getByte(int i);

    public abstract byte[] getBytes(int i, int i2);

    public final double getDouble64(int i) {
        return Double.longBitsToDouble(getInt64(i));
    }

    public final float getFloat32(int i) {
        return Float.intBitsToFloat(getInt32(i));
    }

    public final short getInt16(int i) {
        int i2;
        byte b;
        validateIndex(i, 2);
        if (this._isMotorolaByteOrder) {
            i2 = (getByte(i) << 8) & (-256);
            b = getByte(i + 1);
        } else {
            i2 = (getByte(i + 1) << 8) & (-256);
            b = getByte(i);
        }
        return (short) ((b & 255) | i2);
    }

    public final int getInt24(int i) {
        int i2;
        byte b;
        validateIndex(i, 3);
        if (this._isMotorolaByteOrder) {
            i2 = ((getByte(i) << 16) & 16711680) | (65280 & (getByte(i + 1) << 8));
            b = getByte(i + 2);
        } else {
            i2 = ((getByte(i + 2) << 16) & 16711680) | (65280 & (getByte(i + 1) << 8));
            b = getByte(i);
        }
        return (b & 255) | i2;
    }

    public final int getInt32(int i) {
        int i2;
        byte b;
        validateIndex(i, 4);
        if (this._isMotorolaByteOrder) {
            i2 = ((getByte(i) << 24) & (-16777216)) | (16711680 & (getByte(i + 1) << 16)) | (65280 & (getByte(i + 2) << 8));
            b = getByte(i + 3);
        } else {
            i2 = ((getByte(i + 3) << 24) & (-16777216)) | (16711680 & (getByte(i + 2) << 16)) | (65280 & (getByte(i + 1) << 8));
            b = getByte(i);
        }
        return (b & 255) | i2;
    }

    public final long getInt64(int i) {
        long j;
        long j2;
        byte b;
        validateIndex(i, 8);
        if (this._isMotorolaByteOrder) {
            j = 255;
            j2 = ((((long) getByte(i)) << 56) & (-72057594037927936L)) | ((((long) getByte(i + 1)) << 48) & 71776119061217280L) | ((((long) getByte(i + 2)) << 40) & 280375465082880L) | ((((long) getByte(i + 3)) << 32) & 1095216660480L) | ((((long) getByte(i + 4)) << 24) & 4278190080L) | ((((long) getByte(i + 5)) << 16) & 16711680) | ((((long) getByte(i + 6)) << 8) & 65280);
            b = getByte(i + 7);
        } else {
            j = 255;
            j2 = ((((long) getByte(i + 7)) << 56) & (-72057594037927936L)) | ((((long) getByte(i + 6)) << 48) & 71776119061217280L) | ((((long) getByte(i + 5)) << 40) & 280375465082880L) | ((((long) getByte(i + 4)) << 32) & 1095216660480L) | ((((long) getByte(i + 3)) << 24) & 4278190080L) | ((((long) getByte(i + 2)) << 16) & 16711680) | ((((long) getByte(i + 1)) << 8) & 65280);
            b = getByte(i);
        }
        return (((long) b) & j) | j2;
    }

    public final byte getInt8(int i) {
        validateIndex(i, 1);
        return getByte(i);
    }

    public abstract long getLength();

    public final byte[] getNullTerminatedBytes(int i, int i2) {
        byte[] bytes = getBytes(i, i2);
        int i3 = 0;
        while (i3 < bytes.length && bytes[i3] != 0) {
            i3++;
        }
        if (i3 == i2) {
            return bytes;
        }
        byte[] bArr = new byte[i3];
        if (i3 > 0) {
            System.arraycopy(bytes, 0, bArr, 0, i3);
        }
        return bArr;
    }

    public final String getNullTerminatedString(int i, int i2, Charset charset) {
        return new String(getNullTerminatedBytes(i, i2), charset.name());
    }

    public final StringValue getNullTerminatedStringValue(int i, int i2, Charset charset) {
        return new StringValue(getNullTerminatedBytes(i, i2), charset);
    }

    public final float getS15Fixed16(int i) {
        float f;
        int i2;
        byte b;
        validateIndex(i, 4);
        if (this._isMotorolaByteOrder) {
            f = ((getByte(i) & 255) << 8) | (getByte(i + 1) & 255);
            i2 = (getByte(i + 2) & 255) << 8;
            b = getByte(i + 3);
        } else {
            f = ((getByte(i + 3) & 255) << 8) | (getByte(i + 2) & 255);
            i2 = (getByte(i + 1) & 255) << 8;
            b = getByte(i);
        }
        return (float) ((((double) ((b & 255) | i2)) / 65536.0d) + ((double) f));
    }

    public final String getString(int i, int i2, String str) {
        byte[] bytes = getBytes(i, i2);
        try {
            return new String(bytes, str);
        } catch (UnsupportedEncodingException unused) {
            return new String(bytes);
        }
    }

    public final StringValue getStringValue(int i, int i2, Charset charset) {
        return new StringValue(getBytes(i, i2), charset);
    }

    public final int getUInt16(int i) {
        int i2;
        byte b;
        validateIndex(i, 2);
        if (this._isMotorolaByteOrder) {
            i2 = (getByte(i) << 8) & 65280;
            b = getByte(i + 1);
        } else {
            i2 = (getByte(i + 1) << 8) & 65280;
            b = getByte(i);
        }
        return (b & 255) | i2;
    }

    public final long getUInt32(int i) {
        long j;
        byte b;
        validateIndex(i, 4);
        if (this._isMotorolaByteOrder) {
            j = (65280 & (((long) getByte(i + 2)) << 8)) | (16711680 & (((long) getByte(i + 1)) << 16)) | (4278190080L & (((long) getByte(i)) << 24));
            b = getByte(i + 3);
        } else {
            j = (65280 & (((long) getByte(i + 1)) << 8)) | (16711680 & (((long) getByte(i + 2)) << 16)) | (4278190080L & (((long) getByte(i + 3)) << 24));
            b = getByte(i);
        }
        return (((long) b) & 255) | j;
    }

    public final short getUInt8(int i) {
        validateIndex(i, 1);
        return (short) (getByte(i) & 255);
    }

    public final boolean isMotorolaByteOrder() {
        return this._isMotorolaByteOrder;
    }

    public abstract boolean isValidIndex(int i, int i2);

    public final void setMotorolaByteOrder(boolean z) {
        this._isMotorolaByteOrder = z;
    }

    public abstract int toUnshiftedOffset(int i);

    public abstract void validateIndex(int i, int i2);

    public final String getString(int i, int i2, Charset charset) {
        return new String(getBytes(i, i2), charset.name());
    }
}
