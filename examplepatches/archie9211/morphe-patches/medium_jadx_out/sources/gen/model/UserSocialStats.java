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
import defpackage.qme;
import defpackage.rme;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB1\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J9\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lgen/model/UserSocialStats;", "Lcom/squareup/wire/AndroidMessage;", "Lqme;", "", "user_id", "", "users_followed_count", "users_followed_by_count", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lqme;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lh21;)Lgen/model/UserSocialStats;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "rme", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserSocialStats extends AndroidMessage<UserSocialStats, qme> {
    public static final ProtoAdapter<UserSocialStats> ADAPTER;
    public static final Parcelable.Creator<UserSocialStats> CREATOR;
    public static final rme Companion = new rme();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final String user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long users_followed_by_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 1, tag = 2)
    public final Long users_followed_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserSocialStats.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserSocialStats> protoAdapter = new ProtoAdapter<UserSocialStats>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UserSocialStats$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserSocialStats decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        break;
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        lDecode2 = ProtoAdapter.INT64.decode(reader);
                    }
                }
                h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                String str = strDecode;
                if (str != null) {
                    return new UserSocialStats(str, lDecode, lDecode2, h21VarEndMessageAndGetUnknownFields);
                }
                Internal.missingRequiredFields(strDecode, "user_id");
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserSocialStats value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.user_id);
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 2, value.users_followed_count);
                protoAdapter2.encodeWithTag(writer, 3, value.users_followed_by_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserSocialStats value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.STRING.encodedSizeWithTag(1, value.user_id) + value.unknownFields().e();
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                return protoAdapter2.encodedSizeWithTag(3, value.users_followed_by_count) + protoAdapter2.encodedSizeWithTag(2, value.users_followed_count) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserSocialStats redact(UserSocialStats value) {
                value.getClass();
                return UserSocialStats.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserSocialStats value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 3, value.users_followed_by_count);
                protoAdapter2.encodeWithTag(writer, 2, value.users_followed_count);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserSocialStats(String str, Long l, Long l2, h21 h21Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? null : l, (i & 4) != 0 ? null : l2, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserSocialStats copy$default(UserSocialStats userSocialStats, String str, Long l, Long l2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userSocialStats.user_id;
        }
        if ((i & 2) != 0) {
            l = userSocialStats.users_followed_count;
        }
        if ((i & 4) != 0) {
            l2 = userSocialStats.users_followed_by_count;
        }
        if ((i & 8) != 0) {
            h21Var = userSocialStats.unknownFields();
        }
        return userSocialStats.copy(str, l, l2, h21Var);
    }

    public final UserSocialStats copy(String user_id, Long users_followed_count, Long users_followed_by_count, h21 unknownFields) {
        user_id.getClass();
        unknownFields.getClass();
        return new UserSocialStats(user_id, users_followed_count, users_followed_by_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserSocialStats)) {
            return false;
        }
        UserSocialStats userSocialStats = (UserSocialStats) other;
        return g76.L(unknownFields(), userSocialStats.unknownFields()) && g76.L(this.user_id, userSocialStats.user_id) && g76.L(this.users_followed_count, userSocialStats.users_followed_count) && g76.L(this.users_followed_by_count, userSocialStats.users_followed_by_count);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iO = wgd.o(unknownFields().hashCode() * 37, 37, this.user_id);
        Long l = this.users_followed_count;
        int i3 = 0;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iO + i) * 37;
        Long l2 = this.users_followed_by_count;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i3 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        }
        int i5 = i4 + i3;
        this.hashCode = i5;
        return i5;
    }

    @Override // com.squareup.wire.Message
    public final qme newBuilder() {
        qme qmeVar = new qme();
        qmeVar.a = this.user_id;
        qmeVar.b = this.users_followed_count;
        qmeVar.c = this.users_followed_by_count;
        qmeVar.addUnknownFields(unknownFields());
        return qmeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.user_id, "user_id=", arrayList);
        Long l = this.users_followed_count;
        if (l != null) {
            y30.A("users_followed_count=", l, arrayList);
        }
        Long l2 = this.users_followed_by_count;
        if (l2 != null) {
            y30.A("users_followed_by_count=", l2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserSocialStats{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserSocialStats(String str, Long l, Long l2, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.user_id = str;
        this.users_followed_count = l;
        this.users_followed_by_count = l2;
    }
}
