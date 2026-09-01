package com.squareup.wire;

import androidx.work.impl.yX.VrhD;
import defpackage.ay0;
import defpackage.b09;
import defpackage.h21;
import defpackage.ik4;
import defpackage.kz0;
import defpackage.lg8;
import defpackage.x45;
import defpackage.ygf;
import defpackage.z73;
import defpackage.zz0;
import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0016\u0018\u0000 G2\u00020\u0001:\u0001GB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\r\u0010\bJ\u0017\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u000f\u0010\fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0012J\u0017\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\n2\u0006\u0010\u0014\u001a\u00020\u0010H\u0007¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u001a\u0010\bJ\u000f\u0010\u001b\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u001b\u0010\bJ\u0011\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\nH\u0016¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0015H\u0016¢\u0006\u0004\b!\u0010\"J\u000f\u0010&\u001a\u00020#H\u0010¢\u0006\u0004\b$\u0010%J\u000f\u0010(\u001a\u00020'H\u0016¢\u0006\u0004\b(\u0010)J\u000f\u0010*\u001a\u00020\u0006H\u0016¢\u0006\u0004\b*\u0010\bJ\u000f\u0010+\u001a\u00020\u0010H\u0016¢\u0006\u0004\b+\u0010\u0012J\u000f\u0010,\u001a\u00020\u0006H\u0016¢\u0006\u0004\b,\u0010\bJ\u000f\u0010-\u001a\u00020\u0010H\u0016¢\u0006\u0004\b-\u0010\u0012J'\u00102\u001a\u00020\u00152\u0012\u0010/\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00010.H\u0087\bø\u0001\u0000¢\u0006\u0004\b0\u00101J\u0017\u00104\u001a\u00020\n2\u0006\u00103\u001a\u00020\u0006H\u0016¢\u0006\u0004\b4\u0010\fJ)\u00106\u001a\u00020\n2\u0006\u00103\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u001c2\b\u00105\u001a\u0004\u0018\u00010\u0001H\u0016¢\u0006\u0004\b6\u00107J\u000f\u00108\u001a\u00020\u0010H\u0016¢\u0006\u0004\b8\u0010\u0012R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u00109R\u0016\u0010:\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b:\u0010;R\u0016\u0010<\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b<\u0010;R\u0016\u0010=\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b=\u0010>R\u0016\u0010?\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b?\u0010>R\u0016\u00103\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b3\u0010>R\u0016\u0010@\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b@\u0010;R\u0018\u0010A\u001a\u0004\u0018\u00010\u001c8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bA\u0010BR\u001a\u0010E\u001a\b\u0012\u0004\u0012\u00020D0C8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bE\u0010F\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006H"}, d2 = {"Lcom/squareup/wire/ProtoReader;", "", "Lzz0;", "source", "<init>", "(Lzz0;)V", "", "internalNextLengthDelimited", "()I", "expectedEndTag", "Lc1e;", "skipGroup", "(I)V", "internalReadVarint32", "fieldEncoding", "afterPackableScalar", "", "beforeLengthDelimitedScalar", "()J", "beginMessage", "token", "Lh21;", "endMessageAndGetUnknownFields", "(J)Lh21;", "endMessage", "(J)V", "nextLengthDelimited", "nextTag", "Lcom/squareup/wire/FieldEncoding;", "peekFieldEncoding", "()Lcom/squareup/wire/FieldEncoding;", "skip", "()V", "readBytes", "()Lh21;", "", "beforePossiblyPackedScalar$wire_runtime", "()Z", "beforePossiblyPackedScalar", "", "readString", "()Ljava/lang/String;", "readVarint32", "readVarint64", "readFixed32", "readFixed64", "Lkotlin/Function1;", "tagHandler", "-forEachTag", "(Lx45;)Lh21;", "forEachTag", "tag", "readUnknownField", "value", "addUnknownField", "(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)V", "nextFieldMinLengthInBytes", "Lzz0;", "pos", "J", "limit", "recursionDepth", "I", "state", "pushedLimit", "nextFieldEncoding", "Lcom/squareup/wire/FieldEncoding;", "", "Lkz0;", "bufferStack", "Ljava/util/List;", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public class ProtoReader {
    public static final int FIELD_ENCODING_MASK = 7;
    public static final int RECURSION_LIMIT = 100;
    public static final int STATE_END_GROUP = 4;
    public static final int STATE_FIXED32 = 5;
    public static final int STATE_FIXED64 = 1;
    public static final int STATE_LENGTH_DELIMITED = 2;
    public static final int STATE_PACKED_TAG = 7;
    public static final int STATE_START_GROUP = 3;
    public static final int STATE_TAG = 6;
    public static final int STATE_VARINT = 0;
    public static final int TAG_FIELD_ENCODING_BITS = 3;
    private final List<kz0> bufferStack;
    private long limit;
    private FieldEncoding nextFieldEncoding;
    private long pos;
    private long pushedLimit;
    private int recursionDepth;
    private final zz0 source;
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

    public ProtoReader(zz0 zz0Var) {
        zz0Var.getClass();
        this.source = zz0Var;
        this.limit = Long.MAX_VALUE;
        this.state = 2;
        this.tag = -1;
        this.pushedLimit = -1L;
        this.bufferStack = new ArrayList();
    }

    private final void afterPackableScalar(int fieldEncoding) throws IOException {
        if (this.state == fieldEncoding) {
            this.state = 6;
            return;
        }
        long j = this.pos;
        long j2 = this.limit;
        if (j <= j2) {
            if (j != j2) {
                this.state = 7;
                return;
            }
            this.limit = this.pushedLimit;
            this.pushedLimit = -1L;
            this.state = 6;
            return;
        }
        throw new IOException("Expected to end at " + this.limit + " but was " + this.pos);
    }

    private final long beforeLengthDelimitedScalar() throws ProtocolException {
        if (this.state != 2) {
            throw new ProtocolException("Expected LENGTH_DELIMITED but was " + this.state);
        }
        long j = this.limit - this.pos;
        this.source.x0(j);
        this.state = 6;
        this.pos = this.limit;
        this.limit = this.pushedLimit;
        this.pushedLimit = -1L;
        return j;
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
        long j = this.limit;
        this.pushedLimit = j;
        long j2 = this.pos + ((long) iInternalReadVarint32);
        this.limit = j2;
        if (j2 <= j) {
            return iInternalReadVarint32;
        }
        ay0.b();
        return 0;
    }

    private final int internalReadVarint32() throws ProtocolException {
        this.source.x0(1L);
        this.pos++;
        byte b = this.source.readByte();
        if (b >= 0) {
            return b;
        }
        int i = b & 127;
        this.source.x0(1L);
        this.pos++;
        byte b2 = this.source.readByte();
        if (b2 >= 0) {
            return (b2 << 7) | i;
        }
        int i2 = i | ((b2 & 127) << 7);
        this.source.x0(1L);
        this.pos++;
        byte b3 = this.source.readByte();
        if (b3 >= 0) {
            return (b3 << 14) | i2;
        }
        int i3 = i2 | ((b3 & 127) << 14);
        this.source.x0(1L);
        this.pos++;
        byte b4 = this.source.readByte();
        if (b4 >= 0) {
            return (b4 << 21) | i3;
        }
        int i4 = i3 | ((b4 & 127) << 21);
        this.source.x0(1L);
        this.pos++;
        byte b5 = this.source.readByte();
        int i5 = i4 | (b5 << 28);
        if (b5 < 0) {
            for (int i6 = 0; i6 < 5; i6++) {
                this.source.x0(1L);
                this.pos++;
                if (this.source.readByte() < 0) {
                }
            }
            lg8.k("Malformed VARINT");
            return 0;
        }
        return i5;
    }

    private final void skipGroup(int expectedEndTag) throws IOException {
        while (this.pos < this.limit && !this.source.H()) {
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
                long jInternalReadVarint32 = internalReadVarint32();
                this.pos += jInternalReadVarint32;
                this.source.skip(jInternalReadVarint32);
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

    /* JADX INFO: renamed from: -forEachTag, reason: not valid java name */
    public final h21 m95forEachTag(x45 tagHandler) {
        tagHandler.getClass();
        long jBeginMessage = beginMessage();
        while (true) {
            int iNextTag = nextTag();
            if (iNextTag == -1) {
                return endMessageAndGetUnknownFields(jBeginMessage);
            }
            tagHandler.invoke(Integer.valueOf(iNextTag));
        }
    }

    public void addUnknownField(int tag, FieldEncoding fieldEncoding, Object value) {
        fieldEncoding.getClass();
        ProtoWriter protoWriter = new ProtoWriter(this.bufferStack.get(this.recursionDepth - 1));
        ProtoAdapter<?> protoAdapterRawProtoAdapter = fieldEncoding.rawProtoAdapter();
        protoAdapterRawProtoAdapter.getClass();
        protoAdapterRawProtoAdapter.encodeWithTag(protoWriter, tag, value);
    }

    public boolean beforePossiblyPackedScalar$wire_runtime() throws ProtocolException {
        int i = this.state;
        if (i != 0 && i != 1) {
            if (i == 2) {
                if (this.pos < this.limit) {
                    return true;
                }
                this.limit = this.pushedLimit;
                this.pushedLimit = -1L;
                this.state = 6;
                return false;
            }
            if (i != 5) {
                throw new ProtocolException("unexpected state: " + this.state);
            }
        }
        return true;
    }

    public long beginMessage() {
        if (this.state != 2) {
            ygf.f("Unexpected call to beginMessage()");
            return 0L;
        }
        int i = this.recursionDepth + 1;
        this.recursionDepth = i;
        if (i > 100) {
            ik4.g("Wire recursion limit exceeded");
            return 0L;
        }
        if (i > this.bufferStack.size()) {
            this.bufferStack.add(new kz0());
        }
        long j = this.pushedLimit;
        this.pushedLimit = -1L;
        this.state = 6;
        return j;
    }

    @z73
    public final void endMessage(long token) {
        endMessageAndGetUnknownFields(token);
    }

    public h21 endMessageAndGetUnknownFields(long token) {
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

    public long nextFieldMinLengthInBytes() {
        FieldEncoding fieldEncoding = this.nextFieldEncoding;
        int i = fieldEncoding == null ? -1 : WhenMappings.$EnumSwitchMapping$0[fieldEncoding.ordinal()];
        if (i == -1) {
            ygf.f("nextFieldEncoding is not set");
            return 0L;
        }
        if (i == 1) {
            return this.limit - this.pos;
        }
        if (i == 2) {
            return 4L;
        }
        if (i == 3) {
            return 8L;
        }
        if (i == 4) {
            return 1L;
        }
        ygf.a();
        return 0L;
    }

    public int nextTag() {
        int i = this.state;
        if (i == 7) {
            this.state = 2;
            return this.tag;
        }
        if (i != 6) {
            ygf.f("Unexpected call to nextTag()");
            return 0;
        }
        while (this.pos < this.limit && !this.source.H()) {
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

    /* JADX INFO: renamed from: peekFieldEncoding, reason: from getter */
    public FieldEncoding getNextFieldEncoding() {
        return this.nextFieldEncoding;
    }

    public h21 readBytes() throws ProtocolException {
        long jBeforeLengthDelimitedScalar = beforeLengthDelimitedScalar();
        this.source.x0(jBeforeLengthDelimitedScalar);
        return this.source.r(jBeforeLengthDelimitedScalar);
    }

    public int readFixed32() throws IOException {
        int i = this.state;
        if (i != 5 && i != 2) {
            throw new ProtocolException("Expected FIXED32 or LENGTH_DELIMITED but was " + this.state);
        }
        this.source.x0(4L);
        this.pos += 4;
        int iI0 = this.source.i0();
        afterPackableScalar(5);
        return iI0;
    }

    public long readFixed64() throws IOException {
        int i = this.state;
        if (i != 1 && i != 2) {
            throw new ProtocolException("Expected FIXED64 or LENGTH_DELIMITED but was " + this.state);
        }
        this.source.x0(8L);
        this.pos += 8;
        long jR0 = this.source.r0();
        afterPackableScalar(1);
        return jR0;
    }

    public String readString() throws ProtocolException {
        long jBeforeLengthDelimitedScalar = beforeLengthDelimitedScalar();
        this.source.x0(jBeforeLengthDelimitedScalar);
        return this.source.o(jBeforeLengthDelimitedScalar);
    }

    public void readUnknownField(int tag) {
        FieldEncoding nextFieldEncoding = getNextFieldEncoding();
        nextFieldEncoding.getClass();
        addUnknownField(tag, nextFieldEncoding, nextFieldEncoding.rawProtoAdapter().decode(this));
    }

    public int readVarint32() {
        int i = this.state;
        if (i == 0 || i == 2) {
            int iInternalReadVarint32 = internalReadVarint32();
            afterPackableScalar(0);
            return iInternalReadVarint32;
        }
        throw new ProtocolException("Expected VARINT or LENGTH_DELIMITED but was " + this.state);
    }

    public long readVarint64() throws IOException {
        int i = this.state;
        if (i != 0 && i != 2) {
            throw new ProtocolException("Expected VARINT or LENGTH_DELIMITED but was " + this.state);
        }
        long j = 0;
        for (int i2 = 0; i2 < 64; i2 += 7) {
            this.source.x0(1L);
            this.pos++;
            byte b = this.source.readByte();
            j |= ((long) (b & 127)) << i2;
            if ((b & 128) == 0) {
                afterPackableScalar(0);
                return j;
            }
        }
        lg8.k("WireInput encountered a malformed varint");
        return 0L;
    }

    public void skip() throws IOException {
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
            this.source.skip(beforeLengthDelimitedScalar());
        } else if (i == 5) {
            readFixed32();
        } else {
            ygf.f("Unexpected call to skip()");
        }
    }

    public int nextLengthDelimited() {
        int i = this.state;
        if (i == 6 || i == 2) {
            return internalNextLengthDelimited();
        }
        ygf.f(VrhD.eAjQEcFZZVC);
        return 0;
    }
}
