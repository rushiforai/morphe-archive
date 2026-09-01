package com.squareup.wire;

import defpackage.d46;
import defpackage.ey3;
import defpackage.n1b;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002B\u0015\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u001d\u0010\t\u001a\u00020\b2\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\f\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\b2\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ%\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u000e2\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J%\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00132\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003H\u0016¢\u0006\u0004\b\u0011\u0010\u0014J/\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\b2\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u00132\u0006\u0010\u000b\u001a\u00020\b2\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0017J\u001d\u0010\u001a\u001a\b\u0012\u0004\u0012\u00028\u00000\u00032\u0006\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u001d\u0010\u001a\u001a\b\u0012\u0004\u0012\u00028\u00000\u00032\u0006\u0010\u0019\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001a\u0010\u001dJ#\u0010\u001e\u001a\b\u0012\u0004\u0012\u00028\u00000\u00032\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003H\u0016¢\u0006\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010 ¨\u0006!"}, d2 = {"Lcom/squareup/wire/RepeatedProtoAdapter;", "E", "Lcom/squareup/wire/ProtoAdapter;", "", "originalAdapter", "<init>", "(Lcom/squareup/wire/ProtoAdapter;)V", "value", "", "encodedSize", "(Ljava/util/List;)I", "tag", "encodedSizeWithTag", "(ILjava/util/List;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Ljava/util/List;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Ljava/util/List;)V", "encodeWithTag", "(Lcom/squareup/wire/ProtoWriter;ILjava/util/List;)V", "(Lcom/squareup/wire/ReverseProtoWriter;ILjava/util/List;)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Ljava/util/List;", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/ProtoReader32;)Ljava/util/List;", "redact", "(Ljava/util/List;)Ljava/util/List;", "Lcom/squareup/wire/ProtoAdapter;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class RepeatedProtoAdapter<E> extends ProtoAdapter<List<? extends E>> {
    private final ProtoAdapter<E> originalAdapter;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RepeatedProtoAdapter(ProtoAdapter<E> protoAdapter) {
        super(protoAdapter.getFieldEncoding(), n1b.a.b(List.class), null, protoAdapter.getSyntax(), ey3.a, null, 32, null);
        protoAdapter.getClass();
        this.originalAdapter = protoAdapter;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final List<E> decode(ProtoReader reader) {
        reader.getClass();
        return d46.Q(this.originalAdapter.decode(reader));
    }

    public final void encode(ProtoWriter writer, List<? extends E> value) {
        writer.getClass();
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be encoded with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ReverseProtoWriter writer, int tag, List<? extends E> value) {
        writer.getClass();
        if (value == null) {
            return;
        }
        int size = value.size();
        while (true) {
            size--;
            if (-1 >= size) {
                return;
            } else {
                this.originalAdapter.encodeWithTag(writer, tag, value.get(size));
            }
        }
    }

    public final int encodedSize(List<? extends E> value) {
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be sized with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSizeWithTag(int tag, List<? extends E> value) {
        if (value == null) {
            return 0;
        }
        int size = value.size();
        int iEncodedSizeWithTag = 0;
        for (int i = 0; i < size; i++) {
            iEncodedSizeWithTag += this.originalAdapter.encodedSizeWithTag(tag, value.get(i));
        }
        return iEncodedSizeWithTag;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ Object redact(Object obj) {
        redact((List) obj);
        return ey3.a;
    }

    public final List<E> redact(List<? extends E> value) {
        value.getClass();
        return ey3.a;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ int encodedSize(Object obj) {
        encodedSize((List) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Object obj) {
        encode(reverseProtoWriter, (List) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Object obj) {
        encode(protoWriter, (List) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final List<E> decode(ProtoReader32 reader) {
        reader.getClass();
        return d46.Q(this.originalAdapter.decode(reader));
    }

    public final void encode(ReverseProtoWriter writer, List<? extends E> value) {
        writer.getClass();
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be encoded with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ProtoWriter writer, int tag, List<? extends E> value) {
        writer.getClass();
        if (value == null) {
            return;
        }
        int size = value.size();
        for (int i = 0; i < size; i++) {
            this.originalAdapter.encodeWithTag(writer, tag, value.get(i));
        }
    }
}
