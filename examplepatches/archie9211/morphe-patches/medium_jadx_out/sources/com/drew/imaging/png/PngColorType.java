package com.drew.imaging.png;

import defpackage.ev6;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngColorType {
    private final int[] _allowedBitDepths;
    private final String _description;
    private final int _numericValue;
    public static final PngColorType GREYSCALE = new PngColorType(0, "Greyscale", 1, 2, 4, 8, 16);
    public static final PngColorType TRUE_COLOR = new PngColorType(2, "True Color", 8, 16);
    public static final PngColorType INDEXED_COLOR = new PngColorType(3, "Indexed Color", 1, 2, 4, 8);
    public static final PngColorType GREYSCALE_WITH_ALPHA = new PngColorType(4, "Greyscale with Alpha", 8, 16);
    public static final PngColorType TRUE_COLOR_WITH_ALPHA = new PngColorType(6, "True Color with Alpha", 8, 16);

    private PngColorType(int i, String str, int... iArr) {
        this._numericValue = i;
        this._description = str;
        this._allowedBitDepths = iArr;
    }

    public static PngColorType fromNumericValue(int i) {
        return i != 0 ? i != 6 ? i != 2 ? i != 3 ? i != 4 ? new PngColorType(i, ev6.w("Unknown (", i, ")"), new int[0]) : GREYSCALE_WITH_ALPHA : INDEXED_COLOR : TRUE_COLOR : TRUE_COLOR_WITH_ALPHA : GREYSCALE;
    }

    public final int[] getAllowedBitDepths() {
        return this._allowedBitDepths;
    }

    public final String getDescription() {
        return this._description;
    }

    public final int getNumericValue() {
        return this._numericValue;
    }
}
