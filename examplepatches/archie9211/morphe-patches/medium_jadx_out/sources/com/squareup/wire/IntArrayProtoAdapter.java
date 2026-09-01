package com.squareup.wire;

import defpackage.n1b;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0015\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0015\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0001¢\u0006\u0004\b\u0005\u0010\u0006J)\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u00032\b\u0010\n\u001a\u0004\u0018\u00010\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ)\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u00032\b\u0010\n\u001a\u0004\u0018\u00010\u0002H\u0016¢\u0006\u0004\b\f\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J!\u0010\u0012\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\u00032\b\u0010\n\u001a\u0004\u0018\u00010\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001f\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001f\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u000e2\u0006\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0016J\u0017\u0010\u0019\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u0019\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u0019\u0010\u001cJ\u0017\u0010\u001d\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001d\u0010\u001eR\u001a\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001f¨\u0006 "}, d2 = {"Lcom/squareup/wire/IntArrayProtoAdapter;", "Lcom/squareup/wire/ProtoAdapter;", "", "", "originalAdapter", "<init>", "(Lcom/squareup/wire/ProtoAdapter;)V", "Lcom/squareup/wire/ProtoWriter;", "writer", "tag", "value", "Lc1e;", "encodeWithTag", "(Lcom/squareup/wire/ProtoWriter;I[I)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;I[I)V", "encodedSize", "([I)I", "encodedSizeWithTag", "(I[I)I", "encode", "(Lcom/squareup/wire/ProtoWriter;[I)V", "(Lcom/squareup/wire/ReverseProtoWriter;[I)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)[I", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/ProtoReader32;)[I", "redact", "([I)[I", "Lcom/squareup/wire/ProtoAdapter;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class IntArrayProtoAdapter extends ProtoAdapter<int[]> {
    private final ProtoAdapter<Integer> originalAdapter;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public IntArrayProtoAdapter(ProtoAdapter<Integer> protoAdapter) {
        super(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(int[].class), null, protoAdapter.getSyntax(), new int[0], null, 32, null);
        protoAdapter.getClass();
        this.originalAdapter = protoAdapter;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int[] decode(ProtoReader reader) {
        reader.getClass();
        return new int[]{this.originalAdapter.decode(reader).intValue()};
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ReverseProtoWriter writer, int[] value) {
        writer.getClass();
        value.getClass();
        int length = value.length;
        while (true) {
            length--;
            if (-1 >= length) {
                return;
            } else {
                this.originalAdapter.encode(writer, Integer.valueOf(value[length]));
            }
        }
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ProtoWriter writer, int tag, int[] value) {
        writer.getClass();
        if (value == null || value.length == 0) {
            return;
        }
        super.encodeWithTag(writer, tag, value);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSize(int[] value) {
        value.getClass();
        int iEncodedSize = 0;
        for (int i : value) {
            iEncodedSize += this.originalAdapter.encodedSize(Integer.valueOf(i));
        }
        return iEncodedSize;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSizeWithTag(int tag, int[] value) {
        if (value == null || value.length == 0) {
            return 0;
        }
        return super.encodedSizeWithTag(tag, value);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int[] redact(int[] value) {
        value.getClass();
        return new int[0];
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ReverseProtoWriter writer, int tag, int[] value) {
        writer.getClass();
        if (value == null || value.length == 0) {
            return;
        }
        super.encodeWithTag(writer, tag, value);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int[] decode(ProtoReader32 reader) {
        reader.getClass();
        return new int[]{this.originalAdapter.decode(reader).intValue()};
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ProtoWriter writer, int[] value) {
        writer.getClass();
        value.getClass();
        for (int i : value) {
            this.originalAdapter.encode(writer, Integer.valueOf(i));
        }
    }
}
