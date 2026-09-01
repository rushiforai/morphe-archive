package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
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
import defpackage.lbc;
import defpackage.lv8;
import defpackage.mbc;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!Be\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJk\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001fR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001f¨\u0006\""}, d2 = {"Lcom/medium/proto/event/SignUpSignInLoginCodeError;", "Lcom/squareup/wire/AndroidMessage;", "Llbc;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "entry_point", "error_message", "error_code", "operation", "logged_out_user_id", "login_code", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Llbc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/SignUpSignInLoginCodeError;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "mbc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("susi.loginCode.error")
public final class SignUpSignInLoginCodeError extends AndroidMessage<SignUpSignInLoginCodeError, lbc> {
    public static final ProtoAdapter<SignUpSignInLoginCodeError> ADAPTER;
    public static final Parcelable.Creator<SignUpSignInLoginCodeError> CREATOR;
    public static final mbc Companion = new mbc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String error_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String error_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String logged_out_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String login_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String operation;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SignUpSignInLoginCodeError.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SignUpSignInLoginCodeError> protoAdapter = new ProtoAdapter<SignUpSignInLoginCodeError>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.SignUpSignInLoginCodeError$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInLoginCodeError decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SignUpSignInLoginCodeError(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, strDecode5, strDecode6, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                        case 7:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SignUpSignInLoginCodeError value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 3, value.error_message);
                protoAdapter2.encodeWithTag(writer, 4, value.error_code);
                protoAdapter2.encodeWithTag(writer, 5, value.operation);
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 7, value.login_code);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SignUpSignInLoginCodeError value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(7, value.login_code) + protoAdapter2.encodedSizeWithTag(6, value.logged_out_user_id) + protoAdapter2.encodedSizeWithTag(5, value.operation) + protoAdapter2.encodedSizeWithTag(4, value.error_code) + protoAdapter2.encodedSizeWithTag(3, value.error_message) + protoAdapter2.encodedSizeWithTag(2, value.entry_point) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInLoginCodeError redact(SignUpSignInLoginCodeError value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return SignUpSignInLoginCodeError.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, h21.d, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SignUpSignInLoginCodeError value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 7, value.login_code);
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 5, value.operation);
                protoAdapter2.encodeWithTag(writer, 4, value.error_code);
                protoAdapter2.encodeWithTag(writer, 3, value.error_message);
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SignUpSignInLoginCodeError(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : str6, (i & 128) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SignUpSignInLoginCodeError copy$default(SignUpSignInLoginCodeError signUpSignInLoginCodeError, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = signUpSignInLoginCodeError.common_fields;
        }
        if ((i & 2) != 0) {
            str = signUpSignInLoginCodeError.entry_point;
        }
        if ((i & 4) != 0) {
            str2 = signUpSignInLoginCodeError.error_message;
        }
        if ((i & 8) != 0) {
            str3 = signUpSignInLoginCodeError.error_code;
        }
        if ((i & 16) != 0) {
            str4 = signUpSignInLoginCodeError.operation;
        }
        if ((i & 32) != 0) {
            str5 = signUpSignInLoginCodeError.logged_out_user_id;
        }
        if ((i & 64) != 0) {
            str6 = signUpSignInLoginCodeError.login_code;
        }
        if ((i & 128) != 0) {
            h21Var = signUpSignInLoginCodeError.unknownFields();
        }
        String str7 = str6;
        h21 h21Var2 = h21Var;
        String str8 = str4;
        String str9 = str5;
        return signUpSignInLoginCodeError.copy(analyticsEventCommonFields, str, str2, str3, str8, str9, str7, h21Var2);
    }

    public final SignUpSignInLoginCodeError copy(AnalyticsEventCommonFields common_fields, String entry_point, String error_message, String error_code, String operation, String logged_out_user_id, String login_code, h21 unknownFields) {
        unknownFields.getClass();
        return new SignUpSignInLoginCodeError(common_fields, entry_point, error_message, error_code, operation, logged_out_user_id, login_code, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SignUpSignInLoginCodeError)) {
            return false;
        }
        SignUpSignInLoginCodeError signUpSignInLoginCodeError = (SignUpSignInLoginCodeError) other;
        return g76.L(unknownFields(), signUpSignInLoginCodeError.unknownFields()) && g76.L(this.common_fields, signUpSignInLoginCodeError.common_fields) && g76.L(this.entry_point, signUpSignInLoginCodeError.entry_point) && g76.L(this.error_message, signUpSignInLoginCodeError.error_message) && g76.L(this.error_code, signUpSignInLoginCodeError.error_code) && g76.L(this.operation, signUpSignInLoginCodeError.operation) && g76.L(this.logged_out_user_id, signUpSignInLoginCodeError.logged_out_user_id) && g76.L(this.login_code, signUpSignInLoginCodeError.login_code);
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
        String str2 = this.error_message;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.error_code;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.operation;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.logged_out_user_id;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.login_code;
        int iHashCode8 = iHashCode7 + (str6 != null ? str6.hashCode() : 0);
        this.hashCode = iHashCode8;
        return iHashCode8;
    }

    @Override // com.squareup.wire.Message
    public final lbc newBuilder() {
        lbc lbcVar = new lbc();
        lbcVar.a = this.common_fields;
        lbcVar.b = this.entry_point;
        lbcVar.c = this.error_message;
        lbcVar.d = this.error_code;
        lbcVar.e = this.operation;
        lbcVar.f = this.logged_out_user_id;
        lbcVar.g = this.login_code;
        lbcVar.addUnknownFields(unknownFields());
        return lbcVar;
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
        String str2 = this.error_message;
        if (str2 != null) {
            lv8.D(str2, "error_message=", arrayList);
        }
        String str3 = this.error_code;
        if (str3 != null) {
            lv8.D(str3, "error_code=", arrayList);
        }
        String str4 = this.operation;
        if (str4 != null) {
            lv8.D(str4, "operation=", arrayList);
        }
        String str5 = this.logged_out_user_id;
        if (str5 != null) {
            lv8.D(str5, "logged_out_user_id=", arrayList);
        }
        String str6 = this.login_code;
        if (str6 != null) {
            lv8.D(str6, "login_code=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SignUpSignInLoginCodeError{", "}", null, 56);
    }

    public SignUpSignInLoginCodeError() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SignUpSignInLoginCodeError(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.entry_point = str;
        this.error_message = str2;
        this.error_code = str3;
        this.operation = str4;
        this.logged_out_user_id = str5;
        this.login_code = str6;
    }
}
