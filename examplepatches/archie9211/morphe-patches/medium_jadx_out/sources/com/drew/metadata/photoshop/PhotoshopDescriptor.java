package com.drew.metadata.photoshop;

import com.drew.lang.ByteArrayReader;
import com.drew.metadata.TagDescriptor;
import java.io.IOException;
import java.text.DecimalFormat;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PhotoshopDescriptor extends TagDescriptor<PhotoshopDirectory> {
    public PhotoshopDescriptor(PhotoshopDirectory photoshopDirectory) {
        super(photoshopDirectory);
    }

    private String get32BitNumberString(int i) {
        byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        try {
            return String.format("%d", Integer.valueOf(new ByteArrayReader(byteArray, 0).getInt32(0)));
        } catch (IOException unused) {
            return null;
        }
    }

    private String getBinaryDataString(int i) {
        byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        return String.format("%d bytes binary data", Integer.valueOf(byteArray.length));
    }

    private String getBooleanString(int i) {
        byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
        if (byteArray == null || byteArray.length == 0) {
            return null;
        }
        return byteArray[0] == 0 ? "No" : "Yes";
    }

    private String getSimpleString(int i) {
        byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        return new String(byteArray);
    }

    public final String getClippingPathNameString(int i) {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            return new String(byteArrayReader.getBytes(1, byteArrayReader.getByte(0)), "UTF-8");
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i != 1002) {
            if (i == 1005) {
                return getResolutionInfoDescription();
            }
            if (i == 1028) {
                return getBinaryDataString(i);
            }
            if (i == 1030) {
                return getJpegQualityString();
            }
            if (i != 1044 && i != 1054) {
                if (i == 1057) {
                    return getVersionDescription();
                }
                if (i == 1062) {
                    return getPrintScaleDescription();
                }
                if (i == 1064) {
                    return getPixelAspectRatioString();
                }
                if (i == 2999) {
                    return getClippingPathNameString(i);
                }
                if (i != 1049) {
                    if (i == 1050) {
                        return getSlicesDescription();
                    }
                    switch (i) {
                        case PhotoshopDirectory.TAG_THUMBNAIL_OLD /* 1033 */:
                        case PhotoshopDirectory.TAG_THUMBNAIL /* 1036 */:
                            return getThumbnailDescription(i);
                        case PhotoshopDirectory.TAG_COPYRIGHT /* 1034 */:
                            return getBooleanString(i);
                        case PhotoshopDirectory.TAG_URL /* 1035 */:
                            break;
                        case 1037:
                            break;
                        default:
                            return (i < 2000 || i > 2998) ? super.getDescription(i) : getPathString(i);
                    }
                }
            }
            return get32BitNumberString(i);
        }
        return getSimpleString(i);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String getJpegQualityString() {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.metadata.photoshop.PhotoshopDescriptor.getJpegQualityString():java.lang.String");
    }

    public final String getPixelAspectRatioString() {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(PhotoshopDirectory.TAG_PIXEL_ASPECT_RATIO);
            if (byteArray == null) {
                return null;
            }
            return Double.toString(new ByteArrayReader(byteArray, 0).getDouble64(4));
        } catch (Exception unused) {
            return null;
        }
    }

    public final String getPrintScaleDescription() {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(PhotoshopDirectory.TAG_PRINT_SCALE);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            int int32 = byteArrayReader.getInt32(0);
            float float32 = byteArrayReader.getFloat32(2);
            float float322 = byteArrayReader.getFloat32(6);
            float float323 = byteArrayReader.getFloat32(10);
            if (int32 == 0) {
                return "Centered, Scale " + float323;
            }
            if (int32 == 1) {
                return "Size to fit";
            }
            if (int32 != 2) {
                return String.format("Unknown %04X, X:%s Y:%s, Scale:%s", Integer.valueOf(int32), Float.valueOf(float32), Float.valueOf(float322), Float.valueOf(float323));
            }
            return "User defined, X:" + float32 + " Y:" + float322 + ", Scale:" + float323;
        } catch (Exception unused) {
            return null;
        }
    }

    public final String getResolutionInfoDescription() {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(PhotoshopDirectory.TAG_RESOLUTION_INFO);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            float s15Fixed16 = byteArrayReader.getS15Fixed16(0);
            float s15Fixed162 = byteArrayReader.getS15Fixed16(8);
            DecimalFormat decimalFormat = new DecimalFormat("0.##");
            return decimalFormat.format(s15Fixed16) + "x" + decimalFormat.format(s15Fixed162) + " DPI";
        } catch (Exception unused) {
            return null;
        }
    }

    public final String getSlicesDescription() {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(PhotoshopDirectory.TAG_SLICES);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            int int32 = byteArrayReader.getInt32(20) * 2;
            return String.format("%s (%d,%d,%d,%d) %d Slices", byteArrayReader.getString(24, int32, "UTF-16"), Integer.valueOf(byteArrayReader.getInt32(4)), Integer.valueOf(byteArrayReader.getInt32(8)), Integer.valueOf(byteArrayReader.getInt32(12)), Integer.valueOf(byteArrayReader.getInt32(16)), Integer.valueOf(byteArrayReader.getInt32(int32 + 24)));
        } catch (IOException unused) {
            return null;
        }
    }

    public final String getThumbnailDescription(int i) {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(i);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            int int32 = byteArrayReader.getInt32(0);
            int int322 = byteArrayReader.getInt32(4);
            int int323 = byteArrayReader.getInt32(8);
            int int324 = byteArrayReader.getInt32(16);
            int int325 = byteArrayReader.getInt32(20);
            return String.format("%s, %dx%d, Decomp %d bytes, %d bpp, %d bytes", int32 == 1 ? "JpegRGB" : "RawRGB", Integer.valueOf(int322), Integer.valueOf(int323), Integer.valueOf(int324), Integer.valueOf(byteArrayReader.getInt32(24)), Integer.valueOf(int325));
        } catch (IOException unused) {
            return null;
        }
    }

    public final String getVersionDescription() {
        try {
            byte[] byteArray = ((PhotoshopDirectory) this._directory).getByteArray(PhotoshopDirectory.TAG_VERSION);
            if (byteArray == null) {
                return null;
            }
            ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
            int int32 = byteArrayReader.getInt32(0);
            int int322 = byteArrayReader.getInt32(5) * 2;
            String string = byteArrayReader.getString(9, int322, "UTF-16");
            int int323 = byteArrayReader.getInt32(9 + int322);
            int i = int322 + 13;
            int i2 = int323 * 2;
            return String.format("%d (%s, %s) %d", Integer.valueOf(int32), string, byteArrayReader.getString(i, i2, "UTF-16"), Integer.valueOf(byteArrayReader.getInt32(i + i2)));
        } catch (IOException unused) {
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x007d A[Catch: Exception -> 0x0263, TryCatch #0 {Exception -> 0x0263, blocks: (B:11:0x004b, B:26:0x0069, B:58:0x013e, B:33:0x007d, B:38:0x008c, B:39:0x00b9, B:34:0x0083, B:40:0x00c5, B:42:0x00cd, B:44:0x00d5, B:47:0x00e5, B:52:0x00f4, B:53:0x0122, B:48:0x00eb, B:54:0x0129, B:56:0x0133, B:57:0x0136, B:59:0x014a, B:61:0x0154, B:62:0x0157, B:64:0x015d, B:65:0x0160, B:67:0x0192, B:68:0x019f, B:72:0x01b2, B:73:0x01b9, B:75:0x01bf, B:79:0x01e9, B:80:0x01f4, B:82:0x01fa, B:83:0x025c), top: B:88:0x004b }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0083 A[Catch: Exception -> 0x0263, TryCatch #0 {Exception -> 0x0263, blocks: (B:11:0x004b, B:26:0x0069, B:58:0x013e, B:33:0x007d, B:38:0x008c, B:39:0x00b9, B:34:0x0083, B:40:0x00c5, B:42:0x00cd, B:44:0x00d5, B:47:0x00e5, B:52:0x00f4, B:53:0x0122, B:48:0x00eb, B:54:0x0129, B:56:0x0133, B:57:0x0136, B:59:0x014a, B:61:0x0154, B:62:0x0157, B:64:0x015d, B:65:0x0160, B:67:0x0192, B:68:0x019f, B:72:0x01b2, B:73:0x01b9, B:75:0x01bf, B:79:0x01e9, B:80:0x01f4, B:82:0x01fa, B:83:0x025c), top: B:88:0x004b }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x008c A[Catch: Exception -> 0x0263, LOOP:1: B:36:0x0089->B:38:0x008c, LOOP_END, TryCatch #0 {Exception -> 0x0263, blocks: (B:11:0x004b, B:26:0x0069, B:58:0x013e, B:33:0x007d, B:38:0x008c, B:39:0x00b9, B:34:0x0083, B:40:0x00c5, B:42:0x00cd, B:44:0x00d5, B:47:0x00e5, B:52:0x00f4, B:53:0x0122, B:48:0x00eb, B:54:0x0129, B:56:0x0133, B:57:0x0136, B:59:0x014a, B:61:0x0154, B:62:0x0157, B:64:0x015d, B:65:0x0160, B:67:0x0192, B:68:0x019f, B:72:0x01b2, B:73:0x01b9, B:75:0x01bf, B:79:0x01e9, B:80:0x01f4, B:82:0x01fa, B:83:0x025c), top: B:88:0x004b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String getPathString(int r29) {
        /*
            Method dump skipped, instruction units count: 612
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.metadata.photoshop.PhotoshopDescriptor.getPathString(int):java.lang.String");
    }
}
