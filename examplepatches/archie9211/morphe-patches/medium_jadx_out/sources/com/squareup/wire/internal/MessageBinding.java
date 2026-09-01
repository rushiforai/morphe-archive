package com.squareup.wire.internal;

import com.squareup.wire.FieldEncoding;
import com.squareup.wire.Syntax;
import defpackage.h21;
import defpackage.wg6;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\bf\u0018\u0000*\b\b\u0000\u0010\u0002*\u00020\u0001*\b\b\u0001\u0010\u0003*\u00020\u00012\u00020\u0001J\u0017\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0004\u001a\u00028\u0000H&¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\t\u001a\u00020\b2\u0006\u0010\u0004\u001a\u00028\u0000H&¢\u0006\u0004\b\t\u0010\nJ\u001f\u0010\r\u001a\u00020\f2\u0006\u0010\u0004\u001a\u00028\u00002\u0006\u0010\u000b\u001a\u00020\bH&¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00028\u0001H&¢\u0006\u0004\b\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00028\u00002\u0006\u0010\u0011\u001a\u00028\u0001H&¢\u0006\u0004\b\u0012\u0010\u0013J1\u0010\u0018\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00028\u00012\u0006\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0016\u001a\u00020\u00152\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001H&¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00028\u0001H&¢\u0006\u0004\b\u001a\u0010\u001bR\u001c\u0010\u001f\u001a\n\u0012\u0006\b\u0000\u0012\u00028\u00000\u001c8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR,\u0010$\u001a\u001a\u0012\u0004\u0012\u00020\b\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010!0 8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#R\u0016\u0010(\u001a\u0004\u0018\u00010%8&X¦\u0004¢\u0006\u0006\u001a\u0004\b&\u0010'R\u0014\u0010,\u001a\u00020)8&X¦\u0004¢\u0006\u0006\u001a\u0004\b*\u0010+ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006-À\u0006\u0001"}, d2 = {"Lcom/squareup/wire/internal/MessageBinding;", "", "M", "B", "message", "Lh21;", "unknownFields", "(Ljava/lang/Object;)Lh21;", "", "getCachedSerializedSize", "(Ljava/lang/Object;)I", "size", "Lc1e;", "setCachedSerializedSize", "(Ljava/lang/Object;I)V", "newBuilder", "()Ljava/lang/Object;", "builder", "build", "(Ljava/lang/Object;)Ljava/lang/Object;", "tag", "Lcom/squareup/wire/FieldEncoding;", "fieldEncoding", "value", "addUnknownField", "(Ljava/lang/Object;ILcom/squareup/wire/FieldEncoding;Ljava/lang/Object;)V", "clearUnknownFields", "(Ljava/lang/Object;)V", "Lwg6;", "getMessageType", "()Lwg6;", "messageType", "", "Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "getFields", "()Ljava/util/Map;", "fields", "", "getTypeUrl", "()Ljava/lang/String;", "typeUrl", "Lcom/squareup/wire/Syntax;", "getSyntax", "()Lcom/squareup/wire/Syntax;", "syntax", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface MessageBinding<M, B> {
    void addUnknownField(B builder, int tag, FieldEncoding fieldEncoding, Object value);

    M build(B builder);

    void clearUnknownFields(B builder);

    int getCachedSerializedSize(M message);

    Map<Integer, FieldOrOneOfBinding<M, B>> getFields();

    wg6 getMessageType();

    Syntax getSyntax();

    String getTypeUrl();

    B newBuilder();

    void setCachedSerializedSize(M message, int size);

    h21 unknownFields(M message);
}
