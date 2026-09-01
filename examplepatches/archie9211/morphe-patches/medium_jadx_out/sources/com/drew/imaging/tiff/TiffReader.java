package com.drew.imaging.tiff;

import com.drew.lang.RandomAccessReader;
import com.drew.lang.Rational;
import defpackage.b09;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TiffReader {
    private static int calculateTagOffset(int i, int i2) {
        return (i2 * 12) + i + 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:121:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:141:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void processIfd(com.drew.imaging.tiff.TiffHandler r29, com.drew.lang.RandomAccessReader r30, java.util.Set<java.lang.Integer> r31, int r32, int r33) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 519
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.imaging.tiff.TiffReader.processIfd(com.drew.imaging.tiff.TiffHandler, com.drew.lang.RandomAccessReader, java.util.Set, int, int):void");
    }

    private static void processTag(TiffHandler tiffHandler, int i, int i2, int i3, int i4, RandomAccessReader randomAccessReader) {
        int i5 = 0;
        switch (i4) {
            case 1:
                if (i3 != 1) {
                    short[] sArr = new short[i3];
                    while (i5 < i3) {
                        sArr[i5] = randomAccessReader.getUInt8(i2 + i5);
                        i5++;
                    }
                    tiffHandler.setInt8uArray(i, sArr);
                } else {
                    tiffHandler.setInt8u(i, randomAccessReader.getUInt8(i2));
                }
                break;
            case 2:
                tiffHandler.setString(i, randomAccessReader.getNullTerminatedStringValue(i2, i3, null));
                break;
            case 3:
                if (i3 != 1) {
                    int[] iArr = new int[i3];
                    while (i5 < i3) {
                        iArr[i5] = randomAccessReader.getUInt16((i5 * 2) + i2);
                        i5++;
                    }
                    tiffHandler.setInt16uArray(i, iArr);
                } else {
                    tiffHandler.setInt16u(i, randomAccessReader.getUInt16(i2));
                }
                break;
            case 4:
                if (i3 != 1) {
                    long[] jArr = new long[i3];
                    while (i5 < i3) {
                        jArr[i5] = randomAccessReader.getUInt32((i5 * 4) + i2);
                        i5++;
                    }
                    tiffHandler.setInt32uArray(i, jArr);
                } else {
                    tiffHandler.setInt32u(i, randomAccessReader.getUInt32(i2));
                }
                break;
            case 5:
                if (i3 == 1) {
                    tiffHandler.setRational(i, new Rational(randomAccessReader.getUInt32(i2), randomAccessReader.getUInt32(i2 + 4)));
                } else if (i3 > 1) {
                    Rational[] rationalArr = new Rational[i3];
                    while (i5 < i3) {
                        int i6 = i5 * 8;
                        rationalArr[i5] = new Rational(randomAccessReader.getUInt32(i2 + i6), randomAccessReader.getUInt32(i2 + 4 + i6));
                        i5++;
                    }
                    tiffHandler.setRationalArray(i, rationalArr);
                }
                break;
            case 6:
                if (i3 != 1) {
                    byte[] bArr = new byte[i3];
                    while (i5 < i3) {
                        bArr[i5] = randomAccessReader.getInt8(i2 + i5);
                        i5++;
                    }
                    tiffHandler.setInt8sArray(i, bArr);
                } else {
                    tiffHandler.setInt8s(i, randomAccessReader.getInt8(i2));
                }
                break;
            case 7:
                tiffHandler.setByteArray(i, randomAccessReader.getBytes(i2, i3));
                break;
            case 8:
                if (i3 != 1) {
                    short[] sArr2 = new short[i3];
                    while (i5 < i3) {
                        sArr2[i5] = randomAccessReader.getInt16((i5 * 2) + i2);
                        i5++;
                    }
                    tiffHandler.setInt16sArray(i, sArr2);
                } else {
                    tiffHandler.setInt16s(i, randomAccessReader.getInt16(i2));
                }
                break;
            case 9:
                if (i3 != 1) {
                    int[] iArr2 = new int[i3];
                    while (i5 < i3) {
                        iArr2[i5] = randomAccessReader.getInt32((i5 * 4) + i2);
                        i5++;
                    }
                    tiffHandler.setInt32sArray(i, iArr2);
                } else {
                    tiffHandler.setInt32s(i, randomAccessReader.getInt32(i2));
                }
                break;
            case 10:
                if (i3 == 1) {
                    tiffHandler.setRational(i, new Rational(randomAccessReader.getInt32(i2), randomAccessReader.getInt32(i2 + 4)));
                } else if (i3 > 1) {
                    Rational[] rationalArr2 = new Rational[i3];
                    while (i5 < i3) {
                        int i7 = i5 * 8;
                        rationalArr2[i5] = new Rational(randomAccessReader.getInt32(i2 + i7), randomAccessReader.getInt32(i2 + 4 + i7));
                        i5++;
                    }
                    tiffHandler.setRationalArray(i, rationalArr2);
                }
                break;
            case 11:
                if (i3 != 1) {
                    float[] fArr = new float[i3];
                    while (i5 < i3) {
                        fArr[i5] = randomAccessReader.getFloat32((i5 * 4) + i2);
                        i5++;
                    }
                    tiffHandler.setFloatArray(i, fArr);
                } else {
                    tiffHandler.setFloat(i, randomAccessReader.getFloat32(i2));
                }
                break;
            case 12:
                if (i3 != 1) {
                    double[] dArr = new double[i3];
                    while (i5 < i3) {
                        dArr[i5] = randomAccessReader.getDouble64((i5 * 8) + i2);
                        i5++;
                    }
                    tiffHandler.setDoubleArray(i, dArr);
                } else {
                    tiffHandler.setDouble(i, randomAccessReader.getDouble64(i2));
                }
                break;
            default:
                tiffHandler.error(String.format("Invalid TIFF tag format code %d for tag 0x%04X", Integer.valueOf(i4), Integer.valueOf(i)));
                break;
        }
    }

    public final void processTiff(RandomAccessReader randomAccessReader, TiffHandler tiffHandler, int i) throws Throwable {
        short int16 = randomAccessReader.getInt16(i);
        if (int16 == 19789) {
            randomAccessReader.setMotorolaByteOrder(true);
        } else {
            if (int16 != 18761) {
                throw new TiffProcessingException(b09.w(int16, "Unclear distinction between Motorola/Intel byte ordering: "), null);
            }
            randomAccessReader.setMotorolaByteOrder(false);
        }
        tiffHandler.setTiffMarker(randomAccessReader.getUInt16(i + 2));
        int int32 = randomAccessReader.getInt32(i + 4) + i;
        if (int32 >= randomAccessReader.getLength() - 1) {
            tiffHandler.warn("First IFD offset is beyond the end of the TIFF data segment -- trying default offset");
            int32 = i + 8;
        }
        processIfd(tiffHandler, randomAccessReader, new HashSet(), int32, i);
    }
}
