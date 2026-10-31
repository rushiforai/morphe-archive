package kotlin.reflect.jvm.internal.impl.protobuf;

import androidx.recyclerview.widget.u1;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: classes5.dex */
public final class CodedOutputStream {
    private final byte[] buffer;
    private final int limit;
    private final OutputStream output;
    private int totalBytesWritten = 0;
    private int position = 0;

    public static class OutOfSpaceException extends IOException {
        public OutOfSpaceException() {
            super("CodedOutputStream was writing to a flat byte array and ran out of space.");
        }
    }

    private CodedOutputStream(OutputStream outputStream, byte[] bArr) {
        this.output = outputStream;
        this.buffer = bArr;
        this.limit = bArr.length;
    }

    public static int computeBoolSize(int i5, boolean z11) {
        return computeBoolSizeNoTag(z11) + computeTagSize(i5);
    }

    public static int computeBoolSizeNoTag(boolean z11) {
        return 1;
    }

    public static int computeByteArraySizeNoTag(byte[] bArr) {
        return computeRawVarint32Size(bArr.length) + bArr.length;
    }

    public static int computeBytesSize(int i5, ByteString byteString) {
        return computeBytesSizeNoTag(byteString) + computeTagSize(i5);
    }

    public static int computeBytesSizeNoTag(ByteString byteString) {
        return byteString.size() + computeRawVarint32Size(byteString.size());
    }

    public static int computeDoubleSize(int i5, double d5) {
        return computeDoubleSizeNoTag(d5) + computeTagSize(i5);
    }

    public static int computeDoubleSizeNoTag(double d5) {
        return 8;
    }

    public static int computeEnumSize(int i5, int i11) {
        return computeEnumSizeNoTag(i11) + computeTagSize(i5);
    }

    public static int computeEnumSizeNoTag(int i5) {
        return computeInt32SizeNoTag(i5);
    }

    public static int computeFixed32SizeNoTag(int i5) {
        return 4;
    }

    public static int computeFixed64SizeNoTag(long j11) {
        return 8;
    }

    public static int computeFloatSize(int i5, float f11) {
        return computeFloatSizeNoTag(f11) + computeTagSize(i5);
    }

    public static int computeFloatSizeNoTag(float f11) {
        return 4;
    }

    public static int computeGroupSizeNoTag(MessageLite messageLite) {
        return messageLite.getSerializedSize();
    }

    public static int computeInt32Size(int i5, int i11) {
        return computeInt32SizeNoTag(i11) + computeTagSize(i5);
    }

    public static int computeInt32SizeNoTag(int i5) {
        if (i5 >= 0) {
            return computeRawVarint32Size(i5);
        }
        return 10;
    }

    public static int computeInt64SizeNoTag(long j11) {
        return computeRawVarint64Size(j11);
    }

    public static int computeLazyFieldSizeNoTag(LazyFieldLite lazyFieldLite) {
        int serializedSize = lazyFieldLite.getSerializedSize();
        return computeRawVarint32Size(serializedSize) + serializedSize;
    }

    public static int computeMessageSize(int i5, MessageLite messageLite) {
        return computeMessageSizeNoTag(messageLite) + computeTagSize(i5);
    }

    public static int computeMessageSizeNoTag(MessageLite messageLite) {
        int serializedSize = messageLite.getSerializedSize();
        return computeRawVarint32Size(serializedSize) + serializedSize;
    }

    public static int computePreferredBufferSize(int i5) {
        return i5 > 4096 ? u1.FLAG_APPEARED_IN_PRE_LAYOUT : i5;
    }

    public static int computeRawVarint32Size(int i5) {
        if ((i5 & (-128)) == 0) {
            return 1;
        }
        if ((i5 & (-16384)) == 0) {
            return 2;
        }
        if (((-2097152) & i5) == 0) {
            return 3;
        }
        return (i5 & (-268435456)) == 0 ? 4 : 5;
    }

    public static int computeRawVarint64Size(long j11) {
        if (((-128) & j11) == 0) {
            return 1;
        }
        if (((-16384) & j11) == 0) {
            return 2;
        }
        if (((-2097152) & j11) == 0) {
            return 3;
        }
        if (((-268435456) & j11) == 0) {
            return 4;
        }
        if (((-34359738368L) & j11) == 0) {
            return 5;
        }
        if (((-4398046511104L) & j11) == 0) {
            return 6;
        }
        if (((-562949953421312L) & j11) == 0) {
            return 7;
        }
        if (((-72057594037927936L) & j11) == 0) {
            return 8;
        }
        return (j11 & Long.MIN_VALUE) == 0 ? 9 : 10;
    }

    public static int computeSFixed32SizeNoTag(int i5) {
        return 4;
    }

    public static int computeSFixed64SizeNoTag(long j11) {
        return 8;
    }

