package com.drew.imaging.png;

import com.drew.lang.SequentialReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngChunkReader {
    private static final byte[] PNG_SIGNATURE_BYTES = {-119, 80, 78, 71, 13, 10, 26, 10};

    public final Iterable<PngChunk> extract(SequentialReader sequentialReader, Set<PngChunkType> set) throws PngProcessingException {
        byte[] bytes;
        sequentialReader.setMotorolaByteOrder(true);
        byte[] bArr = PNG_SIGNATURE_BYTES;
        if (!Arrays.equals(bArr, sequentialReader.getBytes(bArr.length))) {
            throw new PngProcessingException("PNG signature mismatch", null);
        }
        ArrayList arrayList = new ArrayList();
        HashSet hashSet = new HashSet();
        boolean z = false;
        boolean z2 = false;
        while (!z) {
            int int32 = sequentialReader.getInt32();
            if (int32 < 0) {
                throw new PngProcessingException("PNG chunk length exceeds maximum", null);
            }
            PngChunkType pngChunkType = new PngChunkType(sequentialReader.getBytes(4));
            boolean z3 = set == null || set.contains(pngChunkType);
            if (z3) {
                bytes = sequentialReader.getBytes(int32);
            } else {
                sequentialReader.skip(int32);
                bytes = null;
            }
            sequentialReader.skip(4L);
            if (z3 && hashSet.contains(pngChunkType) && !pngChunkType.areMultipleAllowed()) {
                throw new PngProcessingException(String.format("Observed multiple instances of PNG chunk '%s', for which multiples are not allowed", pngChunkType), null);
            }
            PngChunkType pngChunkType2 = PngChunkType.IHDR;
            if (pngChunkType.equals(pngChunkType2)) {
                z2 = true;
            } else if (!z2) {
                throw new PngProcessingException(String.format("First chunk should be '%s', but '%s' was observed", pngChunkType2, pngChunkType), null);
            }
            if (pngChunkType.equals(PngChunkType.IEND)) {
                z = true;
            }
            if (z3) {
                arrayList.add(new PngChunk(pngChunkType, bytes));
            }
            hashSet.add(pngChunkType);
        }
        return arrayList;
    }
}
