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
import com.squareup.wire.internal.Internal;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.rne;
import defpackage.sne;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 $2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002%B\u0081\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\b2\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u008b\u0001\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u001f\u0010 R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010!R\u0014\u0010\u0005\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010!R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\"R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010#R\u0016\u0010\n\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010#R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010#R\u0016\u0010\f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010#R\u0016\u0010\r\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010#R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010#R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010#¨\u0006&"}, d2 = {"Lgen/model/UserUserSocial;", "Lcom/squareup/wire/AndroidMessage;", "Lrne;", "", "user_id", "target_user_id", "", "created_at", "", "is_following", "is_twitter_following", "is_facebook_following", "is_medium_following", "is_blocking", "is_muting", "is_super_following", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lrne;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)Lgen/model/UserUserSocial;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Boolean;", "Companion", "sne", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserUserSocial extends AndroidMessage<UserUserSocial, rne> {
    public static final ProtoAdapter<UserUserSocial> ADAPTER;
    public static final Parcelable.Creator<UserUserSocial> CREATOR;
    public static final sne Companion = new sne();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 4)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 9)
    public final Boolean is_blocking;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 5, tag = 7)
    public final Boolean is_facebook_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 5)
    public final Boolean is_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 8)
    public final Boolean is_medium_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 10)
    public final Boolean is_muting;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 9, tag = 11)
    public final Boolean is_super_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 6)
    public final Boolean is_twitter_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final String target_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserUserSocial.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserUserSocial> protoAdapter = new ProtoAdapter<UserUserSocial>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UserUserSocial$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserUserSocial decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                Long lDecode = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                Boolean boolDecode4 = null;
                Boolean boolDecode5 = null;
                Boolean boolDecode6 = null;
                Boolean boolDecode7 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                        String str = strDecode;
                        if (str == null) {
                            Internal.missingRequiredFields(strDecode, "user_id");
                            throw null;
                        }
                        String str2 = strDecode2;
                        if (str2 != null) {
                            return new UserUserSocial(str, str2, lDecode, boolDecode, boolDecode2, boolDecode3, boolDecode4, boolDecode5, boolDecode6, boolDecode7, h21VarEndMessageAndGetUnknownFields);
                        }
                        Internal.missingRequiredFields(strDecode2, "target_user_id");
                        throw null;
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                        case 4:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 5:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 6:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 7:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 8:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 9:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 10:
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 11:
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserUserSocial value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
                protoAdapter2.encodeWithTag(writer, 2, value.target_user_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 4, value.created_at);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 5, value.is_following);
                protoAdapter3.encodeWithTag(writer, 6, value.is_twitter_following);
                protoAdapter3.encodeWithTag(writer, 7, value.is_facebook_following);
                protoAdapter3.encodeWithTag(writer, 8, value.is_medium_following);
                protoAdapter3.encodeWithTag(writer, 9, value.is_blocking);
                protoAdapter3.encodeWithTag(writer, 10, value.is_muting);
                protoAdapter3.encodeWithTag(writer, 11, value.is_super_following);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserUserSocial value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = ProtoAdapter.INT64.encodedSizeWithTag(4, value.created_at) + protoAdapter2.encodedSizeWithTag(2, value.target_user_id) + protoAdapter2.encodedSizeWithTag(1, value.user_id) + iE;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(11, value.is_super_following) + protoAdapter3.encodedSizeWithTag(10, value.is_muting) + protoAdapter3.encodedSizeWithTag(9, value.is_blocking) + protoAdapter3.encodedSizeWithTag(8, value.is_medium_following) + protoAdapter3.encodedSizeWithTag(7, value.is_facebook_following) + protoAdapter3.encodedSizeWithTag(6, value.is_twitter_following) + protoAdapter3.encodedSizeWithTag(5, value.is_following) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserUserSocial redact(UserUserSocial value) {
                value.getClass();
                return UserUserSocial.copy$default(value, null, null, null, null, null, null, null, null, null, null, h21.d, 1023, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserUserSocial value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 11, value.is_super_following);
                protoAdapter2.encodeWithTag(writer, 10, value.is_muting);
                protoAdapter2.encodeWithTag(writer, 9, value.is_blocking);
                protoAdapter2.encodeWithTag(writer, 8, value.is_medium_following);
                protoAdapter2.encodeWithTag(writer, 7, value.is_facebook_following);
                protoAdapter2.encodeWithTag(writer, 6, value.is_twitter_following);
                protoAdapter2.encodeWithTag(writer, 5, value.is_following);
                ProtoAdapter.INT64.encodeWithTag(writer, 4, value.created_at);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 2, value.target_user_id);
                protoAdapter3.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserUserSocial(String str, String str2, Long l, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, h21 h21Var, int i, gy2 gy2Var) {
        this(str, str2, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : bool, (i & 16) != 0 ? null : bool2, (i & 32) != 0 ? null : bool3, (i & 64) != 0 ? null : bool4, (i & 128) != 0 ? null : bool5, (i & 256) != 0 ? null : bool6, (i & 512) != 0 ? null : bool7, (i & 1024) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserUserSocial copy$default(UserUserSocial userUserSocial, String str, String str2, Long l, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userUserSocial.user_id;
        }
        if ((i & 2) != 0) {
            str2 = userUserSocial.target_user_id;
        }
        if ((i & 4) != 0) {
            l = userUserSocial.created_at;
        }
        if ((i & 8) != 0) {
            bool = userUserSocial.is_following;
        }
        if ((i & 16) != 0) {
            bool2 = userUserSocial.is_twitter_following;
        }
        if ((i & 32) != 0) {
            bool3 = userUserSocial.is_facebook_following;
        }
        if ((i & 64) != 0) {
            bool4 = userUserSocial.is_medium_following;
        }
        if ((i & 128) != 0) {
            bool5 = userUserSocial.is_blocking;
        }
        if ((i & 256) != 0) {
            bool6 = userUserSocial.is_muting;
        }
        if ((i & 512) != 0) {
            bool7 = userUserSocial.is_super_following;
        }
        if ((i & 1024) != 0) {
            h21Var = userUserSocial.unknownFields();
        }
        Boolean bool8 = bool7;
        h21 h21Var2 = h21Var;
        Boolean bool9 = bool5;
        Boolean bool10 = bool6;
        Boolean bool11 = bool3;
        Boolean bool12 = bool4;
        Boolean bool13 = bool2;
        Long l2 = l;
        return userUserSocial.copy(str, str2, l2, bool, bool13, bool11, bool12, bool9, bool10, bool8, h21Var2);
    }

    public final UserUserSocial copy(String user_id, String target_user_id, Long created_at, Boolean is_following, Boolean is_twitter_following, Boolean is_facebook_following, Boolean is_medium_following, Boolean is_blocking, Boolean is_muting, Boolean is_super_following, h21 unknownFields) {
        user_id.getClass();
        target_user_id.getClass();
        unknownFields.getClass();
        return new UserUserSocial(user_id, target_user_id, created_at, is_following, is_twitter_following, is_facebook_following, is_medium_following, is_blocking, is_muting, is_super_following, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserUserSocial)) {
            return false;
        }
        UserUserSocial userUserSocial = (UserUserSocial) other;
        return g76.L(unknownFields(), userUserSocial.unknownFields()) && g76.L(this.user_id, userUserSocial.user_id) && g76.L(this.target_user_id, userUserSocial.target_user_id) && g76.L(this.created_at, userUserSocial.created_at) && g76.L(this.is_following, userUserSocial.is_following) && g76.L(this.is_twitter_following, userUserSocial.is_twitter_following) && g76.L(this.is_facebook_following, userUserSocial.is_facebook_following) && g76.L(this.is_medium_following, userUserSocial.is_medium_following) && g76.L(this.is_blocking, userUserSocial.is_blocking) && g76.L(this.is_muting, userUserSocial.is_muting) && g76.L(this.is_super_following, userUserSocial.is_super_following);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iO = wgd.o(wgd.o(unknownFields().hashCode() * 37, 37, this.user_id), 37, this.target_user_id);
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i3 = (iO + i) * 37;
        Boolean bool = this.is_following;
        int i4 = (i3 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.is_twitter_following;
        int i5 = (i4 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.is_facebook_following;
        int i6 = (i5 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool4 = this.is_medium_following;
        int i7 = (i6 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool5 = this.is_blocking;
        int i8 = (i7 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool6 = this.is_muting;
        int i9 = (i8 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool7 = this.is_super_following;
        int i10 = i9 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i10;
        return i10;
    }

    @Override // com.squareup.wire.Message
    public final rne newBuilder() {
        rne rneVar = new rne();
        rneVar.a = this.user_id;
        rneVar.b = this.target_user_id;
        rneVar.c = this.created_at;
        rneVar.d = this.is_following;
        rneVar.e = this.is_twitter_following;
        rneVar.f = this.is_facebook_following;
        rneVar.g = this.is_medium_following;
        rneVar.h = this.is_blocking;
        rneVar.i = this.is_muting;
        rneVar.j = this.is_super_following;
        rneVar.addUnknownFields(unknownFields());
        return rneVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.user_id, "user_id=", arrayList);
        lv8.D(this.target_user_id, "target_user_id=", arrayList);
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Boolean bool = this.is_following;
        if (bool != null) {
            lv8.A("is_following=", bool, arrayList);
        }
        Boolean bool2 = this.is_twitter_following;
        if (bool2 != null) {
            lv8.A("is_twitter_following=", bool2, arrayList);
        }
        Boolean bool3 = this.is_facebook_following;
        if (bool3 != null) {
            lv8.A("is_facebook_following=", bool3, arrayList);
        }
        Boolean bool4 = this.is_medium_following;
        if (bool4 != null) {
            lv8.A("is_medium_following=", bool4, arrayList);
        }
        Boolean bool5 = this.is_blocking;
        if (bool5 != null) {
            lv8.A("is_blocking=", bool5, arrayList);
        }
        Boolean bool6 = this.is_muting;
        if (bool6 != null) {
            lv8.A("is_muting=", bool6, arrayList);
        }
        Boolean bool7 = this.is_super_following;
        if (bool7 != null) {
            lv8.A("is_super_following=", bool7, arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserUserSocial{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserUserSocial(String str, String str2, Long l, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        h21Var.getClass();
        this.user_id = str;
        this.target_user_id = str2;
        this.created_at = l;
        this.is_following = bool;
        this.is_twitter_following = bool2;
        this.is_facebook_following = bool3;
        this.is_medium_following = bool4;
        this.is_blocking = bool5;
        this.is_muting = bool6;
        this.is_super_following = bool7;
    }
}
