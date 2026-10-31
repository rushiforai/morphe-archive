package org.brotli.dec;

import java.io.InputStream;

/* loaded from: classes5.dex */
final class State {
    int accumulator32;
    long accumulator64;
    int bitOffset;
    int[] blockTrees;
    byte[] byteBuffer;
    int cdBlockBits;
    byte[] cdBlockMap;
    int cdBrCopied;
    int cdBrIndex;
    int cdBrLength;
    int cdBrOffset;
    int[] cdChunkOffsets;
    byte[][] cdChunks;
    int cdNumChunks;
    int cdTotalSize;
    int commandBlockLength;
    int[] commandTreeGroup;
    int commandTreeIdx;
    int contextLookupOffset1;
    int contextLookupOffset2;
    byte[] contextMap;
    int contextMapSlice;
    byte[] contextModes;
    int copyLength;
    byte[] distContextMap;
    int distContextMapSlice;
    byte[] distExtraBits;
    int[] distOffset;
    int distRbIdx;
    int distance;
    int distanceBlockLength;
    int distanceCode;
    int distancePostfixBits;
    int[] distanceTreeGroup;
    int endOfStreamReached;
    int expectedTotalSize;
    int halfOffset;
    int inputEnd;
    int insertLength;
    int[] intBuffer;
    int isEager;
    int isLargeWindow;
    int isMetadata;
    int isUncompressed;

    /* renamed from: j, reason: collision with root package name */
    int f80623j;
    int literalBlockLength;
    int[] literalTreeGroup;
    int literalTreeIdx;
    int maxBackwardDistance;
    int maxDistance;
    int maxRingBufferSize;
    int metaBlockLength;
    int nextRunningState;
    int numCommandBlockTypes;
    int numDirectDistanceCodes;
    int numDistanceBlockTypes;
    int numLiteralBlockTypes;
    byte[] output;
    int outputLength;
    int outputOffset;
    int outputUsed;
    int pos;
    int ringBufferBytesReady;
    int ringBufferBytesWritten;
    int ringBufferSize;
    int[] rings;
    int runningState;
    short[] shortBuffer;
    int tailBytes;
    int trivialLiteralContext;
    InputStream input = Utils.makeEmptyInput();
    byte[] ringBuffer = new byte[0];

    public State() {
        int[] iArr = new int[10];
        this.rings = iArr;
        iArr[0] = 16;
        iArr[1] = 15;
        iArr[2] = 11;
        iArr[3] = 4;
    }
}
