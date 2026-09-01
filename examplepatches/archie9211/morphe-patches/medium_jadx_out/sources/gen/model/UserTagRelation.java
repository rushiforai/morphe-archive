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
import defpackage.ane;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.zme;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0010\u001a\u00020\u00062\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J;\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/UserTagRelation;", "Lcom/squareup/wire/AndroidMessage;", "Lzme;", "", "user_id", "tag_slug", "", "is_following", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lzme;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lh21;)Lgen/model/UserTagRelation;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "ane", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserTagRelation extends AndroidMessage<UserTagRelation, zme> {
    public static final ProtoAdapter<UserTagRelation> ADAPTER;
    public static final Parcelable.Creator<UserTagRelation> CREATOR;
    public static final ane Companion = new ane();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean is_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String tag_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserTagRelation.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserTagRelation> protoAdapter = new ProtoAdapter<UserTagRelation>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UserTagRelation$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserTagRelation decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UserTagRelation(strDecode, strDecode2, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserTagRelation value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
                protoAdapter2.encodeWithTag(writer, 2, value.tag_slug);
                ProtoAdapter.BOOL.encodeWithTag(writer, 3, value.is_following);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserTagRelation value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(3, value.is_following) + protoAdapter2.encodedSizeWithTag(2, value.tag_slug) + protoAdapter2.encodedSizeWithTag(1, value.user_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserTagRelation redact(UserTagRelation value) {
                value.getClass();
                return UserTagRelation.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserTagRelation value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 3, value.is_following);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserTagRelation(String str, String str2, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : bool, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserTagRelation copy$default(UserTagRelation userTagRelation, String str, String str2, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userTagRelation.user_id;
        }
        if ((i & 2) != 0) {
            str2 = userTagRelation.tag_slug;
        }
        if ((i & 4) != 0) {
            bool = userTagRelation.is_following;
        }
        if ((i & 8) != 0) {
            h21Var = userTagRelation.unknownFields();
        }
        return userTagRelation.copy(str, str2, bool, h21Var);
    }

    public final UserTagRelation copy(String user_id, String tag_slug, Boolean is_following, h21 unknownFields) {
        unknownFields.getClass();
        return new UserTagRelation(user_id, tag_slug, is_following, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserTagRelation)) {
            return false;
        }
        UserTagRelation userTagRelation = (UserTagRelation) other;
        return g76.L(unknownFields(), userTagRelation.unknownFields()) && g76.L(this.user_id, userTagRelation.user_id) && g76.L(this.tag_slug, userTagRelation.tag_slug) && g76.L(this.is_following, userTagRelation.is_following);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.user_id;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.tag_slug;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Boolean bool = this.is_following;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode3 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final zme newBuilder() {
        zme zmeVar = new zme();
        zmeVar.a = this.user_id;
        zmeVar.b = this.tag_slug;
        zmeVar.c = this.is_following;
        zmeVar.addUnknownFields(unknownFields());
        return zmeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.user_id;
        if (str != null) {
            lv8.D(str, "user_id=", arrayList);
        }
        String str2 = this.tag_slug;
        if (str2 != null) {
            lv8.D(str2, "tag_slug=", arrayList);
        }
        Boolean bool = this.is_following;
        if (bool != null) {
            lv8.A("is_following=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserTagRelation{", "}", null, 56);
    }

    public UserTagRelation() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserTagRelation(String str, String str2, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.user_id = str;
        this.tag_slug = str2;
        this.is_following = bool;
    }
}
