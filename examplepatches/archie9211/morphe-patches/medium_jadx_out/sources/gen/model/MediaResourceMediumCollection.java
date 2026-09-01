package gen.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.im7;
import defpackage.jm7;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u0012\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lgen/model/MediaResourceMediumCollection;", "Lcom/squareup/wire/AndroidMessage;", "Lim7;", "", "collection_id", "Lgen/model/Collection;", "collection", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/Collection;Lh21;)V", "newBuilder", "()Lim7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/Collection;Lh21;)Lgen/model/MediaResourceMediumCollection;", "Ljava/lang/String;", "Lgen/model/Collection;", "getCollection$annotations", "()V", "Companion", "jm7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResourceMediumCollection extends AndroidMessage<MediaResourceMediumCollection, im7> {
    public static final ProtoAdapter<MediaResourceMediumCollection> ADAPTER;
    public static final Parcelable.Creator<MediaResourceMediumCollection> CREATOR;
    public static final jm7 Companion = new jm7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Collection#ADAPTER", schemaIndex = 1, tag = 2)
    public final Collection collection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String collection_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResourceMediumCollection.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResourceMediumCollection> protoAdapter = new ProtoAdapter<MediaResourceMediumCollection>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResourceMediumCollection$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumCollection decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Collection collectionDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResourceMediumCollection(strDecode, collectionDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        collectionDecode = Collection.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResourceMediumCollection value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.collection_id);
                Collection.ADAPTER.encodeWithTag(writer, 2, value.collection);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResourceMediumCollection value) {
                value.getClass();
                return Collection.ADAPTER.encodedSizeWithTag(2, value.collection) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.collection_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumCollection redact(MediaResourceMediumCollection value) {
                value.getClass();
                Collection collection = value.collection;
                return MediaResourceMediumCollection.copy$default(value, null, collection != null ? Collection.ADAPTER.redact(collection) : null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResourceMediumCollection value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                Collection.ADAPTER.encodeWithTag(writer, 2, value.collection);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.collection_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MediaResourceMediumCollection(String str, Collection collection, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : collection, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MediaResourceMediumCollection copy$default(MediaResourceMediumCollection mediaResourceMediumCollection, String str, Collection collection, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mediaResourceMediumCollection.collection_id;
        }
        if ((i & 2) != 0) {
            collection = mediaResourceMediumCollection.collection;
        }
        if ((i & 4) != 0) {
            h21Var = mediaResourceMediumCollection.unknownFields();
        }
        return mediaResourceMediumCollection.copy(str, collection, h21Var);
    }

    public final MediaResourceMediumCollection copy(String collection_id, Collection collection, h21 unknownFields) {
        unknownFields.getClass();
        return new MediaResourceMediumCollection(collection_id, collection, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResourceMediumCollection)) {
            return false;
        }
        MediaResourceMediumCollection mediaResourceMediumCollection = (MediaResourceMediumCollection) other;
        return g76.L(unknownFields(), mediaResourceMediumCollection.unknownFields()) && g76.L(this.collection_id, mediaResourceMediumCollection.collection_id) && g76.L(this.collection, mediaResourceMediumCollection.collection);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.collection_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Collection collection = this.collection;
        int iHashCode3 = iHashCode2 + (collection != null ? collection.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final im7 newBuilder() {
        im7 im7Var = new im7();
        im7Var.a = this.collection_id;
        im7Var.b = this.collection;
        im7Var.addUnknownFields(unknownFields());
        return im7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.collection_id;
        if (str != null) {
            lv8.D(str, "collection_id=", arrayList);
        }
        Collection collection = this.collection;
        if (collection != null) {
            arrayList.add("collection=" + collection);
        }
        return bu1.F0(arrayList, ", ", "MediaResourceMediumCollection{", "}", null, 56);
    }

    public MediaResourceMediumCollection() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResourceMediumCollection(String str, Collection collection, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.collection_id = str;
        this.collection = collection;
    }

    public static /* synthetic */ void getCollection$annotations() {
    }
}
