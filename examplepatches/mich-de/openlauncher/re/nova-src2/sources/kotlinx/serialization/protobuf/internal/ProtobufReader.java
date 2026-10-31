package kotlinx.serialization.protobuf.internal;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DoubleCompanionObject;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u0012\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0006\u0010\u0010\u001a\u00020\u0007J\u0010\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0007H\u0002J\u0006\u0010\u0013\u001a\u00020\u0014J\u0006\u0010\u0015\u001a\u00020\u0014J\u0011\u0010\u0016\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\tH\u0082\bJ\u0006\u0010\u0018\u001a\u00020\u0019J\u0006\u0010\u001a\u001a\u00020\u0014J\u0006\u0010\u001b\u001a\u00020\u0019J\u0006\u0010\u001c\u001a\u00020\u0003J\u0006\u0010\u001d\u001a\u00020\u0003J\u000e\u0010\u001e\u001a\u00020\u00072\u0006\u0010\u001f\u001a\u00020 J\u0006\u0010!\u001a\u00020\u0007J\u000e\u0010\"\u001a\u00020#2\u0006\u0010\u001f\u001a\u00020 J\u0006\u0010$\u001a\u00020#J\u0006\u0010%\u001a\u00020&J\u0006\u0010'\u001a\u00020&J\b\u0010(\u001a\u00020\u0007H\u0002J\b\u0010)\u001a\u00020#H\u0002J\u0006\u0010*\u001a\u00020+J\u0006\u0010,\u001a\u00020+J\u0006\u0010-\u001a\u00020.J\u0006\u0010/\u001a\u00020.J\u0010\u00100\u001a\u00020\u00142\u0006\u00101\u001a\u00020\u0007H\u0002J\u0012\u00102\u001a\u00020\u00072\b\b\u0002\u0010\u001f\u001a\u00020 H\u0002J\u0012\u00103\u001a\u00020#2\b\b\u0002\u0010\u001f\u001a\u00020 H\u0002J\u0010\u00104\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0010\u00105\u001a\u00020#2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\b\u001a\u00020\t8\u0006@\u0006X\u0087\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\r\u001a\u00020\u000b8F¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000f¨\u00066"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufReader;", b.f42142b, "input", "Lkotlinx/serialization/protobuf/internal/ByteArrayInput;", "<init>", "(Lkotlinx/serialization/protobuf/internal/ByteArrayInput;)V", "currentId", b.f42142b, "currentType", "Lkotlinx/serialization/protobuf/internal/ProtoWireType;", "pushBack", b.f42142b, "pushBackHeader", "eof", "getEof", "()Z", "readTag", "updateIdAndType", "header", "pushBackTag", b.f42142b, "skipElement", "assertWireType", "expected", "readByteArray", b.f42142b, "skipSizeDelimited", "readByteArrayNoTag", "objectInput", "objectTaglessInput", "readInt", "format", "Lkotlinx/serialization/protobuf/ProtoIntegerType;", "readInt32NoTag", "readLong", b.f42142b, "readLongNoTag", "readFloat", b.f42142b, "readFloatNoTag", "readIntLittleEndian", "readLongLittleEndian", "readDouble", b.f42142b, "readDoubleNoTag", "readString", b.f42142b, "readStringNoTag", "checkLength", "length", "decode32", "decode64", "decodeSignedVarintInt", "decodeSignedVarintLong", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ProtobufReader {

    @JvmField
    public int currentId;

    @JvmField
    @NotNull
    public ProtoWireType currentType;

    @NotNull
    private final ByteArrayInput input;
    private boolean pushBack;
    private int pushBackHeader;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[ProtoWireType.values().length];
            try {
                iArr[ProtoWireType.VARINT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[ProtoWireType.i64.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[ProtoWireType.SIZE_DELIMITED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[ProtoWireType.i32.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[ProtoIntegerType.values().length];
            try {
                iArr2[ProtoIntegerType.DEFAULT.ordinal()] = 1;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr2[ProtoIntegerType.SIGNED.ordinal()] = 2;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr2[ProtoIntegerType.FIXED.ordinal()] = 3;
            } catch (NoSuchFieldError unused7) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    public ProtobufReader(@NotNull ByteArrayInput input) {
        Intrinsics.g(input, "input");
        this.input = input;
        this.currentId = -1;
        this.currentType = ProtoWireType.INVALID;
    }

    private final void assertWireType(ProtoWireType expected) {
        if (this.currentType == expected) {
            return;
        }
        throw new ProtobufDecodingException("Expected wire type " + expected + ", but found " + this.currentType, null, 2, null);
    }

    private final void checkLength(int length) {
        if (length < 0) {
            throw new ProtobufDecodingException(c0.h(length, "Unexpected negative length: "), null, 2, null);
        }
    }

    private final int decode32(ProtoIntegerType format) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[format.ordinal()];
        if (i5 == 1) {
            return (int) this.input.readVarint64(false);
        }
        if (i5 == 2) {
            return decodeSignedVarintInt(this.input);
        }
        if (i5 == 3) {
            return readIntLittleEndian();
        }
        throw new NoWhenBranchMatchedException();
    }

    public static /* synthetic */ int decode32$default(ProtobufReader protobufReader, ProtoIntegerType protoIntegerType, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            protoIntegerType = ProtoIntegerType.DEFAULT;
        }
        return protobufReader.decode32(protoIntegerType);
    }

    private final long decode64(ProtoIntegerType format) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[format.ordinal()];
        if (i5 == 1) {
            return this.input.readVarint64(false);
        }
        if (i5 == 2) {
            return decodeSignedVarintLong(this.input);
        }
        if (i5 == 3) {
            return readLongLittleEndian();
        }
        throw new NoWhenBranchMatchedException();
    }

    public static /* synthetic */ long decode64$default(ProtobufReader protobufReader, ProtoIntegerType protoIntegerType, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            protoIntegerType = ProtoIntegerType.DEFAULT;
        }
        return protobufReader.decode64(protoIntegerType);
    }

    private final int decodeSignedVarintInt(ByteArrayInput input) {
        int varint32 = input.readVarint32();
        return (varint32 & Integer.MIN_VALUE) ^ ((((varint32 << 31) >> 31) ^ varint32) >> 1);
    }

    private final long decodeSignedVarintLong(ByteArrayInput input) {
        long varint64 = input.readVarint64(false);
        return (varint64 & Long.MIN_VALUE) ^ ((((varint64 << 63) >> 63) ^ varint64) >> 1);
    }

    private final int readIntLittleEndian() {
        int i5 = 0;
        for (int i11 = 0; i11 < 4; i11++) {
            i5 |= (this.input.read() & 255) << (i11 * 8);
        }
        return i5;
    }

    private final long readLongLittleEndian() {
        long j11 = 0;
        for (int i5 = 0; i5 < 8; i5++) {
            j11 |= (this.input.read() & 255) << (i5 * 8);
        }
        return j11;
    }

    private final int updateIdAndType(int header) {
        if (header == -1) {
            this.currentId = -1;
            this.currentType = ProtoWireType.INVALID;
            return -1;
        }
        this.currentId = header >>> 3;
        this.currentType = ProtoWireType.INSTANCE.fromLeastSignificantBits(header);
        return this.currentId;
    }

    public final boolean getEof() {
        return !this.pushBack && this.input.getAvailableBytes() == 0;
    }

    @NotNull
    public final ByteArrayInput objectInput() {
        ProtoWireType protoWireType = ProtoWireType.SIZE_DELIMITED;
        if (this.currentType == protoWireType) {
            return objectTaglessInput();
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    @NotNull
    public final ByteArrayInput objectTaglessInput() {
        int iDecode32$default = decode32$default(this, null, 1, null);
        checkLength(iDecode32$default);
        return this.input.slice(iDecode32$default);
    }

    public final void pushBackTag() {
        this.pushBack = true;
        int typeId = (this.currentId << 3) | this.currentType.getTypeId();
        updateIdAndType(this.pushBackHeader);
        this.pushBackHeader = typeId;
    }

    @NotNull
    public final byte[] readByteArray() {
        ProtoWireType protoWireType = ProtoWireType.SIZE_DELIMITED;
        if (this.currentType == protoWireType) {
            return readByteArrayNoTag();
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    @NotNull
    public final byte[] readByteArrayNoTag() {
        int iDecode32$default = decode32$default(this, null, 1, null);
        checkLength(iDecode32$default);
        return this.input.readExactNBytes(iDecode32$default);
    }

    public final double readDouble() {
        ProtoWireType protoWireType = ProtoWireType.i64;
        if (this.currentType == protoWireType) {
            DoubleCompanionObject doubleCompanionObject = DoubleCompanionObject.f71854a;
            return Double.longBitsToDouble(readLongLittleEndian());
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    public final double readDoubleNoTag() {
        DoubleCompanionObject doubleCompanionObject = DoubleCompanionObject.f71854a;
        return Double.longBitsToDouble(readLongLittleEndian());
    }

    public final float readFloat() {
        ProtoWireType protoWireType = ProtoWireType.i32;
        if (this.currentType == protoWireType) {
            FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
            return Float.intBitsToFloat(readIntLittleEndian());
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    public final float readFloatNoTag() {
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        return Float.intBitsToFloat(readIntLittleEndian());
    }

    public final int readInt(@NotNull ProtoIntegerType format) {
        Intrinsics.g(format, "format");
        ProtoWireType protoWireType = format == ProtoIntegerType.FIXED ? ProtoWireType.i32 : ProtoWireType.VARINT;
        if (this.currentType == protoWireType) {
            return decode32(format);
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    public final int readInt32NoTag() {
        return decode32$default(this, null, 1, null);
    }

    public final long readLong(@NotNull ProtoIntegerType format) {
        Intrinsics.g(format, "format");
        ProtoWireType protoWireType = format == ProtoIntegerType.FIXED ? ProtoWireType.i64 : ProtoWireType.VARINT;
        if (this.currentType == protoWireType) {
            return decode64(format);
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    public final long readLongNoTag() {
        return decode64(ProtoIntegerType.DEFAULT);
    }

    @NotNull
    public final String readString() {
        ProtoWireType protoWireType = ProtoWireType.SIZE_DELIMITED;
        if (this.currentType == protoWireType) {
            int iDecode32$default = decode32$default(this, null, 1, null);
            checkLength(iDecode32$default);
            return this.input.readString(iDecode32$default);
        }
        throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
    }

    @NotNull
    public final String readStringNoTag() {
        int iDecode32$default = decode32$default(this, null, 1, null);
        checkLength(iDecode32$default);
        return this.input.readString(iDecode32$default);
    }

    public final int readTag() {
        if (!this.pushBack) {
            this.pushBackHeader = (this.currentId << 3) | this.currentType.getTypeId();
            return updateIdAndType((int) this.input.readVarint64(true));
        }
        this.pushBack = false;
        int typeId = (this.currentId << 3) | this.currentType.getTypeId();
        int iUpdateIdAndType = updateIdAndType(this.pushBackHeader);
        this.pushBackHeader = typeId;
        return iUpdateIdAndType;
    }

    public final void skipElement() {
        int i5 = WhenMappings.$EnumSwitchMapping$0[this.currentType.ordinal()];
        if (i5 == 1) {
            readInt(ProtoIntegerType.DEFAULT);
            return;
        }
        if (i5 == 2) {
            readLong(ProtoIntegerType.FIXED);
            return;
        }
        if (i5 == 3) {
            skipSizeDelimited();
        } else if (i5 == 4) {
            readInt(ProtoIntegerType.FIXED);
        } else {
            throw new ProtobufDecodingException("Unsupported start group or end group wire type: " + this.currentType, null, 2, null);
        }
    }

    public final void skipSizeDelimited() {
        ProtoWireType protoWireType = ProtoWireType.SIZE_DELIMITED;
        if (this.currentType == protoWireType) {
            int iDecode32$default = decode32$default(this, null, 1, null);
            checkLength(iDecode32$default);
            this.input.skipExactNBytes(iDecode32$default);
        } else {
            throw new ProtobufDecodingException("Expected wire type " + protoWireType + ", but found " + this.currentType, null, 2, null);
        }
    }
}
