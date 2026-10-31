package org.brotli.dec;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.brotli.dec.Transform;

/* loaded from: classes5.dex */
final class Decode {
    private static final int BLOCK_START = 2;
    private static final int CD_BLOCK_MAP_BITS = 8;
    private static final int CLOSED = 11;
    static final short[] CMD_LOOKUP;
    private static final int CODE_LENGTH_CODES = 18;
    private static final int CODE_LENGTH_REPEAT_CODE = 16;
    private static final int COMPRESSED_BLOCK_START = 3;
    private static final int COPY_FROM_COMPOUND_DICTIONARY = 14;
    private static final int COPY_LOOP = 8;
    private static final int COPY_UNCOMPRESSED = 6;
    private static final int DEFAULT_CODE_LENGTH = 8;
    private static final int DISTANCE_CONTEXT_BITS = 2;
    private static final int FINISHED = 10;
    private static final int HUFFMAN_TABLE_BITS = 8;
    private static final int HUFFMAN_TABLE_MASK = 255;
    private static final int HUFFMAN_TABLE_SIZE_258 = 632;
    private static final int HUFFMAN_TABLE_SIZE_26 = 396;
    private static final int INITIALIZED = 1;
    private static final int INIT_WRITE = 12;
    private static final int INSERT_LOOP = 7;
    private static final int LITERAL_CONTEXT_BITS = 6;
    private static final int MAIN_LOOP = 4;
    private static final int MAX_ALLOWED_DISTANCE = 2147483644;
    private static final int MAX_DISTANCE_BITS = 24;
    static final int MAX_LARGE_WINDOW_BITS = 30;
    private static final int MAX_LARGE_WINDOW_DISTANCE_BITS = 62;
    static final int MAX_TRANSFORMED_WORD_LENGTH = 37;
    static final int MIN_LARGE_WINDOW_BITS = 10;
    private static final int NUM_BLOCK_LENGTH_CODES = 26;
    private static final int NUM_COMMAND_CODES = 704;
    private static final int NUM_DISTANCE_SHORT_CODES = 16;
    private static final int NUM_LITERAL_CODES = 256;
    private static final int READ_METADATA = 5;
    private static final int UNINITIALIZED = 0;
    private static final int USE_DICTIONARY = 9;
    private static final int WRITE = 13;
    static final int[] MAX_HUFFMAN_TABLE_SIZE = {256, TTAdConstant.AD_ID_IS_NULL_CODE, 436, 468, 500, 534, 566, 598, 630, 662, 694, 726, 758, 790, 822, 854, 886, 920, 952, 984, 1016, 1048, 1080};
    private static final int[] CODE_LENGTH_CODE_ORDER = {1, 2, 3, 4, 0, 5, 17, 6, 16, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    private static final int[] DISTANCE_SHORT_CODE_INDEX_OFFSET = {0, 3, 2, 1, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3};
    private static final int[] DISTANCE_SHORT_CODE_VALUE_OFFSET = {0, 0, 0, 0, -1, 1, -2, 2, -3, 3, -1, 1, -2, 2, -3, 3};
    private static final int[] FIXED_TABLE = {SQLiteDatabase.OPEN_SHAREDCACHE, 131076, 131075, 196610, SQLiteDatabase.OPEN_SHAREDCACHE, 131076, 131075, 262145, SQLiteDatabase.OPEN_SHAREDCACHE, 131076, 131075, 196610, SQLiteDatabase.OPEN_SHAREDCACHE, 131076, 131075, 262149};
    static final int[] BLOCK_LENGTH_OFFSET = {1, 5, 9, 13, 17, 25, 33, 41, 49, 65, 81, 97, 113, 145, 177, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 241, Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, 369, 497, 753, 1265, 2289, 4337, 8433, 16625};
    static final int[] BLOCK_LENGTH_N_BITS = {2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 7, 8, 9, 10, 11, 12, 13, 24};
    static final short[] INSERT_LENGTH_N_BITS = {0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 9, 10, 12, 14, 24};
    static final short[] COPY_LENGTH_N_BITS = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 9, 10, 24};

    static {
        short[] sArr = new short[2816];
        CMD_LOOKUP = sArr;
        unpackCommandLookupTable(sArr);
    }

    public static int attachDictionaryChunk(State state, byte[] bArr) {
        if (state.runningState != 1) {
            return Utils.makeError(state, -24);
        }
        int i5 = state.cdNumChunks;
        if (i5 == 0) {
            state.cdChunks = new byte[16][];
            state.cdChunkOffsets = new int[16];
            state.cdBlockBits = -1;
        }
        if (i5 == 15) {
            return Utils.makeError(state, -27);
        }
        state.cdChunks[i5] = bArr;
        int i11 = i5 + 1;
        state.cdNumChunks = i11;
        int length = state.cdTotalSize + bArr.length;
        state.cdTotalSize = length;
        state.cdChunkOffsets[i11] = length;
        return 0;
    }

    private static int calculateDistanceAlphabetLimit(State state, int i5, int i11, int i12) {
        if (i5 < (2 << i11) + i12) {
            return Utils.makeError(state, -23);
        }
        int i13 = ((i5 - i12) >> i11) + 4;
        int iLog2floor = log2floor(i13);
        return (((((i13 >> (iLog2floor - 1)) & 1) | ((iLog2floor - 2) << 1)) - 1) << i11) + (1 << i11) + i12 + 16;
    }

    private static int calculateDistanceAlphabetSize(int i5, int i11, int i12) {
        return ((i12 << i5) * 2) + i11 + 16;
    }

    private static void calculateDistanceLut(State state, int i5) {
        byte[] bArr = state.distExtraBits;
        int[] iArr = state.distOffset;
        int i11 = state.distancePostfixBits;
        int i12 = state.numDirectDistanceCodes;
        int i13 = 1 << i11;
        int i14 = 16;
        int i15 = 0;
        while (i15 < i12) {
            bArr[i14] = 0;
            i15++;
            iArr[i14] = i15;
            i14++;
        }
        int i16 = 1;
        int i17 = 0;
        while (i14 < i5) {
            int i18 = ((((i17 + 2) << i16) - 4) << i11) + i12 + 1;
            for (int i19 = 0; i19 < i13; i19++) {
                bArr[i14] = (byte) i16;
                iArr[i14] = i18 + i19;
                i14++;
            }
            i16 += i17;
            i17 ^= 1;
        }
    }

    private static int calculateFence(State state) {
        int i5 = state.ringBufferSize;
        return state.isEager != 0 ? Utils.min(i5, (state.ringBufferBytesWritten + state.outputLength) - state.outputUsed) : i5;
    }

