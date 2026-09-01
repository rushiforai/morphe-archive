package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.metadata.exif.ExifDirectoryBase;
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
import defpackage.jbc;
import defpackage.kbc;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJw\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010 R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010 R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010 ¨\u0006#"}, d2 = {"Lcom/medium/proto/event/SignUpSignInError;", "Lcom/squareup/wire/AndroidMessage;", "Ljbc;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "entry_point", "operation", "susi_method", "error_message", "error_code", "logged_out_user_id", "dimension", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ljbc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/SignUpSignInError;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "kbc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("susi.error")
public final class SignUpSignInError extends AndroidMessage<SignUpSignInError, jbc> {
    public static final ProtoAdapter<SignUpSignInError> ADAPTER;
    public static final Parcelable.Creator<SignUpSignInError> CREATOR;
    public static final kbc Companion = new kbc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String dimension;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String error_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String error_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String logged_out_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String operation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String susi_method;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SignUpSignInError.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SignUpSignInError> protoAdapter = new ProtoAdapter<SignUpSignInError>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.SignUpSignInError$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInError decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SignUpSignInError(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                        case 8:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SignUpSignInError value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                protoAdapter2.encodeWithTag(writer, 5, value.error_message);
                protoAdapter2.encodeWithTag(writer, 6, value.error_code);
                protoAdapter2.encodeWithTag(writer, 7, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 8, value.dimension);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SignUpSignInError value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(8, value.dimension) + protoAdapter2.encodedSizeWithTag(7, value.logged_out_user_id) + protoAdapter2.encodedSizeWithTag(6, value.error_code) + protoAdapter2.encodedSizeWithTag(5, value.error_message) + protoAdapter2.encodedSizeWithTag(4, value.susi_method) + protoAdapter2.encodedSizeWithTag(3, value.operation) + protoAdapter2.encodedSizeWithTag(2, value.entry_point) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInError redact(SignUpSignInError value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return SignUpSignInError.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, null, h21.d, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SignUpSignInError value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 8, value.dimension);
                protoAdapter2.encodeWithTag(writer, 7, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 6, value.error_code);
                protoAdapter2.encodeWithTag(writer, 5, value.error_message);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SignUpSignInError(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : str6, (i & 128) != 0 ? null : str7, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SignUpSignInError copy$default(SignUpSignInError signUpSignInError, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = signUpSignInError.common_fields;
        }
        if ((i & 2) != 0) {
            str = signUpSignInError.entry_point;
        }
        if ((i & 4) != 0) {
            str2 = signUpSignInError.operation;
        }
        if ((i & 8) != 0) {
            str3 = signUpSignInError.susi_method;
        }
        if ((i & 16) != 0) {
            str4 = signUpSignInError.error_message;
        }
        if ((i & 32) != 0) {
            str5 = signUpSignInError.error_code;
        }
        if ((i & 64) != 0) {
            str6 = signUpSignInError.logged_out_user_id;
        }
        if ((i & 128) != 0) {
            str7 = signUpSignInError.dimension;
        }
        if ((i & 256) != 0) {
            h21Var = signUpSignInError.unknownFields();
        }
        String str8 = str7;
        h21 h21Var2 = h21Var;
        String str9 = str5;
        String str10 = str6;
        String str11 = str4;
        String str12 = str2;
        return signUpSignInError.copy(analyticsEventCommonFields, str, str12, str3, str11, str9, str10, str8, h21Var2);
    }

    public final SignUpSignInError copy(AnalyticsEventCommonFields common_fields, String entry_point, String operation, String susi_method, String error_message, String error_code, String logged_out_user_id, String dimension, h21 unknownFields) {
        unknownFields.getClass();
        return new SignUpSignInError(common_fields, entry_point, operation, susi_method, error_message, error_code, logged_out_user_id, dimension, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SignUpSignInError)) {
            return false;
        }
        SignUpSignInError signUpSignInError = (SignUpSignInError) other;
        return g76.L(unknownFields(), signUpSignInError.unknownFields()) && g76.L(this.common_fields, signUpSignInError.common_fields) && g76.L(this.entry_point, signUpSignInError.entry_point) && g76.L(this.operation, signUpSignInError.operation) && g76.L(this.susi_method, signUpSignInError.susi_method) && g76.L(this.error_message, signUpSignInError.error_message) && g76.L(this.error_code, signUpSignInError.error_code) && g76.L(this.logged_out_user_id, signUpSignInError.logged_out_user_id) && g76.L(this.dimension, signUpSignInError.dimension);
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
        String str4 = this.error_message;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.error_code;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.logged_out_user_id;
        int iHashCode8 = (iHashCode7 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.dimension;
        int iHashCode9 = iHashCode8 + (str7 != null ? str7.hashCode() : 0);
        this.hashCode = iHashCode9;
        return iHashCode9;
    }

    @Override // com.squareup.wire.Message
    public final jbc newBuilder() {
        jbc jbcVar = new jbc();
        jbcVar.a = this.common_fields;
        jbcVar.b = this.entry_point;
        jbcVar.c = this.operation;
        jbcVar.d = this.susi_method;
        jbcVar.e = this.error_message;
        jbcVar.f = this.error_code;
        jbcVar.g = this.logged_out_user_id;
        jbcVar.h = this.dimension;
        jbcVar.addUnknownFields(unknownFields());
        return jbcVar;
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
            lv8.D(str3, "susi_method=", arrayList);
        }
        String str4 = this.error_message;
        if (str4 != null) {
            lv8.D(str4, "error_message=", arrayList);
        }
        String str5 = this.error_code;
        if (str5 != null) {
            lv8.D(str5, "error_code=", arrayList);
        }
        String str6 = this.logged_out_user_id;
        if (str6 != null) {
            lv8.D(str6, "logged_out_user_id=", arrayList);
        }
        String str7 = this.dimension;
        if (str7 != null) {
            lv8.D(str7, "dimension=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SignUpSignInError{", "}", null, 56);
    }

    public SignUpSignInError() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SignUpSignInError(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.entry_point = str;
        this.operation = str2;
        this.susi_method = str3;
        this.error_message = str4;
        this.error_code = str5;
        this.logged_out_user_id = str6;
        this.dimension = str7;
    }
}
