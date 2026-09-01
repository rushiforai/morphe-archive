package gen.model;

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
import defpackage.cc0;
import defpackage.dc0;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000e\u0018\u0000 $2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002%B}\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\f2\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0083\u0001\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001f\u0012\u0004\b \u0010!R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u0012\u0004\b\"\u0010!R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001fR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001fR\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010#¨\u0006&"}, d2 = {"Lgen/model/AuthInfo;", "Lcom/squareup/wire/AndroidMessage;", "Lcc0;", "", "uid", "auth_issued", "auth_sign", "session_token", "redirect", "sid", "domain", "xsrf", "", "password_prompt", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lcc0;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)Lgen/model/AuthInfo;", "Ljava/lang/String;", "getAuth_issued$annotations", "()V", "getAuth_sign$annotations", "Ljava/lang/Boolean;", "Companion", "dc0", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AuthInfo extends AndroidMessage<AuthInfo, cc0> {
    public static final ProtoAdapter<AuthInfo> ADAPTER;
    public static final Parcelable.Creator<AuthInfo> CREATOR;
    public static final dc0 Companion = new dc0();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String auth_issued;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String auth_sign;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String domain;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean password_prompt;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String redirect;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String session_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String sid;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String uid;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String xsrf;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AuthInfo.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AuthInfo> protoAdapter = new ProtoAdapter<AuthInfo>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.AuthInfo$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AuthInfo decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AuthInfo(strDecode, strDecode2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, strDecode8, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
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
            public final void encode(ProtoWriter writer, AuthInfo value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.uid);
                protoAdapter2.encodeWithTag(writer, 2, value.auth_issued);
                protoAdapter2.encodeWithTag(writer, 3, value.auth_sign);
                protoAdapter2.encodeWithTag(writer, 4, value.session_token);
                protoAdapter2.encodeWithTag(writer, 5, value.redirect);
                protoAdapter2.encodeWithTag(writer, 6, value.sid);
                protoAdapter2.encodeWithTag(writer, 7, value.domain);
                protoAdapter2.encodeWithTag(writer, 8, value.xsrf);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.password_prompt);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AuthInfo value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(9, value.password_prompt) + protoAdapter2.encodedSizeWithTag(8, value.xsrf) + protoAdapter2.encodedSizeWithTag(7, value.domain) + protoAdapter2.encodedSizeWithTag(6, value.sid) + protoAdapter2.encodedSizeWithTag(5, value.redirect) + protoAdapter2.encodedSizeWithTag(4, value.session_token) + protoAdapter2.encodedSizeWithTag(3, value.auth_sign) + protoAdapter2.encodedSizeWithTag(2, value.auth_issued) + protoAdapter2.encodedSizeWithTag(1, value.uid) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AuthInfo redact(AuthInfo value) {
                value.getClass();
                return AuthInfo.copy$default(value, null, null, null, null, null, null, null, null, null, h21.d, 511, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AuthInfo value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.password_prompt);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 8, value.xsrf);
                protoAdapter2.encodeWithTag(writer, 7, value.domain);
                protoAdapter2.encodeWithTag(writer, 6, value.sid);
                protoAdapter2.encodeWithTag(writer, 5, value.redirect);
                protoAdapter2.encodeWithTag(writer, 4, value.session_token);
                protoAdapter2.encodeWithTag(writer, 3, value.auth_sign);
                protoAdapter2.encodeWithTag(writer, 2, value.auth_issued);
                protoAdapter2.encodeWithTag(writer, 1, value.uid);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AuthInfo(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : str6, (i & 64) != 0 ? null : str7, (i & 128) != 0 ? null : str8, (i & 256) != 0 ? null : bool, (i & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AuthInfo copy$default(AuthInfo authInfo, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = authInfo.uid;
        }
        if ((i & 2) != 0) {
            str2 = authInfo.auth_issued;
        }
        if ((i & 4) != 0) {
            str3 = authInfo.auth_sign;
        }
        if ((i & 8) != 0) {
            str4 = authInfo.session_token;
        }
        if ((i & 16) != 0) {
            str5 = authInfo.redirect;
        }
        if ((i & 32) != 0) {
            str6 = authInfo.sid;
        }
        if ((i & 64) != 0) {
            str7 = authInfo.domain;
        }
        if ((i & 128) != 0) {
            str8 = authInfo.xsrf;
        }
        if ((i & 256) != 0) {
            bool = authInfo.password_prompt;
        }
        if ((i & 512) != 0) {
            h21Var = authInfo.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        String str9 = str7;
        String str10 = str8;
        String str11 = str5;
        String str12 = str6;
        return authInfo.copy(str, str2, str3, str4, str11, str12, str9, str10, bool2, h21Var2);
    }

    public final AuthInfo copy(String uid, String auth_issued, String auth_sign, String session_token, String redirect, String sid, String domain, String xsrf, Boolean password_prompt, h21 unknownFields) {
        unknownFields.getClass();
        return new AuthInfo(uid, auth_issued, auth_sign, session_token, redirect, sid, domain, xsrf, password_prompt, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AuthInfo)) {
            return false;
        }
        AuthInfo authInfo = (AuthInfo) other;
        return g76.L(unknownFields(), authInfo.unknownFields()) && g76.L(this.uid, authInfo.uid) && g76.L(this.auth_issued, authInfo.auth_issued) && g76.L(this.auth_sign, authInfo.auth_sign) && g76.L(this.session_token, authInfo.session_token) && g76.L(this.redirect, authInfo.redirect) && g76.L(this.sid, authInfo.sid) && g76.L(this.domain, authInfo.domain) && g76.L(this.xsrf, authInfo.xsrf) && g76.L(this.password_prompt, authInfo.password_prompt);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.uid;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.auth_issued;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.auth_sign;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.session_token;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.redirect;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.sid;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.domain;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.xsrf;
        int iHashCode9 = (iHashCode8 + (str8 != null ? str8.hashCode() : 0)) * 37;
        Boolean bool = this.password_prompt;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode9 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final cc0 newBuilder() {
        cc0 cc0Var = new cc0();
        cc0Var.a = this.uid;
        cc0Var.b = this.auth_issued;
        cc0Var.c = this.auth_sign;
        cc0Var.d = this.session_token;
        cc0Var.e = this.redirect;
        cc0Var.f = this.sid;
        cc0Var.g = this.domain;
        cc0Var.h = this.xsrf;
        cc0Var.i = this.password_prompt;
        cc0Var.addUnknownFields(unknownFields());
        return cc0Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.uid;
        if (str != null) {
            lv8.D(str, "uid=", arrayList);
        }
        String str2 = this.auth_issued;
        if (str2 != null) {
            lv8.D(str2, "auth_issued=", arrayList);
        }
        String str3 = this.auth_sign;
        if (str3 != null) {
            lv8.D(str3, "auth_sign=", arrayList);
        }
        String str4 = this.session_token;
        if (str4 != null) {
            lv8.D(str4, "session_token=", arrayList);
        }
        String str5 = this.redirect;
        if (str5 != null) {
            lv8.D(str5, "redirect=", arrayList);
        }
        String str6 = this.sid;
        if (str6 != null) {
            lv8.D(str6, "sid=", arrayList);
        }
        String str7 = this.domain;
        if (str7 != null) {
            lv8.D(str7, "domain=", arrayList);
        }
        String str8 = this.xsrf;
        if (str8 != null) {
            lv8.D(str8, "xsrf=", arrayList);
        }
        Boolean bool = this.password_prompt;
        if (bool != null) {
            lv8.A("password_prompt=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "AuthInfo{", "}", null, 56);
    }

    public static /* synthetic */ void getAuth_issued$annotations() {
    }

    public static /* synthetic */ void getAuth_sign$annotations() {
    }

    public AuthInfo() {
        this(null, null, null, null, null, null, null, null, null, null, 1023, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AuthInfo(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.uid = str;
        this.auth_issued = str2;
        this.auth_sign = str3;
        this.session_token = str4;
        this.redirect = str5;
        this.sid = str6;
        this.domain = str7;
        this.xsrf = str8;
        this.password_prompt = bool;
    }
}
