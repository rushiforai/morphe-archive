package com.squareup.wire;

import defpackage.n1b;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010&\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0003B%\b\u0000\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ#\u0010\u000b\u001a\u00020\n2\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u000b\u0010\fJ+\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\r2\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J+\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u00122\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u0010\u0010\u0013J#\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00042\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J/\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00042\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u0018\u0010\u0019R \u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u00038\u0000X\u0080\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR \u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u00038\u0000X\u0080\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001d\u0010\u001c¨\u0006\u001e"}, d2 = {"Lcom/squareup/wire/MapEntryProtoAdapter;", "K", "V", "Lcom/squareup/wire/ProtoAdapter;", "", "keyAdapter", "valueAdapter", "<init>", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoAdapter;)V", "value", "", "encodedSize", "(Ljava/util/Map$Entry;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Ljava/util/Map$Entry;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Ljava/util/Map$Entry;)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Ljava/util/Map$Entry;", "redact", "(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;", "Lcom/squareup/wire/ProtoAdapter;", "getKeyAdapter$wire_runtime", "()Lcom/squareup/wire/ProtoAdapter;", "getValueAdapter$wire_runtime", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
final class MapEntryProtoAdapter<K, V> extends ProtoAdapter<Map.Entry<? extends K, ? extends V>> {
    private final ProtoAdapter<K> keyAdapter;
    private final ProtoAdapter<V> valueAdapter;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MapEntryProtoAdapter(ProtoAdapter<K> protoAdapter, ProtoAdapter<V> protoAdapter2) {
        super(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Map.Entry.class), null, protoAdapter2.getSyntax(), null, null, 48, null);
        protoAdapter.getClass();
        protoAdapter2.getClass();
        this.keyAdapter = protoAdapter;
        this.valueAdapter = protoAdapter2;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final Map.Entry<K, V> decode(ProtoReader reader) {
        reader.getClass();
        throw new UnsupportedOperationException();
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ProtoWriter writer, Map.Entry<? extends K, ? extends V> value) {
        writer.getClass();
        value.getClass();
        this.keyAdapter.encodeWithTag(writer, 1, value.getKey());
        this.valueAdapter.encodeWithTag(writer, 2, value.getValue());
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSize(Map.Entry<? extends K, ? extends V> value) {
        value.getClass();
        return this.valueAdapter.encodedSizeWithTag(2, value.getValue()) + this.keyAdapter.encodedSizeWithTag(1, value.getKey());
    }

    public final ProtoAdapter<K> getKeyAdapter$wire_runtime() {
        return this.keyAdapter;
    }

    public final ProtoAdapter<V> getValueAdapter$wire_runtime() {
        return this.valueAdapter;
    }

    public final Map.Entry<K, V> redact(Map.Entry<? extends K, ? extends V> value) {
        value.getClass();
        throw new UnsupportedOperationException();
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ Object decode(ProtoReader protoReader) {
        decode(protoReader);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ Object redact(Object obj) {
        redact((Map.Entry) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ReverseProtoWriter writer, Map.Entry<? extends K, ? extends V> value) {
        writer.getClass();
        value.getClass();
        this.valueAdapter.encodeWithTag(writer, 2, value.getValue());
        this.keyAdapter.encodeWithTag(writer, 1, value.getKey());
    }
}
