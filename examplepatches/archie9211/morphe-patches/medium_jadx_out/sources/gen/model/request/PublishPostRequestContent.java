package gen.model.request;

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
import defpackage.hoa;
import defpackage.ioa;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import gen.model.PostResponseType;
import gen.model.ResponseDistribution;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000e\u0018\u0000 &2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002'Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u000e2\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJw\u0010\u001f\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u001f\u0010 R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010!R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010!R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010!R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010!R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010#R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010$R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010%¨\u0006("}, d2 = {"Lgen/model/request/PublishPostRequestContent;", "Lcom/squareup/wire/AndroidMessage;", "Lhoa;", "", "title", "subtitle", "meta_description", "", "latest_rev", "collection_id", "Lgen/model/PostResponseType;", "post_response_type", "Lgen/model/ResponseDistribution;", "response_distribution", "", "dynamic_paywall_enabled", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lgen/model/PostResponseType;Lgen/model/ResponseDistribution;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lhoa;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lgen/model/PostResponseType;Lgen/model/ResponseDistribution;Ljava/lang/Boolean;Lh21;)Lgen/model/request/PublishPostRequestContent;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/PostResponseType;", "Lgen/model/ResponseDistribution;", "Ljava/lang/Boolean;", "Companion", "ioa", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublishPostRequestContent extends AndroidMessage<PublishPostRequestContent, hoa> {
    public static final ProtoAdapter<PublishPostRequestContent> ADAPTER;
    public static final Parcelable.Creator<PublishPostRequestContent> CREATOR;
    public static final ioa Companion = new ioa();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 6)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 9)
    public final Boolean dynamic_paywall_enabled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 5)
    public final Long latest_rev;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 4)
    public final String meta_description;

    @WireField(adapter = "gen.model.PostResponseType#ADAPTER", schemaIndex = 5, tag = 7)
    public final PostResponseType post_response_type;

    @WireField(adapter = "gen.model.ResponseDistribution#ADAPTER", schemaIndex = 6, tag = 8)
    public final ResponseDistribution response_distribution;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 3)
    public final String subtitle;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 2)
    public final String title;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PublishPostRequestContent.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PublishPostRequestContent> protoAdapter = new ProtoAdapter<PublishPostRequestContent>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.PublishPostRequestContent$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PublishPostRequestContent decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Long lDecode = null;
                String strDecode4 = null;
                PostResponseType postResponseTypeDecode = null;
                ResponseDistribution responseDistributionDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PublishPostRequestContent(strDecode, strDecode2, strDecode3, lDecode, strDecode4, postResponseTypeDecode, responseDistributionDecode, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
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
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            try {
                                postResponseTypeDecode = PostResponseType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 8:
                            try {
                                responseDistributionDecode = ResponseDistribution.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 9:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PublishPostRequestContent value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.title);
                protoAdapter2.encodeWithTag(writer, 3, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 4, value.meta_description);
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.latest_rev);
                protoAdapter2.encodeWithTag(writer, 6, value.collection_id);
                PostResponseType.ADAPTER.encodeWithTag(writer, 7, value.post_response_type);
                ResponseDistribution.ADAPTER.encodeWithTag(writer, 8, value.response_distribution);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.dynamic_paywall_enabled);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PublishPostRequestContent value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(9, value.dynamic_paywall_enabled) + ResponseDistribution.ADAPTER.encodedSizeWithTag(8, value.response_distribution) + PostResponseType.ADAPTER.encodedSizeWithTag(7, value.post_response_type) + protoAdapter2.encodedSizeWithTag(6, value.collection_id) + ProtoAdapter.INT64.encodedSizeWithTag(5, value.latest_rev) + protoAdapter2.encodedSizeWithTag(4, value.meta_description) + protoAdapter2.encodedSizeWithTag(3, value.subtitle) + protoAdapter2.encodedSizeWithTag(2, value.title) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PublishPostRequestContent redact(PublishPostRequestContent value) {
                value.getClass();
                return PublishPostRequestContent.copy$default(value, null, null, null, null, null, null, null, null, h21.d, 255, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PublishPostRequestContent value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.dynamic_paywall_enabled);
                ResponseDistribution.ADAPTER.encodeWithTag(writer, 8, value.response_distribution);
                PostResponseType.ADAPTER.encodeWithTag(writer, 7, value.post_response_type);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.collection_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.latest_rev);
                protoAdapter2.encodeWithTag(writer, 4, value.meta_description);
                protoAdapter2.encodeWithTag(writer, 3, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 2, value.title);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PublishPostRequestContent(String str, String str2, String str3, Long l, String str4, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : l, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : postResponseType, (i & 64) != 0 ? null : responseDistribution, (i & 128) != 0 ? null : bool, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PublishPostRequestContent copy$default(PublishPostRequestContent publishPostRequestContent, String str, String str2, String str3, Long l, String str4, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publishPostRequestContent.title;
        }
        if ((i & 2) != 0) {
            str2 = publishPostRequestContent.subtitle;
        }
        if ((i & 4) != 0) {
            str3 = publishPostRequestContent.meta_description;
        }
        if ((i & 8) != 0) {
            l = publishPostRequestContent.latest_rev;
        }
        if ((i & 16) != 0) {
            str4 = publishPostRequestContent.collection_id;
        }
        if ((i & 32) != 0) {
            postResponseType = publishPostRequestContent.post_response_type;
        }
        if ((i & 64) != 0) {
            responseDistribution = publishPostRequestContent.response_distribution;
        }
        if ((i & 128) != 0) {
            bool = publishPostRequestContent.dynamic_paywall_enabled;
        }
        if ((i & 256) != 0) {
            h21Var = publishPostRequestContent.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        PostResponseType postResponseType2 = postResponseType;
        ResponseDistribution responseDistribution2 = responseDistribution;
        String str5 = str4;
        String str6 = str3;
        return publishPostRequestContent.copy(str, str2, str6, l, str5, postResponseType2, responseDistribution2, bool2, h21Var2);
    }

    public final PublishPostRequestContent copy(String title, String subtitle, String meta_description, Long latest_rev, String collection_id, PostResponseType post_response_type, ResponseDistribution response_distribution, Boolean dynamic_paywall_enabled, h21 unknownFields) {
        unknownFields.getClass();
        return new PublishPostRequestContent(title, subtitle, meta_description, latest_rev, collection_id, post_response_type, response_distribution, dynamic_paywall_enabled, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PublishPostRequestContent)) {
            return false;
        }
        PublishPostRequestContent publishPostRequestContent = (PublishPostRequestContent) other;
        return g76.L(unknownFields(), publishPostRequestContent.unknownFields()) && g76.L(this.title, publishPostRequestContent.title) && g76.L(this.subtitle, publishPostRequestContent.subtitle) && g76.L(this.meta_description, publishPostRequestContent.meta_description) && g76.L(this.latest_rev, publishPostRequestContent.latest_rev) && g76.L(this.collection_id, publishPostRequestContent.collection_id) && this.post_response_type == publishPostRequestContent.post_response_type && this.response_distribution == publishPostRequestContent.response_distribution && g76.L(this.dynamic_paywall_enabled, publishPostRequestContent.dynamic_paywall_enabled);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.title;
        int i3 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.subtitle;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.meta_description;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Long l = this.latest_rev;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode4 + i) * 37;
        String str4 = this.collection_id;
        int iHashCode5 = (i4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        PostResponseType postResponseType = this.post_response_type;
        int iHashCode6 = (iHashCode5 + (postResponseType != null ? postResponseType.hashCode() : 0)) * 37;
        ResponseDistribution responseDistribution = this.response_distribution;
        int iHashCode7 = (iHashCode6 + (responseDistribution != null ? responseDistribution.hashCode() : 0)) * 37;
        Boolean bool = this.dynamic_paywall_enabled;
        if (bool != null) {
            i3 = bool.booleanValue() ? 1231 : 1237;
        }
        int i5 = iHashCode7 + i3;
        this.hashCode = i5;
        return i5;
    }

    @Override // com.squareup.wire.Message
    public final hoa newBuilder() {
        hoa hoaVar = new hoa();
        hoaVar.a = this.title;
        hoaVar.b = this.subtitle;
        hoaVar.c = this.meta_description;
        hoaVar.d = this.latest_rev;
        hoaVar.e = this.collection_id;
        hoaVar.f = this.post_response_type;
        hoaVar.g = this.response_distribution;
        hoaVar.h = this.dynamic_paywall_enabled;
        hoaVar.addUnknownFields(unknownFields());
        return hoaVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.title;
        if (str != null) {
            lv8.D(str, "title=", arrayList);
        }
        String str2 = this.subtitle;
        if (str2 != null) {
            lv8.D(str2, "subtitle=", arrayList);
        }
        String str3 = this.meta_description;
        if (str3 != null) {
            lv8.D(str3, "meta_description=", arrayList);
        }
        Long l = this.latest_rev;
        if (l != null) {
            y30.A("latest_rev=", l, arrayList);
        }
        String str4 = this.collection_id;
        if (str4 != null) {
            lv8.D(str4, "collection_id=", arrayList);
        }
        PostResponseType postResponseType = this.post_response_type;
        if (postResponseType != null) {
            arrayList.add("post_response_type=" + postResponseType);
        }
        ResponseDistribution responseDistribution = this.response_distribution;
        if (responseDistribution != null) {
            arrayList.add("response_distribution=" + responseDistribution);
        }
        Boolean bool = this.dynamic_paywall_enabled;
        if (bool != null) {
            lv8.A("dynamic_paywall_enabled=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PublishPostRequestContent{", "}", null, 56);
    }

    public PublishPostRequestContent() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PublishPostRequestContent(String str, String str2, String str3, Long l, String str4, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.title = str;
        this.subtitle = str2;
        this.meta_description = str3;
        this.latest_rev = l;
        this.collection_id = str4;
        this.post_response_type = postResponseType;
        this.response_distribution = responseDistribution;
        this.dynamic_paywall_enabled = bool;
    }
}
