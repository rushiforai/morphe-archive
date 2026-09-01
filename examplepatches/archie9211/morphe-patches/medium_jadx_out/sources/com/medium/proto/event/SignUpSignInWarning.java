package com.medium.proto.event;

import android.os.Parcelable;
import androidx.core.widget.nRCC.nGxjfIr;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.ddc;
import defpackage.edc;
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
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ_\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/SignUpSignInWarning;", "Lcom/squareup/wire/AndroidMessage;", "Lddc;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "entry_point", "operation", "susi_method", "warning_message", "logged_out_user_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lddc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/SignUpSignInWarning;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "edc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("susi.warning")
public final class SignUpSignInWarning extends AndroidMessage<SignUpSignInWarning, ddc> {
    public static final ProtoAdapter<SignUpSignInWarning> ADAPTER;
    public static final Parcelable.Creator<SignUpSignInWarning> CREATOR;
    public static final edc Companion = new edc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String logged_out_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String operation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String susi_method;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String warning_message;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SignUpSignInWarning.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SignUpSignInWarning> protoAdapter = new ProtoAdapter<SignUpSignInWarning>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.SignUpSignInWarning$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInWarning decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SignUpSignInWarning(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, strDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SignUpSignInWarning value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                protoAdapter2.encodeWithTag(writer, 5, value.warning_message);
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SignUpSignInWarning value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(6, value.logged_out_user_id) + protoAdapter2.encodedSizeWithTag(5, value.warning_message) + protoAdapter2.encodedSizeWithTag(4, value.susi_method) + protoAdapter2.encodedSizeWithTag(3, value.operation) + protoAdapter2.encodedSizeWithTag(2, value.entry_point) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInWarning redact(SignUpSignInWarning value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return SignUpSignInWarning.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, h21.d, 62, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SignUpSignInWarning value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 5, value.warning_message);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SignUpSignInWarning(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SignUpSignInWarning copy$default(SignUpSignInWarning signUpSignInWarning, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = signUpSignInWarning.common_fields;
        }
        if ((i & 2) != 0) {
            str = signUpSignInWarning.entry_point;
        }
        if ((i & 4) != 0) {
            str2 = signUpSignInWarning.operation;
        }
        if ((i & 8) != 0) {
            str3 = signUpSignInWarning.susi_method;
        }
        if ((i & 16) != 0) {
            str4 = signUpSignInWarning.warning_message;
        }
        if ((i & 32) != 0) {
            str5 = signUpSignInWarning.logged_out_user_id;
        }
        if ((i & 64) != 0) {
            h21Var = signUpSignInWarning.unknownFields();
        }
        String str6 = str5;
        h21 h21Var2 = h21Var;
        String str7 = str4;
        String str8 = str2;
        return signUpSignInWarning.copy(analyticsEventCommonFields, str, str8, str3, str7, str6, h21Var2);
    }

    public final SignUpSignInWarning copy(AnalyticsEventCommonFields common_fields, String entry_point, String operation, String susi_method, String warning_message, String logged_out_user_id, h21 unknownFields) {
        unknownFields.getClass();
        return new SignUpSignInWarning(common_fields, entry_point, operation, susi_method, warning_message, logged_out_user_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SignUpSignInWarning)) {
            return false;
        }
        SignUpSignInWarning signUpSignInWarning = (SignUpSignInWarning) other;
        return g76.L(unknownFields(), signUpSignInWarning.unknownFields()) && g76.L(this.common_fields, signUpSignInWarning.common_fields) && g76.L(this.entry_point, signUpSignInWarning.entry_point) && g76.L(this.operation, signUpSignInWarning.operation) && g76.L(this.susi_method, signUpSignInWarning.susi_method) && g76.L(this.warning_message, signUpSignInWarning.warning_message) && g76.L(this.logged_out_user_id, signUpSignInWarning.logged_out_user_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.entry_point;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.operation;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.susi_method;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.warning_message;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.logged_out_user_id;
        int iHashCode7 = iHashCode6 + (str5 != null ? str5.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final ddc newBuilder() {
        ddc ddcVar = new ddc();
        ddcVar.a = this.common_fields;
        ddcVar.b = this.entry_point;
        ddcVar.c = this.operation;
        ddcVar.d = this.susi_method;
        ddcVar.e = this.warning_message;
        ddcVar.f = this.logged_out_user_id;
        ddcVar.addUnknownFields(unknownFields());
        return ddcVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.entry_point;
        if (str != null) {
            lv8.D(str, "entry_point=", arrayList);
        }
        String str2 = this.operation;
        if (str2 != null) {
            lv8.D(str2, "operation=", arrayList);
        }
        String str3 = this.susi_method;
        if (str3 != null) {
            lv8.D(str3, nGxjfIr.xQDA, arrayList);
        }
        String str4 = this.warning_message;
        if (str4 != null) {
            lv8.D(str4, "warning_message=", arrayList);
        }
        String str5 = this.logged_out_user_id;
        if (str5 != null) {
            lv8.D(str5, "logged_out_user_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SignUpSignInWarning{", "}", null, 56);
    }

    public SignUpSignInWarning() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SignUpSignInWarning(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.entry_point = str;
        this.operation = str2;
        this.susi_method = str3;
        this.warning_message = str4;
        this.logged_out_user_id = str5;
    }
}
