package com.drew.imaging.png;

import com.drew.lang.SequentialByteArrayReader;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngHeader {
    private final byte _bitsPerSample;
    private final PngColorType _colorType;
    private final byte _compressionType;
    private final byte _filterMethod;
    private final int _imageHeight;
    private final int _imageWidth;
    private final byte _interlaceMethod;

    public PngHeader(byte[] bArr) throws PngProcessingException {
        if (bArr.length != 13) {
            throw new PngProcessingException("PNG header chunk must have 13 data bytes", null);
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        try {
            this._imageWidth = sequentialByteArrayReader.getInt32();
            this._imageHeight = sequentialByteArrayReader.getInt32();
            this._bitsPerSample = sequentialByteArrayReader.getByte();
            this._colorType = PngColorType.fromNumericValue(sequentialByteArrayReader.getByte());
            this._compressionType = sequentialByteArrayReader.getByte();
            this._filterMethod = sequentialByteArrayReader.getByte();
            this._interlaceMethod = sequentialByteArrayReader.getByte();
        } catch (IOException e) {
            throw new PngProcessingException(null, e);
        }
    }

    public final byte getBitsPerSample() {
        return this._bitsPerSample;
    }

    public final PngColorType getColorType() {
        return this._colorType;
    }

    public final byte getCompressionType() {
        return this._compressionType;
    }

    public final byte getFilterMethod() {
        return this._filterMethod;
    }

    public final int getImageHeight() {
        return this._imageHeight;
    }

    public final int getImageWidth() {
        return this._imageWidth;
    }

    public final byte getInterlaceMethod() {
        return this._interlaceMethod;
    }
}