    private static int checkDupes(State state, int[] iArr, int i5) {
        int i11 = 0;
        while (i11 < i5 - 1) {
            int i12 = i11 + 1;
            for (int i13 = i12; i13 < i5; i13++) {
                if (iArr[i11] == iArr[i13]) {
                    return Utils.makeError(state, -7);
                }
            }
            i11 = i12;
        }
        return 0;
    }

    public static int close(State state) {
        int i5 = state.runningState;
        if (i5 == 0) {
            return Utils.makeError(state, -25);
        }
        if (i5 <= 0) {
            return 0;
        }
        state.runningState = 11;
        return 0;
    }

    private static int copyFromCompoundDictionary(State state, int i5) {
        int i11 = state.pos;
        int i12 = i11;
        do {
            int i13 = state.cdBrLength;
            int i14 = state.cdBrCopied;
            if (i13 == i14) {
                break;
            }
            int i15 = i5 - i12;
            int[] iArr = state.cdChunkOffsets;
            int i16 = state.cdBrIndex;
            int i17 = iArr[i16 + 1] - iArr[i16];
            int i18 = state.cdBrOffset;
            int i19 = i17 - i18;
            int i21 = i13 - i14;
            if (i21 > i19) {
                i21 = i19;
            }
            if (i21 <= i15) {
                i15 = i21;
            }
            Utils.copyBytes(state.ringBuffer, i12, state.cdChunks[i16], i18, i18 + i15);
            i12 += i15;
            state.cdBrOffset += i15;
            state.cdBrCopied += i15;
            if (i15 == i19) {
                state.cdBrIndex++;
                state.cdBrOffset = 0;
            }
        } while (i12 < i5);
        return i12 - i11;
    }

    private static int copyUncompressedData(State state) {
        byte[] bArr = state.ringBuffer;
        int i5 = state.metaBlockLength;
        if (i5 <= 0) {
            int iReload = BitReader.reload(state);
            if (iReload < 0) {
                return iReload;
            }
            state.runningState = 2;
            return 0;
        }
        int iMin = Utils.min(state.ringBufferSize - state.pos, i5);
        int iCopyRawBytes = BitReader.copyRawBytes(state, bArr, state.pos, iMin);
        if (iCopyRawBytes < 0) {
            return iCopyRawBytes;
        }
        state.metaBlockLength -= iMin;
        int i11 = state.pos + iMin;
        state.pos = i11;
        if (i11 == state.ringBufferSize) {
            state.nextRunningState = 6;
            state.runningState = 12;
            return 0;
        }
        int iReload2 = BitReader.reload(state);
        if (iReload2 < 0) {
            return iReload2;
        }
        state.runningState = 2;
        return 0;
    }

    private static int decodeBlockTypeAndLength(State state, int i5, int i11) {
        int[] iArr = state.rings;
        int i12 = i5 * 2;
        int i13 = i12 + 4;
        BitReader.fillBitWindow(state);
        int symbol = readSymbol(state.blockTrees, i12, state);
        int blockLength = readBlockLength(state.blockTrees, i12 + 1, state);
        int i14 = symbol == 1 ? iArr[i12 + 5] + 1 : symbol == 0 ? iArr[i13] : symbol - 2;
        if (i14 >= i11) {
            i14 -= i11;
        }
        int i15 = i12 + 5;
        iArr[i13] = iArr[i15];
        iArr[i15] = i14;
        return blockLength;
    }

    private static void decodeCommandBlockSwitch(State state) {
        state.commandBlockLength = decodeBlockTypeAndLength(state, 1, state.numCommandBlockTypes);
        state.commandTreeIdx = state.rings[7];
    }

