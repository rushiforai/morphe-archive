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
import defpackage.gm7;
import defpackage.gy2;
import defpackage.h21;
import defpackage.hm7;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/MediaResourceMediumCatalog;", "Lcom/squareup/wire/AndroidMessage;", "Lgm7;", "", "catalog_id", "Lgen/model/Catalog;", "catalog", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/Catalog;Lh21;)V", "newBuilder", "()Lgm7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/Catalog;Lh21;)Lgen/model/MediaResourceMediumCatalog;", "Ljava/lang/String;", "Lgen/model/Catalog;", "Companion", "hm7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResourceMediumCatalog extends AndroidMessage<MediaResourceMediumCatalog, gm7> {
    public static final ProtoAdapter<MediaResourceMediumCatalog> ADAPTER;
    public static final Parcelable.Creator<MediaResourceMediumCatalog> CREATOR;
    public static final hm7 Companion = new hm7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Catalog#ADAPTER", schemaIndex = 1, tag = 2)
    public final Catalog catalog;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String catalog_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResourceMediumCatalog.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResourceMediumCatalog> protoAdapter = new ProtoAdapter<MediaResourceMediumCatalog>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResourceMediumCatalog$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumCatalog decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Catalog catalogDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResourceMediumCatalog(strDecode, catalogDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        catalogDecode = Catalog.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResourceMediumCatalog value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.catalog_id);
                Catalog.ADAPTER.encodeWithTag(writer, 2, value.catalog);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResourceMediumCatalog value) {
                value.getClass();
                return Catalog.ADAPTER.encodedSizeWithTag(2, value.catalog) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.catalog_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumCatalog redact(MediaResourceMediumCatalog value) {
                value.getClass();
                Catalog catalog = value.catalog;
                return MediaResourceMediumCatalog.copy$default(value, null, catalog != null ? Catalog.ADAPTER.redact(catalog) : null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResourceMediumCatalog value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                Catalog.ADAPTER.encodeWithTag(writer, 2, value.catalog);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.catalog_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MediaResourceMediumCatalog(String str, Catalog catalog, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : catalog, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MediaResourceMediumCatalog copy$default(MediaResourceMediumCatalog mediaResourceMediumCatalog, String str, Catalog catalog, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mediaResourceMediumCatalog.catalog_id;
        }
        if ((i & 2) != 0) {
            catalog = mediaResourceMediumCatalog.catalog;
        }
        if ((i & 4) != 0) {
            h21Var = mediaResourceMediumCatalog.unknownFields();
        }
        return mediaResourceMediumCatalog.copy(str, catalog, h21Var);
    }

    public final MediaResourceMediumCatalog copy(String catalog_id, Catalog catalog, h21 unknownFields) {
        unknownFields.getClass();
        return new MediaResourceMediumCatalog(catalog_id, catalog, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResourceMediumCatalog)) {
            return false;
        }
        MediaResourceMediumCatalog mediaResourceMediumCatalog = (MediaResourceMediumCatalog) other;
        return g76.L(unknownFields(), mediaResourceMediumCatalog.unknownFields()) && g76.L(this.catalog_id, mediaResourceMediumCatalog.catalog_id) && g76.L(this.catalog, mediaResourceMediumCatalog.catalog);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.catalog_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Catalog catalog = this.catalog;
        int iHashCode3 = iHashCode2 + (catalog != null ? catalog.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final gm7 newBuilder() {
        gm7 gm7Var = new gm7();
        gm7Var.a = this.catalog_id;
        gm7Var.b = this.catalog;
        gm7Var.addUnknownFields(unknownFields());
        return gm7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.catalog_id;
        if (str != null) {
            lv8.D(str, "catalog_id=", arrayList);
        }
        Catalog catalog = this.catalog;
        if (catalog != null) {
            arrayList.add("catalog=" + catalog);
        }
        return bu1.F0(arrayList, ", ", "MediaResourceMediumCatalog{", "}", null, 56);
    }

    public MediaResourceMediumCatalog() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResourceMediumCatalog(String str, Catalog catalog, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.catalog_id = str;
        this.catalog = catalog;
    }
}
