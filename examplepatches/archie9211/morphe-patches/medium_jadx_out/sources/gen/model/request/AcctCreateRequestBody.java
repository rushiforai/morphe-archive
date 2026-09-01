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
import defpackage.n5;
import defpackage.o5;
import defpackage.wg6;
import gen.model.OnboardingStatus;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 -2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002.Bõ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u001a\u0010!\u001a\u00020\u00162\b\u0010 \u001a\u0004\u0018\u00010\u001fH\u0096\u0002¢\u0006\u0004\b!\u0010\"J\u000f\u0010$\u001a\u00020#H\u0016¢\u0006\u0004\b$\u0010%J\u000f\u0010&\u001a\u00020\u0003H\u0016¢\u0006\u0004\b&\u0010'Jû\u0001\u0010(\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b(\u0010)R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010*R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010*R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010*R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010*R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010*R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010*R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010*R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010*R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010*R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010+R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010*R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010*R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010*R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010*R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010*R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010*R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010*R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010,R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010*¨\u0006/"}, d2 = {"Lgen/model/request/AcctCreateRequestBody;", "Lcom/squareup/wire/AndroidMessage;", "Ln5;", "", "access_token", "access_token_secret", "account_name", "email", "entry_point", "follow", "identity_token", "name", "nonce", "Lgen/model/OnboardingStatus;", "onboarding_status", "redirect", "source", "twitter_access_token", "twitter_access_token_secret", "username", "default_email", "email_availability", "", "remember_me", "password", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/OnboardingStatus;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ln5;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/OnboardingStatus;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)Lgen/model/request/AcctCreateRequestBody;", "Ljava/lang/String;", "Lgen/model/OnboardingStatus;", "Ljava/lang/Boolean;", "Companion", "o5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AcctCreateRequestBody extends AndroidMessage<AcctCreateRequestBody, n5> {
    public static final ProtoAdapter<AcctCreateRequestBody> ADAPTER;
    public static final Parcelable.Creator<AcctCreateRequestBody> CREATOR;
    public static final o5 Companion = new o5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String access_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String access_token_secret;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String account_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 15, tag = 16)
    public final String default_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 16, tag = 17)
    public final String email_availability;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String entry_point;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String follow;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String identity_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 9)
    public final String nonce;

    @WireField(adapter = "gen.model.OnboardingStatus#ADAPTER", schemaIndex = 9, tag = 10)
    public final OnboardingStatus onboarding_status;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 18, tag = 18)
    public final String password;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String redirect;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 17, tag = 19)
    public final Boolean remember_me;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 13)
    public final String twitter_access_token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 14)
    public final String twitter_access_token_secret;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 15)
    public final String username;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AcctCreateRequestBody.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AcctCreateRequestBody> protoAdapter = new ProtoAdapter<AcctCreateRequestBody>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.AcctCreateRequestBody$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AcctCreateRequestBody decode(ProtoReader reader) {
                String str;
                String str2;
                String str3;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str4 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                OnboardingStatus onboardingStatusDecode = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                String strDecode15 = null;
                String strDecode16 = null;
                Boolean boolDecode = null;
                String strDecode17 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AcctCreateRequestBody(str4, strDecode2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, strDecode8, strDecode9, onboardingStatusDecode, strDecode10, strDecode11, strDecode12, strDecode13, strDecode14, strDecode15, strDecode16, boolDecode, strDecode17, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 4:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 5:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 6:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 7:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 8:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 9:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 10:
                            try {
                                onboardingStatusDecode = OnboardingStatus.ADAPTER.decode(reader);
                                strDecode = str4;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                str = strDecode2;
                                str2 = strDecode3;
                                str3 = strDecode4;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str4;
                                strDecode2 = str;
                                strDecode3 = str2;
                                strDecode4 = str3;
                            }
                            break;
                        case 11:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 12:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 13:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 14:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 15:
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 16:
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 17:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 18:
                            strDecode17 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str4;
                            break;
                        case 19:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str4;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode2;
                            str2 = strDecode3;
                            str3 = strDecode4;
                            strDecode = str4;
                            strDecode2 = str;
                            strDecode3 = str2;
                            strDecode4 = str3;
                            break;
                    }
                    str4 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AcctCreateRequestBody value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.access_token);
                protoAdapter2.encodeWithTag(writer, 2, value.access_token_secret);
                protoAdapter2.encodeWithTag(writer, 3, value.account_name);
                protoAdapter2.encodeWithTag(writer, 4, value.email);
                protoAdapter2.encodeWithTag(writer, 5, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 6, value.follow);
                protoAdapter2.encodeWithTag(writer, 7, value.identity_token);
                protoAdapter2.encodeWithTag(writer, 8, value.name);
                protoAdapter2.encodeWithTag(writer, 9, value.nonce);
                OnboardingStatus.ADAPTER.encodeWithTag(writer, 10, value.onboarding_status);
                protoAdapter2.encodeWithTag(writer, 11, value.redirect);
                protoAdapter2.encodeWithTag(writer, 12, value.source);
                protoAdapter2.encodeWithTag(writer, 13, value.twitter_access_token);
                protoAdapter2.encodeWithTag(writer, 14, value.twitter_access_token_secret);
                protoAdapter2.encodeWithTag(writer, 15, value.username);
                protoAdapter2.encodeWithTag(writer, 16, value.default_email);
                protoAdapter2.encodeWithTag(writer, 17, value.email_availability);
                ProtoAdapter.BOOL.encodeWithTag(writer, 19, value.remember_me);
                protoAdapter2.encodeWithTag(writer, 18, value.password);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AcctCreateRequestBody value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(18, value.password) + ProtoAdapter.BOOL.encodedSizeWithTag(19, value.remember_me) + protoAdapter2.encodedSizeWithTag(17, value.email_availability) + protoAdapter2.encodedSizeWithTag(16, value.default_email) + protoAdapter2.encodedSizeWithTag(15, value.username) + protoAdapter2.encodedSizeWithTag(14, value.twitter_access_token_secret) + protoAdapter2.encodedSizeWithTag(13, value.twitter_access_token) + protoAdapter2.encodedSizeWithTag(12, value.source) + protoAdapter2.encodedSizeWithTag(11, value.redirect) + OnboardingStatus.ADAPTER.encodedSizeWithTag(10, value.onboarding_status) + protoAdapter2.encodedSizeWithTag(9, value.nonce) + protoAdapter2.encodedSizeWithTag(8, value.name) + protoAdapter2.encodedSizeWithTag(7, value.identity_token) + protoAdapter2.encodedSizeWithTag(6, value.follow) + protoAdapter2.encodedSizeWithTag(5, value.entry_point) + protoAdapter2.encodedSizeWithTag(4, value.email) + protoAdapter2.encodedSizeWithTag(3, value.account_name) + protoAdapter2.encodedSizeWithTag(2, value.access_token_secret) + protoAdapter2.encodedSizeWithTag(1, value.access_token) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AcctCreateRequestBody redact(AcctCreateRequestBody value) {
                value.getClass();
                return value.copy((524287 & 1) != 0 ? value.access_token : null, (524287 & 2) != 0 ? value.access_token_secret : null, (524287 & 4) != 0 ? value.account_name : null, (524287 & 8) != 0 ? value.email : null, (524287 & 16) != 0 ? value.entry_point : null, (524287 & 32) != 0 ? value.follow : null, (524287 & 64) != 0 ? value.identity_token : null, (524287 & 128) != 0 ? value.name : null, (524287 & 256) != 0 ? value.nonce : null, (524287 & 512) != 0 ? value.onboarding_status : null, (524287 & 1024) != 0 ? value.redirect : null, (524287 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.source : null, (524287 & 4096) != 0 ? value.twitter_access_token : null, (524287 & 8192) != 0 ? value.twitter_access_token_secret : null, (524287 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.username : null, (524287 & 32768) != 0 ? value.default_email : null, (524287 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.email_availability : null, (524287 & 131072) != 0 ? value.remember_me : null, (524287 & 262144) != 0 ? value.password : null, (524287 & 524288) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AcctCreateRequestBody value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 18, value.password);
                ProtoAdapter.BOOL.encodeWithTag(writer, 19, value.remember_me);
                protoAdapter2.encodeWithTag(writer, 17, value.email_availability);
                protoAdapter2.encodeWithTag(writer, 16, value.default_email);
                protoAdapter2.encodeWithTag(writer, 15, value.username);
                protoAdapter2.encodeWithTag(writer, 14, value.twitter_access_token_secret);
                protoAdapter2.encodeWithTag(writer, 13, value.twitter_access_token);
                protoAdapter2.encodeWithTag(writer, 12, value.source);
                protoAdapter2.encodeWithTag(writer, 11, value.redirect);
                OnboardingStatus.ADAPTER.encodeWithTag(writer, 10, value.onboarding_status);
                protoAdapter2.encodeWithTag(writer, 9, value.nonce);
                protoAdapter2.encodeWithTag(writer, 8, value.name);
                protoAdapter2.encodeWithTag(writer, 7, value.identity_token);
                protoAdapter2.encodeWithTag(writer, 6, value.follow);
                protoAdapter2.encodeWithTag(writer, 5, value.entry_point);
                protoAdapter2.encodeWithTag(writer, 4, value.email);
                protoAdapter2.encodeWithTag(writer, 3, value.account_name);
                protoAdapter2.encodeWithTag(writer, 2, value.access_token_secret);
                protoAdapter2.encodeWithTag(writer, 1, value.access_token);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AcctCreateRequestBody(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, OnboardingStatus onboardingStatus, String str10, String str11, String str12, String str13, String str14, String str15, String str16, Boolean bool, String str17, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : str6, (i & 64) != 0 ? null : str7, (i & 128) != 0 ? null : str8, (i & 256) != 0 ? null : str9, (i & 512) != 0 ? null : onboardingStatus, (i & 1024) != 0 ? null : str10, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str11, (i & 4096) != 0 ? null : str12, (i & 8192) != 0 ? null : str13, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str14, (i & 32768) != 0 ? null : str15, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str16, (i & 131072) != 0 ? null : bool, (i & 262144) != 0 ? null : str17, (i & 524288) != 0 ? h21.d : h21Var);
    }

    public final AcctCreateRequestBody copy(String access_token, String access_token_secret, String account_name, String email, String entry_point, String follow, String identity_token, String name, String nonce, OnboardingStatus onboarding_status, String redirect, String source, String twitter_access_token, String twitter_access_token_secret, String username, String default_email, String email_availability, Boolean remember_me, String password, h21 unknownFields) {
        unknownFields.getClass();
        return new AcctCreateRequestBody(access_token, access_token_secret, account_name, email, entry_point, follow, identity_token, name, nonce, onboarding_status, redirect, source, twitter_access_token, twitter_access_token_secret, username, default_email, email_availability, remember_me, password, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AcctCreateRequestBody)) {
            return false;
        }
        AcctCreateRequestBody acctCreateRequestBody = (AcctCreateRequestBody) other;
        return g76.L(unknownFields(), acctCreateRequestBody.unknownFields()) && g76.L(this.access_token, acctCreateRequestBody.access_token) && g76.L(this.access_token_secret, acctCreateRequestBody.access_token_secret) && g76.L(this.account_name, acctCreateRequestBody.account_name) && g76.L(this.email, acctCreateRequestBody.email) && g76.L(this.entry_point, acctCreateRequestBody.entry_point) && g76.L(this.follow, acctCreateRequestBody.follow) && g76.L(this.identity_token, acctCreateRequestBody.identity_token) && g76.L(this.name, acctCreateRequestBody.name) && g76.L(this.nonce, acctCreateRequestBody.nonce) && this.onboarding_status == acctCreateRequestBody.onboarding_status && g76.L(this.redirect, acctCreateRequestBody.redirect) && g76.L(this.source, acctCreateRequestBody.source) && g76.L(this.twitter_access_token, acctCreateRequestBody.twitter_access_token) && g76.L(this.twitter_access_token_secret, acctCreateRequestBody.twitter_access_token_secret) && g76.L(this.username, acctCreateRequestBody.username) && g76.L(this.default_email, acctCreateRequestBody.default_email) && g76.L(this.email_availability, acctCreateRequestBody.email_availability) && g76.L(this.remember_me, acctCreateRequestBody.remember_me) && g76.L(this.password, acctCreateRequestBody.password);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.access_token;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.access_token_secret;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.account_name;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.email;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.entry_point;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.follow;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.identity_token;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.name;
        int iHashCode9 = (iHashCode8 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.nonce;
        int iHashCode10 = (iHashCode9 + (str9 != null ? str9.hashCode() : 0)) * 37;
        OnboardingStatus onboardingStatus = this.onboarding_status;
        int iHashCode11 = (iHashCode10 + (onboardingStatus != null ? onboardingStatus.hashCode() : 0)) * 37;
        String str10 = this.redirect;
        int iHashCode12 = (iHashCode11 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.source;
        int iHashCode13 = (iHashCode12 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.twitter_access_token;
        int iHashCode14 = (iHashCode13 + (str12 != null ? str12.hashCode() : 0)) * 37;
        String str13 = this.twitter_access_token_secret;
        int iHashCode15 = (iHashCode14 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.username;
        int iHashCode16 = (iHashCode15 + (str14 != null ? str14.hashCode() : 0)) * 37;
        String str15 = this.default_email;
        int iHashCode17 = (iHashCode16 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.email_availability;
        int iHashCode18 = (iHashCode17 + (str16 != null ? str16.hashCode() : 0)) * 37;
        Boolean bool = this.remember_me;
        int i2 = (iHashCode18 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str17 = this.password;
        int iHashCode19 = i2 + (str17 != null ? str17.hashCode() : 0);
        this.hashCode = iHashCode19;
        return iHashCode19;
    }

    @Override // com.squareup.wire.Message
    public final n5 newBuilder() {
        n5 n5Var = new n5();
        n5Var.a = this.access_token;
        n5Var.b = this.access_token_secret;
        n5Var.c = this.account_name;
        n5Var.d = this.email;
        n5Var.e = this.entry_point;
        n5Var.f = this.follow;
        n5Var.g = this.identity_token;
        n5Var.h = this.name;
        n5Var.i = this.nonce;
        n5Var.j = this.onboarding_status;
        n5Var.k = this.redirect;
        n5Var.l = this.source;
        n5Var.m = this.twitter_access_token;
        n5Var.n = this.twitter_access_token_secret;
        n5Var.o = this.username;
        n5Var.p = this.default_email;
        n5Var.q = this.email_availability;
        n5Var.r = this.remember_me;
        n5Var.s = this.password;
        n5Var.addUnknownFields(unknownFields());
        return n5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.access_token;
        if (str != null) {
            lv8.D(str, "access_token=", arrayList);
        }
        String str2 = this.access_token_secret;
        if (str2 != null) {
            lv8.D(str2, "access_token_secret=", arrayList);
        }
        String str3 = this.account_name;
        if (str3 != null) {
            lv8.D(str3, "account_name=", arrayList);
        }
        String str4 = this.email;
        if (str4 != null) {
            lv8.D(str4, "email=", arrayList);
        }
        String str5 = this.entry_point;
        if (str5 != null) {
            lv8.D(str5, "entry_point=", arrayList);
        }
        String str6 = this.follow;
        if (str6 != null) {
            lv8.D(str6, "follow=", arrayList);
        }
        String str7 = this.identity_token;
        if (str7 != null) {
            lv8.D(str7, "identity_token=", arrayList);
        }
        String str8 = this.name;
        if (str8 != null) {
            lv8.D(str8, "name=", arrayList);
        }
        String str9 = this.nonce;
        if (str9 != null) {
            lv8.D(str9, "nonce=", arrayList);
        }
        OnboardingStatus onboardingStatus = this.onboarding_status;
        if (onboardingStatus != null) {
            arrayList.add("onboarding_status=" + onboardingStatus);
        }
        String str10 = this.redirect;
        if (str10 != null) {
            lv8.D(str10, "redirect=", arrayList);
        }
        String str11 = this.source;
        if (str11 != null) {
            lv8.D(str11, "source=", arrayList);
        }
        String str12 = this.twitter_access_token;
        if (str12 != null) {
            lv8.D(str12, "twitter_access_token=", arrayList);
        }
        String str13 = this.twitter_access_token_secret;
        if (str13 != null) {
            lv8.D(str13, "twitter_access_token_secret=", arrayList);
        }
        String str14 = this.username;
        if (str14 != null) {
            lv8.D(str14, "username=", arrayList);
        }
        String str15 = this.default_email;
        if (str15 != null) {
            lv8.D(str15, "default_email=", arrayList);
        }
        String str16 = this.email_availability;
        if (str16 != null) {
            lv8.D(str16, "email_availability=", arrayList);
        }
        Boolean bool = this.remember_me;
        if (bool != null) {
            lv8.A("remember_me=", bool, arrayList);
        }
        String str17 = this.password;
        if (str17 != null) {
            lv8.D(str17, "password=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "AcctCreateRequestBody{", "}", null, 56);
    }

    public AcctCreateRequestBody() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1048575, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AcctCreateRequestBody(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, OnboardingStatus onboardingStatus, String str10, String str11, String str12, String str13, String str14, String str15, String str16, Boolean bool, String str17, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.access_token = str;
        this.access_token_secret = str2;
        this.account_name = str3;
        this.email = str4;
        this.entry_point = str5;
        this.follow = str6;
        this.identity_token = str7;
        this.name = str8;
        this.nonce = str9;
        this.onboarding_status = onboardingStatus;
        this.redirect = str10;
        this.source = str11;
        this.twitter_access_token = str12;
        this.twitter_access_token_secret = str13;
        this.username = str14;
        this.default_email = str15;
        this.email_availability = str16;
        this.remember_me = bool;
        this.password = str17;
    }
}
