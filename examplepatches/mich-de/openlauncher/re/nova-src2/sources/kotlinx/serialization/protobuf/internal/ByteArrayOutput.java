package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0010\t\n\u0002\b\b\b\u0000\u0018\u0000 \u001b2\u00020\u0001:\u0001\u001bB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0007H\u0002J\u0006\u0010\u000b\u001a\u00020\u0007J\u0006\u0010\f\u001a\u00020\u0005J\u000e\u0010\r\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u0005J\u000e\u0010\r\u001a\u00020\t2\u0006\u0010\u000f\u001a\u00020\u0000J\u000e\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0007J\u000e\u0010\u0012\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u0014J\u000e\u0010\u0015\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0007J\u000e\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0014J\u0018\u0010\u0018\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u0007H\u0002J\u0010\u0010\u001a\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u0014H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001c"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;", b.f42142b, "<init>", "()V", "array", b.f42142b, "position", b.f42142b, "ensureCapacity", b.f42142b, "elementsToAppend", "size", "toByteArray", "write", "buffer", "output", "writeInt", "intValue", "writeLong", "longValue", b.f42142b, "encodeVarint32", "value", "encodeVarint64", "encodeVarint", "length", "varIntLength", k.O, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ByteArrayOutput {

    @NotNull
    private static final Companion Companion = new Companion(null);

    @NotNull
    private static final int[] VAR_INT_LENGTHS;

    @NotNull
    private byte[] array = new byte[32];
    private int position;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0015\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ByteArrayOutput$Companion;", b.f42142b, "<init>", "()V", "VAR_INT_LENGTHS", b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    static {
        int[] iArr = new int[65];
        for (int i5 = 0; i5 < 65; i5++) {
            iArr[i5] = (63 - i5) / 7;
        }
        VAR_INT_LENGTHS = iArr;
    }

    private final void encodeVarint(long value, int length) {
        for (int i5 = 0; i5 < length; i5++) {
            this.array[this.position + i5] = (byte) ((127 & value) | 128);
            value >>>= 7;
        }
        byte[] bArr = this.array;
        int i11 = this.position;
        bArr[i11 + length] = (byte) value;
        this.position = length + 1 + i11;
    }

    private final void ensureCapacity(int elementsToAppend) {
        int i5 = this.position + elementsToAppend;
        if (i5 <= this.array.length) {
            return;
        }
        byte[] bArr = new byte[Integer.highestOneBit(i5) << 1];
        u90.b.v(this.array, 0, bArr, 0, 14);
        this.array = bArr;
    }

    private final int varIntLength(long value) {
        return VAR_INT_LENGTHS[Long.numberOfLeadingZeros(value)];
    }

    public final void encodeVarint32(int value) {
        ensureCapacity(5);
        if ((value & (-128)) != 0) {
            long j11 = value;
            encodeVarint(j11, varIntLength(j11));
        } else {
            byte[] bArr = this.array;
            int i5 = this.position;
            this.position = i5 + 1;
            bArr[i5] = (byte) value;
        }
    }

    public final void encodeVarint64(long value) {
        int iVarIntLength = varIntLength(value);
        ensureCapacity(iVarIntLength + 1);
        encodeVarint(value, iVarIntLength);
    }

    /* renamed from: size, reason: from getter */
    public final int getPosition() {
        return this.position;
    }

    @NotNull
    public final byte[] toByteArray() {
        int i5 = this.position;
        byte[] bArr = new byte[i5];
        u90.b.v(this.array, 0, bArr, i5, 2);
        return bArr;
    }

    public final void write(@NotNull byte[] buffer) {
        Intrinsics.g(buffer, "buffer");
        int length = buffer.length;
        if (length == 0) {
            return;
        }
        ensureCapacity(length);
        u90.b.q(buffer, this.position, this.array, 0, length);
        this.position += length;
    }

    public final void writeInt(int intValue) {
        ensureCapacity(4);
        for (int i5 = 3; -1 < i5; i5--) {
            byte[] bArr = this.array;
            int i11 = this.position;
            this.position = i11 + 1;
            bArr[i11] = (byte) (intValue >> (i5 * 8));
        }
    }

    public final void writeLong(long longValue) {
        ensureCapacity(8);
        for (int i5 = 7; -1 < i5; i5--) {
            byte[] bArr = this.array;
            int i11 = this.position;
            this.position = i11 + 1;
            bArr[i11] = (byte) (longValue >> (i5 * 8));
        }
    }

    public final void write(@NotNull ByteArrayOutput output) {
        Intrinsics.g(output, "output");
        int position = output.getPosition();
        ensureCapacity(position);
        u90.b.q(output.array, this.position, this.array, 0, position);
        this.position += position;
    }
}
