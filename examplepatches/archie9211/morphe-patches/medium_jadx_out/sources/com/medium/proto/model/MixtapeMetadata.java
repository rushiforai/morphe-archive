package com.medium.proto.model;

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
import defpackage.c18;
import defpackage.d18;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\b\u0007\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J;\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0019¨\u0006\u001c"}, d2 = {"Lcom/medium/proto/model/MixtapeMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lc18;", "", "media_resource_id", "thumbnail_image_id", "href", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lc18;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/model/MixtapeMetadata;", "Ljava/lang/String;", "Companion", "d18", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MixtapeMetadata extends AndroidMessage<MixtapeMetadata, c18> {
    public static final ProtoAdapter<MixtapeMetadata> ADAPTER;
    public static final Parcelable.Creator<MixtapeMetadata> CREATOR;
    public static final d18 Companion = new d18();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String href;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String media_resource_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String thumbnail_image_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MixtapeMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MixtapeMetadata> protoAdapter = new ProtoAdapter<MixtapeMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.MixtapeMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MixtapeMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MixtapeMetadata(strDecode, strDecode2, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MixtapeMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
                protoAdapter2.encodeWithTag(writer, 2, value.thumbnail_image_id);
                protoAdapter2.encodeWithTag(writer, 3, value.href);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MixtapeMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(3, value.href) + protoAdapter2.encodedSizeWithTag(2, value.thumbnail_image_id) + protoAdapter2.encodedSizeWithTag(1, value.media_resource_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MixtapeMetadata redact(MixtapeMetadata value) {
                value.getClass();
                return MixtapeMetadata.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MixtapeMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.href);
                protoAdapter2.encodeWithTag(writer, 2, value.thumbnail_image_id);
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MixtapeMetadata(String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MixtapeMetadata copy$default(MixtapeMetadata mixtapeMetadata, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mixtapeMetadata.media_resource_id;
        }
        if ((i & 2) != 0) {
            str2 = mixtapeMetadata.thumbnail_image_id;
        }
        if ((i & 4) != 0) {
            str3 = mixtapeMetadata.href;
        }
        if ((i & 8) != 0) {
            h21Var = mixtapeMetadata.unknownFields();
        }
        return mixtapeMetadata.copy(str, str2, str3, h21Var);
    }

    public final MixtapeMetadata copy(String media_resource_id, String thumbnail_image_id, String href, h21 unknownFields) {
        unknownFields.getClass();
        return new MixtapeMetadata(media_resource_id, thumbnail_image_id, href, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MixtapeMetadata)) {
            return false;
        }
        MixtapeMetadata mixtapeMetadata = (MixtapeMetadata) other;
        return g76.L(unknownFields(), mixtapeMetadata.unknownFields()) && g76.L(this.media_resource_id, mixtapeMetadata.media_resource_id) && g76.L(this.thumbnail_image_id, mixtapeMetadata.thumbnail_image_id) && g76.L(this.href, mixtapeMetadata.href);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.media_resource_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.thumbnail_image_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.href;
        int iHashCode4 = iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final c18 newBuilder() {
        c18 c18Var = new c18();
        c18Var.a = this.media_resource_id;
        c18Var.b = this.thumbnail_image_id;
        c18Var.c = this.href;
        c18Var.addUnknownFields(unknownFields());
        return c18Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.media_resource_id;
        if (str != null) {
            lv8.D(str, "media_resource_id=", arrayList);
        }
        String str2 = this.thumbnail_image_id;
        if (str2 != null) {
            lv8.D(str2, "thumbnail_image_id=", arrayList);
        }
        String str3 = this.href;
        if (str3 != null) {
            lv8.D(str3, "href=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MixtapeMetadata{", "}", null, 56);
    }

    public MixtapeMetadata() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MixtapeMetadata(String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.media_resource_id = str;
        this.thumbnail_image_id = str2;
        this.href = str3;
    }
}
