package com.squareup.wire;

import defpackage.ay0;
import defpackage.b09;
import defpackage.dm2;
import defpackage.gy2;
import defpackage.h21;
import defpackage.ik4;
import defpackage.k80;
import defpackage.kz0;
import defpackage.lg8;
import defpackage.tuc;
import defpackage.ygf;
import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b\u000b\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\r\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u000f\u0010\nJ\u0017\u0010\u0011\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0011\u0010\u000eJ\u000f\u0010\u0012\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0012\u0010\nJ\u0017\u0010\u0014\u001a\u00020\f2\u0006\u0010\u0013\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0014\u0010\u000eJ\u0017\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0013\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u0017\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0002¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u001e\u0010\nJ\u000f\u0010 \u001a\u00020\u001fH\u0002¢\u0006\u0004\b \u0010!J\u000f\u0010#\u001a\u00020\"H\u0016¢\u0006\u0004\b#\u0010$J\u000f\u0010%\u001a\u00020\u0004H\u0016¢\u0006\u0004\b%\u0010\nJ\u0017\u0010'\u001a\u00020\u00152\u0006\u0010&\u001a\u00020\u0004H\u0016¢\u0006\u0004\b'\u0010\u0017J\u000f\u0010(\u001a\u00020\u0004H\u0016¢\u0006\u0004\b(\u0010\nJ\u000f\u0010)\u001a\u00020\u0004H\u0016¢\u0006\u0004\b)\u0010\nJ\u0011\u0010+\u001a\u0004\u0018\u00010*H\u0016¢\u0006\u0004\b+\u0010,J\u000f\u0010\u0014\u001a\u00020\fH\u0016¢\u0006\u0004\b\u0014\u0010-J\u000f\u0010.\u001a\u00020\u0015H\u0016¢\u0006\u0004\b.\u0010/J\u000f\u00101\u001a\u000200H\u0016¢\u0006\u0004\b1\u00102J\u000f\u00103\u001a\u00020\u0018H\u0016¢\u0006\u0004\b3\u00104J\u000f\u00105\u001a\u00020\u0004H\u0016¢\u0006\u0004\b5\u0010\nJ\u000f\u00106\u001a\u00020\u001fH\u0016¢\u0006\u0004\b6\u0010!J\u000f\u00107\u001a\u00020\u0004H\u0016¢\u0006\u0004\b7\u0010\nJ\u000f\u00108\u001a\u00020\u001fH\u0016¢\u0006\u0004\b8\u0010!J\u0017\u0010:\u001a\u00020\f2\u0006\u00109\u001a\u00020\u0004H\u0016¢\u0006\u0004\b:\u0010\u000eJ)\u0010=\u001a\u00020\f2\u0006\u00109\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020*2\b\u0010<\u001a\u0004\u0018\u00010;H\u0016¢\u0006\u0004\b=\u0010>J\u000f\u0010?\u001a\u00020\u0004H\u0016¢\u0006\u0004\b?\u0010\nR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010@R\u0016\u0010\u0005\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0005\u0010AR\u0016\u0010\u0006\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010AR\u0016\u0010B\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bB\u0010AR\u0016\u0010C\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bC\u0010AR\u0016\u00109\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b9\u0010AR\u0016\u0010D\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bD\u0010AR\u0018\u0010E\u001a\u0004\u0018\u00010*8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bE\u0010FR\u001a\u0010I\u001a\b\u0012\u0004\u0012\u00020H0G8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bI\u0010JR\u0018\u0010L\u001a\u0004\u0018\u00010K8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bL\u0010M¨\u0006N"}, d2 = {"Lcom/squareup/wire/ByteArrayProtoReader32;", "Lcom/squareup/wire/ProtoReader32;", "", "source", "", "pos", "limit", "<init>", "([BII)V", "internalNextLengthDelimited", "()I", "expectedEndTag", "Lc1e;", "skipGroup", "(I)V", "internalReadVarint32", "fieldEncoding", "afterPackableScalar", "beforeLengthDelimitedScalar", "byteCount", "skip", "Lh21;", "readByteString", "(I)Lh21;", "", "readUtf8", "(I)Ljava/lang/String;", "", "readByte", "()B", "readIntLe", "", "readLongLe", "()J", "Lcom/squareup/wire/ProtoReader;", "asProtoReader", "()Lcom/squareup/wire/ProtoReader;", "beginMessage", "token", "endMessageAndGetUnknownFields", "nextLengthDelimited", "nextTag", "Lcom/squareup/wire/FieldEncoding;", "peekFieldEncoding", "()Lcom/squareup/wire/FieldEncoding;", "()V", "readBytes", "()Lh21;", "", "beforePossiblyPackedScalar", "()Z", "readString", "()Ljava/lang/String;", "readVarint32", "readVarint64", "readFixed32", "readFixed64", "tag", "readUnknownField", "", "value", "addUnknownField", "(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)V", "nextFieldMinLengthInBytes", "[B", "I", "recursionDepth", "state", "pushedLimit", "nextFieldEncoding", "Lcom/squareup/wire/FieldEncoding;", "", "Lkz0;", "bufferStack", "Ljava/util/List;", "Lcom/squareup/wire/ProtoReader32AsProtoReader;", "protoReader", "Lcom/squareup/wire/ProtoReader32AsProtoReader;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ByteArrayProtoReader32 implements ProtoReader32 {
    private final List<kz0> bufferStack;
    private int limit;
    private FieldEncoding nextFieldEncoding;
    private int pos;
    private ProtoReader32AsProtoReader protoReader;
    private int pushedLimit;
    private int recursionDepth;
    private final byte[] source;
    private int state;
    private int tag;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 0, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[FieldEncoding.values().length];
            try {
                iArr[FieldEncoding.LENGTH_DELIMITED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[FieldEncoding.FIXED32.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[FieldEncoding.FIXED64.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[FieldEncoding.VARINT.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public ByteArrayProtoReader32(byte[] bArr, int i, int i2) {
        bArr.getClass();
        this.source = bArr;
        this.pos = i;
        this.limit = i2;
        this.state = 2;
        this.tag = -1;
        this.pushedLimit = -1;
        this.bufferStack = new ArrayList();
    }

    private final void afterPackableScalar(int fieldEncoding) throws IOException {
        if (this.state == fieldEncoding) {
            this.state = 6;
            return;
        }
        int i = this.pos;
        int i2 = this.limit;
        if (i <= i2) {
            if (i != i2) {
                this.state = 7;
                return;
            }
            this.limit = this.pushedLimit;
            this.pushedLimit = -1;
            this.state = 6;
            return;
        }
        throw new IOException("Expected to end at " + this.limit + " but was " + this.pos);
    }

    private final int beforeLengthDelimitedScalar() throws ProtocolException {
        if (this.state != 2) {
            throw new ProtocolException("Expected LENGTH_DELIMITED but was " + this.state);
        }
        int i = this.limit - this.pos;
        this.state = 6;
        this.limit = this.pushedLimit;
        this.pushedLimit = -1;
        return i;
    }

    private final int internalNextLengthDelimited() throws ProtocolException, EOFException {
        this.nextFieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        this.state = 2;
        int iInternalReadVarint32 = internalReadVarint32();
        if (iInternalReadVarint32 < 0) {
            throw new ProtocolException(b09.w(iInternalReadVarint32, "Negative length: "));
        }
        if (this.pushedLimit != -1) {
            lg8.d();
            return 0;
        }
        int i = this.limit;
        this.pushedLimit = i;
        int i2 = this.pos + iInternalReadVarint32;
        this.limit = i2;
        if (i2 <= i) {
            return iInternalReadVarint32;
        }
        ay0.b();
        return 0;
    }

    private final int internalReadVarint32() throws ProtocolException, EOFException {
        byte b = readByte();
        if (b >= 0) {
            return b;
        }
        int i = b & 127;
        byte b2 = readByte();
        if (b2 >= 0) {
            return (b2 << 7) | i;
        }
        int i2 = i | ((b2 & 127) << 7);
        byte b3 = readByte();
        if (b3 >= 0) {
            return (b3 << 14) | i2;
        }
        int i3 = i2 | ((b3 & 127) << 14);
        byte b4 = readByte();
        if (b4 >= 0) {
            return (b4 << 21) | i3;
        }
        int i4 = i3 | ((b4 & 127) << 21);
        byte b5 = readByte();
        int i5 = i4 | (b5 << 28);
        if (b5 < 0) {
            for (int i6 = 0; i6 < 5; i6++) {
                if (readByte() < 0) {
                }
            }
            lg8.k("Malformed VARINT");
            return 0;
        }
        return i5;
    }

    private final byte readByte() throws EOFException {
        int i = this.pos;
        if (i == this.limit) {
            ay0.b();
            return (byte) 0;
        }
        byte[] bArr = this.source;
        this.pos = i + 1;
        return bArr[i];
    }

    private final h21 readByteString(int byteCount) throws EOFException {
        int i = this.pos;
        int i2 = i + byteCount;
        if (i2 > this.limit) {
            ay0.b();
            return null;
        }
        h21 h21Var = h21.d;
        byte[] bArr = this.source;
        bArr.getClass();
        if (byteCount == -1234567890) {
            byteCount = bArr.length;
        }
        dm2.A(bArr.length, i, byteCount);
        h21 h21Var2 = new h21(k80.l0(bArr, i, byteCount + i));
        this.pos = i2;
        return h21Var2;
    }

    private final int readIntLe() throws EOFException {
        int i = this.pos;
        if (i + 4 > this.limit) {
            ay0.b();
            return 0;
        }
        byte[] bArr = this.source;
        int i2 = i + 1;
        this.pos = i2;
        int i3 = bArr[i] & 255;
        int i4 = i + 2;
        this.pos = i4;
        int i5 = ((bArr[i2] & 255) << 8) | i3;
        int i6 = i + 3;
        this.pos = i6;
        int i7 = i5 | ((bArr[i4] & 255) << 16);
        this.pos = i + 4;
        return ((bArr[i6] & 255) << 24) | i7;
    }

    private final long readLongLe() throws EOFException {
        int i = this.pos;
        if (i + 8 > this.limit) {
            ay0.b();
            return 0L;
        }
        byte[] bArr = this.source;
        int i2 = i + 1;
        this.pos = i2;
        long j = ((long) bArr[i]) & 255;
        int i3 = i + 2;
        this.pos = i3;
        long j2 = j | ((((long) bArr[i2]) & 255) << 8);
        int i4 = i + 3;
        this.pos = i4;
        long j3 = j2 | ((((long) bArr[i3]) & 255) << 16);
        int i5 = i + 4;
        this.pos = i5;
        long j4 = j3 | ((((long) bArr[i4]) & 255) << 24);
        int i6 = i + 5;
        this.pos = i6;
        long j5 = j4 | ((((long) bArr[i5]) & 255) << 32);
        int i7 = i + 6;
        this.pos = i7;
        long j6 = j5 | ((((long) bArr[i6]) & 255) << 40);
        int i8 = i + 7;
        this.pos = i8;
        long j7 = j6 | ((((long) bArr[i7]) & 255) << 48);
        this.pos = i + 8;
        return ((((long) bArr[i8]) & 255) << 56) | j7;
    }

    private final String readUtf8(int byteCount) throws EOFException {
        int i = this.pos;
        int i2 = byteCount + i;
        if (i2 > this.limit) {
            ay0.b();
            return null;
        }
        String strE = tuc.E(i, i2, 4, this.source);
        this.pos = i2;
        return strE;
    }

    private final void skipGroup(int expectedEndTag) throws IOException {
        while (this.pos < this.limit) {
            int iInternalReadVarint32 = internalReadVarint32();
            if (iInternalReadVarint32 == 0) {
                lg8.k("Unexpected tag 0");
                return;
            }
            int i = iInternalReadVarint32 >> 3;
            int i2 = iInternalReadVarint32 & 7;
            if (i2 == 0) {
                this.state = 0;
                readVarint64();
            } else if (i2 == 1) {
                this.state = 1;
                readFixed64();
            } else if (i2 == 2) {
                skip(internalReadVarint32());
            } else {
                if (i2 == 3) {
                    int i3 = this.recursionDepth + 1;
                    this.recursionDepth = i3;
                    if (i3 > 100) {
                        throw new IOException("Wire recursion limit exceeded");
                    }
                    try {
                        skipGroup(i);
                    } finally {
                    }
                    this.recursionDepth--;
                }
                if (i2 == 4) {
                    if (i == expectedEndTag) {
                        return;
                    }
                    lg8.k("Unexpected end group");
                    return;
                } else {
                    if (i2 != 5) {
                        throw new ProtocolException(b09.w(i2, "Unexpected field encoding: "));
                    }
                    this.state = 5;
                    readFixed32();
                }
            }
        }
        ay0.b();
    }

    @Override // com.squareup.wire.ProtoReader32
    public final void addUnknownField(int tag, FieldEncoding fieldEncoding, Object value) {
        fieldEncoding.getClass();
        ProtoWriter protoWriter = new ProtoWriter(this.bufferStack.get(this.recursionDepth - 1));
        ProtoAdapter<?> protoAdapterRawProtoAdapter = fieldEncoding.rawProtoAdapter();
        protoAdapterRawProtoAdapter.getClass();
        protoAdapterRawProtoAdapter.encodeWithTag(protoWriter, tag, value);
    }

    @Override // com.squareup.wire.ProtoReader32
    public final ProtoReader asProtoReader() {
        ProtoReader32AsProtoReader protoReader32AsProtoReader = this.protoReader;
        if (protoReader32AsProtoReader != null) {
            return protoReader32AsProtoReader;
        }
        ProtoReader32AsProtoReader protoReader32AsProtoReader2 = new ProtoReader32AsProtoReader(this);
        this.protoReader = protoReader32AsProtoReader2;
        return protoReader32AsProtoReader2;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final boolean beforePossiblyPackedScalar() throws ProtocolException {
        int i = this.state;
        if (i != 0 && i != 1) {
            if (i == 2) {
                if (this.pos < this.limit) {
                    return true;
                }
                this.limit = this.pushedLimit;
                this.pushedLimit = -1;
                this.state = 6;
                return false;
            }
            if (i != 5) {
                throw new ProtocolException("unexpected state: " + this.state);
            }
        }
        return true;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int beginMessage() throws IOException {
        if (this.state != 2) {
            ygf.f("Unexpected call to beginMessage()");
            return 0;
        }
        int i = this.recursionDepth + 1;
        this.recursionDepth = i;
        if (i > 100) {
            ik4.g("Wire recursion limit exceeded");
            return 0;
        }
        if (i > this.bufferStack.size()) {
            this.bufferStack.add(new kz0());
        }
        int i2 = this.pushedLimit;
        this.pushedLimit = -1;
        this.state = 6;
        return i2;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final h21 endMessageAndGetUnknownFields(int token) throws IOException {
        if (this.state != 6) {
            ygf.f("Unexpected call to endMessage()");
            return null;
        }
        int i = this.recursionDepth - 1;
        this.recursionDepth = i;
        if (i < 0 || this.pushedLimit != -1) {
            ygf.f("No corresponding call to beginMessage()");
            return null;
        }
        if (this.pos == this.limit || i == 0) {
            this.limit = token;
            kz0 kz0Var = this.bufferStack.get(i);
            long j = kz0Var.b;
            return j > 0 ? kz0Var.r(j) : h21.d;
        }
        throw new IOException("Expected to end at " + this.limit + " but was " + this.pos);
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int nextFieldMinLengthInBytes() {
        FieldEncoding fieldEncoding = this.nextFieldEncoding;
        int i = fieldEncoding == null ? -1 : WhenMappings.$EnumSwitchMapping$0[fieldEncoding.ordinal()];
        if (i == -1) {
            ygf.f("nextFieldEncoding is not set");
            return 0;
        }
        if (i == 1) {
            return this.limit - this.pos;
        }
        if (i == 2) {
            return 4;
        }
        if (i == 3) {
            return 8;
        }
        if (i == 4) {
            return 1;
        }
        ygf.a();
        return 0;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int nextLengthDelimited() {
        int i = this.state;
        if (i == 6 || i == 2) {
            return internalNextLengthDelimited();
        }
        ygf.f("Unexpected call to nextDelimited()");
        return 0;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int nextTag() throws IOException {
        int i = this.state;
        if (i == 7) {
            this.state = 2;
            return this.tag;
        }
        if (i != 6) {
            ygf.f("Unexpected call to nextTag()");
            return 0;
        }
        while (this.pos < this.limit) {
            int iInternalReadVarint32 = internalReadVarint32();
            if (iInternalReadVarint32 == 0) {
                lg8.k("Unexpected tag 0");
                return 0;
            }
            int i2 = iInternalReadVarint32 >> 3;
            this.tag = i2;
            int i3 = iInternalReadVarint32 & 7;
            if (i3 == 0) {
                this.nextFieldEncoding = FieldEncoding.VARINT;
                this.state = 0;
                return i2;
            }
            if (i3 == 1) {
                this.nextFieldEncoding = FieldEncoding.FIXED64;
                this.state = 1;
                return i2;
            }
            if (i3 == 2) {
                internalNextLengthDelimited();
                return this.tag;
            }
            if (i3 != 3) {
                if (i3 == 4) {
                    lg8.k("Unexpected end group");
                    return 0;
                }
                if (i3 != 5) {
                    throw new ProtocolException(b09.w(i3, "Unexpected field encoding: "));
                }
                this.nextFieldEncoding = FieldEncoding.FIXED32;
                this.state = 5;
                return i2;
            }
            skipGroup(i2);
        }
        return -1;
    }

    @Override // com.squareup.wire.ProtoReader32
    /* JADX INFO: renamed from: peekFieldEncoding, reason: from getter */
    public final FieldEncoding getNextFieldEncoding() {
        return this.nextFieldEncoding;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final h21 readBytes() {
        return readByteString(beforeLengthDelimitedScalar());
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int readFixed32() throws IOException {
        int i = this.state;
        if (i == 5 || i == 2) {
            int intLe = readIntLe();
            afterPackableScalar(5);
            return intLe;
        }
        throw new ProtocolException("Expected FIXED32 or LENGTH_DELIMITED but was " + this.state);
    }

    @Override // com.squareup.wire.ProtoReader32
    public final long readFixed64() throws IOException {
        int i = this.state;
        if (i == 1 || i == 2) {
            long longLe = readLongLe();
            afterPackableScalar(1);
            return longLe;
        }
        throw new ProtocolException("Expected FIXED64 or LENGTH_DELIMITED but was " + this.state);
    }

    @Override // com.squareup.wire.ProtoReader32
    public final String readString() {
        return readUtf8(beforeLengthDelimitedScalar());
    }

    @Override // com.squareup.wire.ProtoReader32
    public final void readUnknownField(int tag) {
        FieldEncoding fieldEncoding = this.nextFieldEncoding;
        fieldEncoding.getClass();
        addUnknownField(tag, fieldEncoding, fieldEncoding.rawProtoAdapter().decode(this));
    }

    @Override // com.squareup.wire.ProtoReader32
    public final int readVarint32() throws IOException {
        int i = this.state;
        if (i == 0 || i == 2) {
            int iInternalReadVarint32 = internalReadVarint32();
            afterPackableScalar(0);
            return iInternalReadVarint32;
        }
        throw new ProtocolException("Expected VARINT or LENGTH_DELIMITED but was " + this.state);
    }

    @Override // com.squareup.wire.ProtoReader32
    public final long readVarint64() throws IOException {
        int i = this.state;
        if (i != 0 && i != 2) {
            throw new ProtocolException("Expected VARINT or LENGTH_DELIMITED but was " + this.state);
        }
        long j = 0;
        for (int i2 = 0; i2 < 64; i2 += 7) {
            byte b = readByte();
            j |= ((long) (b & 127)) << i2;
            if ((b & 128) == 0) {
                afterPackableScalar(0);
                return j;
            }
        }
        lg8.k("WireInput encountered a malformed varint");
        return 0L;
    }

    @Override // com.squareup.wire.ProtoReader32
    public final void skip() throws IOException {
        int i = this.state;
        if (i == 0) {
            readVarint64();
            return;
        }
        if (i == 1) {
            readFixed64();
            return;
        }
        if (i == 2) {
            skip(beforeLengthDelimitedScalar());
        } else if (i == 5) {
            readFixed32();
        } else {
            ygf.f("Unexpected call to skip()");
        }
    }

    public /* synthetic */ ByteArrayProtoReader32(byte[] bArr, int i, int i2, int i3, gy2 gy2Var) {
        this(bArr, (i3 & 2) != 0 ? 0 : i, (i3 & 4) != 0 ? bArr.length : i2);
    }

    private final void skip(int byteCount) throws EOFException {
        int i = this.pos + byteCount;
        if (i <= this.limit) {
            this.pos = i;
        } else {
            ay0.b();
        }
    }
}