    public static int computeSInt32SizeNoTag(int i5) {
        return computeRawVarint32Size(encodeZigZag32(i5));
    }

    public static int computeSInt64Size(int i5, long j11) {
        return computeSInt64SizeNoTag(j11) + computeTagSize(i5);
    }

    public static int computeSInt64SizeNoTag(long j11) {
        return computeRawVarint64Size(encodeZigZag64(j11));
    }

    public static int computeStringSizeNoTag(String str) throws UnsupportedEncodingException {
        try {
            byte[] bytes = str.getBytes("UTF-8");
            return computeRawVarint32Size(bytes.length) + bytes.length;
        } catch (UnsupportedEncodingException e3) {
            throw new RuntimeException("UTF-8 not supported.", e3);
        }
    }

    public static int computeTagSize(int i5) {
        return computeRawVarint32Size(WireFormat.makeTag(i5, 0));
    }

    public static int computeUInt32SizeNoTag(int i5) {
        return computeRawVarint32Size(i5);
    }

    public static int computeUInt64SizeNoTag(long j11) {
        return computeRawVarint64Size(j11);
    }

    public static int encodeZigZag32(int i5) {
        return (i5 >> 31) ^ (i5 << 1);
    }

    public static long encodeZigZag64(long j11) {
        return (j11 >> 63) ^ (j11 << 1);
    }

    public static CodedOutputStream newInstance(OutputStream outputStream, int i5) {
        return new CodedOutputStream(outputStream, new byte[i5]);
    }

    private void refreshBuffer() throws IOException {
        OutputStream outputStream = this.output;
        if (outputStream == null) {
            throw new OutOfSpaceException();
        }
        outputStream.write(this.buffer, 0, this.position);
        this.position = 0;
    }

    public void flush() throws IOException {
        if (this.output != null) {
            refreshBuffer();
        }
    }

    public void writeBool(int i5, boolean z11) throws IOException {
        writeTag(i5, 0);
        writeBoolNoTag(z11);
    }

    public void writeBoolNoTag(boolean z11) throws IOException {
        writeRawByte(z11 ? 1 : 0);
    }

    public void writeByteArrayNoTag(byte[] bArr) throws IOException {
        writeRawVarint32(bArr.length);
        writeRawBytes(bArr);
    }

    public void writeBytes(int i5, ByteString byteString) throws IOException {
        writeTag(i5, 2);
        writeBytesNoTag(byteString);
    }

    public void writeBytesNoTag(ByteString byteString) throws IOException {
        writeRawVarint32(byteString.size());
        writeRawBytes(byteString);
    }

    public void writeDouble(int i5, double d5) throws IOException {
        writeTag(i5, 1);
        writeDoubleNoTag(d5);
    }

    public void writeDoubleNoTag(double d5) throws IOException {
        writeRawLittleEndian64(Double.doubleToRawLongBits(d5));
    }

    public void writeEnum(int i5, int i11) throws IOException {
        writeTag(i5, 0);
        writeEnumNoTag(i11);
    }

    public void writeEnumNoTag(int i5) throws IOException {
        writeInt32NoTag(i5);
    }

    public void writeFixed32NoTag(int i5) throws IOException {
        writeRawLittleEndian32(i5);
    }

    public void writeFixed64NoTag(long j11) throws IOException {
        writeRawLittleEndian64(j11);
    }

    public void writeFloat(int i5, float f11) throws IOException {
        writeTag(i5, 5);
        writeFloatNoTag(f11);
    }

    public void writeFloatNoTag(float f11) throws IOException {
        writeRawLittleEndian32(Float.floatToRawIntBits(f11));
    }

    public void writeGroup(int i5, MessageLite messageLite) throws IOException {
        writeTag(i5, 3);
        writeGroupNoTag(messageLite);
        writeTag(i5, 4);
    }

    public void writeGroupNoTag(MessageLite messageLite) throws IOException {
        messageLite.writeTo(this);
    }

    public void writeInt32(int i5, int i11) throws IOException {
        writeTag(i5, 0);
        writeInt32NoTag(i11);
    }

    public void writeInt32NoTag(int i5) throws IOException {
        if (i5 >= 0) {
            writeRawVarint32(i5);
        } else {
            writeRawVarint64(i5);
        }
    }

    public void writeInt64NoTag(long j11) throws IOException {
        writeRawVarint64(j11);
    }

    public void writeMessage(int i5, MessageLite messageLite) throws IOException {
        writeTag(i5, 2);
        writeMessageNoTag(messageLite);
    }

    public void writeMessageNoTag(MessageLite messageLite) throws IOException {
        writeRawVarint32(messageLite.getSerializedSize());
        messageLite.writeTo(this);
    }

