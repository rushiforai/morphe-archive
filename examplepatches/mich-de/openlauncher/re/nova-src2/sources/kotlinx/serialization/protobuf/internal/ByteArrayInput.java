package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationException;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u000e\u0010\f\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u0005J\u0006\u0010\u000e\u001a\u00020\u0005J\u000e\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0005J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0010\u001a\u00020\u0005J\u0010\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0010\u001a\u00020\u0005H\u0002J\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0005J\u0006\u0010\u0017\u001a\u00020\u0005J\u000e\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bJ\b\u0010\u001c\u001a\u00020\u0012H\u0002J\b\u0010\u001d\u001a\u00020\u0019H\u0002J\b\u0010\u001e\u001a\u00020\u0005H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\t\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\n\u0010\u000b¨\u0006\u001f"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ByteArrayInput;", b.f42142b, "array", b.f42142b, "endIndex", b.f42142b, "<init>", "([BI)V", "position", "availableBytes", "getAvailableBytes", "()I", "slice", "size", "read", "readExactNBytes", "bytesCount", "skipExactNBytes", b.f42142b, "ensureEnoughBytes", "readString", b.f42142b, "length", "readVarint32", "readVarint64", b.f42142b, "eofAllowed", b.f42142b, "eof", "readVarint64SlowPath", "readVarint32SlowPath", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ByteArrayInput {

    @NotNull
    private byte[] array;
    private final int endIndex;
    private int position;

    public ByteArrayInput(@NotNull byte[] array, int i5) {
        Intrinsics.g(array, "array");
        this.array = array;
        this.endIndex = i5;
    }

    private final void ensureEnoughBytes(int bytesCount) {
        if (bytesCount <= getAvailableBytes()) {
            return;
        }
        throw new SerializationException("Unexpected EOF, available " + getAvailableBytes() + " bytes, requested: " + bytesCount);
    }

    private final void eof() {
        throw new SerializationException("Unexpected EOF");
    }

    private final int readVarint32SlowPath() {
        int i5 = 0;
        for (int i11 = 0; i11 < 32; i11 += 7) {
            int i12 = read();
            i5 |= (i12 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i11;
            if ((i12 & 128) == 0) {
                return i5;
            }
        }
        throw new SerializationException("Input stream is malformed: Varint too long (exceeded 32 bits)");
    }

    private final long readVarint64SlowPath() {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            j11 |= (r3 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i5;
            if ((read() & 128) == 0) {
                return j11;
            }
        }
        throw new SerializationException("Input stream is malformed: Varint too long (exceeded 64 bits)");
    }

    public final int getAvailableBytes() {
        return this.endIndex - this.position;
    }

    public final int read() {
        int i5 = this.position;
        if (i5 >= this.endIndex) {
            return -1;
        }
        byte[] bArr = this.array;
        this.position = i5 + 1;
        return bArr[i5] & 255;
    }

    @NotNull
    public final byte[] readExactNBytes(int bytesCount) {
        ensureEnoughBytes(bytesCount);
        byte[] bArr = new byte[bytesCount];
        int i5 = this.endIndex;
        int i11 = this.position;
        int i12 = i5 - i11;
        if (i12 < bytesCount) {
            bytesCount = i12;
        }
        u90.b.q(this.array, 0, bArr, i11, i11 + bytesCount);
        this.position += bytesCount;
        return bArr;
    }

    @NotNull
    public final String readString(int length) {
        byte[] bArr = this.array;
        int i5 = this.position;
        String strY0 = j.y0(i5, i5 + length, bArr);
        this.position += length;
        return strY0;
    }

    public final int readVarint32() {
        if (this.position == this.endIndex) {
            eof();
        }
        int i5 = this.position;
        byte[] bArr = this.array;
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 >= 0) {
            this.position = i11;
            return b11;
        }
        if (this.endIndex - i5 > 1) {
            int i12 = i5 + 2;
            int i13 = (bArr[i11] << 7) ^ b11;
            if (i13 < 0) {
                this.position = i12;
                return i13 ^ (-128);
            }
        }
        return readVarint32SlowPath();
    }

    public final long readVarint64(boolean eofAllowed) {
        if (this.position == this.endIndex) {
            if (eofAllowed) {
                return -1L;
            }
            eof();
        }
        int i5 = this.position;
        int i11 = i5 + 1;
        long j11 = this.array[i5];
        if (j11 >= 0) {
            this.position = i11;
            return j11;
        }
        if (this.endIndex - i5 > 1) {
            int i12 = i5 + 2;
            long j12 = (r0[i11] << 7) ^ j11;
            if (j12 < 0) {
                this.position = i12;
                return j12 ^ (-128);
            }
        }
        return readVarint64SlowPath();
    }

    public final void skipExactNBytes(int bytesCount) {
        ensureEnoughBytes(bytesCount);
        this.position += bytesCount;
    }

    @NotNull
    public final ByteArrayInput slice(int size) {
        ensureEnoughBytes(size);
        ByteArrayInput byteArrayInput = new ByteArrayInput(this.array, this.position + size);
        byteArrayInput.position = this.position;
        this.position += size;
        return byteArrayInput;
    }

    public /* synthetic */ ByteArrayInput(byte[] bArr, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(bArr, (i11 & 2) != 0 ? bArr.length : i5);
    }
}
