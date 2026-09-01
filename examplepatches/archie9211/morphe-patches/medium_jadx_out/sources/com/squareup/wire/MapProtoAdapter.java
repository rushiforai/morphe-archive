package com.squareup.wire;

import defpackage.fy3;
import defpackage.k80;
import defpackage.n1b;
import defpackage.ygf;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0003B%\b\u0000\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ#\u0010\u000b\u001a\u00020\n2\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u000b\u0010\fJ-\u0010\u000e\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\n2\u0014\u0010\t\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u0004H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ+\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00102\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J+\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00152\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b\u0013\u0010\u0016J5\u0010\u0017\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\n2\u0014\u0010\t\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u0004H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J5\u0010\u0017\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00152\u0006\u0010\r\u001a\u00020\n2\u0014\u0010\t\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u0004H\u0016¢\u0006\u0004\b\u0017\u0010\u0019J#\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00042\u0006\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ#\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00042\u0006\u0010\u001b\u001a\u00020\u001eH\u0016¢\u0006\u0004\b\u001c\u0010\u001fJ/\u0010 \u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00042\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016¢\u0006\u0004\b \u0010!R \u0010#\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\"8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b#\u0010$¨\u0006%"}, d2 = {"Lcom/squareup/wire/MapProtoAdapter;", "K", "V", "Lcom/squareup/wire/ProtoAdapter;", "", "keyAdapter", "valueAdapter", "<init>", "(Lcom/squareup/wire/ProtoAdapter;Lcom/squareup/wire/ProtoAdapter;)V", "value", "", "encodedSize", "(Ljava/util/Map;)I", "tag", "encodedSizeWithTag", "(ILjava/util/Map;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Ljava/util/Map;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Ljava/util/Map;)V", "encodeWithTag", "(Lcom/squareup/wire/ProtoWriter;ILjava/util/Map;)V", "(Lcom/squareup/wire/ReverseProtoWriter;ILjava/util/Map;)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Ljava/util/Map;", "Lcom/squareup/wire/ProtoReader32;", "(Lcom/squareup/wire/ProtoReader32;)Ljava/util/Map;", "redact", "(Ljava/util/Map;)Ljava/util/Map;", "Lcom/squareup/wire/MapEntryProtoAdapter;", "entryAdapter", "Lcom/squareup/wire/MapEntryProtoAdapter;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class MapProtoAdapter<K, V> extends ProtoAdapter<Map<K, ? extends V>> {
    private final MapEntryProtoAdapter<K, V> entryAdapter;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MapProtoAdapter(ProtoAdapter<K> protoAdapter, ProtoAdapter<V> protoAdapter2) {
        super(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(Map.class), null, protoAdapter2.getSyntax(), fy3.a, null, 32, null);
        protoAdapter.getClass();
        protoAdapter2.getClass();
        this.entryAdapter = new MapEntryProtoAdapter<>(protoAdapter, protoAdapter2);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final Map<K, V> decode(ProtoReader reader) {
        reader.getClass();
        K identity = this.entryAdapter.getKeyAdapter$wire_runtime().getIdentity();
        V identity2 = this.entryAdapter.getValueAdapter$wire_runtime().getIdentity();
        long jBeginMessage = reader.beginMessage();
        while (true) {
            int iNextTag = reader.nextTag();
            if (iNextTag == -1) {
                break;
            }
            if (iNextTag == 1) {
                identity = this.entryAdapter.getKeyAdapter$wire_runtime().decode(reader);
            } else if (iNextTag == 2) {
                identity2 = this.entryAdapter.getValueAdapter$wire_runtime().decode(reader);
            }
        }
        reader.endMessageAndGetUnknownFields(jBeginMessage);
        if (identity == null) {
            ygf.f("Map entry with null key");
            return null;
        }
        if (identity2 == null) {
            ygf.f("Map entry with null value");
            return null;
        }
        Map<K, V> mapSingletonMap = Collections.singletonMap(identity, identity2);
        mapSingletonMap.getClass();
        return mapSingletonMap;
    }

    public final void encode(ProtoWriter writer, Map<K, ? extends V> value) {
        writer.getClass();
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be encoded with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ReverseProtoWriter writer, int tag, Map<K, ? extends V> value) {
        writer.getClass();
        if (value == null) {
            return;
        }
        Map.Entry[] entryArr = (Map.Entry[]) value.entrySet().toArray(new Map.Entry[0]);
        k80.I0(entryArr);
        for (Map.Entry entry : entryArr) {
            this.entryAdapter.encodeWithTag(writer, tag, entry);
        }
    }

    public final int encodedSize(Map<K, ? extends V> value) {
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be sized with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSizeWithTag(int tag, Map<K, ? extends V> value) {
        int iEncodedSizeWithTag = 0;
        if (value == null) {
            return 0;
        }
        Iterator<Map.Entry<K, ? extends V>> it2 = value.entrySet().iterator();
        while (it2.hasNext()) {
            iEncodedSizeWithTag += this.entryAdapter.encodedSizeWithTag(tag, it2.next());
        }
        return iEncodedSizeWithTag;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ Object redact(Object obj) {
        redact((Map) obj);
        return fy3.a;
    }

    public final Map<K, V> redact(Map<K, ? extends V> value) {
        value.getClass();
        return fy3.a;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ int encodedSize(Object obj) {
        encodedSize((Map) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ void encode(ReverseProtoWriter reverseProtoWriter, Object obj) {
        encode(reverseProtoWriter, (Map) obj);
        throw null;
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final /* bridge */ /* synthetic */ void encode(ProtoWriter protoWriter, Object obj) {
        encode(protoWriter, (Map) obj);
        throw null;
    }

    public final void encode(ReverseProtoWriter writer, Map<K, ? extends V> value) {
        writer.getClass();
        value.getClass();
        throw new UnsupportedOperationException("Repeated values can only be encoded with a tag.");
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encodeWithTag(ProtoWriter writer, int tag, Map<K, ? extends V> value) {
        writer.getClass();
        if (value == null) {
            return;
        }
        Iterator<Map.Entry<K, ? extends V>> it2 = value.entrySet().iterator();
        while (it2.hasNext()) {
            this.entryAdapter.encodeWithTag(writer, tag, it2.next());
        }
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final Map<K, V> decode(ProtoReader32 reader) {
        reader.getClass();
        K identity = this.entryAdapter.getKeyAdapter$wire_runtime().getIdentity();
        V identity2 = this.entryAdapter.getValueAdapter$wire_runtime().getIdentity();
        int iBeginMessage = reader.beginMessage();
        while (true) {
            int iNextTag = reader.nextTag();
            if (iNextTag == -1) {
                break;
            }
            if (iNextTag == 1) {
                identity = this.entryAdapter.getKeyAdapter$wire_runtime().decode(reader);
            } else if (iNextTag == 2) {
                identity2 = this.entryAdapter.getValueAdapter$wire_runtime().decode(reader);
            }
        }
        reader.endMessageAndGetUnknownFields(iBeginMessage);
        if (identity == null) {
            ygf.f("Map entry with null key");
            return null;
        }
        if (identity2 != null) {
            Map<K, V> mapSingletonMap = Collections.singletonMap(identity, identity2);
            mapSingletonMap.getClass();
            return mapSingletonMap;
        }
        ygf.f("Map entry with null value");
        return null;
    }
}
