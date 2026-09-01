package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
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
import defpackage.tw9;
import defpackage.uw9;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0010\b\u0007\u0018\u0000 -2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002.B\u00ad\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u001a\u0010\u001d\u001a\u00020\f2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0096\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010 \u001a\u00020\u001fH\u0016¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\"\u0010#J³\u0001\u0010$\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b$\u0010%R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010&R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010'R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0007\u0010'\u0012\u0004\b(\u0010)R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010'R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010'R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010*R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010+R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010+R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010,R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010+R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010+R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010'R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010+¨\u0006/"}, d2 = {"Lcom/medium/proto/event/PostViewed;", "Lcom/squareup/wire/AndroidMessage;", "Ltw9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "referrer_source", "collection_id", "collection_slug", "Lcom/medium/proto/event/PostViewedContext;", "context", "", "is_proxy_post", "is_series", "Lcom/medium/proto/event/PostClientVisibilityState;", "post_visibility", "is_truncated", "is_viewing_local_content", "post_share_key", "app_settings_fullswipebackgesture_enabled", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/PostViewedContext;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/medium/proto/event/PostClientVisibilityState;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Ltw9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/PostViewedContext;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/medium/proto/event/PostClientVisibilityState;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/PostViewed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "getReferrer_source$annotations", "()V", "Lcom/medium/proto/event/PostViewedContext;", "Ljava/lang/Boolean;", "Lcom/medium/proto/event/PostClientVisibilityState;", "Companion", "uw9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.clientViewed")
public final class PostViewed extends AndroidMessage<PostViewed, tw9> {
    public static final ProtoAdapter<PostViewed> ADAPTER;
    public static final Parcelable.Creator<PostViewed> CREATOR;
    public static final uw9 Companion = new uw9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 12, tag = 13)
    public final Boolean app_settings_fullswipebackgesture_enabled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String collection_slug;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.medium.proto.event.PostViewedContext#ADAPTER", schemaIndex = 5, tag = 6)
    public final PostViewedContext context;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 7)
    public final Boolean is_proxy_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 8)
    public final Boolean is_series;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 9, tag = 10)
    public final Boolean is_truncated;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 10, tag = 11)
    public final Boolean is_viewing_local_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String post_share_key;

    @WireField(adapter = "com.medium.proto.event.PostClientVisibilityState#ADAPTER", schemaIndex = 8, tag = 9)
    public final PostClientVisibilityState post_visibility;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String referrer_source;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostViewed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostViewed> protoAdapter = new ProtoAdapter<PostViewed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostViewed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostViewed decode(ProtoReader reader) {
                String str;
                String str2;
                String str3;
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFields = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                PostViewedContext postViewedContextDecode = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                PostClientVisibilityState postClientVisibilityStateDecode = null;
                Boolean boolDecode3 = null;
                Boolean boolDecode4 = null;
                String strDecode5 = null;
                Boolean boolDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostViewed(analyticsEventCommonFields, strDecode, strDecode2, strDecode3, strDecode4, postViewedContextDecode, boolDecode, boolDecode2, postClientVisibilityStateDecode, boolDecode3, boolDecode4, strDecode5, boolDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 6:
                            str = strDecode;
                            str2 = strDecode2;
                            str3 = strDecode3;
                            try {
                                postViewedContextDecode = PostViewedContext.ADAPTER.decode(reader);
                                strDecode = str;
                                strDecode2 = str2;
                                strDecode3 = str3;
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                strDecode = str;
                                strDecode2 = str2;
                                strDecode3 = str3;
                            }
                            break;
                        case 7:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 8:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 9:
                            try {
                                postClientVisibilityStateDecode = PostClientVisibilityState.ADAPTER.decode(reader);
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                str = strDecode;
                                str2 = strDecode2;
                                str3 = strDecode3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                strDecode = str;
                                strDecode2 = str2;
                                strDecode3 = str3;
                            }
                            break;
                        case 10:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 11:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 12:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 13:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode;
                            str2 = strDecode2;
                            str3 = strDecode3;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            strDecode = str;
                            strDecode2 = str2;
                            strDecode3 = str3;
                            break;
                    }
                    analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostViewed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 4, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 5, value.collection_slug);
                PostViewedContext.ADAPTER.encodeWithTag(writer, 6, value.context);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 7, value.is_proxy_post);
                protoAdapter3.encodeWithTag(writer, 8, value.is_series);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 9, value.post_visibility);
                protoAdapter3.encodeWithTag(writer, 10, value.is_truncated);
                protoAdapter3.encodeWithTag(writer, 11, value.is_viewing_local_content);
                protoAdapter2.encodeWithTag(writer, 12, value.post_share_key);
                protoAdapter3.encodeWithTag(writer, 13, value.app_settings_fullswipebackgesture_enabled);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostViewed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = PostViewedContext.ADAPTER.encodedSizeWithTag(6, value.context) + protoAdapter2.encodedSizeWithTag(5, value.collection_slug) + protoAdapter2.encodedSizeWithTag(4, value.collection_id) + protoAdapter2.encodedSizeWithTag(3, value.referrer_source) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(13, value.app_settings_fullswipebackgesture_enabled) + protoAdapter2.encodedSizeWithTag(12, value.post_share_key) + protoAdapter3.encodedSizeWithTag(11, value.is_viewing_local_content) + protoAdapter3.encodedSizeWithTag(10, value.is_truncated) + PostClientVisibilityState.ADAPTER.encodedSizeWithTag(9, value.post_visibility) + protoAdapter3.encodedSizeWithTag(8, value.is_series) + protoAdapter3.encodedSizeWithTag(7, value.is_proxy_post) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostViewed redact(PostViewed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return value.copy((8190 & 1) != 0 ? value.common_fields : analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, (8190 & 2) != 0 ? value.post_id : null, (8190 & 4) != 0 ? value.referrer_source : null, (8190 & 8) != 0 ? value.collection_id : null, (8190 & 16) != 0 ? value.collection_slug : null, (8190 & 32) != 0 ? value.context : null, (8190 & 64) != 0 ? value.is_proxy_post : null, (8190 & 128) != 0 ? value.is_series : null, (8190 & 256) != 0 ? value.post_visibility : null, (8190 & 512) != 0 ? value.is_truncated : null, (8190 & 1024) != 0 ? value.is_viewing_local_content : null, (8190 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.post_share_key : null, (8190 & 4096) != 0 ? value.app_settings_fullswipebackgesture_enabled : null, (8190 & 8192) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostViewed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 13, value.app_settings_fullswipebackgesture_enabled);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 12, value.post_share_key);
                protoAdapter2.encodeWithTag(writer, 11, value.is_viewing_local_content);
                protoAdapter2.encodeWithTag(writer, 10, value.is_truncated);
                PostClientVisibilityState.ADAPTER.encodeWithTag(writer, 9, value.post_visibility);
                protoAdapter2.encodeWithTag(writer, 8, value.is_series);
                protoAdapter2.encodeWithTag(writer, 7, value.is_proxy_post);
                PostViewedContext.ADAPTER.encodeWithTag(writer, 6, value.context);
                protoAdapter3.encodeWithTag(writer, 5, value.collection_slug);
                protoAdapter3.encodeWithTag(writer, 4, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter3.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, PostViewedContext postViewedContext, Boolean bool, Boolean bool2, PostClientVisibilityState postClientVisibilityState, Boolean bool3, Boolean bool4, String str5, Boolean bool5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : postViewedContext, (i & 64) != 0 ? null : bool, (i & 128) != 0 ? null : bool2, (i & 256) != 0 ? null : postClientVisibilityState, (i & 512) != 0 ? null : bool3, (i & 1024) != 0 ? null : bool4, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str5, (i & 4096) == 0 ? bool5 : null, (i & 8192) != 0 ? h21.d : h21Var);
    }

    public final PostViewed copy(AnalyticsEventCommonFields common_fields, String post_id, String referrer_source, String collection_id, String collection_slug, PostViewedContext context, Boolean is_proxy_post, Boolean is_series, PostClientVisibilityState post_visibility, Boolean is_truncated, Boolean is_viewing_local_content, String post_share_key, Boolean app_settings_fullswipebackgesture_enabled, h21 unknownFields) {
        unknownFields.getClass();
        return new PostViewed(common_fields, post_id, referrer_source, collection_id, collection_slug, context, is_proxy_post, is_series, post_visibility, is_truncated, is_viewing_local_content, post_share_key, app_settings_fullswipebackgesture_enabled, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostViewed)) {
            return false;
        }
        PostViewed postViewed = (PostViewed) other;
        return g76.L(unknownFields(), postViewed.unknownFields()) && g76.L(this.common_fields, postViewed.common_fields) && g76.L(this.post_id, postViewed.post_id) && g76.L(this.referrer_source, postViewed.referrer_source) && g76.L(this.collection_id, postViewed.collection_id) && g76.L(this.collection_slug, postViewed.collection_slug) && this.context == postViewed.context && g76.L(this.is_proxy_post, postViewed.is_proxy_post) && g76.L(this.is_series, postViewed.is_series) && this.post_visibility == postViewed.post_visibility && g76.L(this.is_truncated, postViewed.is_truncated) && g76.L(this.is_viewing_local_content, postViewed.is_viewing_local_content) && g76.L(this.post_share_key, postViewed.post_share_key) && g76.L(this.app_settings_fullswipebackgesture_enabled, postViewed.app_settings_fullswipebackgesture_enabled);
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
        String str2 = this.referrer_source;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_id;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.collection_slug;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        PostViewedContext postViewedContext = this.context;
        int iHashCode7 = (iHashCode6 + (postViewedContext != null ? postViewedContext.hashCode() : 0)) * 37;
        Boolean bool = this.is_proxy_post;
        int i2 = (iHashCode7 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.is_series;
        int i3 = (i2 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        int iHashCode8 = (i3 + (postClientVisibilityState != null ? postClientVisibilityState.hashCode() : 0)) * 37;
        Boolean bool3 = this.is_truncated;
        int i4 = (iHashCode8 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool4 = this.is_viewing_local_content;
        int i5 = (i4 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str5 = this.post_share_key;
        int iHashCode9 = (i5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Boolean bool5 = this.app_settings_fullswipebackgesture_enabled;
        int i6 = iHashCode9 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i6;
        return i6;
    }

    @Override // com.squareup.wire.Message
    public final tw9 newBuilder() {
        tw9 tw9Var = new tw9();
        tw9Var.a = this.common_fields;
        tw9Var.b = this.post_id;
        tw9Var.c = this.referrer_source;
        tw9Var.d = this.collection_id;
        tw9Var.e = this.collection_slug;
        tw9Var.f = this.context;
        tw9Var.g = this.is_proxy_post;
        tw9Var.h = this.is_series;
        tw9Var.i = this.post_visibility;
        tw9Var.j = this.is_truncated;
        tw9Var.k = this.is_viewing_local_content;
        tw9Var.l = this.post_share_key;
        tw9Var.m = this.app_settings_fullswipebackgesture_enabled;
        tw9Var.addUnknownFields(unknownFields());
        return tw9Var;
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
        String str2 = this.referrer_source;
        if (str2 != null) {
            lv8.D(str2, "referrer_source=", arrayList);
        }
        String str3 = this.collection_id;
        if (str3 != null) {
            lv8.D(str3, "collection_id=", arrayList);
        }
        String str4 = this.collection_slug;
        if (str4 != null) {
            lv8.D(str4, "collection_slug=", arrayList);
        }
        PostViewedContext postViewedContext = this.context;
        if (postViewedContext != null) {
            arrayList.add("context=" + postViewedContext);
        }
        Boolean bool = this.is_proxy_post;
        if (bool != null) {
            lv8.A("is_proxy_post=", bool, arrayList);
        }
        Boolean bool2 = this.is_series;
        if (bool2 != null) {
            lv8.A("is_series=", bool2, arrayList);
        }
        PostClientVisibilityState postClientVisibilityState = this.post_visibility;
        if (postClientVisibilityState != null) {
            arrayList.add("post_visibility=" + postClientVisibilityState);
        }
        Boolean bool3 = this.is_truncated;
        if (bool3 != null) {
            lv8.A("is_truncated=", bool3, arrayList);
        }
        Boolean bool4 = this.is_viewing_local_content;
        if (bool4 != null) {
            lv8.A("is_viewing_local_content=", bool4, arrayList);
        }
        String str5 = this.post_share_key;
        if (str5 != null) {
            lv8.D(str5, "post_share_key=", arrayList);
        }
        Boolean bool5 = this.app_settings_fullswipebackgesture_enabled;
        if (bool5 != null) {
            lv8.A("app_settings_fullswipebackgesture_enabled=", bool5, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostViewed{", "}", null, 56);
    }

    public static /* synthetic */ void getReferrer_source$annotations() {
    }

    public PostViewed() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, 16383, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, PostViewedContext postViewedContext, Boolean bool, Boolean bool2, PostClientVisibilityState postClientVisibilityState, Boolean bool3, Boolean bool4, String str5, Boolean bool5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.referrer_source = str2;
        this.collection_id = str3;
        this.collection_slug = str4;
        this.context = postViewedContext;
        this.is_proxy_post = bool;
        this.is_series = bool2;
        this.post_visibility = postClientVisibilityState;
        this.is_truncated = bool3;
        this.is_viewing_local_content = bool4;
        this.post_share_key = str5;
        this.app_settings_fullswipebackgesture_enabled = bool5;
    }
}
