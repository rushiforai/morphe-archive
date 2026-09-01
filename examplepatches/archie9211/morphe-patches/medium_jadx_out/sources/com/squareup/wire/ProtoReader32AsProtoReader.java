package com.squareup.wire;

import defpackage.h21;
import defpackage.kz0;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\rH\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u0011\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\nH\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001c\u001a\u00020\u0019H\u0010¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\rH\u0016¢\u0006\u0004\b \u0010\u000fJ\u000f\u0010!\u001a\u00020\u0006H\u0016¢\u0006\u0004\b!\u0010\bJ\u000f\u0010\"\u001a\u00020\rH\u0016¢\u0006\u0004\b\"\u0010\u000fJ\u000f\u0010#\u001a\u00020\u0006H\u0016¢\u0006\u0004\b#\u0010\bJ\u0017\u0010%\u001a\u00020\u00142\u0006\u0010$\u001a\u00020\rH\u0016¢\u0006\u0004\b%\u0010&J)\u0010*\u001a\u00020\u00142\u0006\u0010$\u001a\u00020\r2\u0006\u0010'\u001a\u00020\u00112\b\u0010)\u001a\u0004\u0018\u00010(H\u0016¢\u0006\u0004\b*\u0010+J\u000f\u0010,\u001a\u00020\u0006H\u0016¢\u0006\u0004\b,\u0010\bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010-\u001a\u0004\b.\u0010/¨\u00060"}, d2 = {"Lcom/squareup/wire/ProtoReader32AsProtoReader;", "Lcom/squareup/wire/ProtoReader;", "Lcom/squareup/wire/ProtoReader32;", "delegate", "<init>", "(Lcom/squareup/wire/ProtoReader32;)V", "", "beginMessage", "()J", "token", "Lh21;", "endMessageAndGetUnknownFields", "(J)Lh21;", "", "nextLengthDelimited", "()I", "nextTag", "Lcom/squareup/wire/FieldEncoding;", "peekFieldEncoding", "()Lcom/squareup/wire/FieldEncoding;", "Lc1e;", "skip", "()V", "readBytes", "()Lh21;", "", "beforePossiblyPackedScalar$wire_runtime", "()Z", "beforePossiblyPackedScalar", "", "readString", "()Ljava/lang/String;", "readVarint32", "readVarint64", "readFixed32", "readFixed64", "tag", "readUnknownField", "(I)V", "fieldEncoding", "", "value", "addUnknownField", "(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)V", "nextFieldMinLengthInBytes", "Lcom/squareup/wire/ProtoReader32;", "getDelegate", "()Lcom/squareup/wire/ProtoReader32;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ProtoReader32AsProtoReader extends ProtoReader {
    private final ProtoReader32 delegate;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ProtoReader32AsProtoReader(ProtoReader32 protoReader32) {
        super(new kz0());
        protoReader32.getClass();
        this.delegate = protoReader32;
    }

    @Override // com.squareup.wire.ProtoReader
    public final void addUnknownField(int tag, FieldEncoding fieldEncoding, Object value) {
        fieldEncoding.getClass();
        this.delegate.addUnknownField(tag, fieldEncoding, value);
    }

    @Override // com.squareup.wire.ProtoReader
    public final boolean beforePossiblyPackedScalar$wire_runtime() {
        return this.delegate.beforePossiblyPackedScalar();
    }

    @Override // com.squareup.wire.ProtoReader
    public final long beginMessage() {
        return this.delegate.beginMessage();
    }

    @Override // com.squareup.wire.ProtoReader
    public final h21 endMessageAndGetUnknownFields(long token) {
        return this.delegate.endMessageAndGetUnknownFields((int) token);
    }

    public final ProtoReader32 getDelegate() {
        return this.delegate;
    }

    @Override // com.squareup.wire.ProtoReader
    public final long nextFieldMinLengthInBytes() {
        return this.delegate.nextFieldMinLengthInBytes();
    }

    @Override // com.squareup.wire.ProtoReader
    public final int nextLengthDelimited() {
        return this.delegate.nextLengthDelimited();
    }

    @Override // com.squareup.wire.ProtoReader
    public final int nextTag() {
        return this.delegate.nextTag();
    }

    @Override // com.squareup.wire.ProtoReader
    /* JADX INFO: renamed from: peekFieldEncoding */
    public final FieldEncoding getNextFieldEncoding() {
        return this.delegate.getNextFieldEncoding();
    }

    @Override // com.squareup.wire.ProtoReader
    public final h21 readBytes() {
        return this.delegate.readBytes();
    }

    @Override // com.squareup.wire.ProtoReader
    public final int readFixed32() {
        return this.delegate.readFixed32();
    }

    @Override // com.squareup.wire.ProtoReader
    public final long readFixed64() {
        return this.delegate.readFixed64();
    }

    @Override // com.squareup.wire.ProtoReader
    public final String readString() {
        return this.delegate.readString();
    }

    @Override // com.squareup.wire.ProtoReader
    public final void readUnknownField(int tag) {
        this.delegate.readUnknownField(tag);
    }

    @Override // com.squareup.wire.ProtoReader
    public final int readVarint32() {
        return this.delegate.readVarint32();
    }

    @Override // com.squareup.wire.ProtoReader
    public final long readVarint64() {
        return this.delegate.readVarint64();
    }

    @Override // com.squareup.wire.ProtoReader
    public final void skip() {
        this.delegate.skip();
    }
}
