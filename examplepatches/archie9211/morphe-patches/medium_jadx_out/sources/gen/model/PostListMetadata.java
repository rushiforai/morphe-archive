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
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.ph9;
import defpackage.qh9;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\u0018\u0000 %2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002&Bi\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\nH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJo\u0010\u001e\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u001e\u0010\u001fR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010 R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010!R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R\u0016\u0010\f\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010#R\u0016\u0010\r\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010#R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010#R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010$¨\u0006'"}, d2 = {"Lgen/model/PostListMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lph9;", "Lgen/model/PostListSource;", "source", "Lgen/model/PostListLayout;", "layout", "", "number", "", "", "post_ids", "tag_slug", "tag_name", "section_header", "Lh21;", "unknownFields", "<init>", "(Lgen/model/PostListSource;Lgen/model/PostListLayout;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lph9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/PostListSource;Lgen/model/PostListLayout;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/PostListMetadata;", "Lgen/model/PostListSource;", "Lgen/model/PostListLayout;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/util/List;", "Companion", "qh9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostListMetadata extends AndroidMessage<PostListMetadata, ph9> {
    public static final ProtoAdapter<PostListMetadata> ADAPTER;
    public static final Parcelable.Creator<PostListMetadata> CREATOR;
    public static final qh9 Companion = new qh9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.PostListLayout#ADAPTER", schemaIndex = 1, tag = 2)
    public final PostListLayout layout;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer number;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 4)
    public final List<String> post_ids;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String section_header;

    @WireField(adapter = "gen.model.PostListSource#ADAPTER", schemaIndex = 0, tag = 1)
    public final PostListSource source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String tag_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String tag_slug;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostListMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostListMetadata> protoAdapter = new ProtoAdapter<PostListMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.PostListMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostListMetadata decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                PostListSource postListSourceDecode = null;
                PostListLayout postListLayoutDecode = null;
                Integer numDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostListMetadata(postListSourceDecode, postListLayoutDecode, numDecode, arrayListF, strDecode, strDecode2, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            try {
                                postListSourceDecode = PostListSource.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 2:
                            try {
                                postListLayoutDecode = PostListLayout.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 3:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 4:
                            arrayListF.add(ProtoAdapter.STRING.decode(reader));
                            break;
                        case 5:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostListMetadata value) {
                writer.getClass();
                value.getClass();
                PostListSource.ADAPTER.encodeWithTag(writer, 1, value.source);
                PostListLayout.ADAPTER.encodeWithTag(writer, 2, value.layout);
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.number);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.asRepeated().encodeWithTag(writer, 4, value.post_ids);
                protoAdapter2.encodeWithTag(writer, 5, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 6, value.tag_name);
                protoAdapter2.encodeWithTag(writer, 7, value.section_header);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostListMetadata value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.INT32.encodedSizeWithTag(3, value.number) + PostListLayout.ADAPTER.encodedSizeWithTag(2, value.layout) + PostListSource.ADAPTER.encodedSizeWithTag(1, value.source) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(7, value.section_header) + protoAdapter2.encodedSizeWithTag(6, value.tag_name) + protoAdapter2.encodedSizeWithTag(5, value.tag_slug) + protoAdapter2.asRepeated().encodedSizeWithTag(4, value.post_ids) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostListMetadata redact(PostListMetadata value) {
                value.getClass();
                return PostListMetadata.copy$default(value, null, null, null, null, null, null, null, h21.d, 127, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostListMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 7, value.section_header);
                protoAdapter2.encodeWithTag(writer, 6, value.tag_name);
                protoAdapter2.encodeWithTag(writer, 5, value.tag_slug);
                protoAdapter2.asRepeated().encodeWithTag(writer, 4, value.post_ids);
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.number);
                PostListLayout.ADAPTER.encodeWithTag(writer, 2, value.layout);
                PostListSource.ADAPTER.encodeWithTag(writer, 1, value.source);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostListMetadata(PostListSource postListSource, PostListLayout postListLayout, Integer num, List list, String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : postListSource, (i & 2) != 0 ? null : postListLayout, (i & 4) != 0 ? null : num, (i & 8) != 0 ? ey3.a : list, (i & 16) != 0 ? null : str, (i & 32) != 0 ? null : str2, (i & 64) != 0 ? null : str3, (i & 128) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PostListMetadata copy$default(PostListMetadata postListMetadata, PostListSource postListSource, PostListLayout postListLayout, Integer num, List list, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            postListSource = postListMetadata.source;
        }
        if ((i & 2) != 0) {
            postListLayout = postListMetadata.layout;
        }
        if ((i & 4) != 0) {
            num = postListMetadata.number;
        }
        if ((i & 8) != 0) {
            list = postListMetadata.post_ids;
        }
        if ((i & 16) != 0) {
            str = postListMetadata.tag_slug;
        }
        if ((i & 32) != 0) {
            str2 = postListMetadata.tag_name;
        }
        if ((i & 64) != 0) {
            str3 = postListMetadata.section_header;
        }
        if ((i & 128) != 0) {
            h21Var = postListMetadata.unknownFields();
        }
        String str4 = str3;
        h21 h21Var2 = h21Var;
        String str5 = str;
        String str6 = str2;
        return postListMetadata.copy(postListSource, postListLayout, num, list, str5, str6, str4, h21Var2);
    }

    public final PostListMetadata copy(PostListSource source, PostListLayout layout, Integer number, List<String> post_ids, String tag_slug, String tag_name, String section_header, h21 unknownFields) {
        post_ids.getClass();
        unknownFields.getClass();
        return new PostListMetadata(source, layout, number, post_ids, tag_slug, tag_name, section_header, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostListMetadata)) {
            return false;
        }
        PostListMetadata postListMetadata = (PostListMetadata) other;
        return g76.L(unknownFields(), postListMetadata.unknownFields()) && this.source == postListMetadata.source && this.layout == postListMetadata.layout && g76.L(this.number, postListMetadata.number) && g76.L(this.post_ids, postListMetadata.post_ids) && g76.L(this.tag_slug, postListMetadata.tag_slug) && g76.L(this.tag_name, postListMetadata.tag_name) && g76.L(this.section_header, postListMetadata.section_header);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        PostListSource postListSource = this.source;
        int iHashCode2 = (iHashCode + (postListSource != null ? postListSource.hashCode() : 0)) * 37;
        PostListLayout postListLayout = this.layout;
        int iHashCode3 = (iHashCode2 + (postListLayout != null ? postListLayout.hashCode() : 0)) * 37;
        Integer num = this.number;
        int iP = wgd.p((iHashCode3 + (num != null ? num.intValue() : 0)) * 37, 37, this.post_ids);
        String str = this.tag_slug;
        int iHashCode4 = (iP + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.tag_name;
        int iHashCode5 = (iHashCode4 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.section_header;
        int iHashCode6 = iHashCode5 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final ph9 newBuilder() {
        ph9 ph9Var = new ph9();
        ph9Var.d = ey3.a;
        ph9Var.a = this.source;
        ph9Var.b = this.layout;
        ph9Var.c = this.number;
        ph9Var.d = this.post_ids;
        ph9Var.e = this.tag_slug;
        ph9Var.f = this.tag_name;
        ph9Var.g = this.section_header;
        ph9Var.addUnknownFields(unknownFields());
        return ph9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        PostListSource postListSource = this.source;
        if (postListSource != null) {
            arrayList.add("source=" + postListSource);
        }
        PostListLayout postListLayout = this.layout;
        if (postListLayout != null) {
            arrayList.add("layout=" + postListLayout);
        }
        Integer num = this.number;
        if (num != null) {
            lv8.B("number=", num, arrayList);
        }
        if (!this.post_ids.isEmpty()) {
            arrayList.add("post_ids=".concat(Internal.sanitize(this.post_ids)));
        }
        String str = this.tag_slug;
        if (str != null) {
            lv8.D(str, "tag_slug=", arrayList);
        }
        String str2 = this.tag_name;
        if (str2 != null) {
            lv8.D(str2, "tag_name=", arrayList);
        }
        String str3 = this.section_header;
        if (str3 != null) {
            lv8.D(str3, "section_header=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostListMetadata{", "}", null, 56);
    }

    public PostListMetadata() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostListMetadata(PostListSource postListSource, PostListLayout postListLayout, Integer num, List<String> list, String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.source = postListSource;
        this.layout = postListLayout;
        this.number = num;
        this.tag_slug = str;
        this.tag_name = str2;
        this.section_header = str3;
        this.post_ids = Internal.immutableCopyOf("post_ids", list);
    }
}
