package com.squareup.wire;

import com.squareup.wire.ProtoAdapter;
import defpackage.x45;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a\"\u0010\u0004\u001a\u00020\u0003\"\b\b\u0000\u0010\u0001*\u00020\u00002\u0006\u0010\u0002\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\u0004\u0010\u0005\u001a*\u0010\t\u001a\u00020\b\"\b\b\u0000\u0010\u0001*\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0002\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\t\u0010\n\u001a*\u0010\t\u001a\u00020\b\"\b\b\u0000\u0010\u0001*\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\t\u0010\f\u001aE\u0010\u0012\u001a\u00028\u0000\"\b\b\u0000\u0010\u0001*\u00020\u0000*\b\u0012\u0004\u0012\u00028\u00000\r2\u0006\u0010\u000f\u001a\u00020\u000e2\u0014\u0010\u0011\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u0010H\u0080\bø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013\u001aE\u0010\u0012\u001a\u00028\u0000\"\b\b\u0000\u0010\u0001*\u00020\u0000*\b\u0012\u0004\u0012\u00028\u00000\r2\u0006\u0010\u000f\u001a\u00020\u00142\u0014\u0010\u0011\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u0010H\u0080\bø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0015\u001a\"\u0010\u0016\u001a\u00028\u0000\"\b\b\u0000\u0010\u0001*\u00020\u00002\u0006\u0010\u0002\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b\u0016\u0010\u0017\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0018"}, d2 = {"Lcom/squareup/wire/WireEnum;", "E", "value", "", "commonEncodedSize", "(Lcom/squareup/wire/WireEnum;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "commonEncode", "(Lcom/squareup/wire/ProtoWriter;Lcom/squareup/wire/WireEnum;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Lcom/squareup/wire/WireEnum;)V", "Lcom/squareup/wire/EnumAdapter;", "Lcom/squareup/wire/ProtoReader;", "reader", "Lkotlin/Function1;", "fromValue", "commonDecode", "(Lcom/squareup/wire/EnumAdapter;Lcom/squareup/wire/ProtoReader;Lx45;)Lcom/squareup/wire/WireEnum;", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/EnumAdapter;Lcom/squareup/wire/ProtoReader32;Lx45;)Lcom/squareup/wire/WireEnum;", "commonRedact", "(Lcom/squareup/wire/WireEnum;)Lcom/squareup/wire/WireEnum;", "wire-runtime"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class EnumAdapterKt {
    public static final <E extends WireEnum> E commonDecode(EnumAdapter<E> enumAdapter, ProtoReader protoReader, x45 x45Var) {
        enumAdapter.getClass();
        protoReader.getClass();
        x45Var.getClass();
        int varint32 = protoReader.readVarint32();
        E e = (E) x45Var.invoke(Integer.valueOf(varint32));
        if (e != null) {
            return e;
        }
        throw new ProtoAdapter.EnumConstantNotFoundException(varint32, enumAdapter.getType());
    }

    public static final <E extends WireEnum> void commonEncode(ProtoWriter protoWriter, E e) {
        protoWriter.getClass();
        e.getClass();
        protoWriter.writeVarint32(e.getValue());
    }

    public static final <E extends WireEnum> int commonEncodedSize(E e) {
        e.getClass();
        return ProtoWriter.INSTANCE.varint32Size$wire_runtime(e.getValue());
    }

    public static final <E extends WireEnum> E commonRedact(E e) {
        e.getClass();
        throw new UnsupportedOperationException();
    }

    public static final <E extends WireEnum> void commonEncode(ReverseProtoWriter reverseProtoWriter, E e) {
        reverseProtoWriter.getClass();
        e.getClass();
        reverseProtoWriter.writeVarint32(e.getValue());
    }

    public static final <E extends WireEnum> E commonDecode(EnumAdapter<E> enumAdapter, ProtoReader32 protoReader32, x45 x45Var) {
        enumAdapter.getClass();
        protoReader32.getClass();
        x45Var.getClass();
        int varint32 = protoReader32.readVarint32();
        E e = (E) x45Var.invoke(Integer.valueOf(varint32));
        if (e != null) {
            return e;
        }
        throw new ProtoAdapter.EnumConstantNotFoundException(varint32, enumAdapter.getType());
    }
}
