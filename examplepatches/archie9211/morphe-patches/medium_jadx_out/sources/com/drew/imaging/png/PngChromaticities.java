package com.drew.imaging.png;

import com.drew.lang.SequentialByteArrayReader;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngChromaticities {
    private final int _blueX;
    private final int _blueY;
    private final int _greenX;
    private final int _greenY;
    private final int _redX;
    private final int _redY;
    private final int _whitePointX;
    private final int _whitePointY;

    public PngChromaticities(byte[] bArr) throws PngProcessingException {
        if (bArr.length != 32) {
            throw new PngProcessingException("Invalid number of bytes", null);
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        try {
            this._whitePointX = sequentialByteArrayReader.getInt32();
            this._whitePointY = sequentialByteArrayReader.getInt32();
            this._redX = sequentialByteArrayReader.getInt32();
            this._redY = sequentialByteArrayReader.getInt32();
            this._greenX = sequentialByteArrayReader.getInt32();
            this._greenY = sequentialByteArrayReader.getInt32();
            this._blueX = sequentialByteArrayReader.getInt32();
            this._blueY = sequentialByteArrayReader.getInt32();
        } catch (IOException e) {
            throw new PngProcessingException(null, e);
        }
    }

    public final int getBlueX() {
        return this._blueX;
    }

    public final int getBlueY() {
        return this._blueY;
    }

    public final int getGreenX() {
        return this._greenX;
    }

    public final int getGreenY() {
        return this._greenY;
    }

    public final int getRedX() {
        return this._redX;
    }

    public final int getRedY() {
        return this._redY;
    }

    public final int getWhitePointX() {
        return this._whitePointX;
    }

    public final int getWhitePointY() {
        return this._whitePointY;
    }
}
