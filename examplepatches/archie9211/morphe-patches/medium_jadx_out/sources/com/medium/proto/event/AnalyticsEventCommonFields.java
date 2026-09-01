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
import defpackage.wg6;
import defpackage.xj;
import defpackage.yj;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0007\u0018\u0000 &2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002'B\u00ad\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001b\u001a\u00020\f2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0096\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001f\u0010 J³\u0001\u0010!\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b!\u0010\"R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010#R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010#R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010#R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010#R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010#R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010#R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010#R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010$R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010#R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010#R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010#R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010%¨\u0006("}, d2 = {"Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Lcom/squareup/wire/AndroidMessage;", "Lxj;", "", "app_version", "device_id", "device_type", "location", "referrer", "session_id", "user_id", "referrer_source", "", "is_iceland", "source", "country_code", "iso_country_code", "", "client_score", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lxj;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Ljava/lang/Integer;", "Companion", "yj", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AnalyticsEventCommonFields extends AndroidMessage<AnalyticsEventCommonFields, xj> {
    public static final ProtoAdapter<AnalyticsEventCommonFields> ADAPTER;
    public static final Parcelable.Creator<AnalyticsEventCommonFields> CREATOR;
    public static final yj Companion = new yj();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String app_version;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 12, tag = 13)
    public final Integer client_score;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String country_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String device_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String device_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean is_iceland;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String iso_country_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String location;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String referrer;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String session_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AnalyticsEventCommonFields.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AnalyticsEventCommonFields> protoAdapter = new ProtoAdapter<AnalyticsEventCommonFields>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.AnalyticsEventCommonFields$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0022. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final AnalyticsEventCommonFields decode(ProtoReader reader) {
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                Boolean boolDecode = null;
                String strDecode9 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    String str2 = strDecode2;
                    if (iNextTag == -1) {
                        return new AnalyticsEventCommonFields(str, str2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, strDecode8, boolDecode, strDecode9, strDecode10, strDecode11, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 4:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 5:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 6:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 7:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 8:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 9:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 10:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 11:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 12:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 13:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            strDecode = str;
                            strDecode2 = str2;
                            break;
                    }
                    str = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AnalyticsEventCommonFields value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.app_version);
                protoAdapter2.encodeWithTag(writer, 2, value.device_id);
                protoAdapter2.encodeWithTag(writer, 3, value.device_type);
                protoAdapter2.encodeWithTag(writer, 4, value.location);
                protoAdapter2.encodeWithTag(writer, 5, value.referrer);
                protoAdapter2.encodeWithTag(writer, 6, value.session_id);
                protoAdapter2.encodeWithTag(writer, 7, value.user_id);
                protoAdapter2.encodeWithTag(writer, 8, value.referrer_source);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.is_iceland);
                protoAdapter2.encodeWithTag(writer, 10, value.source);
                protoAdapter2.encodeWithTag(writer, 11, value.country_code);
                protoAdapter2.encodeWithTag(writer, 12, value.iso_country_code);
                ProtoAdapter.INT32.encodeWithTag(writer, 13, value.client_score);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AnalyticsEventCommonFields value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT32.encodedSizeWithTag(13, value.client_score) + protoAdapter2.encodedSizeWithTag(12, value.iso_country_code) + protoAdapter2.encodedSizeWithTag(11, value.country_code) + protoAdapter2.encodedSizeWithTag(10, value.source) + ProtoAdapter.BOOL.encodedSizeWithTag(9, value.is_iceland) + protoAdapter2.encodedSizeWithTag(8, value.referrer_source) + protoAdapter2.encodedSizeWithTag(7, value.user_id) + protoAdapter2.encodedSizeWithTag(6, value.session_id) + protoAdapter2.encodedSizeWithTag(5, value.referrer) + protoAdapter2.encodedSizeWithTag(4, value.location) + protoAdapter2.encodedSizeWithTag(3, value.device_type) + protoAdapter2.encodedSizeWithTag(2, value.device_id) + protoAdapter2.encodedSizeWithTag(1, value.app_version) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AnalyticsEventCommonFields redact(AnalyticsEventCommonFields value) {
                value.getClass();
                return value.copy((8191 & 1) != 0 ? value.app_version : null, (8191 & 2) != 0 ? value.device_id : null, (8191 & 4) != 0 ? value.device_type : null, (8191 & 8) != 0 ? value.location : null, (8191 & 16) != 0 ? value.referrer : null, (8191 & 32) != 0 ? value.session_id : null, (8191 & 64) != 0 ? value.user_id : null, (8191 & 128) != 0 ? value.referrer_source : null, (8191 & 256) != 0 ? value.is_iceland : null, (8191 & 512) != 0 ? value.source : null, (8191 & 1024) != 0 ? value.country_code : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.iso_country_code : null, (8191 & 4096) != 0 ? value.client_score : null, (8191 & 8192) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AnalyticsEventCommonFields value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 13, value.client_score);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 12, value.iso_country_code);
                protoAdapter2.encodeWithTag(writer, 11, value.country_code);
                protoAdapter2.encodeWithTag(writer, 10, value.source);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.is_iceland);
                protoAdapter2.encodeWithTag(writer, 8, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 7, value.user_id);
                protoAdapter2.encodeWithTag(writer, 6, value.session_id);
                protoAdapter2.encodeWithTag(writer, 5, value.referrer);
                protoAdapter2.encodeWithTag(writer, 4, value.location);
                protoAdapter2.encodeWithTag(writer, 3, value.device_type);
                protoAdapter2.encodeWithTag(writer, 2, value.device_id);
                protoAdapter2.encodeWithTag(writer, 1, value.app_version);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AnalyticsEventCommonFields(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, Boolean bool, String str9, String str10, String str11, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : str6, (i & 64) != 0 ? null : str7, (i & 128) != 0 ? null : str8, (i & 256) != 0 ? null : bool, (i & 512) != 0 ? null : str9, (i & 1024) != 0 ? null : str10, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str11, (i & 4096) == 0 ? num : null, (i & 8192) != 0 ? h21.d : h21Var);
    }

    public final AnalyticsEventCommonFields copy(String app_version, String device_id, String device_type, String location, String referrer, String session_id, String user_id, String referrer_source, Boolean is_iceland, String source, String country_code, String iso_country_code, Integer client_score, h21 unknownFields) {
        unknownFields.getClass();
        return new AnalyticsEventCommonFields(app_version, device_id, device_type, location, referrer, session_id, user_id, referrer_source, is_iceland, source, country_code, iso_country_code, client_score, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AnalyticsEventCommonFields)) {
            return false;
        }
        AnalyticsEventCommonFields analyticsEventCommonFields = (AnalyticsEventCommonFields) other;
        return g76.L(unknownFields(), analyticsEventCommonFields.unknownFields()) && g76.L(this.app_version, analyticsEventCommonFields.app_version) && g76.L(this.device_id, analyticsEventCommonFields.device_id) && g76.L(this.device_type, analyticsEventCommonFields.device_type) && g76.L(this.location, analyticsEventCommonFields.location) && g76.L(this.referrer, analyticsEventCommonFields.referrer) && g76.L(this.session_id, analyticsEventCommonFields.session_id) && g76.L(this.user_id, analyticsEventCommonFields.user_id) && g76.L(this.referrer_source, analyticsEventCommonFields.referrer_source) && g76.L(this.is_iceland, analyticsEventCommonFields.is_iceland) && g76.L(this.source, analyticsEventCommonFields.source) && g76.L(this.country_code, analyticsEventCommonFields.country_code) && g76.L(this.iso_country_code, analyticsEventCommonFields.iso_country_code) && g76.L(this.client_score, analyticsEventCommonFields.client_score);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.app_version;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.device_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.device_type;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.location;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.referrer;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.session_id;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.user_id;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.referrer_source;
        int iHashCode9 = (iHashCode8 + (str8 != null ? str8.hashCode() : 0)) * 37;
        Boolean bool = this.is_iceland;
        int i2 = (iHashCode9 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str9 = this.source;
        int iHashCode10 = (i2 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.country_code;
        int iHashCode11 = (iHashCode10 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.iso_country_code;
        int iHashCode12 = (iHashCode11 + (str11 != null ? str11.hashCode() : 0)) * 37;
        Integer num = this.client_score;
        int iIntValue = iHashCode12 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final xj newBuilder() {
        xj xjVar = new xj();
        xjVar.a = this.app_version;
        xjVar.b = this.device_id;
        xjVar.c = this.device_type;
        xjVar.d = this.location;
        xjVar.e = this.referrer;
        xjVar.f = this.session_id;
        xjVar.g = this.user_id;
        xjVar.h = this.referrer_source;
        xjVar.i = this.is_iceland;
        xjVar.j = this.source;
        xjVar.k = this.country_code;
        xjVar.l = this.iso_country_code;
        xjVar.m = this.client_score;
        xjVar.addUnknownFields(unknownFields());
        return xjVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.app_version;
        if (str != null) {
            lv8.D(str, "app_version=", arrayList);
        }
        String str2 = this.device_id;
        if (str2 != null) {
            lv8.D(str2, "device_id=", arrayList);
        }
        String str3 = this.device_type;
        if (str3 != null) {
            lv8.D(str3, "device_type=", arrayList);
        }
        String str4 = this.location;
        if (str4 != null) {
            lv8.D(str4, "location=", arrayList);
        }
        String str5 = this.referrer;
        if (str5 != null) {
            lv8.D(str5, "referrer=", arrayList);
        }
        String str6 = this.session_id;
        if (str6 != null) {
            lv8.D(str6, "session_id=", arrayList);
        }
        String str7 = this.user_id;
        if (str7 != null) {
            lv8.D(str7, "user_id=", arrayList);
        }
        String str8 = this.referrer_source;
        if (str8 != null) {
            lv8.D(str8, "referrer_source=", arrayList);
        }
        Boolean bool = this.is_iceland;
        if (bool != null) {
            lv8.A("is_iceland=", bool, arrayList);
        }
        String str9 = this.source;
        if (str9 != null) {
            lv8.D(str9, "source=", arrayList);
        }
        String str10 = this.country_code;
        if (str10 != null) {
            lv8.D(str10, "country_code=", arrayList);
        }
        String str11 = this.iso_country_code;
        if (str11 != null) {
            lv8.D(str11, "iso_country_code=", arrayList);
        }
        Integer num = this.client_score;
        if (num != null) {
            lv8.B("client_score=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "AnalyticsEventCommonFields{", "}", null, 56);
    }

    public AnalyticsEventCommonFields() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, 16383, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AnalyticsEventCommonFields(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, Boolean bool, String str9, String str10, String str11, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.app_version = str;
        this.device_id = str2;
        this.device_type = str3;
        this.location = str4;
        this.referrer = str5;
        this.session_id = str6;
        this.user_id = str7;
        this.referrer_source = str8;
        this.is_iceland = bool;
        this.source = str9;
        this.country_code = str10;
        this.iso_country_code = str11;
        this.client_score = num;
    }
}
