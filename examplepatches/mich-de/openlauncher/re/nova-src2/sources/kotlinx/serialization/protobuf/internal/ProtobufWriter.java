package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0005\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tJ\u0016\u0010\f\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\f\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0003J\u001e\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u0011J\u000e\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u000bJ\u001e\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u0011J\u000e\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0013J\u0016\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00152\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0015J\u0016\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00172\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0017J\u0016\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00192\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0019J\u001e\u0010\u001a\u001a\u00020\u0007*\u00020\u00032\u0006\u0010\u001b\u001a\u00020\u000b2\b\b\u0002\u0010\u0010\u001a\u00020\u0011H\u0002J\u001e\u0010\u001c\u001a\u00020\u0007*\u00020\u00032\u0006\u0010\u001b\u001a\u00020\u00132\b\b\u0002\u0010\u0010\u001a\u00020\u0011H\u0002J\f\u0010\u001d\u001a\u00020\u000b*\u00020\u0019H\u0002J\f\u0010\u001d\u001a\u00020\u0013*\u00020\u0017H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001e"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", b.f42142b, "out", "Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;", "<init>", "(Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;)V", "writeBytes", b.f42142b, "bytes", b.f42142b, "tag", b.f42142b, "writeOutput", "output", "writeInt", "value", "format", "Lkotlinx/serialization/protobuf/ProtoIntegerType;", "writeLong", b.f42142b, "writeString", b.f42142b, "writeDouble", b.f42142b, "writeFloat", b.f42142b, "encode32", "number", "encode64", "reverseBytes", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ProtobufWriter {

    @NotNull
    private final ByteArrayOutput out;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ProtoIntegerType.values().length];
            try {
                iArr[ProtoIntegerType.FIXED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[ProtoIntegerType.DEFAULT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[ProtoIntegerType.SIGNED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public ProtobufWriter(@NotNull ByteArrayOutput out) {
        Intrinsics.g(out, "out");
        this.out = out;
    }

    private final void encode32(ByteArrayOutput byteArrayOutput, int i5, ProtoIntegerType protoIntegerType) {
        int i11 = WhenMappings.$EnumSwitchMapping$0[protoIntegerType.ordinal()];
        if (i11 == 1) {
            this.out.writeInt(BytesKt.reverseBytes(i5));
            return;
        }
        if (i11 == 2) {
            byteArrayOutput.encodeVarint64(i5);
        } else {
            if (i11 != 3) {
                throw new NoWhenBranchMatchedException();
            }
            byteArrayOutput.encodeVarint32((i5 >> 31) ^ (i5 << 1));
        }
    }

    public static /* synthetic */ void encode32$default(ProtobufWriter protobufWriter, ByteArrayOutput byteArrayOutput, int i5, ProtoIntegerType protoIntegerType, int i11, Object obj) {
        if ((i11 & 2) != 0) {
            protoIntegerType = ProtoIntegerType.DEFAULT;
        }
        protobufWriter.encode32(byteArrayOutput, i5, protoIntegerType);
    }

    private final void encode64(ByteArrayOutput byteArrayOutput, long j11, ProtoIntegerType protoIntegerType) {
        int i5 = WhenMappings.$EnumSwitchMapping$0[protoIntegerType.ordinal()];
        if (i5 == 1) {
            this.out.writeLong(BytesKt.reverseBytes(j11));
            return;
        }
        if (i5 == 2) {
            byteArrayOutput.encodeVarint64(j11);
        } else {
            if (i5 != 3) {
                throw new NoWhenBranchMatchedException();
            }
            byteArrayOutput.encodeVarint64((j11 >> 63) ^ (j11 << 1));
        }
    }

    public static /* synthetic */ void encode64$default(ProtobufWriter protobufWriter, ByteArrayOutput byteArrayOutput, long j11, ProtoIntegerType protoIntegerType, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            protoIntegerType = ProtoIntegerType.DEFAULT;
        }
        protobufWriter.encode64(byteArrayOutput, j11, protoIntegerType);
    }

    private final int reverseBytes(float f11) {
        return BytesKt.reverseBytes(Float.floatToRawIntBits(f11));
    }

    public final void writeBytes(@NotNull byte[] bytes, int tag) {
        Intrinsics.g(bytes, "bytes");
        encode32$default(this, this.out, ProtoWireType.SIZE_DELIMITED.wireIntWithTag(tag), null, 2, null);
        writeBytes(bytes);
    }

    public final void writeDouble(double value, int tag) {
        encode32$default(this, this.out, ProtoWireType.i64.wireIntWithTag(tag), null, 2, null);
        this.out.writeLong(reverseBytes(value));
    }

    public final void writeFloat(float value, int tag) {
        encode32$default(this, this.out, ProtoWireType.i32.wireIntWithTag(tag), null, 2, null);
        this.out.writeInt(reverseBytes(value));
    }

    public final void writeInt(int value, int tag, @NotNull ProtoIntegerType format) {
        Intrinsics.g(format, "format");
        encode32$default(this, this.out, (format == ProtoIntegerType.FIXED ? ProtoWireType.i32 : ProtoWireType.VARINT).wireIntWithTag(tag), null, 2, null);
        encode32(this.out, value, format);
    }

    public final void writeLong(long value, int tag, @NotNull ProtoIntegerType format) {
        Intrinsics.g(format, "format");
        encode32$default(this, this.out, (format == ProtoIntegerType.FIXED ? ProtoWireType.i64 : ProtoWireType.VARINT).wireIntWithTag(tag), null, 2, null);
        encode64(this.out, value, format);
    }

    public final void writeOutput(@NotNull ByteArrayOutput output, int tag) {
        Intrinsics.g(output, "output");
        encode32$default(this, this.out, ProtoWireType.SIZE_DELIMITED.wireIntWithTag(tag), null, 2, null);
        writeOutput(output);
    }

    public final void writeString(@NotNull String value, int tag) {
        Intrinsics.g(value, "value");
        writeBytes(j.z0(value), tag);
    }

    private final long reverseBytes(double d5) {
        return BytesKt.reverseBytes(Double.doubleToRawLongBits(d5));
    }

    public final void writeBytes(@NotNull byte[] bytes) {
        Intrinsics.g(bytes, "bytes");
        encode32$default(this, this.out, bytes.length, null, 2, null);
        this.out.write(bytes);
    }

    public final void writeDouble(double value) {
        this.out.writeLong(reverseBytes(value));
    }

    public final void writeFloat(float value) {
        this.out.writeInt(reverseBytes(value));
    }

    public final void writeOutput(@NotNull ByteArrayOutput output) {
        Intrinsics.g(output, "output");
        encode32$default(this, this.out, output.getPosition(), null, 2, null);
        this.out.write(output);
    }

    public final void writeString(@NotNull String value) {
        Intrinsics.g(value, "value");
        writeBytes(j.z0(value));
    }

    public final void writeInt(int value) {
        encode32$default(this, this.out, value, null, 2, null);
    }

    public final void writeLong(long value) {
        encode64$default(this, this.out, value, null, 2, null);
    }
}
