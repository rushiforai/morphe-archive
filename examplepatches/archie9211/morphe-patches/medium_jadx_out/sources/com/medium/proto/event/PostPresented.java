package com.medium.proto.event;

import android.os.Parcelable;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
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
import defpackage.r34;
import defpackage.rj9;
import defpackage.sj9;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0010\b\u0007\u0018\u0000 )2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002*B}\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u0019\u001a\u00020\t2\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0096\u0002¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u0083\u0001\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b \u0010!R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\"R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010#R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010#R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010$R\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010#\u0012\u0004\b%\u0010&R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010'R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010(R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010$¨\u0006+"}, d2 = {"Lcom/medium/proto/event/PostPresented;", "Lcom/squareup/wire/AndroidMessage;", "Lrj9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "source", "collection_id", "", "is_proxy_post", "referrer_source", "Lcom/medium/proto/event/PostClientVisibilityState;", "post_visibility", "Lcom/medium/proto/event/PostDensity;", "density", "is_viewing_local_content", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lcom/medium/proto/event/PostClientVisibilityState;Lcom/medium/proto/event/PostDensity;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lrj9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lcom/medium/proto/event/PostClientVisibilityState;Lcom/medium/proto/event/PostDensity;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/PostPresented;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "getReferrer_source$annotations", "()V", "Lcom/medium/proto/event/PostClientVisibilityState;", "Lcom/medium/proto/event/PostDensity;", "Companion", "sj9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.clientPresented")
public final class PostPresented extends AndroidMessage<PostPresented, rj9> {
    public static final ProtoAdapter<PostPresented> ADAPTER;
    public static final Parcelable.Creator<PostPresented> CREATOR;
    public static final sj9 Companion = new sj9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String collection_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.medium.proto.event.PostDensity#ADAPTER", schemaIndex = 7, tag = 8)
    public final PostDensity density;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean is_proxy_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean is_viewing_local_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.medium.proto.event.PostClientVisibilityState#ADAPTER", schemaIndex = 6, tag = 7)
    public final PostClientVisibilityState post_visibility;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String source;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostPresented.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostPresented> protoAdapter = new ProtoAdapter<PostPresented>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostPresented$Companion$ADAPTER$1
            {
                String str = JWcjNoweKCnTr.nOiRK;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostPresented decode(ProtoReader reader) {
                AnalyticsEventCommonFields analyticsEventCommonFields;
                String str;
                String str2;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                String strDecode4 = null;
                PostClientVisibilityState postClientVisibilityStateDecode = null;
                PostDensity postDensityDecode = null;
                Boolean boolDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostPresented(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, boolDecode, strDecode4, postClientVisibilityStateDecode, postDensityDecode, boolDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                            str = strDecode;
                            try {
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                postClientVisibilityStateDecode = PostClientVisibilityState.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                str2 = strDecode2;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                strDecode2 = str2;
                            }
                            strDecode = str;
                            break;
                        case 8:
                            try {
                                postDensityDecode = PostDensity.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                                str = strDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                str2 = strDecode2;
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                strDecode2 = str2;
                                strDecode = str;
                            }
                            break;
                        case 9:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                            str = strDecode;
                            str2 = strDecode2;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostPresented value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.source);
                protoAdapter2.encodeWithTag(writer, 4, value.collection_id);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 5, value.is_proxy_post);
                protoAdapter2.encodeWithTag(writer, 6, value.referrer_source);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 7, value.post_visibility);
                PostDensity.ADAPTER.encodeWithTag(writer, 8, value.density);
                protoAdapter3.encodeWithTag(writer, 9, value.is_viewing_local_content);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostPresented value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(4, value.collection_id) + protoAdapter2.encodedSizeWithTag(3, value.source) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(9, value.is_viewing_local_content) + PostDensity.ADAPTER.encodedSizeWithTag(8, value.density) + PostClientVisibilityState.ADAPTER.encodedSizeWithTag(7, value.post_visibility) + protoAdapter2.encodedSizeWithTag(6, value.referrer_source) + protoAdapter3.encodedSizeWithTag(5, value.is_proxy_post) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostPresented redact(PostPresented value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PostPresented.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, null, null, h21.d, 510, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostPresented value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 9, value.is_viewing_local_content);
                PostDensity.ADAPTER.encodeWithTag(writer, 8, value.density);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 7, value.post_visibility);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 6, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 5, value.is_proxy_post);
                protoAdapter3.encodeWithTag(writer, 4, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 3, value.source);
                protoAdapter3.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, PostClientVisibilityState postClientVisibilityState, PostDensity postDensity, Boolean bool2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : bool, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : postClientVisibilityState, (i & 128) != 0 ? null : postDensity, (i & 256) != 0 ? null : bool2, (i & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostPresented copy$default(PostPresented postPresented, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, PostClientVisibilityState postClientVisibilityState, PostDensity postDensity, Boolean bool2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = postPresented.common_fields;
        }
        if ((i & 2) != 0) {
            str = postPresented.post_id;
        }
        if ((i & 4) != 0) {
            str2 = postPresented.source;
        }
        if ((i & 8) != 0) {
            str3 = postPresented.collection_id;
        }
        if ((i & 16) != 0) {
            bool = postPresented.is_proxy_post;
        }
        if ((i & 32) != 0) {
            str4 = postPresented.referrer_source;
        }
        if ((i & 64) != 0) {
            postClientVisibilityState = postPresented.post_visibility;
        }
        if ((i & 128) != 0) {
            postDensity = postPresented.density;
        }
        if ((i & 256) != 0) {
            bool2 = postPresented.is_viewing_local_content;
        }
        if ((i & 512) != 0) {
            h21Var = postPresented.unknownFields();
        }
        Boolean bool3 = bool2;
        h21 h21Var2 = h21Var;
        PostClientVisibilityState postClientVisibilityState2 = postClientVisibilityState;
        PostDensity postDensity2 = postDensity;
        Boolean bool4 = bool;
        String str5 = str4;
        return postPresented.copy(analyticsEventCommonFields, str, str2, str3, bool4, str5, postClientVisibilityState2, postDensity2, bool3, h21Var2);
    }

    public final PostPresented copy(AnalyticsEventCommonFields common_fields, String post_id, String source, String collection_id, Boolean is_proxy_post, String referrer_source, PostClientVisibilityState post_visibility, PostDensity density, Boolean is_viewing_local_content, h21 unknownFields) {
        unknownFields.getClass();
        return new PostPresented(common_fields, post_id, source, collection_id, is_proxy_post, referrer_source, post_visibility, density, is_viewing_local_content, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostPresented)) {
            return false;
        }
        PostPresented postPresented = (PostPresented) other;
        return g76.L(unknownFields(), postPresented.unknownFields()) && g76.L(this.common_fields, postPresented.common_fields) && g76.L(this.post_id, postPresented.post_id) && g76.L(this.source, postPresented.source) && g76.L(this.collection_id, postPresented.collection_id) && g76.L(this.is_proxy_post, postPresented.is_proxy_post) && g76.L(this.referrer_source, postPresented.referrer_source) && this.post_visibility == postPresented.post_visibility && this.density == postPresented.density && g76.L(this.is_viewing_local_content, postPresented.is_viewing_local_content);
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
        String str2 = this.source;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_id;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool = this.is_proxy_post;
        int i2 = (iHashCode5 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.referrer_source;
        int iHashCode6 = (i2 + (str4 != null ? str4.hashCode() : 0)) * 37;
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        int iHashCode7 = (iHashCode6 + (postClientVisibilityState != null ? postClientVisibilityState.hashCode() : 0)) * 37;
        PostDensity postDensity = this.density;
        int iHashCode8 = (iHashCode7 + (postDensity != null ? postDensity.hashCode() : 0)) * 37;
        Boolean bool2 = this.is_viewing_local_content;
        int i3 = iHashCode8 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final rj9 newBuilder() {
        rj9 rj9Var = new rj9();
        rj9Var.a = this.common_fields;
        rj9Var.b = this.post_id;
        rj9Var.c = this.source;
        rj9Var.d = this.collection_id;
        rj9Var.e = this.is_proxy_post;
        rj9Var.f = this.referrer_source;
        rj9Var.g = this.post_visibility;
        rj9Var.h = this.density;
        rj9Var.i = this.is_viewing_local_content;
        rj9Var.addUnknownFields(unknownFields());
        return rj9Var;
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
        String str2 = this.source;
        if (str2 != null) {
            lv8.D(str2, "source=", arrayList);
        }
        String str3 = this.collection_id;
        if (str3 != null) {
            lv8.D(str3, "collection_id=", arrayList);
        }
        Boolean bool = this.is_proxy_post;
        if (bool != null) {
            lv8.A("is_proxy_post=", bool, arrayList);
        }
        String str4 = this.referrer_source;
        if (str4 != null) {
            lv8.D(str4, "referrer_source=", arrayList);
        }
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        if (postClientVisibilityState != null) {
            arrayList.add("post_visibility=" + postClientVisibilityState);
        }
        PostDensity postDensity = this.density;
        if (postDensity != null) {
            arrayList.add("density=" + postDensity);
        }
        Boolean bool2 = this.is_viewing_local_content;
        if (bool2 != null) {
            lv8.A("is_viewing_local_content=", bool2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostPresented{", "}", null, 56);
    }

    public static /* synthetic */ void getReferrer_source$annotations() {
    }

    public PostPresented() {
        this(null, null, null, null, null, null, null, null, null, null, 1023, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, PostClientVisibilityState postClientVisibilityState, PostDensity postDensity, Boolean bool2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.source = str2;
        this.collection_id = str3;
        this.is_proxy_post = bool;
        this.referrer_source = str4;
        this.post_visibility = postClientVisibilityState;
        this.density = postDensity;
        this.is_viewing_local_content = bool2;
    }
}
