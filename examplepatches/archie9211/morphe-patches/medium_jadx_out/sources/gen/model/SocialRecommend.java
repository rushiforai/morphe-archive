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
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.qjc;
import defpackage.rjc;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u0012\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lgen/model/SocialRecommend;", "Lcom/squareup/wire/AndroidMessage;", "Lqjc;", "Lgen/model/User;", "user", "", "note", "Lh21;", "unknownFields", "<init>", "(Lgen/model/User;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lqjc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/User;Ljava/lang/String;Lh21;)Lgen/model/SocialRecommend;", "Lgen/model/User;", "Ljava/lang/String;", "getNote$annotations", "()V", "Companion", "rjc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SocialRecommend extends AndroidMessage<SocialRecommend, qjc> {
    public static final ProtoAdapter<SocialRecommend> ADAPTER;
    public static final Parcelable.Creator<SocialRecommend> CREATOR;
    public static final rjc Companion = new rjc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String note;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 0, tag = 1)
    public final User user;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SocialRecommend.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SocialRecommend> protoAdapter = new ProtoAdapter<SocialRecommend>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.SocialRecommend$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SocialRecommend decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                User userDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SocialRecommend(userDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        userDecode = User.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SocialRecommend value) {
                writer.getClass();
                value.getClass();
                User.ADAPTER.encodeWithTag(writer, 1, value.user);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.note);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SocialRecommend value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.note) + User.ADAPTER.encodedSizeWithTag(1, value.user) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SocialRecommend redact(SocialRecommend value) {
                value.getClass();
                User user = value.user;
                return SocialRecommend.copy$default(value, user != null ? User.ADAPTER.redact(user) : null, null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SocialRecommend value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.note);
                User.ADAPTER.encodeWithTag(writer, 1, value.user);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SocialRecommend(User user, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : user, (i & 2) != 0 ? null : str, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SocialRecommend copy$default(SocialRecommend socialRecommend, User user, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            user = socialRecommend.user;
        }
        if ((i & 2) != 0) {
            str = socialRecommend.note;
        }
        if ((i & 4) != 0) {
            h21Var = socialRecommend.unknownFields();
        }
        return socialRecommend.copy(user, str, h21Var);
    }

    public final SocialRecommend copy(User user, String note, h21 unknownFields) {
        unknownFields.getClass();
        return new SocialRecommend(user, note, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SocialRecommend)) {
            return false;
        }
        SocialRecommend socialRecommend = (SocialRecommend) other;
        return g76.L(unknownFields(), socialRecommend.unknownFields()) && g76.L(this.user, socialRecommend.user) && g76.L(this.note, socialRecommend.note);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        User user = this.user;
        int iHashCode2 = (iHashCode + (user != null ? user.hashCode() : 0)) * 37;
        String str = this.note;
        int iHashCode3 = iHashCode2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final qjc newBuilder() {
        qjc qjcVar = new qjc();
        qjcVar.a = this.user;
        qjcVar.b = this.note;
        qjcVar.addUnknownFields(unknownFields());
        return qjcVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        User user = this.user;
        if (user != null) {
            arrayList.add("user=" + user);
        }
        String str = this.note;
        if (str != null) {
            lv8.D(str, "note=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SocialRecommend{", "}", null, 56);
    }

    public SocialRecommend() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SocialRecommend(User user, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.user = user;
        this.note = str;
    }

    public static /* synthetic */ void getNote$annotations() {
    }
}
