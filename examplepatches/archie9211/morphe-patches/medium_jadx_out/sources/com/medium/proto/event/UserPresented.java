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
import defpackage.iee;
import defpackage.jee;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0013\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/UserPresented;", "Lcom/squareup/wire/AndroidMessage;", "Liee;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "tracking_v2", "", "target_user_id", "user_id", "source", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Liee;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/UserPresented;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Boolean;", "Ljava/lang/String;", "Companion", "jee", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("user.presented")
public final class UserPresented extends AndroidMessage<UserPresented, iee> {
    public static final ProtoAdapter<UserPresented> ADAPTER;
    public static final Parcelable.Creator<UserPresented> CREATOR;
    public static final jee Companion = new jee();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String target_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean tracking_v2;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserPresented.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserPresented> protoAdapter = new ProtoAdapter<UserPresented>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.UserPresented$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserPresented decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Boolean boolDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UserPresented(analyticsEventCommonFieldsDecode, boolDecode, strDecode, strDecode2, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserPresented value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.tracking_v2);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.target_user_id);
                protoAdapter2.encodeWithTag(writer, 4, value.user_id);
                protoAdapter2.encodeWithTag(writer, 5, value.source);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserPresented value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.BOOL.encodedSizeWithTag(2, value.tracking_v2) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.source) + protoAdapter2.encodedSizeWithTag(4, value.user_id) + protoAdapter2.encodedSizeWithTag(3, value.target_user_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserPresented redact(UserPresented value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return UserPresented.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserPresented value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.source);
                protoAdapter2.encodeWithTag(writer, 4, value.user_id);
                protoAdapter2.encodeWithTag(writer, 3, value.target_user_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.tracking_v2);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserPresented(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? null : str, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserPresented copy$default(UserPresented userPresented, AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = userPresented.common_fields;
        }
        if ((i & 2) != 0) {
            bool = userPresented.tracking_v2;
        }
        if ((i & 4) != 0) {
            str = userPresented.target_user_id;
        }
        if ((i & 8) != 0) {
            str2 = userPresented.user_id;
        }
        if ((i & 16) != 0) {
            str3 = userPresented.source;
        }
        if ((i & 32) != 0) {
            h21Var = userPresented.unknownFields();
        }
        String str4 = str3;
        h21 h21Var2 = h21Var;
        return userPresented.copy(analyticsEventCommonFields, bool, str, str2, str4, h21Var2);
    }

    public final UserPresented copy(AnalyticsEventCommonFields common_fields, Boolean tracking_v2, String target_user_id, String user_id, String source, h21 unknownFields) {
        unknownFields.getClass();
        return new UserPresented(common_fields, tracking_v2, target_user_id, user_id, source, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserPresented)) {
            return false;
        }
        UserPresented userPresented = (UserPresented) other;
        return g76.L(unknownFields(), userPresented.unknownFields()) && g76.L(this.common_fields, userPresented.common_fields) && g76.L(this.tracking_v2, userPresented.tracking_v2) && g76.L(this.target_user_id, userPresented.target_user_id) && g76.L(this.user_id, userPresented.user_id) && g76.L(this.source, userPresented.source);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Boolean bool = this.tracking_v2;
        int i2 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str = this.target_user_id;
        int iHashCode3 = (i2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.user_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.source;
        int iHashCode5 = iHashCode4 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final iee newBuilder() {
        iee ieeVar = new iee();
        ieeVar.a = this.common_fields;
        ieeVar.b = this.tracking_v2;
        ieeVar.c = this.target_user_id;
        ieeVar.d = this.user_id;
        ieeVar.e = this.source;
        ieeVar.addUnknownFields(unknownFields());
        return ieeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Boolean bool = this.tracking_v2;
        if (bool != null) {
            lv8.A("tracking_v2=", bool, arrayList);
        }
        String str = this.target_user_id;
        if (str != null) {
            lv8.D(str, "target_user_id=", arrayList);
        }
        String str2 = this.user_id;
        if (str2 != null) {
            lv8.D(str2, "user_id=", arrayList);
        }
        String str3 = this.source;
        if (str3 != null) {
            lv8.D(str3, "source=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserPresented{", "}", null, 56);
    }

    public UserPresented() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserPresented(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.tracking_v2 = bool;
        this.target_user_id = str;
        this.user_id = str2;
        this.source = str3;
    }
}
