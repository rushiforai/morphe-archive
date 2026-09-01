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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.tcc;
import defpackage.ucc;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \"2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002#Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\t2\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJw\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010 R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010!R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010 R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010 R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010 ¨\u0006$"}, d2 = {"Lcom/medium/proto/event/SignUpSignInSuccess;", "Lcom/squareup/wire/AndroidMessage;", "Ltcc;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "entry_point", "operation", "susi_method", "", "is_password", "logged_out_user_id", "logged_in_user_id", "dimension", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ltcc;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/SignUpSignInSuccess;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "ucc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("susi.success")
public final class SignUpSignInSuccess extends AndroidMessage<SignUpSignInSuccess, tcc> {
    public static final ProtoAdapter<SignUpSignInSuccess> ADAPTER;
    public static final Parcelable.Creator<SignUpSignInSuccess> CREATOR;
    public static final ucc Companion = new ucc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String dimension;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean is_password;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String logged_in_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String logged_out_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String operation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String susi_method;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SignUpSignInSuccess.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SignUpSignInSuccess> protoAdapter = new ProtoAdapter<SignUpSignInSuccess>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.SignUpSignInSuccess$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInSuccess decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SignUpSignInSuccess(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, boolDecode, strDecode4, strDecode5, strDecode6, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SignUpSignInSuccess value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.is_password);
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                protoAdapter2.encodeWithTag(writer, 7, value.logged_in_user_id);
                protoAdapter2.encodeWithTag(writer, 8, value.dimension);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SignUpSignInSuccess value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(8, value.dimension) + protoAdapter2.encodedSizeWithTag(7, value.logged_in_user_id) + protoAdapter2.encodedSizeWithTag(6, value.logged_out_user_id) + ProtoAdapter.BOOL.encodedSizeWithTag(5, value.is_password) + protoAdapter2.encodedSizeWithTag(4, value.susi_method) + protoAdapter2.encodedSizeWithTag(3, value.operation) + protoAdapter2.encodedSizeWithTag(2, value.entry_point) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SignUpSignInSuccess redact(SignUpSignInSuccess value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return SignUpSignInSuccess.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, null, h21.d, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SignUpSignInSuccess value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 8, value.dimension);
                protoAdapter2.encodeWithTag(writer, 7, value.logged_in_user_id);
                protoAdapter2.encodeWithTag(writer, 6, value.logged_out_user_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.is_password);
                protoAdapter2.encodeWithTag(writer, 4, value.susi_method);
                protoAdapter2.encodeWithTag(writer, 3, value.operation);
                protoAdapter2.encodeWithTag(writer, 2, value.entry_point);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SignUpSignInSuccess(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, String str6, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : bool, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? null : str6, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SignUpSignInSuccess copy$default(SignUpSignInSuccess signUpSignInSuccess, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, String str6, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = signUpSignInSuccess.common_fields;
        }
        if ((i & 2) != 0) {
            str = signUpSignInSuccess.entry_point;
        }
        if ((i & 4) != 0) {
            str2 = signUpSignInSuccess.operation;
        }
        if ((i & 8) != 0) {
            str3 = signUpSignInSuccess.susi_method;
        }
        if ((i & 16) != 0) {
            bool = signUpSignInSuccess.is_password;
        }
        if ((i & 32) != 0) {
            str4 = signUpSignInSuccess.logged_out_user_id;
        }
        if ((i & 64) != 0) {
            str5 = signUpSignInSuccess.logged_in_user_id;
        }
        if ((i & 128) != 0) {
            str6 = signUpSignInSuccess.dimension;
        }
        if ((i & 256) != 0) {
            h21Var = signUpSignInSuccess.unknownFields();
        }
        String str7 = str6;
        h21 h21Var2 = h21Var;
        String str8 = str4;
        String str9 = str5;
        Boolean bool2 = bool;
        String str10 = str2;
        return signUpSignInSuccess.copy(analyticsEventCommonFields, str, str10, str3, bool2, str8, str9, str7, h21Var2);
    }

    public final SignUpSignInSuccess copy(AnalyticsEventCommonFields common_fields, String entry_point, String operation, String susi_method, Boolean is_password, String logged_out_user_id, String logged_in_user_id, String dimension, h21 unknownFields) {
        unknownFields.getClass();
        return new SignUpSignInSuccess(common_fields, entry_point, operation, susi_method, is_password, logged_out_user_id, logged_in_user_id, dimension, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SignUpSignInSuccess)) {
            return false;
        }
        SignUpSignInSuccess signUpSignInSuccess = (SignUpSignInSuccess) other;
        return g76.L(unknownFields(), signUpSignInSuccess.unknownFields()) && g76.L(this.common_fields, signUpSignInSuccess.common_fields) && g76.L(this.entry_point, signUpSignInSuccess.entry_point) && g76.L(this.operation, signUpSignInSuccess.operation) && g76.L(this.susi_method, signUpSignInSuccess.susi_method) && g76.L(this.is_password, signUpSignInSuccess.is_password) && g76.L(this.logged_out_user_id, signUpSignInSuccess.logged_out_user_id) && g76.L(this.logged_in_user_id, signUpSignInSuccess.logged_in_user_id) && g76.L(this.dimension, signUpSignInSuccess.dimension);
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
        Boolean bool = this.is_password;
        int i2 = (iHashCode5 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.logged_out_user_id;
        int iHashCode6 = (i2 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.logged_in_user_id;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.dimension;
        int iHashCode8 = iHashCode7 + (str6 != null ? str6.hashCode() : 0);
        this.hashCode = iHashCode8;
        return iHashCode8;
    }

    @Override // com.squareup.wire.Message
    public final tcc newBuilder() {
        tcc tccVar = new tcc();
        tccVar.a = this.common_fields;
        tccVar.b = this.entry_point;
        tccVar.c = this.operation;
        tccVar.d = this.susi_method;
        tccVar.e = this.is_password;
        tccVar.f = this.logged_out_user_id;
        tccVar.g = this.logged_in_user_id;
        tccVar.h = this.dimension;
        tccVar.addUnknownFields(unknownFields());
        return tccVar;
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
        Boolean bool = this.is_password;
        if (bool != null) {
            lv8.A("is_password=", bool, arrayList);
        }
        String str4 = this.logged_out_user_id;
        if (str4 != null) {
            lv8.D(str4, "logged_out_user_id=", arrayList);
        }
        String str5 = this.logged_in_user_id;
        if (str5 != null) {
            lv8.D(str5, "logged_in_user_id=", arrayList);
        }
        String str6 = this.dimension;
        if (str6 != null) {
            lv8.D(str6, "dimension=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SignUpSignInSuccess{", "}", null, 56);
    }

    public SignUpSignInSuccess() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SignUpSignInSuccess(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, String str6, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.entry_point = str;
        this.operation = str2;
        this.susi_method = str3;
        this.is_password = bool;
        this.logged_out_user_id = str4;
        this.logged_in_user_id = str5;
        this.dimension = str6;
    }
}