    public void writeMessageSetExtension(int i5, MessageLite messageLite) throws IOException {
        writeTag(1, 3);
        writeUInt32(2, i5);
        writeMessage(3, messageLite);
        writeTag(1, 4);
    }

    public void writeRawByte(byte b11) throws IOException {
        if (this.position == this.limit) {
            refreshBuffer();
        }
        byte[] bArr = this.buffer;
        int i5 = this.position;
        this.position = i5 + 1;
        bArr[i5] = b11;
        this.totalBytesWritten++;
    }

    public void writeRawBytes(ByteString byteString) throws IOException {
        writeRawBytes(byteString, 0, byteString.size());
    }

    public void writeRawLittleEndian32(int i5) throws IOException {
        writeRawByte(i5 & 255);
        writeRawByte((i5 >> 8) & 255);
        writeRawByte((i5 >> 16) & 255);
        writeRawByte((i5 >> 24) & 255);
    }

    public void writeRawLittleEndian64(long j11) throws IOException {
        writeRawByte(((int) j11) & 255);
        writeRawByte(((int) (j11 >> 8)) & 255);
        writeRawByte(((int) (j11 >> 16)) & 255);
        writeRawByte(((int) (j11 >> 24)) & 255);
        writeRawByte(((int) (j11 >> 32)) & 255);
        writeRawByte(((int) (j11 >> 40)) & 255);
        writeRawByte(((int) (j11 >> 48)) & 255);
        writeRawByte(((int) (j11 >> 56)) & 255);
    }

    public void writeRawVarint32(int i5) throws IOException {
        while ((i5 & (-128)) != 0) {
            writeRawByte((i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
            i5 >>>= 7;
        }
        writeRawByte(i5);
    }

    public void writeRawVarint64(long j11) throws IOException {
        while (((-128) & j11) != 0) {
            writeRawByte((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
            j11 >>>= 7;
        }
        writeRawByte((int) j11);
    }

    public void writeSFixed32NoTag(int i5) throws IOException {
        writeRawLittleEndian32(i5);
    }

    public void writeSFixed64NoTag(long j11) throws IOException {
        writeRawLittleEndian64(j11);
    }

    public void writeSInt32NoTag(int i5) throws IOException {
        writeRawVarint32(encodeZigZag32(i5));
    }

    public void writeSInt64(int i5, long j11) throws IOException {
        writeTag(i5, 0);
        writeSInt64NoTag(j11);
    }

    public void writeSInt64NoTag(long j11) throws IOException {
        writeRawVarint64(encodeZigZag64(j11));
    }

    public void writeStringNoTag(String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        writeRawVarint32(bytes.length);
        writeRawBytes(bytes);
    }

    public void writeTag(int i5, int i11) throws IOException {
        writeRawVarint32(WireFormat.makeTag(i5, i11));
    }

    public void writeUInt32(int i5, int i11) throws IOException {
        writeTag(i5, 0);
        writeUInt32NoTag(i11);
    }

    public void writeUInt32NoTag(int i5) throws IOException {
        writeRawVarint32(i5);
    }

    public void writeUInt64NoTag(long j11) throws IOException {
        writeRawVarint64(j11);
    }

    public void writeRawBytes(byte[] bArr) throws IOException {
        writeRawBytes(bArr, 0, bArr.length);
    }

    public void writeRawBytes(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.limit;
        int i13 = this.position;
        if (i12 - i13 >= i11) {
            System.arraycopy(bArr, i5, this.buffer, i13, i11);
            this.position += i11;
            this.totalBytesWritten += i11;
            return;
        }
        int i14 = i12 - i13;
        System.arraycopy(bArr, i5, this.buffer, i13, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.position = this.limit;
        this.totalBytesWritten += i14;
        refreshBuffer();
        if (i16 <= this.limit) {
            System.arraycopy(bArr, i15, this.buffer, 0, i16);
            this.position = i16;
        } else {
            this.output.write(bArr, i15, i16);
        }
        this.totalBytesWritten += i16;
    }

    public void writeRawByte(int i5) throws IOException {
        writeRawByte((byte) i5);
    }

    public void writeRawBytes(ByteString byteString, int i5, int i11) throws IOException {
        int i12 = this.limit;
        int i13 = this.position;
        if (i12 - i13 >= i11) {
            byteString.copyTo(this.buffer, i5, i13, i11);
            this.position += i11;
            this.totalBytesWritten += i11;
            return;
        }
        int i14 = i12 - i13;
        byteString.copyTo(this.buffer, i5, i13, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.position = this.limit;
        this.totalBytesWritten += i14;
        refreshBuffer();
        if (i16 <= this.limit) {
            byteString.copyTo(this.buffer, i15, 0, i16);
            this.position = i16;
        } else {
            byteString.writeTo(this.output, i15, i16);
        }
        this.totalBytesWritten += i16;
    }
}
