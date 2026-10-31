package kotlin.reflect.jvm.internal.impl.protobuf;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.reflect.jvm.internal.impl.protobuf.MessageLite;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class CodedInputStream {
    private final byte[] buffer;
    private final boolean bufferIsImmutable;
    private int bufferPos;
    private int bufferSize;
    private int bufferSizeAfterLimit;
    private int currentLimit;
    private boolean enableAliasing;
    private final InputStream input;
    private int lastTag;
    private int recursionDepth;
    private int recursionLimit;
    private RefillCallback refillCallback;
    private int sizeLimit;
    private int totalBytesRetired;

    public interface RefillCallback {
        void onRefill();
    }

    private CodedInputStream(InputStream inputStream) {
        this.enableAliasing = false;
        this.currentLimit = LayoutNode.NotPlacedPlaceOrder;
        this.recursionLimit = 64;
        this.sizeLimit = 67108864;
        this.refillCallback = null;
        this.buffer = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.bufferSize = 0;
        this.bufferPos = 0;
        this.totalBytesRetired = 0;
        this.input = inputStream;
        this.bufferIsImmutable = false;
    }

    public static int decodeZigZag32(int i5) {
        return (-(i5 & 1)) ^ (i5 >>> 1);
    }

    public static long decodeZigZag64(long j11) {
        return (-(j11 & 1)) ^ (j11 >>> 1);
    }

    private void ensureAvailable(int i5) throws IOException {
        if (this.bufferSize - this.bufferPos < i5) {
            refillBuffer(i5);
        }
    }

    public static CodedInputStream newInstance(InputStream inputStream) {
        return new CodedInputStream(inputStream);
    }

    private byte[] readRawBytesSlowPath(int i5) throws IOException {
        if (i5 <= 0) {
            if (i5 == 0) {
                return Internal.EMPTY_BYTE_ARRAY;
            }
            throw InvalidProtocolBufferException.negativeSize();
        }
        int i11 = this.totalBytesRetired;
        int i12 = this.bufferPos;
        int i13 = i11 + i12 + i5;
        int i14 = this.currentLimit;
        if (i13 > i14) {
            skipRawBytes((i14 - i11) - i12);
            throw InvalidProtocolBufferException.truncatedMessage();
        }
        if (i5 < 4096) {
            byte[] bArr = new byte[i5];
            int i15 = this.bufferSize - i12;
            System.arraycopy(this.buffer, i12, bArr, 0, i15);
            this.bufferPos = this.bufferSize;
            int i16 = i5 - i15;
            ensureAvailable(i16);
            System.arraycopy(this.buffer, 0, bArr, i15, i16);
            this.bufferPos = i16;
            return bArr;
        }
        int i17 = this.bufferSize;
        this.totalBytesRetired = i11 + i17;
        this.bufferPos = 0;
        this.bufferSize = 0;
        int length = i17 - i12;
        int i18 = i5 - length;
        ArrayList arrayList = new ArrayList();
        while (i18 > 0) {
            int iMin = Math.min(i18, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr2 = new byte[iMin];
            int i19 = 0;
            while (i19 < iMin) {
                InputStream inputStream = this.input;
                int i21 = inputStream == null ? -1 : inputStream.read(bArr2, i19, iMin - i19);
                if (i21 == -1) {
                    throw InvalidProtocolBufferException.truncatedMessage();
                }
                this.totalBytesRetired += i21;
                i19 += i21;
            }
            i18 -= iMin;
            arrayList.add(bArr2);
        }
        byte[] bArr3 = new byte[i5];
        System.arraycopy(this.buffer, i12, bArr3, 0, length);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            byte[] bArr4 = (byte[]) it.next();
            System.arraycopy(bArr4, 0, bArr3, length, bArr4.length);
            length += bArr4.length;
        }
        return bArr3;
    }

    private void recomputeBufferSizeAfterLimit() {
        int i5 = this.bufferSize + this.bufferSizeAfterLimit;
        this.bufferSize = i5;
        int i11 = this.totalBytesRetired + i5;
        int i12 = this.currentLimit;
        if (i11 <= i12) {
            this.bufferSizeAfterLimit = 0;
            return;
        }
        int i13 = i11 - i12;
        this.bufferSizeAfterLimit = i13;
        this.bufferSize = i5 - i13;
    }

    private void refillBuffer(int i5) throws IOException {
        if (!tryRefillBuffer(i5)) {
            throw InvalidProtocolBufferException.truncatedMessage();
        }
    }

    private void skipRawBytesSlowPath(int i5) throws IOException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.negativeSize();
        }
        int i11 = this.totalBytesRetired;
        int i12 = this.bufferPos;
        int i13 = i11 + i12 + i5;
        int i14 = this.currentLimit;
        if (i13 > i14) {
            skipRawBytes((i14 - i11) - i12);
            throw InvalidProtocolBufferException.truncatedMessage();
        }
        int i15 = this.bufferSize;
        int i16 = i15 - i12;
        this.bufferPos = i15;
        refillBuffer(1);
        while (true) {
            int i17 = i5 - i16;
            int i18 = this.bufferSize;
            if (i17 <= i18) {
                this.bufferPos = i17;
                return;
            } else {
                i16 += i18;
                this.bufferPos = i18;
                refillBuffer(1);
            }
        }
    }

    private boolean tryRefillBuffer(int i5) throws IOException {
        int i11 = this.bufferPos;
        if (i11 + i5 <= this.bufferSize) {
            StringBuilder sb2 = new StringBuilder(77);
            sb2.append("refillBuffer() called when ");
            sb2.append(i5);
            sb2.append(" bytes were already available in buffer");
            throw new IllegalStateException(sb2.toString());
        }
        if (this.totalBytesRetired + i11 + i5 > this.currentLimit) {
            return false;
        }
        RefillCallback refillCallback = this.refillCallback;
        if (refillCallback != null) {
            refillCallback.onRefill();
        }
        if (this.input != null) {
            int i12 = this.bufferPos;
            if (i12 > 0) {
                int i13 = this.bufferSize;
                if (i13 > i12) {
                    byte[] bArr = this.buffer;
                    System.arraycopy(bArr, i12, bArr, 0, i13 - i12);
                }
                this.totalBytesRetired += i12;
                this.bufferSize -= i12;
                this.bufferPos = 0;
            }
            InputStream inputStream = this.input;
            byte[] bArr2 = this.buffer;
            int i14 = this.bufferSize;
            int i15 = inputStream.read(bArr2, i14, bArr2.length - i14);
            if (i15 == 0 || i15 < -1 || i15 > this.buffer.length) {
                StringBuilder sb3 = new StringBuilder(102);
                sb3.append("InputStream#read(byte[]) returned invalid result: ");
                sb3.append(i15);
                sb3.append("\nThe InputStream implementation is buggy.");
                throw new IllegalStateException(sb3.toString());
            }
            if (i15 > 0) {
                this.bufferSize += i15;
                if ((this.totalBytesRetired + i5) - this.sizeLimit > 0) {
                    throw InvalidProtocolBufferException.sizeLimitExceeded();
                }
                recomputeBufferSizeAfterLimit();
                if (this.bufferSize >= i5) {
                    return true;
                }
                return tryRefillBuffer(i5);
            }
        }
        return false;
    }

    public void checkLastTagWas(int i5) throws InvalidProtocolBufferException {
        if (this.lastTag != i5) {
            throw InvalidProtocolBufferException.invalidEndTag();
        }
    }

    public int getBytesUntilLimit() {
        int i5 = this.currentLimit;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.totalBytesRetired + this.bufferPos);
    }

    public boolean isAtEnd() throws IOException {
        return this.bufferPos == this.bufferSize && !tryRefillBuffer(1);
    }

    public void popLimit(int i5) {
        this.currentLimit = i5;
        recomputeBufferSizeAfterLimit();
    }

    public int pushLimit(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.negativeSize();
        }
        int i11 = this.totalBytesRetired + this.bufferPos + i5;
        int i12 = this.currentLimit;
        if (i11 > i12) {
            throw InvalidProtocolBufferException.truncatedMessage();
        }
        this.currentLimit = i11;
        recomputeBufferSizeAfterLimit();
        return i12;
    }

    public boolean readBool() throws IOException {
        return readRawVarint64() != 0;
    }

    public ByteString readBytes() throws IOException {
        int rawVarint32 = readRawVarint32();
        int i5 = this.bufferSize;
        int i11 = this.bufferPos;
        if (rawVarint32 > i5 - i11 || rawVarint32 <= 0) {
            return rawVarint32 == 0 ? ByteString.EMPTY : new LiteralByteString(readRawBytesSlowPath(rawVarint32));
        }
        ByteString boundedByteString = (this.bufferIsImmutable && this.enableAliasing) ? new BoundedByteString(this.buffer, this.bufferPos, rawVarint32) : ByteString.copyFrom(this.buffer, i11, rawVarint32);
        this.bufferPos += rawVarint32;
        return boundedByteString;
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readRawLittleEndian64());
    }

    public int readEnum() throws IOException {
        return readRawVarint32();
    }

    public int readFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readRawLittleEndian32());
    }

    public void readGroup(int i5, MessageLite.Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        int i11 = this.recursionDepth;
        if (i11 >= this.recursionLimit) {
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }
        this.recursionDepth = i11 + 1;
        builder.mergeFrom(this, extensionRegistryLite);
        checkLastTagWas(WireFormat.makeTag(i5, 4));
        this.recursionDepth--;
    }

    public int readInt32() throws IOException {
        return readRawVarint32();
    }

    public long readInt64() throws IOException {
        return readRawVarint64();
    }

    public void readMessage(MessageLite.Builder builder, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        int rawVarint32 = readRawVarint32();
        if (this.recursionDepth >= this.recursionLimit) {
            throw InvalidProtocolBufferException.recursionLimitExceeded();
        }
        int iPushLimit = pushLimit(rawVarint32);
        this.recursionDepth++;
        builder.mergeFrom(this, extensionRegistryLite);
        checkLastTagWas(0);
        this.recursionDepth--;
        popLimit(iPushLimit);
    }

    public byte readRawByte() throws IOException {
        if (this.bufferPos == this.bufferSize) {
            refillBuffer(1);
        }
        byte[] bArr = this.buffer;
        int i5 = this.bufferPos;
        this.bufferPos = i5 + 1;
        return bArr[i5];
    }

    public int readRawLittleEndian32() throws IOException {
        int i5 = this.bufferPos;
        if (this.bufferSize - i5 < 4) {
            refillBuffer(4);
            i5 = this.bufferPos;
        }
        byte[] bArr = this.buffer;
        this.bufferPos = i5 + 4;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public long readRawLittleEndian64() throws IOException {
        int i5 = this.bufferPos;
        if (this.bufferSize - i5 < 8) {
            refillBuffer(8);
            i5 = this.bufferPos;
        }
        byte[] bArr = this.buffer;
        this.bufferPos = i5 + 8;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public int readRawVarint32() throws IOException {
        int i5;
        int i11 = this.bufferPos;
        int i12 = this.bufferSize;
        if (i12 != i11) {
            byte[] bArr = this.buffer;
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.bufferPos = i13;
                return b11;
            }
            if (i12 - i13 >= 9) {
                int i14 = i11 + 2;
                int i15 = (bArr[i13] << 7) ^ b11;
                long j11 = i15;
                if (j11 < 0) {
                    i5 = (int) ((-128) ^ j11);
                } else {
                    int i16 = i11 + 3;
                    int i17 = (bArr[i14] << 14) ^ i15;
                    long j12 = i17;
                    if (j12 >= 0) {
                        i5 = (int) (16256 ^ j12);
                    } else {
                        int i18 = i11 + 4;
                        long j13 = i17 ^ (bArr[i16] << 21);
                        if (j13 < 0) {
                            i5 = (int) ((-2080896) ^ j13);
                        } else {
                            i16 = i11 + 5;
                            int i19 = (int) ((r1 ^ (r3 << 28)) ^ 266354560);
                            if (bArr[i18] < 0) {
                                i18 = i11 + 6;
                                if (bArr[i16] < 0) {
                                    i16 = i11 + 7;
                                    if (bArr[i18] < 0) {
                                        i18 = i11 + 8;
                                        if (bArr[i16] < 0) {
                                            i16 = i11 + 9;
                                            if (bArr[i18] < 0) {
                                                int i21 = i11 + 10;
                                                if (bArr[i16] >= 0) {
                                                    i14 = i21;
                                                    i5 = i19;
                                                }
                                            }
                                        }
                                    }
                                }
                                i5 = i19;
                            }
                            i5 = i19;
                        }
                        i14 = i18;
                    }
                    i14 = i16;
                }
                this.bufferPos = i14;
                return i5;
            }
        }
        return (int) readRawVarint64SlowPath();
    }

    public long readRawVarint64() throws IOException {
        long j11;
        long j12;
        long j13;
        int i5 = this.bufferPos;
        int i11 = this.bufferSize;
        if (i11 != i5) {
            byte[] bArr = this.buffer;
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.bufferPos = i12;
                return b11;
            }
            if (i11 - i12 >= 9) {
                int i13 = i5 + 2;
                long j14 = (bArr[i12] << 7) ^ b11;
                if (j14 >= 0) {
                    int i14 = i5 + 3;
                    long j15 = j14 ^ (bArr[i13] << 14);
                    if (j15 >= 0) {
                        j13 = 16256;
                    } else {
                        i13 = i5 + 4;
                        j14 = j15 ^ (bArr[i14] << 21);
                        if (j14 < 0) {
                            j12 = -2080896;
                        } else {
                            i14 = i5 + 5;
                            j15 = j14 ^ (bArr[i13] << 28);
                            if (j15 >= 0) {
                                j13 = 266354560;
                            } else {
                                i13 = i5 + 6;
                                j14 = j15 ^ (bArr[i14] << 35);
                                if (j14 < 0) {
                                    j12 = -34093383808L;
                                } else {
                                    i14 = i5 + 7;
                                    j15 = j14 ^ (bArr[i13] << 42);
                                    if (j15 >= 0) {
                                        j13 = 4363953127296L;
                                    } else {
                                        i13 = i5 + 8;
                                        j14 = j15 ^ (bArr[i14] << 49);
                                        if (j14 < 0) {
                                            j12 = -558586000294016L;
                                        } else {
                                            i14 = i5 + 9;
                                            long j16 = (j14 ^ (bArr[i13] << 56)) ^ 71499008037633920L;
                                            if (j16 >= 0) {
                                                j11 = j16;
                                                i13 = i14;
                                                this.bufferPos = i13;
                                                return j11;
                                            }
                                            i13 = i5 + 10;
                                            if (bArr[i14] >= 0) {
                                                j11 = j16;
                                                this.bufferPos = i13;
                                                return j11;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    j11 = j15 ^ j13;
                    i13 = i14;
                    this.bufferPos = i13;
                    return j11;
                }
                j12 = -128;
                j11 = j14 ^ j12;
                this.bufferPos = i13;
                return j11;
            }
        }
        return readRawVarint64SlowPath();
    }

    public long readRawVarint64SlowPath() throws IOException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((readRawByte() & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.malformedVarint();
    }

    public int readSFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readSFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public int readSInt32() throws IOException {
        return decodeZigZag32(readRawVarint32());
    }

    public long readSInt64() throws IOException {
        return decodeZigZag64(readRawVarint64());
    }

    public String readString() throws IOException {
        int rawVarint32 = readRawVarint32();
        int i5 = this.bufferSize;
        int i11 = this.bufferPos;
        if (rawVarint32 > i5 - i11 || rawVarint32 <= 0) {
            return rawVarint32 == 0 ? b.f42142b : new String(readRawBytesSlowPath(rawVarint32), "UTF-8");
        }
        String str = new String(this.buffer, i11, rawVarint32, "UTF-8");
        this.bufferPos += rawVarint32;
        return str;
    }

    public String readStringRequireUtf8() throws IOException {
        byte[] rawBytesSlowPath;
        int rawVarint32 = readRawVarint32();
        int i5 = this.bufferPos;
        if (rawVarint32 <= this.bufferSize - i5 && rawVarint32 > 0) {
            rawBytesSlowPath = this.buffer;
            this.bufferPos = i5 + rawVarint32;
        } else {
            if (rawVarint32 == 0) {
                return b.f42142b;
            }
            rawBytesSlowPath = readRawBytesSlowPath(rawVarint32);
            i5 = 0;
        }
        if (Utf8.isValidUtf8(rawBytesSlowPath, i5, i5 + rawVarint32)) {
            return new String(rawBytesSlowPath, i5, rawVarint32, "UTF-8");
        }
        throw InvalidProtocolBufferException.invalidUtf8();
    }

    public int readTag() throws IOException {
        if (isAtEnd()) {
            this.lastTag = 0;
            return 0;
        }
        int rawVarint32 = readRawVarint32();
        this.lastTag = rawVarint32;
        if (WireFormat.getTagFieldNumber(rawVarint32) != 0) {
            return this.lastTag;
        }
        throw InvalidProtocolBufferException.invalidTag();
    }

    public int readUInt32() throws IOException {
        return readRawVarint32();
    }

    public long readUInt64() throws IOException {
        return readRawVarint64();
    }

    public boolean skipField(int i5, CodedOutputStream codedOutputStream) throws IOException {
        int tagWireType = WireFormat.getTagWireType(i5);
        if (tagWireType == 0) {
            long int64 = readInt64();
            codedOutputStream.writeRawVarint32(i5);
            codedOutputStream.writeUInt64NoTag(int64);
            return true;
        }
        if (tagWireType == 1) {
            long rawLittleEndian64 = readRawLittleEndian64();
            codedOutputStream.writeRawVarint32(i5);
            codedOutputStream.writeFixed64NoTag(rawLittleEndian64);
            return true;
        }
        if (tagWireType == 2) {
            ByteString bytes = readBytes();
            codedOutputStream.writeRawVarint32(i5);
            codedOutputStream.writeBytesNoTag(bytes);
            return true;
        }
        if (tagWireType == 3) {
            codedOutputStream.writeRawVarint32(i5);
            skipMessage(codedOutputStream);
            int iMakeTag = WireFormat.makeTag(WireFormat.getTagFieldNumber(i5), 4);
            checkLastTagWas(iMakeTag);
            codedOutputStream.writeRawVarint32(iMakeTag);
            return true;
        }
        if (tagWireType == 4) {
            return false;
        }
        if (tagWireType != 5) {
            throw InvalidProtocolBufferException.invalidWireType();
        }
        int rawLittleEndian32 = readRawLittleEndian32();
        codedOutputStream.writeRawVarint32(i5);
        codedOutputStream.writeFixed32NoTag(rawLittleEndian32);
        return true;
    }

    public void skipMessage(CodedOutputStream codedOutputStream) throws IOException {
        int tag;
        do {
            tag = readTag();
            if (tag == 0) {
                return;
            }
        } while (skipField(tag, codedOutputStream));
    }

    public void skipRawBytes(int i5) throws IOException {
        int i11 = this.bufferSize;
        int i12 = this.bufferPos;
        if (i5 > i11 - i12 || i5 < 0) {
            skipRawBytesSlowPath(i5);
        } else {
            this.bufferPos = i12 + i5;
        }
    }

    public static CodedInputStream newInstance(LiteralByteString literalByteString) {
        CodedInputStream codedInputStream = new CodedInputStream(literalByteString);
        try {
            codedInputStream.pushLimit(literalByteString.size());
            return codedInputStream;
        } catch (InvalidProtocolBufferException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public <T extends MessageLite> T readMessage(Parser<T> parser, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        int rawVarint32 = readRawVarint32();
        if (this.recursionDepth < this.recursionLimit) {
            int iPushLimit = pushLimit(rawVarint32);
            this.recursionDepth++;
            T partialFrom = parser.parsePartialFrom(this, extensionRegistryLite);
            checkLastTagWas(0);
            this.recursionDepth--;
            popLimit(iPushLimit);
            return partialFrom;
        }
        throw InvalidProtocolBufferException.recursionLimitExceeded();
    }

    private CodedInputStream(LiteralByteString literalByteString) {
        this.enableAliasing = false;
        this.currentLimit = LayoutNode.NotPlacedPlaceOrder;
        this.recursionLimit = 64;
        this.sizeLimit = 67108864;
        this.refillCallback = null;
        this.buffer = literalByteString.bytes;
        int offsetIntoBytes = literalByteString.getOffsetIntoBytes();
        this.bufferPos = offsetIntoBytes;
        this.bufferSize = offsetIntoBytes + literalByteString.size();
        this.totalBytesRetired = -this.bufferPos;
        this.input = null;
        this.bufferIsImmutable = true;
    }

    public static int readRawVarint32(int i5, InputStream inputStream) throws IOException {
        if ((i5 & 128) == 0) {
            return i5;
        }
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = 7;
        while (i12 < 32) {
            int i13 = inputStream.read();
            if (i13 == -1) {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            i11 |= (i13 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i12;
            if ((i13 & 128) == 0) {
                return i11;
            }
            i12 += 7;
        }
        while (i12 < 64) {
            int i14 = inputStream.read();
            if (i14 == -1) {
                throw InvalidProtocolBufferException.truncatedMessage();
            }
            if ((i14 & 128) == 0) {
                return i11;
            }
            i12 += 7;
        }
        throw InvalidProtocolBufferException.malformedVarint();
    }
}
