package com.squareup.wire;

import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import defpackage.b09;
import defpackage.gy2;
import defpackage.h21;
import defpackage.hz0;
import defpackage.i5b;
import defpackage.iwb;
import defpackage.kz0;
import defpackage.lg9;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.x45;
import defpackage.xz0;
import defpackage.ygf;
import defpackage.yw6;
import defpackage.ywb;
import java.io.EOFException;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0012\n\u0002\b\u0012\u0018\u0000 @2\u00020\u0001:\u0001@B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\t\u0010\u0003J\u0015\u0010\f\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ#\u0010\u0013\u001a\u00020\u00062\u0012\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00060\u000eH\u0000¢\u0006\u0004\b\u0011\u0010\u0012J\u0015\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0018¢\u0006\u0004\b\u0019\u0010\u001aJ\u001d\u0010\u001e\u001a\u00020\u00062\u0006\u0010\u001b\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u001c¢\u0006\u0004\b\u001e\u0010\u001fJ\u0017\u0010!\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0004H\u0000¢\u0006\u0004\b \u0010\bJ\u0015\u0010\"\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0004¢\u0006\u0004\b\"\u0010\bJ\u0015\u0010$\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020#¢\u0006\u0004\b$\u0010%J\u0015\u0010&\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0004¢\u0006\u0004\b&\u0010\bJ\u0015\u0010'\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020#¢\u0006\u0004\b'\u0010%R\u0016\u0010)\u001a\u00020(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b)\u0010*R\u0016\u0010+\u001a\u00020(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b+\u0010*R\u0014\u0010-\u001a\u00020,8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b-\u0010.R\u0016\u00100\u001a\u00020/8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b0\u00101R\u0016\u00102\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b2\u00103R\u001b\u00108\u001a\u00020(8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b4\u00105\u001a\u0004\b6\u00107R\u001b\u0010<\u001a\u00020\u000f8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b9\u00105\u001a\u0004\b:\u0010;R\u0011\u0010?\u001a\u00020\u00048F¢\u0006\u0006\u001a\u0004\b=\u0010>¨\u0006A"}, d2 = {"Lcom/squareup/wire/ReverseProtoWriter;", "", "<init>", "()V", "", "minByteCount", "Lc1e;", "require", "(I)V", "emitCurrentSegment", "Lxz0;", "sink", "writeTo", "(Lxz0;)V", "Lkotlin/Function1;", "Lcom/squareup/wire/ProtoWriter;", "block", "writeForward$wire_runtime", "(Lx45;)V", "writeForward", "Lh21;", "value", "writeBytes", "(Lh21;)V", "", "writeString", "(Ljava/lang/String;)V", "fieldNumber", "Lcom/squareup/wire/FieldEncoding;", "fieldEncoding", "writeTag", "(ILcom/squareup/wire/FieldEncoding;)V", "writeSignedVarint32$wire_runtime", "writeSignedVarint32", "writeVarint32", "", "writeVarint64", "(J)V", "writeFixed32", "writeFixed64", "Lkz0;", "tail", "Lkz0;", "head", "Lhz0;", "cursor", "Lhz0;", "", "array", "[B", "arrayLimit", "I", "forwardBuffer$delegate", "Lvq6;", "getForwardBuffer", "()Lkz0;", "forwardBuffer", "forwardWriter$delegate", "getForwardWriter", "()Lcom/squareup/wire/ProtoWriter;", "forwardWriter", "getByteCount", "()I", "byteCount", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ReverseProtoWriter {
    private static final Companion Companion = new Companion();
    private static final byte[] EMPTY_ARRAY = new byte[0];
    private int arrayLimit;

    /* JADX INFO: renamed from: forwardBuffer$delegate, reason: from kotlin metadata */
    private final vq6 forwardBuffer;

    /* JADX INFO: renamed from: forwardWriter$delegate, reason: from kotlin metadata */
    private final vq6 forwardWriter;
    private kz0 tail = new kz0();
    private kz0 head = new kz0();
    private final hz0 cursor = new hz0();
    private byte[] array = EMPTY_ARRAY;

    public ReverseProtoWriter() {
        yw6 yw6Var = yw6.NONE;
        this.forwardBuffer = vx0.d0(yw6Var, new lg9(15));
        this.forwardWriter = vx0.d0(yw6Var, new i5b(8, this));
    }

    public static ProtoWriter a(ReverseProtoWriter reverseProtoWriter) {
        return new ProtoWriter(reverseProtoWriter.getForwardBuffer());
    }

    private final void emitCurrentSegment() throws EOFException {
        byte[] bArr = this.array;
        byte[] bArr2 = EMPTY_ARRAY;
        if (bArr == bArr2) {
            return;
        }
        this.cursor.close();
        this.head.skip(this.arrayLimit);
        this.head.J(this.tail);
        kz0 kz0Var = this.tail;
        this.tail = this.head;
        this.head = kz0Var;
        this.array = bArr2;
        this.arrayLimit = 0;
    }

    private static final kz0 forwardBuffer_delegate$lambda$0() {
        return new kz0();
    }

    private static final ProtoWriter forwardWriter_delegate$lambda$1(ReverseProtoWriter reverseProtoWriter) {
        return new ProtoWriter(reverseProtoWriter.getForwardBuffer());
    }

    private final kz0 getForwardBuffer() {
        return (kz0) this.forwardBuffer.getValue();
    }

    private final ProtoWriter getForwardWriter() {
        return (ProtoWriter) this.forwardWriter.getValue();
    }

    private final void require(int minByteCount) throws EOFException {
        if (this.arrayLimit >= minByteCount) {
            return;
        }
        emitCurrentSegment();
        this.head.T(this.cursor);
        hz0 hz0Var = this.cursor;
        hz0Var.getClass();
        if (minByteCount <= 0) {
            ywb.g(b09.w(minByteCount, "minByteCount <= 0: "));
            return;
        }
        if (minByteCount > 8192) {
            ywb.g(b09.w(minByteCount, "minByteCount > Segment.SIZE: "));
            return;
        }
        kz0 kz0Var = hz0Var.a;
        if (kz0Var == null) {
            ygf.f("not attached to a buffer");
            return;
        }
        if (!hz0Var.b) {
            ygf.f("expandBuffer() only permitted for read/write buffers");
            return;
        }
        long j = kz0Var.b;
        iwb iwbVarI0 = kz0Var.I0(minByteCount);
        int i = 8192 - iwbVarI0.c;
        iwbVarI0.c = 8192;
        kz0Var.b = ((long) i) + j;
        hz0Var.c = iwbVarI0;
        hz0Var.d = j;
        hz0Var.e = iwbVarI0.a;
        hz0Var.f = 8192 - i;
        hz0Var.g = 8192;
        hz0 hz0Var2 = this.cursor;
        if (hz0Var2.d == 0) {
            int i2 = hz0Var2.g;
            byte[] bArr = hz0Var2.e;
            bArr.getClass();
            if (i2 == bArr.length) {
                byte[] bArr2 = this.cursor.e;
                bArr2.getClass();
                this.array = bArr2;
                this.arrayLimit = this.cursor.g;
                return;
            }
        }
        ygf.f("Check failed.");
    }

    public final int getByteCount() {
        return (this.array.length - this.arrayLimit) + ((int) this.tail.b);
    }

    public final void writeBytes(h21 value) {
        value.getClass();
        int iE = value.e();
        while (iE != 0) {
            require(1);
            int iMin = Math.min(this.arrayLimit, iE);
            int i = this.arrayLimit - iMin;
            this.arrayLimit = i;
            iE -= iMin;
            value.c(iE, i, iMin, this.array);
        }
    }

    public final void writeFixed32(int value) throws EOFException {
        require(4);
        int i = this.arrayLimit;
        int i2 = i - 4;
        this.arrayLimit = i2;
        byte[] bArr = this.array;
        bArr[i2] = (byte) (value & 255);
        bArr[i - 3] = (byte) ((value >>> 8) & 255);
        bArr[i - 2] = (byte) ((value >>> 16) & 255);
        bArr[i - 1] = (byte) ((value >>> 24) & 255);
    }

    public final void writeFixed64(long value) throws EOFException {
        require(8);
        int i = this.arrayLimit;
        int i2 = i - 8;
        this.arrayLimit = i2;
        byte[] bArr = this.array;
        bArr[i2] = (byte) (value & 255);
        bArr[i - 7] = (byte) ((value >>> 8) & 255);
        bArr[i - 6] = (byte) ((value >>> 16) & 255);
        bArr[i - 5] = (byte) ((value >>> 24) & 255);
        bArr[i - 4] = (byte) ((value >>> 32) & 255);
        bArr[i - 3] = (byte) ((value >>> 40) & 255);
        bArr[i - 2] = (byte) ((value >>> 48) & 255);
        bArr[i - 1] = (byte) ((value >>> 56) & 255);
    }

    public final void writeForward$wire_runtime(x45 block) {
        block.getClass();
        block.invoke(getForwardWriter());
        kz0 forwardBuffer = getForwardBuffer();
        writeBytes(forwardBuffer.r(forwardBuffer.b));
    }

    public final void writeSignedVarint32$wire_runtime(int value) throws EOFException {
        if (value >= 0) {
            writeVarint32(value);
        } else {
            writeVarint64(value);
        }
    }

    public final void writeString(String value) throws EOFException {
        value.getClass();
        int length = value.length() - 1;
        while (length >= 0) {
            int i = length - 1;
            char cCharAt = value.charAt(length);
            if (cCharAt < 128) {
                require(1);
                int i2 = this.arrayLimit;
                byte[] bArr = this.array;
                int i3 = i2 - 1;
                bArr[i3] = (byte) cCharAt;
                int iMax = Math.max(-1, i - i3);
                int i4 = i3;
                length = i;
                while (length > iMax) {
                    char cCharAt2 = value.charAt(length);
                    if (cCharAt2 >= 128) {
                        break;
                    }
                    length--;
                    i4--;
                    bArr[i4] = (byte) cCharAt2;
                }
                this.arrayLimit = i4;
            } else {
                if (cCharAt < 2048) {
                    require(2);
                    byte[] bArr2 = this.array;
                    int i5 = this.arrayLimit;
                    int i6 = i5 - 1;
                    this.arrayLimit = i6;
                    bArr2[i6] = (byte) (128 | (cCharAt & '?'));
                    int i7 = i5 - 2;
                    this.arrayLimit = i7;
                    bArr2[i7] = (byte) ((cCharAt >> 6) | 192);
                } else if (cCharAt < 55296 || cCharAt > 57343) {
                    require(3);
                    byte[] bArr3 = this.array;
                    int i8 = this.arrayLimit;
                    int i9 = i8 - 1;
                    this.arrayLimit = i9;
                    bArr3[i9] = (byte) ((cCharAt & '?') | 128);
                    int i10 = i8 - 2;
                    this.arrayLimit = i10;
                    bArr3[i10] = (byte) (128 | (63 & (cCharAt >> 6)));
                    int i11 = i8 - 3;
                    this.arrayLimit = i11;
                    bArr3[i11] = (byte) ((cCharAt >> '\f') | CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY);
                } else {
                    char cCharAt3 = i >= 0 ? value.charAt(i) : (char) 65535;
                    if (cCharAt3 > 56319 || 56320 > cCharAt || cCharAt >= 57344) {
                        require(1);
                        byte[] bArr4 = this.array;
                        int i12 = this.arrayLimit - 1;
                        this.arrayLimit = i12;
                        bArr4[i12] = 63;
                    } else {
                        length -= 2;
                        int i13 = (((cCharAt3 & 1023) << 10) | (cCharAt & 1023)) + ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
                        require(4);
                        byte[] bArr5 = this.array;
                        int i14 = this.arrayLimit;
                        int i15 = i14 - 1;
                        this.arrayLimit = i15;
                        bArr5[i15] = (byte) ((i13 & 63) | 128);
                        int i16 = i14 - 2;
                        this.arrayLimit = i16;
                        bArr5[i16] = (byte) (((i13 >> 6) & 63) | 128);
                        int i17 = i14 - 3;
                        this.arrayLimit = i17;
                        bArr5[i17] = (byte) (128 | (63 & (i13 >> 12)));
                        int i18 = i14 - 4;
                        this.arrayLimit = i18;
                        bArr5[i18] = (byte) ((i13 >> 18) | 240);
                    }
                }
                length = i;
            }
        }
    }

    public final void writeTag(int fieldNumber, FieldEncoding fieldEncoding) {
        fieldEncoding.getClass();
        writeVarint32(ProtoWriter.INSTANCE.makeTag$wire_runtime(fieldNumber, fieldEncoding));
    }

    public final void writeTo(xz0 sink) {
        sink.getClass();
        emitCurrentSegment();
        sink.J(this.tail);
    }

    public final void writeVarint32(int value) {
        int iVarint32Size$wire_runtime = ProtoWriter.INSTANCE.varint32Size$wire_runtime(value);
        require(iVarint32Size$wire_runtime);
        int i = this.arrayLimit - iVarint32Size$wire_runtime;
        this.arrayLimit = i;
        while (true) {
            int i2 = value & (-128);
            byte[] bArr = this.array;
            if (i2 == 0) {
                bArr[i] = (byte) value;
                return;
            } else {
                bArr[i] = (byte) ((value & 127) | 128);
                value >>>= 7;
                i++;
            }
        }
    }

    public final void writeVarint64(long value) throws EOFException {
        int iVarint64Size$wire_runtime = ProtoWriter.INSTANCE.varint64Size$wire_runtime(value);
        require(iVarint64Size$wire_runtime);
        int i = this.arrayLimit - iVarint64Size$wire_runtime;
        this.arrayLimit = i;
        while (true) {
            long j = (-128) & value;
            byte[] bArr = this.array;
            if (j == 0) {
                bArr[i] = (byte) value;
                return;
            } else {
                bArr[i] = (byte) ((127 & value) | 128);
                value >>>= 7;
                i++;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Lcom/squareup/wire/ReverseProtoWriter$Companion;", "", "<init>", "()V", "EMPTY_ARRAY", "", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