    private static int decodeContextMap(int i5, byte[] bArr, State state) {
        int moreInput;
        int moreInput2;
        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput2 = BitReader.readMoreInput(state)) < 0) {
            return moreInput2;
        }
        int iDecodeVarLenUnsignedByte = decodeVarLenUnsignedByte(state) + 1;
        if (iDecodeVarLenUnsignedByte == 1) {
            Utils.fillBytesWithZeroes(bArr, 0, i5);
            return iDecodeVarLenUnsignedByte;
        }
        BitReader.fillBitWindow(state);
        int fewBits = BitReader.readFewBits(state, 1) != 0 ? BitReader.readFewBits(state, 4) + 1 : 0;
        int i11 = iDecodeVarLenUnsignedByte + fewBits;
        int i12 = MAX_HUFFMAN_TABLE_SIZE[(i11 + 31) >> 5];
        int[] iArr = new int[i12 + 1];
        int huffmanCode = readHuffmanCode(i11, i11, iArr, i12, state);
        if (huffmanCode < 0) {
            return huffmanCode;
        }
        int i13 = 0;
        while (i13 < i5) {
            if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
                return moreInput;
            }
            BitReader.fillBitWindow(state);
            int symbol = readSymbol(iArr, i12, state);
            if (symbol == 0) {
                bArr[i13] = 0;
            } else if (symbol <= fewBits) {
                BitReader.fillBitWindow(state);
                for (int fewBits2 = (1 << symbol) + BitReader.readFewBits(state, symbol); fewBits2 != 0; fewBits2--) {
                    if (i13 >= i5) {
                        return Utils.makeError(state, -3);
                    }
                    bArr[i13] = 0;
                    i13++;
                }
            } else {
                bArr[i13] = (byte) (symbol - fewBits);
            }
            i13++;
        }
        BitReader.fillBitWindow(state);
        if (BitReader.readFewBits(state, 1) == 1) {
            inverseMoveToFrontTransform(bArr, i5);
        }
        return iDecodeVarLenUnsignedByte;
    }

    private static void decodeDistanceBlockSwitch(State state) {
        state.distanceBlockLength = decodeBlockTypeAndLength(state, 2, state.numDistanceBlockTypes);
        state.distContextMapSlice = state.rings[9] << 2;
    }

    private static int decodeHuffmanTreeGroup(int i5, int i11, int i12, State state, int[] iArr) {
        int i13 = i12;
        for (int i14 = 0; i14 < i12; i14++) {
            iArr[i14] = i13;
            int huffmanCode = readHuffmanCode(i5, i11, iArr, i14, state);
            if (huffmanCode < 0) {
                return huffmanCode;
            }
            i13 += huffmanCode;
        }
        return 0;
    }

    private static void decodeLiteralBlockSwitch(State state) {
        state.literalBlockLength = decodeBlockTypeAndLength(state, 0, state.numLiteralBlockTypes);
        int i5 = state.rings[5];
        int i11 = i5 << 6;
        state.contextMapSlice = i11;
        state.literalTreeIdx = state.contextMap[i11] & 255;
        int i12 = state.contextModes[i5] << 9;
        state.contextLookupOffset1 = i12;
        state.contextLookupOffset2 = i12 + 256;
    }

    private static int decodeMetaBlockLength(State state) {
        BitReader.fillBitWindow(state);
        int fewBits = BitReader.readFewBits(state, 1);
        state.inputEnd = fewBits;
        state.metaBlockLength = 0;
        state.isUncompressed = 0;
        state.isMetadata = 0;
        if (fewBits != 0 && BitReader.readFewBits(state, 1) != 0) {
            return 0;
        }
        int fewBits2 = BitReader.readFewBits(state, 2) + 4;
        if (fewBits2 == 7) {
            state.isMetadata = 1;
            if (BitReader.readFewBits(state, 1) != 0) {
                return Utils.makeError(state, -6);
            }
            int fewBits3 = BitReader.readFewBits(state, 2);
            if (fewBits3 == 0) {
                return 0;
            }
            for (int i5 = 0; i5 < fewBits3; i5++) {
                BitReader.fillBitWindow(state);
                int fewBits4 = BitReader.readFewBits(state, 8);
                if (fewBits4 == 0 && i5 + 1 == fewBits3 && fewBits3 > 1) {
                    return Utils.makeError(state, -8);
                }
                state.metaBlockLength += fewBits4 << (i5 * 8);
            }
        } else {
            for (int i11 = 0; i11 < fewBits2; i11++) {
                BitReader.fillBitWindow(state);
                int fewBits5 = BitReader.readFewBits(state, 4);
                if (fewBits5 == 0 && i11 + 1 == fewBits2 && fewBits2 > 4) {
                    return Utils.makeError(state, -8);
                }
                state.metaBlockLength += fewBits5 << (i11 * 4);
            }
        }
        state.metaBlockLength++;
        if (state.inputEnd == 0) {
            state.isUncompressed = BitReader.readFewBits(state, 1);
        }
        return 0;
    }

    private static int decodeVarLenUnsignedByte(State state) {
        BitReader.fillBitWindow(state);
        if (BitReader.readFewBits(state, 1) == 0) {
            return 0;
        }
        int fewBits = BitReader.readFewBits(state, 3);
        if (fewBits == 0) {
            return 1;
        }
        return BitReader.readFewBits(state, fewBits) + (1 << fewBits);
    }

    private static int decodeWindowBits(State state) {
        int fewBits;
        int i5 = state.isLargeWindow;
        state.isLargeWindow = 0;
        BitReader.fillBitWindow(state);
        if (BitReader.readFewBits(state, 1) == 0) {
            return 16;
        }
        int fewBits2 = BitReader.readFewBits(state, 3);
        if (fewBits2 != 0) {
            return fewBits2 + 17;
        }
        int fewBits3 = BitReader.readFewBits(state, 3);
        if (fewBits3 == 0) {
            return 17;
        }
        if (fewBits3 != 1) {
            return fewBits3 + 8;
        }
        if (i5 == 0) {
            return -1;
        }
        state.isLargeWindow = 1;
        if (BitReader.readFewBits(state, 1) != 1 && (fewBits = BitReader.readFewBits(state, 6)) >= 10 && fewBits <= 30) {
            return fewBits;
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x0340 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int decompress(State state) {
        int i5;
        int moreInput;
        int moreInput2;
        int moreInput3;
        int bits;
        int moreInput4;
        int i11;
        int moreInput5;
        int i12 = state.runningState;
        if (i12 == 0) {
            return Utils.makeError(state, -25);
        }
        int i13 = -28;
        if (i12 < 0) {
            return Utils.makeError(state, -28);
        }
        if (i12 == 11) {
            return Utils.makeError(state, -22);
        }
        int i14 = 1;
        if (i12 == 1) {
            int iDecodeWindowBits = decodeWindowBits(state);
            if (iDecodeWindowBits == -1) {
                return Utils.makeError(state, -11);
            }
            int i15 = 1 << iDecodeWindowBits;
            state.maxRingBufferSize = i15;
            state.maxBackwardDistance = i15 - 16;
            state.runningState = 2;
        }
        int iCalculateFence = calculateFence(state);
        int i16 = state.ringBufferSize - 1;
        byte[] bArr = state.ringBuffer;
        while (true) {
            int i17 = state.runningState;
            if (i17 == 10) {
                int i18 = i14;
                if (i17 != 10) {
                    return Utils.makeError(state, -29);
                }
                if (state.metaBlockLength < 0) {
                    return Utils.makeError(state, -10);
                }
                int iJumpToByteBoundary = BitReader.jumpToByteBoundary(state);
                if (iJumpToByteBoundary != 0) {
                    return iJumpToByteBoundary;
                }
                int iCheckHealth = BitReader.checkHealth(state, i18);
                return iCheckHealth != 0 ? iCheckHealth : i18;
            }
            switch (i17) {
                case 2:
                    i5 = i14;
                    if (state.metaBlockLength < 0) {
                        return Utils.makeError(state, -10);
                    }
                    int nextMetablockHeader = readNextMetablockHeader(state);
                    if (nextMetablockHeader < 0) {
                        return nextMetablockHeader;
                    }
                    iCalculateFence = calculateFence(state);
                    i16 = state.ringBufferSize - 1;
                    bArr = state.ringBuffer;
                    continue;
                    i14 = i5;
                    i13 = -28;
                case 3:
                    i5 = i14;
                    int metablockHuffmanCodesAndContextMaps = readMetablockHuffmanCodesAndContextMaps(state);
                    if (metablockHuffmanCodesAndContextMaps < 0) {
                        return metablockHuffmanCodesAndContextMaps;
                    }
                    state.runningState = 4;
                    continue;
                    i14 = i5;
                    i13 = -28;
                case 4:
                    i5 = i14;
                    if (state.metaBlockLength <= 0) {
                        state.runningState = 2;
                        continue;
                    } else {
                        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
                            return moreInput;
                        }
                        if (state.commandBlockLength == 0) {
                            decodeCommandBlockSwitch(state);
                        }
                        state.commandBlockLength--;
                        BitReader.fillBitWindow(state);
                        int symbol = readSymbol(state.commandTreeGroup, state.commandTreeIdx, state) << 2;
                        short[] sArr = CMD_LOOKUP;
                        short s11 = sArr[symbol];
                        short s12 = sArr[symbol + 1];
                        short s13 = sArr[symbol + 2];
                        state.distanceCode = sArr[symbol + 3];
                        BitReader.fillBitWindow(state);
                        state.insertLength = s12 + BitReader.readBits(state, s11 & 255);
                        BitReader.fillBitWindow(state);
                        state.copyLength = s13 + BitReader.readBits(state, s11 >> 8);
                        state.f80623j = 0;
                        state.runningState = 7;
                    }
                    i14 = i5;
                    i13 = -28;
                    break;
                case 5:
                    i5 = i14;
                    while (state.metaBlockLength > 0) {
                        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput2 = BitReader.readMoreInput(state)) < 0) {
                            return moreInput2;
                        }
                        BitReader.fillBitWindow(state);
                        BitReader.readFewBits(state, 8);
                        state.metaBlockLength--;
                    }
                    state.runningState = 2;
                    continue;
                    i14 = i5;
                    i13 = -28;
                    break;
                case 6:
                    i5 = i14;
                    int iCopyUncompressedData = copyUncompressedData(state);
                    if (iCopyUncompressedData < 0) {
                        return iCopyUncompressedData;
                    }
                    continue;
                    i14 = i5;
                    i13 = -28;
                case 7:
                    if (state.trivialLiteralContext != 0) {
                        while (true) {
                            if (state.f80623j < state.insertLength) {
                                if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput5 = BitReader.readMoreInput(state)) < 0) {
                                    return moreInput5;
                                }
                                if (state.literalBlockLength == 0) {
                                    decodeLiteralBlockSwitch(state);
                                }
                                state.literalBlockLength -= i14;
                                BitReader.fillBitWindow(state);
                                bArr[state.pos] = (byte) readSymbol(state.literalTreeGroup, state.literalTreeIdx, state);
                                int i19 = state.pos + i14;
                                state.pos = i19;
                                state.f80623j += i14;
                                if (i19 >= iCalculateFence) {
                                    state.nextRunningState = 7;
                                    state.runningState = 12;
                                }
                            }
                        }
                    } else {
                        int i21 = state.pos;
                        int i22 = bArr[(i21 - 1) & i16] & 255;
                        int i23 = bArr[(i21 - 2) & i16] & 255;
                        while (state.f80623j < state.insertLength) {
                            if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput3 = BitReader.readMoreInput(state)) < 0) {
                                return moreInput3;
                            }
                            if (state.literalBlockLength == 0) {
                                decodeLiteralBlockSwitch(state);
                            }
                            int[] iArr = Context.LOOKUP;
                            i5 = i14;
                            int i24 = state.contextMap[state.contextMapSlice + (iArr[state.contextLookupOffset2 + i23] | iArr[state.contextLookupOffset1 + i22])] & 255;
                            state.literalBlockLength--;
                            BitReader.fillBitWindow(state);
                            int symbol2 = readSymbol(state.literalTreeGroup, i24, state);
                            int i25 = state.pos;
                            bArr[i25] = (byte) symbol2;
                            int i26 = i25 + 1;
                            state.pos = i26;
                            state.f80623j++;
                            if (i26 >= iCalculateFence) {
                                state.nextRunningState = 7;
                                state.runningState = 12;
                                if (state.runningState == 7) {
                                    continue;
                                } else {
                                    int i27 = state.metaBlockLength - state.insertLength;
                                    state.metaBlockLength = i27;
                                    if (i27 <= 0) {
                                        state.runningState = 4;
                                        continue;
                                    } else {
                                        int symbol3 = state.distanceCode;
                                        if (symbol3 < 0) {
                                            state.distance = state.rings[state.distRbIdx];
                                        } else {
                                            if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput4 = BitReader.readMoreInput(state)) < 0) {
                                                return moreInput4;
                                            }
                                            if (state.distanceBlockLength == 0) {
                                                decodeDistanceBlockSwitch(state);
                                            }
                                            state.distanceBlockLength--;
                                            BitReader.fillBitWindow(state);
                                            symbol3 = readSymbol(state.distanceTreeGroup, state.distContextMap[state.distContextMapSlice + symbol3] & 255, state);
                                            if (symbol3 < 16) {
                                                int i28 = state.rings[(state.distRbIdx + DISTANCE_SHORT_CODE_INDEX_OFFSET[symbol3]) & 3] + DISTANCE_SHORT_CODE_VALUE_OFFSET[symbol3];
                                                state.distance = i28;
                                                if (i28 < 0) {
                                                    return Utils.makeError(state, -12);
                                                }
                                            } else {
                                                byte b11 = state.distExtraBits[symbol3];
                                                if (state.bitOffset + b11 <= BitReader.BITNESS) {
                                                    bits = BitReader.readFewBits(state, b11);
                                                } else {
                                                    BitReader.fillBitWindow(state);
                                                    bits = BitReader.readBits(state, b11);
                                                }
                                                state.distance = state.distOffset[symbol3] + (bits << state.distancePostfixBits);
                                            }
                                        }
                                        int i29 = state.maxDistance;
                                        int i31 = state.maxBackwardDistance;
                                        if (i29 == i31 || (i11 = state.pos) >= i31) {
                                            state.maxDistance = i31;
                                        } else {
                                            state.maxDistance = i11;
                                        }
                                        int i32 = state.distance;
                                        if (i32 > state.maxDistance) {
                                            state.runningState = 9;
                                        } else {
                                            if (symbol3 > 0) {
                                                int i33 = (state.distRbIdx + 1) & 3;
                                                state.distRbIdx = i33;
                                                state.rings[i33] = i32;
                                            }
                                            if (state.copyLength > state.metaBlockLength) {
                                                return Utils.makeError(state, -9);
                                            }
                                            state.f80623j = 0;
                                            state.runningState = 8;
                                        }
                                    }
                                }
                                i14 = i5;
                                i13 = -28;
                            } else {
                                int i34 = i22;
                                i22 = symbol2;
                                i23 = i34;
                                i14 = i5;
                            }
                        }
                    }
                    i5 = i14;
                    if (state.runningState == 7) {
                    }
                    i14 = i5;
                    i13 = -28;
                    break;
                case 8:
                    int i35 = state.pos;
                    int i36 = (i35 - state.distance) & i16;
                    int i37 = state.copyLength - state.f80623j;
                    int i38 = i36 + i37;
                    int i39 = i35 + i37;
                    if (i38 >= i16 || i39 >= i16) {
                        while (true) {
                            int i40 = state.f80623j;
                            if (i40 < state.copyLength) {
                                int i41 = state.pos;
                                bArr[i41] = bArr[(i41 - state.distance) & i16];
                                state.metaBlockLength -= i14;
                                int i42 = i41 + i14;
                                state.pos = i42;
                                state.f80623j = i40 + 1;
                                if (i42 >= iCalculateFence) {
                                    state.nextRunningState = 8;
                                    state.runningState = 12;
                                }
                            }
                        }
                    } else {
                        if (i37 < 12 || (i38 > i35 && i39 > i36)) {
                            int i43 = (i37 + 3) >> 2;
                            for (int i44 = 0; i44 < i43; i44++) {
                                bArr[i35] = bArr[i36];
                                bArr[i35 + 1] = bArr[i36 + 1];
                                int i45 = i35 + 3;
                                int i46 = i36 + 3;
                                bArr[i35 + 2] = bArr[i36 + 2];
                                i35 += 4;
                                i36 += 4;
                                bArr[i45] = bArr[i46];
                            }
                        } else {
                            Utils.copyBytesWithin(bArr, i35, i36, i38);
                        }
                        state.f80623j += i37;
                        state.metaBlockLength -= i37;
                        state.pos += i37;
                    }
                    if (state.runningState == 8) {
                        state.runningState = 4;
                        break;
                    }
                    break;
                case 9:
                    int iDoUseDictionary = doUseDictionary(state, iCalculateFence);
                    if (iDoUseDictionary < 0) {
                        return iDoUseDictionary;
                    }
                    break;
                case 10:
                case 11:
                default:
                    return Utils.makeError(state, i13);
                case 12:
                    state.ringBufferBytesReady = Utils.min(state.pos, state.ringBufferSize);
                    state.runningState = 13;
                    break;
                case 13:
                    int iWriteRingBuffer = writeRingBuffer(state);
                    if (iWriteRingBuffer != 0) {
                        return iWriteRingBuffer;
                    }
                    int i47 = state.pos;
                    int i48 = state.maxBackwardDistance;
                    if (i47 >= i48) {
                        state.maxDistance = i48;
                    }
                    int i49 = state.ringBufferSize;
                    if (i47 >= i49) {
                        if (i47 > i49) {
                            Utils.copyBytesWithin(bArr, 0, i49, i47);
                        }
                        state.pos &= i16;
                        state.ringBufferBytesWritten = 0;
                    }
                    state.runningState = state.nextRunningState;
                    break;
                case 14:
                    int iCopyFromCompoundDictionary = state.pos + copyFromCompoundDictionary(state, iCalculateFence);
                    state.pos = iCopyFromCompoundDictionary;
                    if (iCopyFromCompoundDictionary >= iCalculateFence) {
                        state.nextRunningState = 14;
                        state.runningState = 12;
                        return 2;
                    }
                    state.runningState = 4;
                    break;
            }
            i5 = i14;
            i14 = i5;
            i13 = -28;
        }
    }

    private static int doUseDictionary(State state, int i5) {
        int i11;
        int i12 = state.distance;
        if (i12 > MAX_ALLOWED_DISTANCE) {
            return Utils.makeError(state, -9);
        }
        int i13 = ((i12 - state.maxDistance) - 1) - state.cdTotalSize;
        if (i13 >= 0) {
            ByteBuffer data = Dictionary.getData();
            int i14 = state.copyLength;
            if (i14 <= 31 && (i11 = Dictionary.sizeBits[i14]) != 0) {
                int i15 = i13 >> i11;
                int i16 = ((i13 & ((1 << i11) - 1)) * i14) + Dictionary.offsets[i14];
                Transform.Transforms transforms = Transform.RFC_TRANSFORMS;
                if (i15 >= transforms.numTransforms) {
                    return Utils.makeError(state, -9);
                }
                int iTransformDictionaryWord = Transform.transformDictionaryWord(state.ringBuffer, state.pos, data, i16, i14, transforms, i15);
                int i17 = state.pos + iTransformDictionaryWord;
                state.pos = i17;
                state.metaBlockLength -= iTransformDictionaryWord;
                if (i17 >= i5) {
                    state.nextRunningState = 4;
                    state.runningState = 12;
                    return 0;
                }
                state.runningState = 4;
            }
            return Utils.makeError(state, -9);
        }
        int iInitializeCompoundDictionaryCopy = initializeCompoundDictionaryCopy(state, (-i13) - 1, state.copyLength);
        if (iInitializeCompoundDictionaryCopy < 0) {
            return iInitializeCompoundDictionaryCopy;
        }
        state.runningState = 14;
        return 0;
    }

    public static int enableEagerOutput(State state) {
        if (state.runningState != 1) {
            return Utils.makeError(state, -24);
        }
        state.isEager = 1;
        return 0;
    }

    public static int enableLargeWindow(State state) {
        if (state.runningState != 1) {
            return Utils.makeError(state, -24);
        }
        state.isLargeWindow = 1;
        return 0;
    }

    private static int huffmanTreeGroupAllocSize(int i5, int i11) {
        return (MAX_HUFFMAN_TABLE_SIZE[(i5 + 31) >> 5] * i11) + i11;
    }

    public static int initState(State state) {
        if (state.runningState != 0) {
            return Utils.makeError(state, -26);
        }
        int[] iArr = new int[3091];
        state.blockTrees = iArr;
        iArr[0] = 7;
        state.distRbIdx = 3;
        int iCalculateDistanceAlphabetLimit = calculateDistanceAlphabetLimit(state, MAX_ALLOWED_DISTANCE, 3, 120);
        if (iCalculateDistanceAlphabetLimit < 0) {
            return iCalculateDistanceAlphabetLimit;
        }
        state.distExtraBits = new byte[iCalculateDistanceAlphabetLimit];
        state.distOffset = new int[iCalculateDistanceAlphabetLimit];
        int iInitBitReader = BitReader.initBitReader(state);
        if (iInitBitReader < 0) {
            return iInitBitReader;
        }
        state.runningState = 1;
        return 0;
    }

    private static void initializeCompoundDictionary(State state) {
        state.cdBlockMap = new byte[256];
        int i5 = 8;
        while (((state.cdTotalSize - 1) >> i5) != 0) {
            i5++;
        }
        int i11 = i5 - 8;
        state.cdBlockBits = i11;
        int i12 = 0;
        for (int i13 = 0; i13 < state.cdTotalSize; i13 += 1 << i11) {
            while (true) {
                int i14 = i12 + 1;
                if (state.cdChunkOffsets[i14] < i13) {
                    i12 = i14;
                }
            }
            state.cdBlockMap[i13 >> i11] = (byte) i12;
        }
    }

    private static int initializeCompoundDictionaryCopy(State state, int i5, int i11) {
        int[] iArr;
        if (state.cdBlockBits == -1) {
            initializeCompoundDictionary(state);
        }
        int i12 = state.cdBlockMap[i5 >> state.cdBlockBits];
        while (true) {
            iArr = state.cdChunkOffsets;
            int i13 = i12 + 1;
            if (i5 < iArr[i13]) {
                break;
            }
            i12 = i13;
        }
        if (state.cdTotalSize > i5 + i11) {
            return Utils.makeError(state, -9);
        }
        int i14 = (state.distRbIdx + 1) & 3;
        state.distRbIdx = i14;
        state.rings[i14] = state.distance;
        state.metaBlockLength -= i11;
        state.cdBrIndex = i12;
        state.cdBrOffset = i5 - iArr[i12];
        state.cdBrLength = i11;
        state.cdBrCopied = 0;
        return 0;
    }

    private static void inverseMoveToFrontTransform(byte[] bArr, int i5) {
        int[] iArr = new int[256];
        for (int i11 = 0; i11 < 256; i11++) {
            iArr[i11] = i11;
        }
        for (int i12 = 0; i12 < i5; i12++) {
            int i13 = bArr[i12] & 255;
            bArr[i12] = (byte) iArr[i13];
            if (i13 != 0) {
                moveToFront(iArr, i13);
            }
        }
    }

    private static int log2floor(int i5) {
        int i11 = -1;
        for (int i12 = 16; i12 > 0; i12 >>= 1) {
            int i13 = i5 >> i12;
            if (i13 != 0) {
                i11 += i12;
                i5 = i13;
            }
        }
        return i11 + i5;
    }

    private static void maybeReallocateRingBuffer(State state) {
        int i5 = state.maxRingBufferSize;
        int i11 = state.expectedTotalSize;
        if (i5 > i11) {
            while (true) {
                int i12 = i5 >> 1;
                if (i12 <= i11) {
                    break;
                } else {
                    i5 = i12;
                }
            }
            if (state.inputEnd == 0 && i5 < 16384 && state.maxRingBufferSize >= 16384) {
                i5 = 16384;
            }
        }
        int i13 = state.ringBufferSize;
        if (i5 <= i13) {
            return;
        }
        byte[] bArr = new byte[i5 + 37];
        byte[] bArr2 = state.ringBuffer;
        if (bArr2.length != 0) {
            Utils.copyBytes(bArr, 0, bArr2, 0, i13);
        }
        state.ringBuffer = bArr;
        state.ringBufferSize = i5;
    }

    private static void moveToFront(int[] iArr, int i5) {
        int i11 = iArr[i5];
        while (i5 > 0) {
            iArr[i5] = iArr[i5 - 1];
            i5--;
        }
        iArr[0] = i11;
    }

    private static int readBlockLength(int[] iArr, int i5, State state) {
        BitReader.fillBitWindow(state);
        int symbol = readSymbol(iArr, i5, state);
        int i11 = BLOCK_LENGTH_N_BITS[symbol];
        BitReader.fillBitWindow(state);
        return BLOCK_LENGTH_OFFSET[symbol] + BitReader.readBits(state, i11);
    }

    private static int readComplexHuffmanCode(int i5, int i11, int[] iArr, int i12, State state) {
        int[] iArr2 = new int[i5];
        int[] iArr3 = new int[18];
        int i13 = 0;
        int i14 = 32;
        while (i11 < 18) {
            int i15 = CODE_LENGTH_CODE_ORDER[i11];
            BitReader.fillBitWindow(state);
            int iPeekBits = BitReader.peekBits(state) & 15;
            int i16 = state.bitOffset;
            int i17 = FIXED_TABLE[iPeekBits];
            state.bitOffset = i16 + (i17 >> 16);
            int i18 = i17 & 65535;
            iArr3[i15] = i18;
            if (i18 != 0) {
                i14 -= 32 >> i18;
                i13++;
                if (i14 <= 0) {
                    break;
                }
            }
            i11++;
        }
        if (i14 != 0 && i13 != 1) {
            return Utils.makeError(state, -4);
        }
        int huffmanCodeLengths = readHuffmanCodeLengths(iArr3, i5, iArr2, state);
        return huffmanCodeLengths < 0 ? huffmanCodeLengths : Huffman.buildHuffmanTable(iArr, i12, 8, iArr2, i5);
    }

    private static int readHuffmanCode(int i5, int i11, int[] iArr, int i12, State state) {
        int moreInput;
        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
            return moreInput;
        }
        BitReader.fillBitWindow(state);
        int fewBits = BitReader.readFewBits(state, 2);
        return fewBits == 1 ? readSimpleHuffmanCode(i5, i11, iArr, i12, state) : readComplexHuffmanCode(i11, fewBits, iArr, i12, state);
    }

    private static int readHuffmanCodeLengths(int[] iArr, int i5, int[] iArr2, State state) {
        int moreInput;
        int[] iArr3 = new int[33];
        Huffman.buildHuffmanTable(iArr3, 32, 5, iArr, 18);
        int i11 = 8;
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        int i15 = 32768;
        while (i12 < i5 && i15 > 0) {
            if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
                return moreInput;
            }
            BitReader.fillBitWindow(state);
            int iPeekBits = BitReader.peekBits(state) & 31;
            int i16 = state.bitOffset;
            int i17 = iArr3[iPeekBits];
            state.bitOffset = i16 + (i17 >> 16);
            int i18 = i17 & 65535;
            if (i18 < 16) {
                int i19 = i12 + 1;
                iArr2[i12] = i18;
                if (i18 != 0) {
                    i15 -= SQLiteDatabase.OPEN_NOMUTEX >> i18;
                    i12 = i19;
                    i11 = i18;
                } else {
                    i12 = i19;
                }
                i14 = 0;
            } else {
                int i21 = i18 - 14;
                int i22 = i18 == 16 ? i11 : 0;
                if (i13 != i22) {
                    i14 = 0;
                    i13 = i22;
                }
                int i23 = i14 > 0 ? (i14 - 2) << i21 : i14;
                BitReader.fillBitWindow(state);
                int fewBits = i23 + BitReader.readFewBits(state, i21) + 3;
                int i24 = fewBits - i14;
                if (i12 + i24 > i5) {
                    return Utils.makeError(state, -2);
                }
                int i25 = 0;
                while (i25 < i24) {
                    iArr2[i12] = i13;
                    i25++;
                    i12++;
                }
                if (i13 != 0) {
                    i15 -= i24 << (15 - i13);
                }
                i14 = fewBits;
            }
        }
        if (i15 != 0) {
            return Utils.makeError(state, -18);
        }
        Utils.fillIntsWithZeroes(iArr2, i12, i5);
        return 0;
    }

    private static int readMetablockHuffmanCodesAndContextMaps(State state) {
        int iCalculateDistanceAlphabetLimit;
        int moreInput;
        int moreInput2;
        int iDecodeVarLenUnsignedByte = decodeVarLenUnsignedByte(state) + 1;
        state.numLiteralBlockTypes = iDecodeVarLenUnsignedByte;
        int metablockPartition = readMetablockPartition(state, 0, iDecodeVarLenUnsignedByte);
        if (metablockPartition < 0) {
            return metablockPartition;
        }
        state.literalBlockLength = metablockPartition;
        int iDecodeVarLenUnsignedByte2 = decodeVarLenUnsignedByte(state) + 1;
        state.numCommandBlockTypes = iDecodeVarLenUnsignedByte2;
        int metablockPartition2 = readMetablockPartition(state, 1, iDecodeVarLenUnsignedByte2);
        if (metablockPartition2 < 0) {
            return metablockPartition2;
        }
        state.commandBlockLength = metablockPartition2;
        int iDecodeVarLenUnsignedByte3 = decodeVarLenUnsignedByte(state) + 1;
        state.numDistanceBlockTypes = iDecodeVarLenUnsignedByte3;
        int metablockPartition3 = readMetablockPartition(state, 2, iDecodeVarLenUnsignedByte3);
        if (metablockPartition3 < 0) {
            return metablockPartition3;
        }
        state.distanceBlockLength = metablockPartition3;
        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput2 = BitReader.readMoreInput(state)) < 0) {
            return moreInput2;
        }
        BitReader.fillBitWindow(state);
        state.distancePostfixBits = BitReader.readFewBits(state, 2);
        state.numDirectDistanceCodes = BitReader.readFewBits(state, 4) << state.distancePostfixBits;
        state.contextModes = new byte[state.numLiteralBlockTypes];
        int i5 = 0;
        while (true) {
            int i11 = state.numLiteralBlockTypes;
            if (i5 >= i11) {
                int i12 = i11 << 6;
                byte[] bArr = new byte[i12];
                state.contextMap = bArr;
                int iDecodeContextMap = decodeContextMap(i12, bArr, state);
                if (iDecodeContextMap < 0) {
                    return iDecodeContextMap;
                }
                state.trivialLiteralContext = 1;
                int i13 = 0;
                while (true) {
                    if (i13 >= i12) {
                        break;
                    }
                    if (state.contextMap[i13] != (i13 >> 6)) {
                        state.trivialLiteralContext = 0;
                        break;
                    }
                    i13++;
                }
                int i14 = state.numDistanceBlockTypes << 2;
                byte[] bArr2 = new byte[i14];
                state.distContextMap = bArr2;
                int iDecodeContextMap2 = decodeContextMap(i14, bArr2, state);
                if (iDecodeContextMap2 < 0) {
                    return iDecodeContextMap2;
                }
                int[] iArr = new int[huffmanTreeGroupAllocSize(256, iDecodeContextMap)];
                state.literalTreeGroup = iArr;
                int iDecodeHuffmanTreeGroup = decodeHuffmanTreeGroup(256, 256, iDecodeContextMap, state, iArr);
                if (iDecodeHuffmanTreeGroup < 0) {
                    return iDecodeHuffmanTreeGroup;
                }
                int[] iArr2 = new int[huffmanTreeGroupAllocSize(NUM_COMMAND_CODES, state.numCommandBlockTypes)];
                state.commandTreeGroup = iArr2;
                int iDecodeHuffmanTreeGroup2 = decodeHuffmanTreeGroup(NUM_COMMAND_CODES, NUM_COMMAND_CODES, state.numCommandBlockTypes, state, iArr2);
                if (iDecodeHuffmanTreeGroup2 < 0) {
                    return iDecodeHuffmanTreeGroup2;
                }
                int iCalculateDistanceAlphabetSize = calculateDistanceAlphabetSize(state.distancePostfixBits, state.numDirectDistanceCodes, 24);
                if (state.isLargeWindow == 1) {
                    iCalculateDistanceAlphabetSize = calculateDistanceAlphabetSize(state.distancePostfixBits, state.numDirectDistanceCodes, 62);
                    iCalculateDistanceAlphabetLimit = calculateDistanceAlphabetLimit(state, MAX_ALLOWED_DISTANCE, state.distancePostfixBits, state.numDirectDistanceCodes);
                    if (iCalculateDistanceAlphabetLimit < 0) {
                        return iCalculateDistanceAlphabetLimit;
                    }
                } else {
                    iCalculateDistanceAlphabetLimit = iCalculateDistanceAlphabetSize;
                }
                int[] iArr3 = new int[huffmanTreeGroupAllocSize(iCalculateDistanceAlphabetLimit, iDecodeContextMap2)];
                state.distanceTreeGroup = iArr3;
                int iDecodeHuffmanTreeGroup3 = decodeHuffmanTreeGroup(iCalculateDistanceAlphabetSize, iCalculateDistanceAlphabetLimit, iDecodeContextMap2, state, iArr3);
                if (iDecodeHuffmanTreeGroup3 < 0) {
                    return iDecodeHuffmanTreeGroup3;
                }
                calculateDistanceLut(state, iCalculateDistanceAlphabetLimit);
                state.contextMapSlice = 0;
                state.distContextMapSlice = 0;
                int i15 = state.contextModes[0] * AbstractJsonLexerKt.TC_OTHER;
                state.contextLookupOffset1 = i15;
                state.contextLookupOffset2 = i15 + 256;
                state.literalTreeIdx = 0;
                state.commandTreeIdx = 0;
                int[] iArr4 = state.rings;
                iArr4[4] = 1;
                iArr4[5] = 0;
                iArr4[6] = 1;
                iArr4[7] = 0;
                iArr4[8] = 1;
                iArr4[9] = 0;
                return 0;
            }
            int iMin = Utils.min(i5 + 96, i11);
            while (i5 < iMin) {
                BitReader.fillBitWindow(state);
                state.contextModes[i5] = (byte) BitReader.readFewBits(state, 2);
                i5++;
            }
            if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
                return moreInput;
            }
        }
    }

    private static int readMetablockPartition(State state, int i5, int i11) {
        int[] iArr = state.blockTrees;
        int i12 = i5 * 2;
        int i13 = iArr[i12];
        if (i11 <= 1) {
            iArr[i12 + 1] = i13;
            iArr[i12 + 2] = i13;
            return 268435456;
        }
        int i14 = i11 + 2;
        int huffmanCode = readHuffmanCode(i14, i14, iArr, i12, state);
        if (huffmanCode < 0) {
            return huffmanCode;
        }
        int i15 = i13 + huffmanCode;
        int[] iArr2 = state.blockTrees;
        int i16 = i12 + 1;
        iArr2[i16] = i15;
        int huffmanCode2 = readHuffmanCode(26, 26, iArr2, i16, state);
        if (huffmanCode2 < 0) {
            return huffmanCode2;
        }
        int i17 = i15 + huffmanCode2;
        int[] iArr3 = state.blockTrees;
        iArr3[i12 + 2] = i17;
        return readBlockLength(iArr3, i16, state);
    }

    private static int readNextMetablockHeader(State state) {
        int moreInput;
        if (state.inputEnd != 0) {
            state.nextRunningState = 10;
            state.runningState = 12;
            return 0;
        }
        state.literalTreeGroup = new int[0];
        state.commandTreeGroup = new int[0];
        state.distanceTreeGroup = new int[0];
        if (state.halfOffset > BitReader.HALF_WATERLINE && (moreInput = BitReader.readMoreInput(state)) < 0) {
            return moreInput;
        }
        int iDecodeMetaBlockLength = decodeMetaBlockLength(state);
        if (iDecodeMetaBlockLength < 0) {
            return iDecodeMetaBlockLength;
        }
        if (state.metaBlockLength == 0 && state.isMetadata == 0) {
            return 0;
        }
        if (state.isUncompressed == 0 && state.isMetadata == 0) {
            state.runningState = 3;
        } else {
            int iJumpToByteBoundary = BitReader.jumpToByteBoundary(state);
            if (iJumpToByteBoundary < 0) {
                return iJumpToByteBoundary;
            }
            if (state.isMetadata == 0) {
                state.runningState = 6;
            } else {
                state.runningState = 5;
            }
        }
        if (state.isMetadata != 0) {
            return 0;
        }
        int i5 = state.expectedTotalSize + state.metaBlockLength;
        state.expectedTotalSize = i5;
        if (i5 > 1073741824) {
            state.expectedTotalSize = 1073741824;
        }
        if (state.ringBufferSize < state.maxRingBufferSize) {
            maybeReallocateRingBuffer(state);
        }
        return 0;
    }

    private static int readSimpleHuffmanCode(int i5, int i11, int[] iArr, int i12, State state) {
        int[] iArr2 = new int[i11];
        int[] iArr3 = new int[4];
        int iLog2floor = log2floor(i5 - 1) + 1;
        int fewBits = BitReader.readFewBits(state, 2) + 1;
        for (int i13 = 0; i13 < fewBits; i13++) {
            BitReader.fillBitWindow(state);
            int fewBits2 = BitReader.readFewBits(state, iLog2floor);
            if (fewBits2 >= i11) {
                return Utils.makeError(state, -15);
            }
            iArr3[i13] = fewBits2;
        }
        int iCheckDupes = checkDupes(state, iArr3, fewBits);
        if (iCheckDupes < 0) {
            return iCheckDupes;
        }
        if (fewBits == 4) {
            fewBits += BitReader.readFewBits(state, 1);
        }
        if (fewBits == 1) {
            iArr2[iArr3[0]] = 1;
        } else if (fewBits == 2) {
            iArr2[iArr3[0]] = 1;
            iArr2[iArr3[1]] = 1;
        } else if (fewBits == 3) {
            iArr2[iArr3[0]] = 1;
            iArr2[iArr3[1]] = 2;
            iArr2[iArr3[2]] = 2;
        } else if (fewBits == 4) {
            iArr2[iArr3[0]] = 2;
            iArr2[iArr3[1]] = 2;
            iArr2[iArr3[2]] = 2;
            iArr2[iArr3[3]] = 2;
        } else if (fewBits == 5) {
            iArr2[iArr3[0]] = 1;
            iArr2[iArr3[1]] = 2;
            iArr2[iArr3[2]] = 3;
            iArr2[iArr3[3]] = 3;
        }
        return Huffman.buildHuffmanTable(iArr, i12, 8, iArr2, i11);
    }

    private static int readSymbol(int[] iArr, int i5, State state) {
        int i11 = iArr[i5];
        int iPeekBits = BitReader.peekBits(state);
        int i12 = i11 + (iPeekBits & HUFFMAN_TABLE_MASK);
        int i13 = iArr[i12];
        int i14 = i13 >> 16;
        int i15 = i13 & 65535;
        if (i14 <= 8) {
            state.bitOffset += i14;
            return i15;
        }
        int iShr32 = i12 + i15 + Utils.shr32(iPeekBits & ((1 << i14) - 1), 8);
        int i16 = state.bitOffset;
        int i17 = iArr[iShr32];
        state.bitOffset = (i17 >> 16) + 8 + i16;
        return i17 & 65535;
    }

    private static void unpackCommandLookupTable(short[] sArr) {
        int i5;
        int[] iArr = new int[24];
        int[] iArr2 = new int[24];
        iArr2[0] = 2;
        int i11 = 0;
        while (i11 < 23) {
            int i12 = i11 + 1;
            iArr[i12] = iArr[i11] + (1 << INSERT_LENGTH_N_BITS[i11]);
            iArr2[i12] = iArr2[i11] + (1 << COPY_LENGTH_N_BITS[i11]);
            i11 = i12;
        }
        for (int i13 = 0; i13 < NUM_COMMAND_CODES; i13++) {
            int i14 = i13 >> 6;
            if (i14 >= 2) {
                i14 -= 2;
                i5 = 0;
            } else {
                i5 = -4;
            }
            int i15 = i14 * 2;
            int i16 = (((170064 >> i15) & 3) << 3) | ((i13 >> 3) & 7);
            int i17 = (((156228 >> i15) & 3) << 3) | (i13 & 7);
            int iMin = (i5 + Utils.min(iArr2[i17], 5)) - 2;
            int i18 = i13 * 4;
            sArr[i18] = (short) (INSERT_LENGTH_N_BITS[i16] | (COPY_LENGTH_N_BITS[i17] << 8));
            sArr[i18 + 1] = (short) iArr[i16];
            sArr[i18 + 2] = (short) iArr2[i17];
            sArr[i18 + 3] = (short) iMin;
        }
    }

    private static int writeRingBuffer(State state) {
        int iMin = Utils.min(state.outputLength - state.outputUsed, state.ringBufferBytesReady - state.ringBufferBytesWritten);
        if (iMin != 0) {
            byte[] bArr = state.output;
            int i5 = state.outputOffset + state.outputUsed;
            byte[] bArr2 = state.ringBuffer;
            int i11 = state.ringBufferBytesWritten;
            Utils.copyBytes(bArr, i5, bArr2, i11, i11 + iMin);
            state.outputUsed += iMin;
            state.ringBufferBytesWritten += iMin;
        }
        return state.outputUsed < state.outputLength ? 0 : 2;
    }
}
