package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
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
import defpackage.bq9;
import defpackage.bu1;
import defpackage.cq9;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0012\b\u0007\u0018\u0000 -2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002.BÕ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0005\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\b0\u0005\u0012\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\r\u0012\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u000e\b\u0002\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0006\u0012\u000e\b\u0002\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\b0\u0005\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001f\u001a\u00020\u000b2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0096\u0002¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\bH\u0016¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u0006H\u0016¢\u0006\u0004\b#\u0010$JÛ\u0001\u0010%\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00052\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\b0\u00052\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\r2\u000e\b\u0002\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u000e\b\u0002\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00052\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00062\u000e\b\u0002\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\b0\u00052\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b%\u0010&R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010'R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010(R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010)R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010)R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010(R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010*R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010+R\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010,R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010,R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\b0\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010,R\u001a\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010,R\u001a\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010,R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010,R\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\b0\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010,¨\u0006/"}, d2 = {"Lcom/medium/proto/event/PostStreamScrolled;", "Lcom/squareup/wire/AndroidMessage;", "Lbq9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "", "post_ids", "", "tops", "bottoms", "", "are_full_posts", "", "view_started_at", "scroll_top", "scroll_bottom", "logged_at", "sources", "is_proxy_post", "user_id", "screen_spaces", "is_viewing_local_content", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lbq9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/PostStreamScrolled;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Long;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Ljava/util/List;", "Companion", "cq9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.streamScrolled")
public final class PostStreamScrolled extends AndroidMessage<PostStreamScrolled, bq9> {
    public static final ProtoAdapter<PostStreamScrolled> ADAPTER;
    public static final Parcelable.Creator<PostStreamScrolled> CREATOR;
    public static final cq9 Companion = new cq9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", label = WireField.Label.REPEATED, schemaIndex = 4, tag = 5)
    public final List<Boolean> are_full_posts;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 4)
    public final List<Integer> bottoms;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", label = WireField.Label.REPEATED, schemaIndex = 10, tag = 11)
    public final List<Boolean> is_proxy_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 13, tag = 14)
    public final Boolean is_viewing_local_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 8, tag = 9)
    public final Long logged_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<String> post_ids;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REPEATED, schemaIndex = 12, tag = 13)
    public final List<Integer> screen_spaces;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 7, tag = 8)
    public final Integer scroll_bottom;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 6, tag = 7)
    public final Integer scroll_top;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 9, tag = 10)
    public final List<String> sources;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REPEATED, schemaIndex = 2, tag = 3)
    public final List<Integer> tops;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 5, tag = 6)
    public final Long view_started_at;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostStreamScrolled.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostStreamScrolled> protoAdapter = new ProtoAdapter<PostStreamScrolled>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostStreamScrolled$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x003c. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostStreamScrolled decode(ProtoReader reader) {
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFields = null;
                Long lDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                Long lDecode2 = null;
                String strDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    Long l = lDecode;
                    if (iNextTag == -1) {
                        return new PostStreamScrolled(analyticsEventCommonFields, arrayListF, arrayList, arrayList2, arrayList3, l, numDecode, numDecode2, lDecode2, arrayList4, arrayList5, strDecode, arrayList6, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            lDecode = l;
                            break;
                        case 2:
                            arrayListF.add(ProtoAdapter.STRING.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 3:
                            arrayList.add(ProtoAdapter.INT32.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 4:
                            arrayList2.add(ProtoAdapter.INT32.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 5:
                            arrayList3.add(ProtoAdapter.BOOL.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 6:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 7:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            lDecode = l;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 8:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            lDecode = l;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 9:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            lDecode = l;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 10:
                            arrayList4.add(ProtoAdapter.STRING.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 11:
                            arrayList5.add(ProtoAdapter.BOOL.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 12:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            lDecode = l;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        case 13:
                            arrayList6.add(ProtoAdapter.INT32.decode(reader));
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                        case 14:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            lDecode = l;
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                            lDecode = l;
                            break;
                    }
                    analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostStreamScrolled value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.asRepeated().encodeWithTag(writer, 2, value.post_ids);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.asRepeated().encodeWithTag(writer, 3, value.tops);
                protoAdapter3.asRepeated().encodeWithTag(writer, 4, value.bottoms);
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                protoAdapter4.asRepeated().encodeWithTag(writer, 5, value.are_full_posts);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 6, value.view_started_at);
                protoAdapter3.encodeWithTag(writer, 7, value.scroll_top);
                protoAdapter3.encodeWithTag(writer, 8, value.scroll_bottom);
                protoAdapter5.encodeWithTag(writer, 9, value.logged_at);
                protoAdapter2.asRepeated().encodeWithTag(writer, 10, value.sources);
                protoAdapter4.asRepeated().encodeWithTag(writer, 11, value.is_proxy_post);
                protoAdapter2.encodeWithTag(writer, 12, value.user_id);
                protoAdapter3.asRepeated().encodeWithTag(writer, 13, value.screen_spaces);
                protoAdapter4.encodeWithTag(writer, 14, value.is_viewing_local_content);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostStreamScrolled value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = protoAdapter2.asRepeated().encodedSizeWithTag(2, value.post_ids) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = protoAdapter3.asRepeated().encodedSizeWithTag(4, value.bottoms) + protoAdapter3.asRepeated().encodedSizeWithTag(3, value.tops) + iEncodedSizeWithTag2;
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag4 = protoAdapter4.asRepeated().encodedSizeWithTag(5, value.are_full_posts) + iEncodedSizeWithTag3;
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                return protoAdapter4.encodedSizeWithTag(14, value.is_viewing_local_content) + protoAdapter3.asRepeated().encodedSizeWithTag(13, value.screen_spaces) + protoAdapter2.encodedSizeWithTag(12, value.user_id) + protoAdapter4.asRepeated().encodedSizeWithTag(11, value.is_proxy_post) + protoAdapter2.asRepeated().encodedSizeWithTag(10, value.sources) + protoAdapter5.encodedSizeWithTag(9, value.logged_at) + protoAdapter3.encodedSizeWithTag(8, value.scroll_bottom) + protoAdapter3.encodedSizeWithTag(7, value.scroll_top) + protoAdapter5.encodedSizeWithTag(6, value.view_started_at) + iEncodedSizeWithTag4;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostStreamScrolled redact(PostStreamScrolled value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return value.copy((16382 & 1) != 0 ? value.common_fields : analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, (16382 & 2) != 0 ? value.post_ids : null, (16382 & 4) != 0 ? value.tops : null, (16382 & 8) != 0 ? value.bottoms : null, (16382 & 16) != 0 ? value.are_full_posts : null, (16382 & 32) != 0 ? value.view_started_at : null, (16382 & 64) != 0 ? value.scroll_top : null, (16382 & 128) != 0 ? value.scroll_bottom : null, (16382 & 256) != 0 ? value.logged_at : null, (16382 & 512) != 0 ? value.sources : null, (16382 & 1024) != 0 ? value.is_proxy_post : null, (16382 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.user_id : null, (16382 & 4096) != 0 ? value.screen_spaces : null, (16382 & 8192) != 0 ? value.is_viewing_local_content : null, (16382 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostStreamScrolled value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 14, value.is_viewing_local_content);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.asRepeated().encodeWithTag(writer, 13, value.screen_spaces);
                ProtoAdapter<String> protoAdapter4 = ProtoAdapter.STRING;
                protoAdapter4.encodeWithTag(writer, 12, value.user_id);
                protoAdapter2.asRepeated().encodeWithTag(writer, 11, value.is_proxy_post);
                protoAdapter4.asRepeated().encodeWithTag(writer, 10, value.sources);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 9, value.logged_at);
                protoAdapter3.encodeWithTag(writer, 8, value.scroll_bottom);
                protoAdapter3.encodeWithTag(writer, 7, value.scroll_top);
                protoAdapter5.encodeWithTag(writer, 6, value.view_started_at);
                protoAdapter2.asRepeated().encodeWithTag(writer, 5, value.are_full_posts);
                protoAdapter3.asRepeated().encodeWithTag(writer, 4, value.bottoms);
                protoAdapter3.asRepeated().encodeWithTag(writer, 3, value.tops);
                protoAdapter4.asRepeated().encodeWithTag(writer, 2, value.post_ids);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PostStreamScrolled(AnalyticsEventCommonFields analyticsEventCommonFields, List list, List list2, List list3, List list4, Long l, Integer num, Integer num2, Long l2, List list5, List list6, String str, List list7, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        AnalyticsEventCommonFields analyticsEventCommonFields2 = (i & 1) != 0 ? null : analyticsEventCommonFields;
        int i2 = i & 2;
        List list8 = ey3.a;
        this(analyticsEventCommonFields2, i2 != 0 ? list8 : list, (i & 4) != 0 ? list8 : list2, (i & 8) != 0 ? list8 : list3, (i & 16) != 0 ? list8 : list4, (i & 32) != 0 ? null : l, (i & 64) != 0 ? null : num, (i & 128) != 0 ? null : num2, (i & 256) != 0 ? null : l2, (i & 512) != 0 ? list8 : list5, (i & 1024) != 0 ? list8 : list6, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str, (i & 4096) == 0 ? list7 : list8, (i & 8192) == 0 ? bool : null, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? h21.d : h21Var);
    }

    public final PostStreamScrolled copy(AnalyticsEventCommonFields common_fields, List<String> post_ids, List<Integer> tops, List<Integer> bottoms, List<Boolean> are_full_posts, Long view_started_at, Integer scroll_top, Integer scroll_bottom, Long logged_at, List<String> sources, List<Boolean> is_proxy_post, String user_id, List<Integer> screen_spaces, Boolean is_viewing_local_content, h21 unknownFields) {
        post_ids.getClass();
        tops.getClass();
        bottoms.getClass();
        are_full_posts.getClass();
        sources.getClass();
        is_proxy_post.getClass();
        screen_spaces.getClass();
        unknownFields.getClass();
        return new PostStreamScrolled(common_fields, post_ids, tops, bottoms, are_full_posts, view_started_at, scroll_top, scroll_bottom, logged_at, sources, is_proxy_post, user_id, screen_spaces, is_viewing_local_content, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostStreamScrolled)) {
            return false;
        }
        PostStreamScrolled postStreamScrolled = (PostStreamScrolled) other;
        return g76.L(unknownFields(), postStreamScrolled.unknownFields()) && g76.L(this.common_fields, postStreamScrolled.common_fields) && g76.L(this.post_ids, postStreamScrolled.post_ids) && g76.L(this.tops, postStreamScrolled.tops) && g76.L(this.bottoms, postStreamScrolled.bottoms) && g76.L(this.are_full_posts, postStreamScrolled.are_full_posts) && g76.L(this.view_started_at, postStreamScrolled.view_started_at) && g76.L(this.scroll_top, postStreamScrolled.scroll_top) && g76.L(this.scroll_bottom, postStreamScrolled.scroll_bottom) && g76.L(this.logged_at, postStreamScrolled.logged_at) && g76.L(this.sources, postStreamScrolled.sources) && g76.L(this.is_proxy_post, postStreamScrolled.is_proxy_post) && g76.L(this.user_id, postStreamScrolled.user_id) && g76.L(this.screen_spaces, postStreamScrolled.screen_spaces) && g76.L(this.is_viewing_local_content, postStreamScrolled.is_viewing_local_content);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int i4 = 0;
        int iP = wgd.p(wgd.p(wgd.p(wgd.p((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.post_ids), 37, this.tops), 37, this.bottoms), 37, this.are_full_posts);
        Long l = this.view_started_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i5 = (iP + i) * 37;
        Integer num = this.scroll_top;
        int iIntValue = (i5 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.scroll_bottom;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        Long l2 = this.logged_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int iP2 = wgd.p(wgd.p((iIntValue2 + i2) * 37, 37, this.sources), 37, this.is_proxy_post);
        String str = this.user_id;
        int iP3 = wgd.p((iP2 + (str != null ? str.hashCode() : 0)) * 37, 37, this.screen_spaces);
        Boolean bool = this.is_viewing_local_content;
        if (bool != null) {
            i4 = bool.booleanValue() ? 1231 : 1237;
        }
        int i6 = iP3 + i4;
        this.hashCode = i6;
        return i6;
    }

    @Override // com.squareup.wire.Message
    public final bq9 newBuilder() {
        bq9 bq9Var = new bq9();
        ey3 ey3Var = ey3.a;
        bq9Var.b = ey3Var;
        bq9Var.c = ey3Var;
        bq9Var.d = ey3Var;
        bq9Var.e = ey3Var;
        bq9Var.j = ey3Var;
        bq9Var.k = ey3Var;
        bq9Var.m = ey3Var;
        bq9Var.a = this.common_fields;
        bq9Var.b = this.post_ids;
        bq9Var.c = this.tops;
        bq9Var.d = this.bottoms;
        bq9Var.e = this.are_full_posts;
        bq9Var.f = this.view_started_at;
        bq9Var.g = this.scroll_top;
        bq9Var.h = this.scroll_bottom;
        bq9Var.i = this.logged_at;
        bq9Var.j = this.sources;
        bq9Var.k = this.is_proxy_post;
        bq9Var.l = this.user_id;
        bq9Var.m = this.screen_spaces;
        bq9Var.n = this.is_viewing_local_content;
        bq9Var.addUnknownFields(unknownFields());
        return bq9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        if (!this.post_ids.isEmpty()) {
            arrayList.add("post_ids=".concat(Internal.sanitize(this.post_ids)));
        }
        if (!this.tops.isEmpty()) {
            b09.J("tops=", this.tops, arrayList);
        }
        if (!this.bottoms.isEmpty()) {
            b09.J("bottoms=", this.bottoms, arrayList);
        }
        if (!this.are_full_posts.isEmpty()) {
            b09.J("are_full_posts=", this.are_full_posts, arrayList);
        }
        Long l = this.view_started_at;
        if (l != null) {
            y30.A("view_started_at=", l, arrayList);
        }
        Integer num = this.scroll_top;
        if (num != null) {
            lv8.B("scroll_top=", num, arrayList);
        }
        Integer num2 = this.scroll_bottom;
        if (num2 != null) {
            lv8.B("scroll_bottom=", num2, arrayList);
        }
        Long l2 = this.logged_at;
        if (l2 != null) {
            y30.A("logged_at=", l2, arrayList);
        }
        if (!this.sources.isEmpty()) {
            arrayList.add("sources=".concat(Internal.sanitize(this.sources)));
        }
        if (!this.is_proxy_post.isEmpty()) {
            b09.J("is_proxy_post=", this.is_proxy_post, arrayList);
        }
        String str = this.user_id;
        if (str != null) {
            lv8.D(str, "user_id=", arrayList);
        }
        if (!this.screen_spaces.isEmpty()) {
            b09.J("screen_spaces=", this.screen_spaces, arrayList);
        }
        Boolean bool = this.is_viewing_local_content;
        if (bool != null) {
            lv8.A("is_viewing_local_content=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostStreamScrolled{", "}", null, 56);
    }

    public PostStreamScrolled() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 32767, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostStreamScrolled(AnalyticsEventCommonFields analyticsEventCommonFields, List<String> list, List<Integer> list2, List<Integer> list3, List<Boolean> list4, Long l, Integer num, Integer num2, Long l2, List<String> list5, List<Boolean> list6, String str, List<Integer> list7, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        list3.getClass();
        list4.getClass();
        list5.getClass();
        list6.getClass();
        list7.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.view_started_at = l;
        this.scroll_top = num;
        this.scroll_bottom = num2;
        this.logged_at = l2;
        this.user_id = str;
        this.is_viewing_local_content = bool;
        this.post_ids = Internal.immutableCopyOf("post_ids", list);
        this.tops = Internal.immutableCopyOf("tops", list2);
        this.bottoms = Internal.immutableCopyOf("bottoms", list3);
        this.are_full_posts = Internal.immutableCopyOf("are_full_posts", list4);
        this.sources = Internal.immutableCopyOf("sources", list5);
        this.is_proxy_post = Internal.immutableCopyOf("is_proxy_post", list6);
        this.screen_spaces = Internal.immutableCopyOf("screen_spaces", list7);
    }
}
