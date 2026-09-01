package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.metadata.exif.ExifDirectoryBase;
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
import defpackage.il9;
import defpackage.jl9;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000e\b\u0007\u0018\u0000 &2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002'Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u000b2\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJw\u0010\u001f\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u001f\u0010 R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010!R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\"R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\"R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010#R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010$R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010%R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010$¨\u0006("}, d2 = {"Lcom/medium/proto/event/PostRead;", "Lcom/squareup/wire/AndroidMessage;", "Lil9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "collection_id", "collection_slug", "Lcom/medium/proto/event/PostViewedContext;", "context", "", "is_proxy_post", "Lcom/medium/proto/event/PostClientVisibilityState;", "post_visibility", "is_viewing_local_content", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/PostViewedContext;Ljava/lang/Boolean;Lcom/medium/proto/event/PostClientVisibilityState;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lil9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/PostViewedContext;Ljava/lang/Boolean;Lcom/medium/proto/event/PostClientVisibilityState;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/PostRead;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lcom/medium/proto/event/PostViewedContext;", "Ljava/lang/Boolean;", "Lcom/medium/proto/event/PostClientVisibilityState;", "Companion", "jl9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.clientRead")
public final class PostRead extends AndroidMessage<PostRead, il9> {
    public static final ProtoAdapter<PostRead> ADAPTER;
    public static final Parcelable.Creator<PostRead> CREATOR;
    public static final jl9 Companion = new jl9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String collection_slug;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.medium.proto.event.PostViewedContext#ADAPTER", schemaIndex = 4, tag = 5)
    public final PostViewedContext context;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 5, tag = 6)
    public final Boolean is_proxy_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 8)
    public final Boolean is_viewing_local_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.medium.proto.event.PostClientVisibilityState#ADAPTER", schemaIndex = 6, tag = 7)
    public final PostClientVisibilityState post_visibility;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostRead.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostRead> protoAdapter = new ProtoAdapter<PostRead>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostRead$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostRead decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                PostViewedContext postViewedContextDecode = null;
                Boolean boolDecode = null;
                PostClientVisibilityState postClientVisibilityStateDecode = null;
                Boolean boolDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostRead(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, postViewedContextDecode, boolDecode, postClientVisibilityStateDecode, boolDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            try {
                                postViewedContextDecode = PostViewedContext.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 6:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 7:
                            try {
                                postClientVisibilityStateDecode = PostClientVisibilityState.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 8:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostRead value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 4, value.collection_slug);
                PostViewedContext.ADAPTER.encodeWithTag(writer, 5, value.context);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 6, value.is_proxy_post);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 7, value.post_visibility);
                protoAdapter3.encodeWithTag(writer, 8, value.is_viewing_local_content);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostRead value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = PostViewedContext.ADAPTER.encodedSizeWithTag(5, value.context) + protoAdapter2.encodedSizeWithTag(4, value.collection_slug) + protoAdapter2.encodedSizeWithTag(3, value.collection_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(8, value.is_viewing_local_content) + PostClientVisibilityState.ADAPTER.encodedSizeWithTag(7, value.post_visibility) + protoAdapter3.encodedSizeWithTag(6, value.is_proxy_post) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostRead redact(PostRead value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PostRead.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, null, h21.d, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostRead value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 8, value.is_viewing_local_content);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 7, value.post_visibility);
                protoAdapter2.encodeWithTag(writer, 6, value.is_proxy_post);
                PostViewedContext.ADAPTER.encodeWithTag(writer, 5, value.context);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 4, value.collection_slug);
                protoAdapter3.encodeWithTag(writer, 3, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostRead(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, PostViewedContext postViewedContext, Boolean bool, PostClientVisibilityState postClientVisibilityState, Boolean bool2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : postViewedContext, (i & 32) != 0 ? null : bool, (i & 64) != 0 ? null : postClientVisibilityState, (i & 128) != 0 ? null : bool2, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostRead copy$default(PostRead postRead, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, PostViewedContext postViewedContext, Boolean bool, PostClientVisibilityState postClientVisibilityState, Boolean bool2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = postRead.common_fields;
        }
        if ((i & 2) != 0) {
            str = postRead.post_id;
        }
        if ((i & 4) != 0) {
            str2 = postRead.collection_id;
        }
        if ((i & 8) != 0) {
            str3 = postRead.collection_slug;
        }
        if ((i & 16) != 0) {
            postViewedContext = postRead.context;
        }
        if ((i & 32) != 0) {
            bool = postRead.is_proxy_post;
        }
        if ((i & 64) != 0) {
            postClientVisibilityState = postRead.post_visibility;
        }
        if ((i & 128) != 0) {
            bool2 = postRead.is_viewing_local_content;
        }
        if ((i & 256) != 0) {
            h21Var = postRead.unknownFields();
        }
        Boolean bool3 = bool2;
        h21 h21Var2 = h21Var;
        Boolean bool4 = bool;
        PostClientVisibilityState postClientVisibilityState2 = postClientVisibilityState;
        PostViewedContext postViewedContext2 = postViewedContext;
        String str4 = str2;
        return postRead.copy(analyticsEventCommonFields, str, str4, str3, postViewedContext2, bool4, postClientVisibilityState2, bool3, h21Var2);
    }

    public final PostRead copy(AnalyticsEventCommonFields common_fields, String post_id, String collection_id, String collection_slug, PostViewedContext context, Boolean is_proxy_post, PostClientVisibilityState post_visibility, Boolean is_viewing_local_content, h21 unknownFields) {
        unknownFields.getClass();
        return new PostRead(common_fields, post_id, collection_id, collection_slug, context, is_proxy_post, post_visibility, is_viewing_local_content, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostRead)) {
            return false;
        }
        PostRead postRead = (PostRead) other;
        return g76.L(unknownFields(), postRead.unknownFields()) && g76.L(this.common_fields, postRead.common_fields) && g76.L(this.post_id, postRead.post_id) && g76.L(this.collection_id, postRead.collection_id) && g76.L(this.collection_slug, postRead.collection_slug) && this.context == postRead.context && g76.L(this.is_proxy_post, postRead.is_proxy_post) && this.post_visibility == postRead.post_visibility && g76.L(this.is_viewing_local_content, postRead.is_viewing_local_content);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.collection_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_slug;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        PostViewedContext postViewedContext = this.context;
        int iHashCode6 = (iHashCode5 + (postViewedContext != null ? postViewedContext.hashCode() : 0)) * 37;
        Boolean bool = this.is_proxy_post;
        int i2 = (iHashCode6 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        int iHashCode7 = (i2 + (postClientVisibilityState != null ? postClientVisibilityState.hashCode() : 0)) * 37;
        Boolean bool2 = this.is_viewing_local_content;
        int i3 = iHashCode7 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final il9 newBuilder() {
        il9 il9Var = new il9();
        il9Var.a = this.common_fields;
        il9Var.b = this.post_id;
        il9Var.c = this.collection_id;
        il9Var.d = this.collection_slug;
        il9Var.e = this.context;
        il9Var.f = this.is_proxy_post;
        il9Var.g = this.post_visibility;
        il9Var.h = this.is_viewing_local_content;
        il9Var.addUnknownFields(unknownFields());
        return il9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        String str2 = this.collection_id;
        if (str2 != null) {
            lv8.D(str2, "collection_id=", arrayList);
        }
        String str3 = this.collection_slug;
        if (str3 != null) {
            lv8.D(str3, "collection_slug=", arrayList);
        }
        PostViewedContext postViewedContext = this.context;
        if (postViewedContext != null) {
            arrayList.add("context=" + postViewedContext);
        }
        Boolean bool = this.is_proxy_post;
        if (bool != null) {
            lv8.A("is_proxy_post=", bool, arrayList);
        }
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        if (postClientVisibilityState != null) {
            arrayList.add("post_visibility=" + postClientVisibilityState);
        }
        Boolean bool2 = this.is_viewing_local_content;
        if (bool2 != null) {
            lv8.A("is_viewing_local_content=", bool2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostRead{", "}", null, 56);
    }

    public PostRead() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostRead(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, PostViewedContext postViewedContext, Boolean bool, PostClientVisibilityState postClientVisibilityState, Boolean bool2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.collection_id = str2;
        this.collection_slug = str3;
        this.context = postViewedContext;
        this.is_proxy_post = bool;
        this.post_visibility = postClientVisibilityState;
        this.is_viewing_local_content = bool2;
    }
}
