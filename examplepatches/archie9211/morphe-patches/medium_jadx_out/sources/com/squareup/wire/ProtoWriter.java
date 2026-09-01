package com.squareup.wire;

import defpackage.gy2;
import defpackage.h21;
import defpackage.xz0;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0007\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u0015\u0010\f\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ\u001d\u0010\u0012\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u000eH\u0000¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u000e¢\u0006\u0004\b\u0017\u0010\u0015J\u0015\u0010\u0019\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0018¢\u0006\u0004\b\u0019\u0010\u001aJ\u0015\u0010\u001b\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u000e¢\u0006\u0004\b\u001b\u0010\u0015J\u0015\u0010\u001c\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0018¢\u0006\u0004\b\u001c\u0010\u001aR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001d¨\u0006\u001f"}, d2 = {"Lcom/squareup/wire/ProtoWriter;", "", "Lxz0;", "sink", "<init>", "(Lxz0;)V", "Lh21;", "value", "Lc1e;", "writeBytes", "(Lh21;)V", "", "writeString", "(Ljava/lang/String;)V", "", "fieldNumber", "Lcom/squareup/wire/FieldEncoding;", "fieldEncoding", "writeTag", "(ILcom/squareup/wire/FieldEncoding;)V", "writeSignedVarint32$wire_runtime", "(I)V", "writeSignedVarint32", "writeVarint32", "", "writeVarint64", "(J)V", "writeFixed32", "writeFixed64", "Lxz0;", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ProtoWriter {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private final xz0 sink;

    public ProtoWriter(xz0 xz0Var) {
        xz0Var.getClass();
        this.sink = xz0Var;
    }

    public final void writeBytes(h21 value) {
        value.getClass();
        this.sink.C0(value);
    }

    public final void writeFixed32(int value) {
        this.sink.F(value);
    }

    public final void writeFixed64(long value) {
        this.sink.A(value);
    }

    public final void writeSignedVarint32$wire_runtime(int value) {
        if (value >= 0) {
            writeVarint32(value);
        } else {
            writeVarint64(value);
        }
    }

    public final void writeString(String value) {
        value.getClass();
        this.sink.Y(value);
    }

    public final void writeTag(int fieldNumber, FieldEncoding fieldEncoding) {
        fieldEncoding.getClass();
        writeVarint32(INSTANCE.makeTag$wire_runtime(fieldNumber, fieldEncoding));
    }

    public final void writeVarint32(int value) {
        while (true) {
            int i = value & (-128);
            xz0 xz0Var = this.sink;
            if (i == 0) {
                xz0Var.writeByte(value);
                return;
            } else {
                xz0Var.writeByte((value & 127) | 128);
                value >>>= 7;
            }
        }
    }

    public final void writeVarint64(long value) {
        while (true) {
            long j = (-128) & value;
            xz0 xz0Var = this.sink;
            if (j == 0) {
                xz0Var.writeByte((int) value);
                return;
            } else {
                xz0Var.writeByte((((int) value) & 127) | 128);
                value >>>= 7;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\t\n\u0002\b\u000b\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001d\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0000¢\u0006\u0002\b\tJ\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\fJ\u0015\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\u000fJ\u0015\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\u0011J\u0015\u0010\u0012\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u0013H\u0000¢\u0006\u0002\b\u0014J\u0015\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\u0017J\u0015\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0016\u001a\u00020\u0005H\u0000¢\u0006\u0002\b\u0019J\u0015\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0013H\u0000¢\u0006\u0002\b\u001bJ\u0015\u0010\u001c\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0013H\u0000¢\u0006\u0002\b\u001d¨\u0006\u001e"}, d2 = {"Lcom/squareup/wire/ProtoWriter$Companion;", "", "<init>", "()V", "makeTag", "", "fieldNumber", "fieldEncoding", "Lcom/squareup/wire/FieldEncoding;", "makeTag$wire_runtime", "tagSize", "tag", "tagSize$wire_runtime", "int32Size", "value", "int32Size$wire_runtime", "varint32Size", "varint32Size$wire_runtime", "varint64Size", "", "varint64Size$wire_runtime", "encodeZigZag32", "n", "encodeZigZag32$wire_runtime", "decodeZigZag32", "decodeZigZag32$wire_runtime", "encodeZigZag64", "encodeZigZag64$wire_runtime", "decodeZigZag64", "decodeZigZag64$wire_runtime", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final int decodeZigZag32$wire_runtime(int n) {
            return (n >>> 1) ^ (-(n & 1));
        }

        public final long decodeZigZag64$wire_runtime(long n) {
            return (-(n & 1)) ^ (n >>> 1);
        }

        public final int encodeZigZag32$wire_runtime(int n) {
            return (n << 1) ^ (n >> 31);
        }

        public final long encodeZigZag64$wire_runtime(long n) {
            return (n >> 63) ^ (n << 1);
        }

        public final int int32Size$wire_runtime(int value) {
            if (value >= 0) {
                return varint32Size$wire_runtime(value);
            }
            return 10;
        }

        public final int makeTag$wire_runtime(int fieldNumber, FieldEncoding fieldEncoding) {
            fieldEncoding.getClass();
            return (fieldNumber << 3) | fieldEncoding.getValue();
        }

        public final int tagSize$wire_runtime(int tag) {
            return varint32Size$wire_runtime(makeTag$wire_runtime(tag, FieldEncoding.VARINT));
        }

        public final int varint32Size$wire_runtime(int value) {
            if ((value & (-128)) == 0) {
                return 1;
            }
            if ((value & (-16384)) == 0) {
                return 2;
            }
            if (((-2097152) & value) == 0) {
                return 3;
            }
            return ((-268435456) & value) == 0 ? 4 : 5;
        }

        public final int varint64Size$wire_runtime(long value) {
            if (((-128) & value) == 0) {
                return 1;
            }
            if (((-16384) & value) == 0) {
                return 2;
            }
            if (((-2097152) & value) == 0) {
                return 3;
            }
            if (((-268435456) & value) == 0) {
                return 4;
            }
            if (((-34359738368L) & value) == 0) {
                return 5;
            }
            if (((-4398046511104L) & value) == 0) {
                return 6;
            }
            if (((-562949953421312L) & value) == 0) {
                return 7;
            }
            if (((-72057594037927936L) & value) == 0) {
                return 8;
            }
            return (value & Long.MIN_VALUE) == 0 ? 9 : 10;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
