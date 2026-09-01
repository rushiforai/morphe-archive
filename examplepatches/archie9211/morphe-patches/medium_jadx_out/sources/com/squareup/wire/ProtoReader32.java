package com.squareup.wire;

import defpackage.h21;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\r\bf\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0003\u0010\u0004J\u000f\u0010\u0006\u001a\u00020\u0005H&¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0005H&¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0005H&¢\u0006\u0004\b\f\u0010\u0007J\u000f\u0010\r\u001a\u00020\u0005H&¢\u0006\u0004\b\r\u0010\u0007J\u0011\u0010\u000f\u001a\u0004\u0018\u00010\u000eH&¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H&¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\tH&¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H&¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H&¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0005H&¢\u0006\u0004\b\u001c\u0010\u0007J\u000f\u0010\u001e\u001a\u00020\u001dH&¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0005H&¢\u0006\u0004\b \u0010\u0007J\u000f\u0010!\u001a\u00020\u001dH&¢\u0006\u0004\b!\u0010\u001fJ\u0017\u0010#\u001a\u00020\u00112\u0006\u0010\"\u001a\u00020\u0005H&¢\u0006\u0004\b#\u0010$J)\u0010'\u001a\u00020\u00112\u0006\u0010\"\u001a\u00020\u00052\u0006\u0010%\u001a\u00020\u000e2\b\u0010&\u001a\u0004\u0018\u00010\u0001H&¢\u0006\u0004\b'\u0010(J\u000f\u0010)\u001a\u00020\u0005H&¢\u0006\u0004\b)\u0010\u0007ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006*À\u0006\u0001"}, d2 = {"Lcom/squareup/wire/ProtoReader32;", "", "Lcom/squareup/wire/ProtoReader;", "asProtoReader", "()Lcom/squareup/wire/ProtoReader;", "", "beginMessage", "()I", "token", "Lh21;", "endMessageAndGetUnknownFields", "(I)Lh21;", "nextLengthDelimited", "nextTag", "Lcom/squareup/wire/FieldEncoding;", "peekFieldEncoding", "()Lcom/squareup/wire/FieldEncoding;", "Lc1e;", "skip", "()V", "readBytes", "()Lh21;", "", "beforePossiblyPackedScalar", "()Z", "", "readString", "()Ljava/lang/String;", "readVarint32", "", "readVarint64", "()J", "readFixed32", "readFixed64", "tag", "readUnknownField", "(I)V", "fieldEncoding", "value", "addUnknownField", "(ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)V", "nextFieldMinLengthInBytes", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface ProtoReader32 {
    void addUnknownField(int tag, FieldEncoding fieldEncoding, Object value);

    ProtoReader asProtoReader();

    boolean beforePossiblyPackedScalar();

    int beginMessage();

    h21 endMessageAndGetUnknownFields(int token);

    int nextFieldMinLengthInBytes();

    int nextLengthDelimited();

    int nextTag();

    FieldEncoding peekFieldEncoding();

    h21 readBytes();

    int readFixed32();

    long readFixed64();

    String readString();

    void readUnknownField(int tag);

    int readVarint32();

    long readVarint64();

    void skip();
}
