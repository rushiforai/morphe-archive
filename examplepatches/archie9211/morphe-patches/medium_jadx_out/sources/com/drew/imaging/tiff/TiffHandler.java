package com.drew.imaging.tiff;

import com.drew.lang.RandomAccessReader;
import com.drew.lang.Rational;
import com.drew.metadata.StringValue;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface TiffHandler {
    boolean customProcessTag(int i, Set<Integer> set, int i2, RandomAccessReader randomAccessReader, int i3, int i4);

    void endingIFD();

    void error(String str);

    boolean hasFollowerIfd();

    void setByteArray(int i, byte[] bArr);

    void setDouble(int i, double d);

    void setDoubleArray(int i, double[] dArr);

    void setFloat(int i, float f);

    void setFloatArray(int i, float[] fArr);

    void setInt16s(int i, int i2);

    void setInt16sArray(int i, short[] sArr);

    void setInt16u(int i, int i2);

    void setInt16uArray(int i, int[] iArr);

    void setInt32s(int i, int i2);

    void setInt32sArray(int i, int[] iArr);

    void setInt32u(int i, long j);

    void setInt32uArray(int i, long[] jArr);

    void setInt8s(int i, byte b);

    void setInt8sArray(int i, byte[] bArr);

    void setInt8u(int i, short s);

    void setInt8uArray(int i, short[] sArr);

    void setRational(int i, Rational rational);

    void setRationalArray(int i, Rational[] rationalArr);

    void setString(int i, StringValue stringValue);

    void setTiffMarker(int i);

    Long tryCustomProcessFormat(int i, int i2, long j);

    boolean tryEnterSubIfd(int i);

    void warn(String str);
}
