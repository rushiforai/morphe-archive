package com.drew.imaging.tiff;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TiffDataFormat {
    public static final int CODE_DOUBLE = 12;
    public static final int CODE_INT16_S = 8;
    public static final int CODE_INT16_U = 3;
    public static final int CODE_INT32_S = 9;
    public static final int CODE_INT32_U = 4;
    public static final int CODE_INT8_S = 6;
    public static final int CODE_INT8_U = 1;
    public static final int CODE_RATIONAL_S = 10;
    public static final int CODE_RATIONAL_U = 5;
    public static final int CODE_SINGLE = 11;
    public static final int CODE_STRING = 2;
    public static final int CODE_UNDEFINED = 7;
    private final int _componentSizeBytes;
    private final String _name;
    private final int _tiffFormatCode;
    public static final TiffDataFormat INT8_U = new TiffDataFormat("BYTE", 1, 1);
    public static final TiffDataFormat STRING = new TiffDataFormat("STRING", 2, 1);
    public static final TiffDataFormat INT16_U = new TiffDataFormat("USHORT", 3, 2);
    public static final TiffDataFormat INT32_U = new TiffDataFormat("ULONG", 4, 4);
    public static final TiffDataFormat RATIONAL_U = new TiffDataFormat("URATIONAL", 5, 8);
    public static final TiffDataFormat INT8_S = new TiffDataFormat("SBYTE", 6, 1);
    public static final TiffDataFormat UNDEFINED = new TiffDataFormat("UNDEFINED", 7, 1);
    public static final TiffDataFormat INT16_S = new TiffDataFormat("SSHORT", 8, 2);
    public static final TiffDataFormat INT32_S = new TiffDataFormat("SLONG", 9, 4);
    public static final TiffDataFormat RATIONAL_S = new TiffDataFormat("SRATIONAL", 10, 8);
    public static final TiffDataFormat SINGLE = new TiffDataFormat("SINGLE", 11, 4);
    public static final TiffDataFormat DOUBLE = new TiffDataFormat("DOUBLE", 12, 8);

    private TiffDataFormat(String str, int i, int i2) {
        this._name = str;
        this._tiffFormatCode = i;
        this._componentSizeBytes = i2;
    }

    public static TiffDataFormat fromTiffFormatCode(int i) {
        switch (i) {
            case 1:
                return INT8_U;
            case 2:
                return STRING;
            case 3:
                return INT16_U;
            case 4:
                return INT32_U;
            case 5:
                return RATIONAL_U;
            case 6:
                return INT8_S;
            case 7:
                return UNDEFINED;
            case 8:
                return INT16_S;
            case 9:
                return INT32_S;
            case 10:
                return RATIONAL_S;
            case 11:
                return SINGLE;
            case 12:
                return DOUBLE;
            default:
                return null;
        }
    }

    public final int getComponentSizeBytes() {
        return this._componentSizeBytes;
    }

    public final int getTiffFormatCode() {
        return this._tiffFormatCode;
    }

    public final String toString() {
        return this._name;
    }
}
