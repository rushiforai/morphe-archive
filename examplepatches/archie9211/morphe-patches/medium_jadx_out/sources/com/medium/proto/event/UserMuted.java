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
import defpackage.cee;
import defpackage.dee;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fBM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/UserMuted;", "Lcom/squareup/wire/AndroidMessage;", "Lcee;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "target_user_id", "post_id", "source", "referrer_source", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lcee;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/UserMuted;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "dee", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("user.muted")
public final class UserMuted extends AndroidMessage<UserMuted, cee> {
    public static final ProtoAdapter<UserMuted> ADAPTER;
    public static final Parcelable.Creator<UserMuted> CREATOR;
    public static final dee Companion = new dee();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String target_user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserMuted.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserMuted> protoAdapter = new ProtoAdapter<UserMuted>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.UserMuted$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserMuted decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UserMuted(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                        strDecode4 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserMuted value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.target_user_id);
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.source);
                protoAdapter2.encodeWithTag(writer, 5, value.referrer_source);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserMuted value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.referrer_source) + protoAdapter2.encodedSizeWithTag(4, value.source) + protoAdapter2.encodedSizeWithTag(3, value.post_id) + protoAdapter2.encodedSizeWithTag(2, value.target_user_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserMuted redact(UserMuted value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return UserMuted.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserMuted value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 4, value.source);
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                protoAdapter2.encodeWithTag(writer, 2, value.target_user_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserMuted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserMuted copy$default(UserMuted userMuted, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = userMuted.common_fields;
        }
        if ((i & 2) != 0) {
            str = userMuted.target_user_id;
        }
        if ((i & 4) != 0) {
            str2 = userMuted.post_id;
        }
        if ((i & 8) != 0) {
            str3 = userMuted.source;
        }
        if ((i & 16) != 0) {
            str4 = userMuted.referrer_source;
        }
        if ((i & 32) != 0) {
            h21Var = userMuted.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        return userMuted.copy(analyticsEventCommonFields, str, str2, str3, str5, h21Var2);
    }

    public final UserMuted copy(AnalyticsEventCommonFields common_fields, String target_user_id, String post_id, String source, String referrer_source, h21 unknownFields) {
        unknownFields.getClass();
        return new UserMuted(common_fields, target_user_id, post_id, source, referrer_source, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserMuted)) {
            return false;
        }
        UserMuted userMuted = (UserMuted) other;
        return g76.L(unknownFields(), userMuted.unknownFields()) && g76.L(this.common_fields, userMuted.common_fields) && g76.L(this.target_user_id, userMuted.target_user_id) && g76.L(this.post_id, userMuted.post_id) && g76.L(this.source, userMuted.source) && g76.L(this.referrer_source, userMuted.referrer_source);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.target_user_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.post_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.source;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.referrer_source;
        int iHashCode6 = iHashCode5 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final cee newBuilder() {
        cee ceeVar = new cee();
        ceeVar.a = this.common_fields;
        ceeVar.b = this.target_user_id;
        ceeVar.c = this.post_id;
        ceeVar.d = this.source;
        ceeVar.e = this.referrer_source;
        ceeVar.addUnknownFields(unknownFields());
        return ceeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.target_user_id;
        if (str != null) {
            lv8.D(str, "target_user_id=", arrayList);
        }
        String str2 = this.post_id;
        if (str2 != null) {
            lv8.D(str2, "post_id=", arrayList);
        }
        String str3 = this.source;
        if (str3 != null) {
            lv8.D(str3, "source=", arrayList);
        }
        String str4 = this.referrer_source;
        if (str4 != null) {
            lv8.D(str4, "referrer_source=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserMuted{", "}", null, 56);
    }

    public UserMuted() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserMuted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.target_user_id = str;
        this.post_id = str2;
        this.source = str3;
        this.referrer_source = str4;
    }
}
