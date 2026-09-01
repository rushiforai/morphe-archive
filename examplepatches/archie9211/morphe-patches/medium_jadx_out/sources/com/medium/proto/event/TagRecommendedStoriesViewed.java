package com.medium.proto.event;

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
import defpackage.iad;
import defpackage.jad;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0013\u001a\u00020\t2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/TagRecommendedStoriesViewed;", "Lcom/squareup/wire/AndroidMessage;", "Liad;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "tag_id", "tag_slug", "referrer_source", "", "tracking_v2", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Liad;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/TagRecommendedStoriesViewed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "jad", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("tag.recommendedStories.viewed")
public final class TagRecommendedStoriesViewed extends AndroidMessage<TagRecommendedStoriesViewed, iad> {
    public static final ProtoAdapter<TagRecommendedStoriesViewed> ADAPTER;
    public static final Parcelable.Creator<TagRecommendedStoriesViewed> CREATOR;
    public static final jad Companion = new jad();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String tag_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String tag_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean tracking_v2;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(TagRecommendedStoriesViewed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<TagRecommendedStoriesViewed> protoAdapter = new ProtoAdapter<TagRecommendedStoriesViewed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.TagRecommendedStoriesViewed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final TagRecommendedStoriesViewed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new TagRecommendedStoriesViewed(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, TagRecommendedStoriesViewed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.tag_id);
                protoAdapter2.encodeWithTag(writer, 3, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 4, value.referrer_source);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(TagRecommendedStoriesViewed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(5, value.tracking_v2) + protoAdapter2.encodedSizeWithTag(4, value.referrer_source) + protoAdapter2.encodedSizeWithTag(3, value.tag_slug) + protoAdapter2.encodedSizeWithTag(2, value.tag_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final TagRecommendedStoriesViewed redact(TagRecommendedStoriesViewed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return TagRecommendedStoriesViewed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, TagRecommendedStoriesViewed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 3, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 2, value.tag_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ TagRecommendedStoriesViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : bool, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ TagRecommendedStoriesViewed copy$default(TagRecommendedStoriesViewed tagRecommendedStoriesViewed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = tagRecommendedStoriesViewed.common_fields;
        }
        if ((i & 2) != 0) {
            str = tagRecommendedStoriesViewed.tag_id;
        }
        if ((i & 4) != 0) {
            str2 = tagRecommendedStoriesViewed.tag_slug;
        }
        if ((i & 8) != 0) {
            str3 = tagRecommendedStoriesViewed.referrer_source;
        }
        if ((i & 16) != 0) {
            bool = tagRecommendedStoriesViewed.tracking_v2;
        }
        if ((i & 32) != 0) {
            h21Var = tagRecommendedStoriesViewed.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        return tagRecommendedStoriesViewed.copy(analyticsEventCommonFields, str, str2, str3, bool2, h21Var2);
    }

    public final TagRecommendedStoriesViewed copy(AnalyticsEventCommonFields common_fields, String tag_id, String tag_slug, String referrer_source, Boolean tracking_v2, h21 unknownFields) {
        unknownFields.getClass();
        return new TagRecommendedStoriesViewed(common_fields, tag_id, tag_slug, referrer_source, tracking_v2, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof TagRecommendedStoriesViewed)) {
            return false;
        }
        TagRecommendedStoriesViewed tagRecommendedStoriesViewed = (TagRecommendedStoriesViewed) other;
        return g76.L(unknownFields(), tagRecommendedStoriesViewed.unknownFields()) && g76.L(this.common_fields, tagRecommendedStoriesViewed.common_fields) && g76.L(this.tag_id, tagRecommendedStoriesViewed.tag_id) && g76.L(this.tag_slug, tagRecommendedStoriesViewed.tag_slug) && g76.L(this.referrer_source, tagRecommendedStoriesViewed.referrer_source) && g76.L(this.tracking_v2, tagRecommendedStoriesViewed.tracking_v2);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.tag_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.tag_slug;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.referrer_source;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool = this.tracking_v2;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode5 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final iad newBuilder() {
        iad iadVar = new iad();
        iadVar.a = this.common_fields;
        iadVar.b = this.tag_id;
        iadVar.c = this.tag_slug;
        iadVar.d = this.referrer_source;
        iadVar.e = this.tracking_v2;
        iadVar.addUnknownFields(unknownFields());
        return iadVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.tag_id;
        if (str != null) {
            lv8.D(str, "tag_id=", arrayList);
        }
        String str2 = this.tag_slug;
        if (str2 != null) {
            lv8.D(str2, "tag_slug=", arrayList);
        }
        String str3 = this.referrer_source;
        if (str3 != null) {
            lv8.D(str3, "referrer_source=", arrayList);
        }
        Boolean bool = this.tracking_v2;
        if (bool != null) {
            lv8.A("tracking_v2=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "TagRecommendedStoriesViewed{", "}", null, 56);
    }

    public TagRecommendedStoriesViewed() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TagRecommendedStoriesViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.tag_id = str;
        this.tag_slug = str2;
        this.referrer_source = str3;
        this.tracking_v2 = bool;
    }
}
