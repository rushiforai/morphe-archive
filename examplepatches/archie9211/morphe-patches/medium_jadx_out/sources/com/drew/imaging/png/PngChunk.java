package com.drew.imaging.png;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngChunk {
    private final byte[] _bytes;
    private final PngChunkType _chunkType;

    public PngChunk(PngChunkType pngChunkType, byte[] bArr) {
        this._chunkType = pngChunkType;
        this._bytes = bArr;
    }

    public final byte[] getBytes() {
        return this._bytes;
    }

    public final PngChunkType getType() {
        return this._chunkType;
    }
}
