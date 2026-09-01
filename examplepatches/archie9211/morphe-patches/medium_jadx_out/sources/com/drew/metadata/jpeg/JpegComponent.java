package com.drew.metadata.jpeg;

import defpackage.ev6;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegComponent implements Serializable {
    private static final long serialVersionUID = 61121257899091914L;
    private final int _componentId;
    private final int _quantizationTableNumber;
    private final int _samplingFactorByte;

    public JpegComponent(int i, int i2, int i3) {
        this._componentId = i;
        this._samplingFactorByte = i2;
        this._quantizationTableNumber = i3;
    }

    public final int getComponentId() {
        return this._componentId;
    }

    public final String getComponentName() {
        int i = this._componentId;
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? ev6.w("Unknown (", i, ")") : "Q" : "I" : "Cr" : "Cb" : "Y";
    }

    public final int getHorizontalSamplingFactor() {
        return (this._samplingFactorByte >> 4) & 15;
    }

    public final int getQuantizationTableNumber() {
        return this._quantizationTableNumber;
    }

    public final int getVerticalSamplingFactor() {
        return this._samplingFactorByte & 15;
    }

    public final String toString() {
        return String.format("Quantization table %d, Sampling factors %d horiz/%d vert", Integer.valueOf(this._quantizationTableNumber), Integer.valueOf(getHorizontalSamplingFactor()), Integer.valueOf(getVerticalSamplingFactor()));
    }
}
