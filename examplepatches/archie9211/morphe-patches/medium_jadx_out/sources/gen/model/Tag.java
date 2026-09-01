package gen.model;

import android.os.Parcelable;
import com.medium.android.data.notification.YMl.DtuT;
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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.t7d;
import defpackage.u7d;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\b\u0007\u0018\u0000 %2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002&BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0096\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ_\u0010\u001e\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u001e\u0010\u001fR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010 R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010!R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\"R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010#R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010$¨\u0006'"}, d2 = {"Lgen/model/Tag;", "Lcom/squareup/wire/AndroidMessage;", "Lt7d;", "", "slug", "name", "", "post_count", "Lgen/model/UserTagRelation;", "user_relation", "Lgen/model/TagVirtuals;", "virtuals", "Lgen/model/TagMetadata;", "metadata", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lgen/model/UserTagRelation;Lgen/model/TagVirtuals;Lgen/model/TagMetadata;Lh21;)V", "newBuilder", "()Lt7d;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lgen/model/UserTagRelation;Lgen/model/TagVirtuals;Lgen/model/TagMetadata;Lh21;)Lgen/model/Tag;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/UserTagRelation;", "Lgen/model/TagVirtuals;", "Lgen/model/TagMetadata;", "Companion", "u7d", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Tag extends AndroidMessage<Tag, t7d> {
    public static final ProtoAdapter<Tag> ADAPTER;
    public static final Parcelable.Creator<Tag> CREATOR;
    public static final u7d Companion = new u7d();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.TagMetadata#ADAPTER", schemaIndex = 5, tag = 6)
    public final TagMetadata metadata;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long post_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String slug;

    @WireField(adapter = "gen.model.UserTagRelation#ADAPTER", schemaIndex = 3, tag = 4)
    public final UserTagRelation user_relation;

    @WireField(adapter = "gen.model.TagVirtuals#ADAPTER", schemaIndex = 4, tag = 5)
    public final TagVirtuals virtuals;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Tag.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Tag> protoAdapter = new ProtoAdapter<Tag>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Tag$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Tag decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                Long lDecode = null;
                UserTagRelation userTagRelationDecode = null;
                TagVirtuals tagVirtualsDecode = null;
                TagMetadata tagMetadataDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Tag(strDecode, strDecode2, lDecode, userTagRelationDecode, tagVirtualsDecode, tagMetadataDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 4:
                            userTagRelationDecode = UserTagRelation.ADAPTER.decode(reader);
                            break;
                        case 5:
                            tagVirtualsDecode = TagVirtuals.ADAPTER.decode(reader);
                            break;
                        case 6:
                            tagMetadataDecode = TagMetadata.ADAPTER.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Tag value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.slug);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.post_count);
                UserTagRelation.ADAPTER.encodeWithTag(writer, 4, value.user_relation);
                TagVirtuals.ADAPTER.encodeWithTag(writer, 5, value.virtuals);
                TagMetadata.ADAPTER.encodeWithTag(writer, 6, value.metadata);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Tag value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return TagMetadata.ADAPTER.encodedSizeWithTag(6, value.metadata) + TagVirtuals.ADAPTER.encodedSizeWithTag(5, value.virtuals) + UserTagRelation.ADAPTER.encodedSizeWithTag(4, value.user_relation) + ProtoAdapter.INT64.encodedSizeWithTag(3, value.post_count) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.slug) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Tag redact(Tag value) {
                value.getClass();
                UserTagRelation userTagRelation = value.user_relation;
                UserTagRelation userTagRelationRedact = userTagRelation != null ? UserTagRelation.ADAPTER.redact(userTagRelation) : null;
                TagVirtuals tagVirtuals = value.virtuals;
                TagVirtuals tagVirtualsRedact = tagVirtuals != null ? TagVirtuals.ADAPTER.redact(tagVirtuals) : null;
                TagMetadata tagMetadata = value.metadata;
                return Tag.copy$default(value, null, null, null, userTagRelationRedact, tagVirtualsRedact, tagMetadata != null ? TagMetadata.ADAPTER.redact(tagMetadata) : null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Tag value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                TagMetadata.ADAPTER.encodeWithTag(writer, 6, value.metadata);
                TagVirtuals.ADAPTER.encodeWithTag(writer, 5, value.virtuals);
                UserTagRelation.ADAPTER.encodeWithTag(writer, 4, value.user_relation);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.post_count);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 1, value.slug);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Tag(String str, String str2, Long l, UserTagRelation userTagRelation, TagVirtuals tagVirtuals, TagMetadata tagMetadata, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : userTagRelation, (i & 16) != 0 ? null : tagVirtuals, (i & 32) != 0 ? null : tagMetadata, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, Long l, UserTagRelation userTagRelation, TagVirtuals tagVirtuals, TagMetadata tagMetadata, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = tag.slug;
        }
        if ((i & 2) != 0) {
            str2 = tag.name;
        }
        if ((i & 4) != 0) {
            l = tag.post_count;
        }
        if ((i & 8) != 0) {
            userTagRelation = tag.user_relation;
        }
        if ((i & 16) != 0) {
            tagVirtuals = tag.virtuals;
        }
        if ((i & 32) != 0) {
            tagMetadata = tag.metadata;
        }
        if ((i & 64) != 0) {
            h21Var = tag.unknownFields();
        }
        TagMetadata tagMetadata2 = tagMetadata;
        h21 h21Var2 = h21Var;
        TagVirtuals tagVirtuals2 = tagVirtuals;
        Long l2 = l;
        return tag.copy(str, str2, l2, userTagRelation, tagVirtuals2, tagMetadata2, h21Var2);
    }

    public final Tag copy(String slug, String name, Long post_count, UserTagRelation user_relation, TagVirtuals virtuals, TagMetadata metadata, h21 unknownFields) {
        unknownFields.getClass();
        return new Tag(slug, name, post_count, user_relation, virtuals, metadata, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Tag)) {
            return false;
        }
        Tag tag = (Tag) other;
        return g76.L(unknownFields(), tag.unknownFields()) && g76.L(this.slug, tag.slug) && g76.L(this.name, tag.name) && g76.L(this.post_count, tag.post_count) && g76.L(this.user_relation, tag.user_relation) && g76.L(this.virtuals, tag.virtuals) && g76.L(this.metadata, tag.metadata);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.slug;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Long l = this.post_count;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i3 = (iHashCode3 + i) * 37;
        UserTagRelation userTagRelation = this.user_relation;
        int iHashCode4 = (i3 + (userTagRelation != null ? userTagRelation.hashCode() : 0)) * 37;
        TagVirtuals tagVirtuals = this.virtuals;
        int iHashCode5 = (iHashCode4 + (tagVirtuals != null ? tagVirtuals.hashCode() : 0)) * 37;
        TagMetadata tagMetadata = this.metadata;
        int iHashCode6 = iHashCode5 + (tagMetadata != null ? tagMetadata.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final t7d newBuilder() {
        t7d t7dVar = new t7d();
        t7dVar.a = this.slug;
        t7dVar.b = this.name;
        t7dVar.c = this.post_count;
        t7dVar.d = this.user_relation;
        t7dVar.e = this.virtuals;
        t7dVar.f = this.metadata;
        t7dVar.addUnknownFields(unknownFields());
        return t7dVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.slug;
        if (str != null) {
            lv8.D(str, "slug=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        Long l = this.post_count;
        if (l != null) {
            y30.A("post_count=", l, arrayList);
        }
        UserTagRelation userTagRelation = this.user_relation;
        if (userTagRelation != null) {
            arrayList.add("user_relation=" + userTagRelation);
        }
        TagVirtuals tagVirtuals = this.virtuals;
        if (tagVirtuals != null) {
            arrayList.add(DtuT.nHXnqlgVAdkrSd + tagVirtuals);
        }
        TagMetadata tagMetadata = this.metadata;
        if (tagMetadata != null) {
            arrayList.add("metadata=" + tagMetadata);
        }
        return bu1.F0(arrayList, ", ", "Tag{", "}", null, 56);
    }

    public Tag() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Tag(String str, String str2, Long l, UserTagRelation userTagRelation, TagVirtuals tagVirtuals, TagMetadata tagMetadata, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.slug = str;
        this.name = str2;
        this.post_count = l;
        this.user_relation = userTagRelation;
        this.virtuals = tagVirtuals;
        this.metadata = tagMetadata;
    }
}
