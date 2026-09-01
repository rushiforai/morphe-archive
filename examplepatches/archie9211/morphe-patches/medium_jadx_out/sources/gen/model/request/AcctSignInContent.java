package gen.model.request;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
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
import defpackage.r5;
import defpackage.s5;
import defpackage.wg6;
import defpackage.z73;
import java.util.ArrayList;
import kotlin.Metadata;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000e\u0018\u0000 .2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002/Bõ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010 \u001a\u00020\u00102\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0096\u0002¢\u0006\u0004\b \u0010!J\u000f\u0010#\u001a\u00020\"H\u0016¢\u0006\u0004\b#\u0010$J\u000f\u0010%\u001a\u00020\u0003H\u0016¢\u0006\u0004\b%\u0010&Jû\u0001\u0010'\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b'\u0010(R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010)R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010)R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010)R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010)R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010)R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010)R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010)R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010)R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010)R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010)R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010)R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010)R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010*R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010)R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010)R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010*R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u0010)\u0012\u0004\b+\u0010,R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010)R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0017\u0010)\u0012\u0004\b-\u0010,¨\u00060"}, d2 = {"Lgen/model/request/AcctSignInContent;", "Lcom/squareup/wire/AndroidMessage;", "Lr5;", "", "source", "access_token", "oauth_request_token", "oauth_request_token_verifier", "redirect", "operation", "access_token_secret", "account_name", "account_id", "identity_token", "code", "name", "", "is_draft", "nonce", "entry_point", "remember_me", "password", "email", "two_factor_verification_code", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lr5;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/request/AcctSignInContent;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "getPassword$annotations", "()V", "getTwo_factor_verification_code$annotations", "Companion", "s5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AcctSignInContent extends AndroidMessage<AcctSignInContent, r5> {
    public static final ProtoAdapter<AcctSignInContent> ADAPTER;
    public static final Parcelable.Creator<AcctSignInContent> CREATOR;
    public static final s5 Companion = new s5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String access_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String access_token_secret;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 9)
    public final String account_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String account_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 17, tag = 17)
    public final String email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 15)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String identity_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 12, tag = 13)
    public final Boolean is_draft;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 14)
    public final String nonce;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String oauth_request_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String oauth_request_token_verifier;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String operation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 16, tag = 16)
    public final String password;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String redirect;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 15, tag = 19)
    public final Boolean remember_me;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 18, tag = 18)
    public final String two_factor_verification_code;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AcctSignInContent.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AcctSignInContent> protoAdapter = new ProtoAdapter<AcctSignInContent>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.AcctSignInContent$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x002e. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final AcctSignInContent decode(ProtoReader reader) {
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
                String strDecode9 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                Boolean boolDecode = null;
                String strDecode13 = null;
                String strDecode14 = null;
                Boolean boolDecode2 = null;
                String strDecode15 = null;
                String strDecode16 = null;
                String strDecode17 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    String str2 = strDecode2;
                    if (iNextTag == -1) {
                        return new AcctSignInContent(str, str2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, strDecode8, strDecode9, strDecode10, strDecode11, strDecode12, boolDecode, strDecode13, strDecode14, boolDecode2, strDecode15, strDecode16, strDecode17, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 10:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 11:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 12:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 13:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 14:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 15:
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 16:
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 17:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 18:
                            strDecode17 = ProtoAdapter.STRING.decode(reader);
                            strDecode2 = str2;
                            strDecode = str;
                            break;
                        case 19:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
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
            public final void encode(ProtoWriter writer, AcctSignInContent value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.source);
                protoAdapter2.encodeWithTag(writer, 2, value.access_token);
                protoAdapter2.encodeWithTag(writer, 3, value.oauth_request_token);
                protoAdapter2.encodeWithTag(writer, 4, value.oauth_request_token_verifier);
                protoAdapter2.encodeWithTag(writer, 5, value.redirect);
                protoAdapter2.encodeWithTag(writer, 6, value.operation);
                protoAdapter2.encodeWithTag(writer, 7, value.access_token_secret);
                protoAdapter2.encodeWithTag(writer, 8, value.account_name);
                protoAdapter2.encodeWithTag(writer, 9, value.account_id);
                protoAdapter2.encodeWithTag(writer, 10, value.identity_token);
                protoAdapter2.encodeWithTag(writer, 11, value.code);
                protoAdapter2.encodeWithTag(writer, 12, value.name);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 13, value.is_draft);
                protoAdapter2.encodeWithTag(writer, 14, value.nonce);
                protoAdapter2.encodeWithTag(writer, 15, value.entry_point);
                protoAdapter3.encodeWithTag(writer, 19, value.remember_me);
                protoAdapter2.encodeWithTag(writer, 16, value.password);
                protoAdapter2.encodeWithTag(writer, 17, value.email);
                protoAdapter2.encodeWithTag(writer, 18, value.two_factor_verification_code);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AcctSignInContent value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(12, value.name) + protoAdapter2.encodedSizeWithTag(11, value.code) + protoAdapter2.encodedSizeWithTag(10, value.identity_token) + protoAdapter2.encodedSizeWithTag(9, value.account_id) + protoAdapter2.encodedSizeWithTag(8, value.account_name) + protoAdapter2.encodedSizeWithTag(7, value.access_token_secret) + protoAdapter2.encodedSizeWithTag(6, value.operation) + protoAdapter2.encodedSizeWithTag(5, value.redirect) + protoAdapter2.encodedSizeWithTag(4, value.oauth_request_token_verifier) + protoAdapter2.encodedSizeWithTag(3, value.oauth_request_token) + protoAdapter2.encodedSizeWithTag(2, value.access_token) + protoAdapter2.encodedSizeWithTag(1, value.source) + iE;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(18, value.two_factor_verification_code) + protoAdapter2.encodedSizeWithTag(17, value.email) + protoAdapter2.encodedSizeWithTag(16, value.password) + protoAdapter3.encodedSizeWithTag(19, value.remember_me) + protoAdapter2.encodedSizeWithTag(15, value.entry_point) + protoAdapter2.encodedSizeWithTag(14, value.nonce) + protoAdapter3.encodedSizeWithTag(13, value.is_draft) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AcctSignInContent redact(AcctSignInContent value) {
                value.getClass();
                return value.copy((524287 & 1) != 0 ? value.source : null, (524287 & 2) != 0 ? value.access_token : null, (524287 & 4) != 0 ? value.oauth_request_token : null, (524287 & 8) != 0 ? value.oauth_request_token_verifier : null, (524287 & 16) != 0 ? value.redirect : null, (524287 & 32) != 0 ? value.operation : null, (524287 & 64) != 0 ? value.access_token_secret : null, (524287 & 128) != 0 ? value.account_name : null, (524287 & 256) != 0 ? value.account_id : null, (524287 & 512) != 0 ? value.identity_token : null, (524287 & 1024) != 0 ? value.code : null, (524287 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.name : null, (524287 & 4096) != 0 ? value.is_draft : null, (524287 & 8192) != 0 ? value.nonce : null, (524287 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.entry_point : null, (524287 & 32768) != 0 ? value.remember_me : null, (524287 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.password : null, (524287 & 131072) != 0 ? value.email : null, (524287 & 262144) != 0 ? value.two_factor_verification_code : null, (524287 & 524288) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AcctSignInContent value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 18, value.two_factor_verification_code);
                protoAdapter2.encodeWithTag(writer, 17, value.email);
                protoAdapter2.encodeWithTag(writer, 16, value.password);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 19, value.remember_me);
                protoAdapter2.encodeWithTag(writer, 15, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 14, value.nonce);
                protoAdapter3.encodeWithTag(writer, 13, value.is_draft);
                protoAdapter2.encodeWithTag(writer, 12, value.name);
                protoAdapter2.encodeWithTag(writer, 11, value.code);
                protoAdapter2.encodeWithTag(writer, 10, value.identity_token);
                protoAdapter2.encodeWithTag(writer, 9, value.account_id);
                protoAdapter2.encodeWithTag(writer, 8, value.account_name);
                protoAdapter2.encodeWithTag(writer, 7, value.access_token_secret);
                protoAdapter2.encodeWithTag(writer, 6, value.operation);
                protoAdapter2.encodeWithTag(writer, 5, value.redirect);
                protoAdapter2.encodeWithTag(writer, 4, value.oauth_request_token_verifier);
                protoAdapter2.encodeWithTag(writer, 3, value.oauth_request_token);
                protoAdapter2.encodeWithTag(writer, 2, value.access_token);
                protoAdapter2.encodeWithTag(writer, 1, value.source);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AcctSignInContent(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, Boolean bool, String str13, String str14, Boolean bool2, String str15, String str16, String str17, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : str6, (i & 64) != 0 ? null : str7, (i & 128) != 0 ? null : str8, (i & 256) != 0 ? null : str9, (i & 512) != 0 ? null : str10, (i & 1024) != 0 ? null : str11, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str12, (i & 4096) != 0 ? null : bool, (i & 8192) != 0 ? null : str13, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str14, (i & 32768) != 0 ? null : bool2, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str15, (i & 131072) != 0 ? null : str16, (i & 262144) != 0 ? null : str17, (i & 524288) != 0 ? h21.d : h21Var);
    }

    @z73
    public static /* synthetic */ void getPassword$annotations() {
    }

    @z73
    public static /* synthetic */ void getTwo_factor_verification_code$annotations() {
    }

    public final AcctSignInContent copy(String source, String access_token, String oauth_request_token, String oauth_request_token_verifier, String redirect, String operation, String access_token_secret, String account_name, String account_id, String identity_token, String code, String name, Boolean is_draft, String nonce, String entry_point, Boolean remember_me, String password, String email, String two_factor_verification_code, h21 unknownFields) {
        unknownFields.getClass();
        return new AcctSignInContent(source, access_token, oauth_request_token, oauth_request_token_verifier, redirect, operation, access_token_secret, account_name, account_id, identity_token, code, name, is_draft, nonce, entry_point, remember_me, password, email, two_factor_verification_code, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AcctSignInContent)) {
            return false;
        }
        AcctSignInContent acctSignInContent = (AcctSignInContent) other;
        return g76.L(unknownFields(), acctSignInContent.unknownFields()) && g76.L(this.source, acctSignInContent.source) && g76.L(this.access_token, acctSignInContent.access_token) && g76.L(this.oauth_request_token, acctSignInContent.oauth_request_token) && g76.L(this.oauth_request_token_verifier, acctSignInContent.oauth_request_token_verifier) && g76.L(this.redirect, acctSignInContent.redirect) && g76.L(this.operation, acctSignInContent.operation) && g76.L(this.access_token_secret, acctSignInContent.access_token_secret) && g76.L(this.account_name, acctSignInContent.account_name) && g76.L(this.account_id, acctSignInContent.account_id) && g76.L(this.identity_token, acctSignInContent.identity_token) && g76.L(this.code, acctSignInContent.code) && g76.L(this.name, acctSignInContent.name) && g76.L(this.is_draft, acctSignInContent.is_draft) && g76.L(this.nonce, acctSignInContent.nonce) && g76.L(this.entry_point, acctSignInContent.entry_point) && g76.L(this.remember_me, acctSignInContent.remember_me) && g76.L(this.password, acctSignInContent.password) && g76.L(this.email, acctSignInContent.email) && g76.L(this.two_factor_verification_code, acctSignInContent.two_factor_verification_code);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.source;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.access_token;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.oauth_request_token;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.oauth_request_token_verifier;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.redirect;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.operation;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.access_token_secret;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.account_name;
        int iHashCode9 = (iHashCode8 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.account_id;
        int iHashCode10 = (iHashCode9 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.identity_token;
        int iHashCode11 = (iHashCode10 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.code;
        int iHashCode12 = (iHashCode11 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.name;
        int iHashCode13 = (iHashCode12 + (str12 != null ? str12.hashCode() : 0)) * 37;
        Boolean bool = this.is_draft;
        int i2 = 1237;
        int i3 = (iHashCode13 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str13 = this.nonce;
        int iHashCode14 = (i3 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.entry_point;
        int iHashCode15 = (iHashCode14 + (str14 != null ? str14.hashCode() : 0)) * 37;
        Boolean bool2 = this.remember_me;
        if (bool2 == null) {
            i2 = 0;
        } else if (bool2.booleanValue()) {
            i2 = 1231;
        }
        int i4 = (iHashCode15 + i2) * 37;
        String str15 = this.password;
        int iHashCode16 = (i4 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.email;
        int iHashCode17 = (iHashCode16 + (str16 != null ? str16.hashCode() : 0)) * 37;
        String str17 = this.two_factor_verification_code;
        int iHashCode18 = iHashCode17 + (str17 != null ? str17.hashCode() : 0);
        this.hashCode = iHashCode18;
        return iHashCode18;
    }

    @Override // com.squareup.wire.Message
    public final r5 newBuilder() {
        r5 r5Var = new r5();
        r5Var.a = this.source;
        r5Var.b = this.access_token;
        r5Var.c = this.oauth_request_token;
        r5Var.d = this.oauth_request_token_verifier;
        r5Var.e = this.redirect;
        r5Var.f = this.operation;
        r5Var.g = this.access_token_secret;
        r5Var.h = this.account_name;
        r5Var.i = this.account_id;
        r5Var.j = this.identity_token;
        r5Var.k = this.code;
        r5Var.l = this.name;
        r5Var.m = this.is_draft;
        r5Var.n = this.nonce;
        r5Var.o = this.entry_point;
        r5Var.p = this.remember_me;
        r5Var.q = this.password;
        r5Var.r = this.email;
        r5Var.s = this.two_factor_verification_code;
        r5Var.addUnknownFields(unknownFields());
        return r5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.source;
        if (str != null) {
            lv8.D(str, "source=", arrayList);
        }
        String str2 = this.access_token;
        if (str2 != null) {
            lv8.D(str2, "access_token=", arrayList);
        }
        String str3 = this.oauth_request_token;
        if (str3 != null) {
            lv8.D(str3, "oauth_request_token=", arrayList);
        }
        String str4 = this.oauth_request_token_verifier;
        if (str4 != null) {
            lv8.D(str4, "oauth_request_token_verifier=", arrayList);
        }
        String str5 = this.redirect;
        if (str5 != null) {
            lv8.D(str5, "redirect=", arrayList);
        }
        String str6 = this.operation;
        if (str6 != null) {
            lv8.D(str6, "operation=", arrayList);
        }
        String str7 = this.access_token_secret;
        if (str7 != null) {
            lv8.D(str7, "access_token_secret=", arrayList);
        }
        String str8 = this.account_name;
        if (str8 != null) {
            lv8.D(str8, "account_name=", arrayList);
        }
        String str9 = this.account_id;
        if (str9 != null) {
            lv8.D(str9, dpBiLjNeNsiASg.iMHmhNYDyHP, arrayList);
        }
        String str10 = this.identity_token;
        if (str10 != null) {
            lv8.D(str10, "identity_token=", arrayList);
        }
        String str11 = this.code;
        if (str11 != null) {
            lv8.D(str11, "code=", arrayList);
        }
        String str12 = this.name;
        if (str12 != null) {
            lv8.D(str12, "name=", arrayList);
        }
        Boolean bool = this.is_draft;
        if (bool != null) {
            lv8.A("is_draft=", bool, arrayList);
        }
        String str13 = this.nonce;
        if (str13 != null) {
            lv8.D(str13, "nonce=", arrayList);
        }
        String str14 = this.entry_point;
        if (str14 != null) {
            lv8.D(str14, "entry_point=", arrayList);
        }
        Boolean bool2 = this.remember_me;
        if (bool2 != null) {
            lv8.A("remember_me=", bool2, arrayList);
        }
        String str15 = this.password;
        if (str15 != null) {
            lv8.D(str15, "password=", arrayList);
        }
        String str16 = this.email;
        if (str16 != null) {
            lv8.D(str16, "email=", arrayList);
        }
        String str17 = this.two_factor_verification_code;
        if (str17 != null) {
            lv8.D(str17, "two_factor_verification_code=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "AcctSignInContent{", "}", null, 56);
    }

    public AcctSignInContent() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1048575, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AcctSignInContent(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, Boolean bool, String str13, String str14, Boolean bool2, String str15, String str16, String str17, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.source = str;
        this.access_token = str2;
        this.oauth_request_token = str3;
        this.oauth_request_token_verifier = str4;
        this.redirect = str5;
        this.operation = str6;
        this.access_token_secret = str7;
        this.account_name = str8;
        this.account_id = str9;
        this.identity_token = str10;
        this.code = str11;
        this.name = str12;
        this.is_draft = bool;
        this.nonce = str13;
        this.entry_point = str14;
        this.remember_me = bool2;
        this.password = str15;
        this.email = str16;
        this.two_factor_verification_code = str17;
    }
}
