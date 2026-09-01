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
import defpackage.b1d;
import defpackage.bu1;
import defpackage.c1d;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lgen/model/SuggestionReasonCollection;", "Lcom/squareup/wire/AndroidMessage;", "Lb1d;", "", "collection_id", "name", "slug", "Lgen/model/ImageDisplay;", "image", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Lh21;)V", "newBuilder", "()Lb1d;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Lh21;)Lgen/model/SuggestionReasonCollection;", "Ljava/lang/String;", "Lgen/model/ImageDisplay;", "Companion", "c1d", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SuggestionReasonCollection extends AndroidMessage<SuggestionReasonCollection, b1d> {
    public static final ProtoAdapter<SuggestionReasonCollection> ADAPTER;
    public static final Parcelable.Creator<SuggestionReasonCollection> CREATOR;
    public static final c1d Companion = new c1d();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String collection_id;

    @WireField(adapter = "gen.model.ImageDisplay#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageDisplay image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String slug;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SuggestionReasonCollection.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SuggestionReasonCollection> protoAdapter = new ProtoAdapter<SuggestionReasonCollection>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.SuggestionReasonCollection$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonCollection decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                ImageDisplay imageDisplayDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SuggestionReasonCollection(strDecode, strDecode2, strDecode3, imageDisplayDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        imageDisplayDecode = ImageDisplay.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SuggestionReasonCollection value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 3, value.slug);
                ImageDisplay.ADAPTER.encodeWithTag(writer, 4, value.image);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SuggestionReasonCollection value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ImageDisplay.ADAPTER.encodedSizeWithTag(4, value.image) + protoAdapter2.encodedSizeWithTag(3, value.slug) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.collection_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonCollection redact(SuggestionReasonCollection value) {
                value.getClass();
                ImageDisplay imageDisplay = value.image;
                return SuggestionReasonCollection.copy$default(value, null, null, null, imageDisplay != null ? ImageDisplay.ADAPTER.redact(imageDisplay) : null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SuggestionReasonCollection value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ImageDisplay.ADAPTER.encodeWithTag(writer, 4, value.image);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.slug);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SuggestionReasonCollection(String str, String str2, String str3, ImageDisplay imageDisplay, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : imageDisplay, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SuggestionReasonCollection copy$default(SuggestionReasonCollection suggestionReasonCollection, String str, String str2, String str3, ImageDisplay imageDisplay, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = suggestionReasonCollection.collection_id;
        }
        if ((i & 2) != 0) {
            str2 = suggestionReasonCollection.name;
        }
        if ((i & 4) != 0) {
            str3 = suggestionReasonCollection.slug;
        }
        if ((i & 8) != 0) {
            imageDisplay = suggestionReasonCollection.image;
        }
        if ((i & 16) != 0) {
            h21Var = suggestionReasonCollection.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str4 = str3;
        return suggestionReasonCollection.copy(str, str2, str4, imageDisplay, h21Var2);
    }

    public final SuggestionReasonCollection copy(String collection_id, String name, String slug, ImageDisplay image, h21 unknownFields) {
        unknownFields.getClass();
        return new SuggestionReasonCollection(collection_id, name, slug, image, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SuggestionReasonCollection)) {
            return false;
        }
        SuggestionReasonCollection suggestionReasonCollection = (SuggestionReasonCollection) other;
        return g76.L(unknownFields(), suggestionReasonCollection.unknownFields()) && g76.L(this.collection_id, suggestionReasonCollection.collection_id) && g76.L(this.name, suggestionReasonCollection.name) && g76.L(this.slug, suggestionReasonCollection.slug) && g76.L(this.image, suggestionReasonCollection.image);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.collection_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.slug;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageDisplay imageDisplay = this.image;
        int iHashCode5 = iHashCode4 + (imageDisplay != null ? imageDisplay.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final b1d newBuilder() {
        b1d b1dVar = new b1d();
        b1dVar.a = this.collection_id;
        b1dVar.b = this.name;
        b1dVar.c = this.slug;
        b1dVar.d = this.image;
        b1dVar.addUnknownFields(unknownFields());
        return b1dVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.collection_id;
        if (str != null) {
            lv8.D(str, "collection_id=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.slug;
        if (str3 != null) {
            lv8.D(str3, "slug=", arrayList);
        }
        ImageDisplay imageDisplay = this.image;
        if (imageDisplay != null) {
            arrayList.add("image=" + imageDisplay);
        }
        return bu1.F0(arrayList, ", ", "SuggestionReasonCollection{", "}", null, 56);
    }

    public SuggestionReasonCollection() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SuggestionReasonCollection(String str, String str2, String str3, ImageDisplay imageDisplay, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.collection_id = str;
        this.name = str2;
        this.slug = str3;
        this.image = imageDisplay;
    }
}
