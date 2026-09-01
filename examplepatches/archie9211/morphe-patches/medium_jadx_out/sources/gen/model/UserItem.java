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
import defpackage.abe;
import defpackage.bbe;
import defpackage.bu1;
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
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\b\u0007\u0018\u0000 $2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002%Be\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJk\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001fR\u001c\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\n\u0010\u001f\u0012\u0004\b!\u0010\"R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010#¨\u0006&"}, d2 = {"Lgen/model/UserItem;", "Lcom/squareup/wire/AndroidMessage;", "Labe;", "", "user_id", "name", "username", "Lgen/model/ImageDisplay;", "image", "bio", "bioHTML", "Lgen/model/UserUserSocial;", "social", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Ljava/lang/String;Ljava/lang/String;Lgen/model/UserUserSocial;Lh21;)V", "newBuilder", "()Labe;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Ljava/lang/String;Ljava/lang/String;Lgen/model/UserUserSocial;Lh21;)Lgen/model/UserItem;", "Ljava/lang/String;", "Lgen/model/ImageDisplay;", "getBioHTML$annotations", "()V", "Lgen/model/UserUserSocial;", "Companion", "bbe", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserItem extends AndroidMessage<UserItem, abe> {
    public static final ProtoAdapter<UserItem> ADAPTER;
    public static final Parcelable.Creator<UserItem> CREATOR;
    public static final bbe Companion = new bbe();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String bio;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String bioHTML;

    @WireField(adapter = "gen.model.ImageDisplay#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageDisplay image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "gen.model.UserUserSocial#ADAPTER", schemaIndex = 6, tag = 7)
    public final UserUserSocial social;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String username;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserItem.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserItem> protoAdapter = new ProtoAdapter<UserItem>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UserItem$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserItem decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                ImageDisplay imageDisplayDecode = null;
                String strDecode4 = null;
                String strDecode5 = null;
                UserUserSocial userUserSocialDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UserItem(strDecode, strDecode2, strDecode3, imageDisplayDecode, strDecode4, strDecode5, userUserSocialDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            imageDisplayDecode = ImageDisplay.ADAPTER.decode(reader);
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            userUserSocialDecode = UserUserSocial.ADAPTER.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserItem value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 3, value.username);
                ImageDisplay.ADAPTER.encodeWithTag(writer, 4, value.image);
                protoAdapter2.encodeWithTag(writer, 5, value.bio);
                protoAdapter2.encodeWithTag(writer, 6, value.bioHTML);
                UserUserSocial.ADAPTER.encodeWithTag(writer, 7, value.social);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserItem value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return UserUserSocial.ADAPTER.encodedSizeWithTag(7, value.social) + protoAdapter2.encodedSizeWithTag(6, value.bioHTML) + protoAdapter2.encodedSizeWithTag(5, value.bio) + ImageDisplay.ADAPTER.encodedSizeWithTag(4, value.image) + protoAdapter2.encodedSizeWithTag(3, value.username) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.user_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserItem redact(UserItem value) {
                value.getClass();
                ImageDisplay imageDisplay = value.image;
                ImageDisplay imageDisplayRedact = imageDisplay != null ? ImageDisplay.ADAPTER.redact(imageDisplay) : null;
                UserUserSocial userUserSocial = value.social;
                return UserItem.copy$default(value, null, null, null, imageDisplayRedact, null, null, userUserSocial != null ? UserUserSocial.ADAPTER.redact(userUserSocial) : null, h21.d, 55, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserItem value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                UserUserSocial.ADAPTER.encodeWithTag(writer, 7, value.social);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.bioHTML);
                protoAdapter2.encodeWithTag(writer, 5, value.bio);
                ImageDisplay.ADAPTER.encodeWithTag(writer, 4, value.image);
                protoAdapter2.encodeWithTag(writer, 3, value.username);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserItem(String str, String str2, String str3, ImageDisplay imageDisplay, String str4, String str5, UserUserSocial userUserSocial, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : imageDisplay, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : userUserSocial, (i & 128) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserItem copy$default(UserItem userItem, String str, String str2, String str3, ImageDisplay imageDisplay, String str4, String str5, UserUserSocial userUserSocial, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userItem.user_id;
        }
        if ((i & 2) != 0) {
            str2 = userItem.name;
        }
        if ((i & 4) != 0) {
            str3 = userItem.username;
        }
        if ((i & 8) != 0) {
            imageDisplay = userItem.image;
        }
        if ((i & 16) != 0) {
            str4 = userItem.bio;
        }
        if ((i & 32) != 0) {
            str5 = userItem.bioHTML;
        }
        if ((i & 64) != 0) {
            userUserSocial = userItem.social;
        }
        if ((i & 128) != 0) {
            h21Var = userItem.unknownFields();
        }
        UserUserSocial userUserSocial2 = userUserSocial;
        h21 h21Var2 = h21Var;
        String str6 = str4;
        String str7 = str5;
        return userItem.copy(str, str2, str3, imageDisplay, str6, str7, userUserSocial2, h21Var2);
    }

    public final UserItem copy(String user_id, String name, String username, ImageDisplay image, String bio, String bioHTML, UserUserSocial social, h21 unknownFields) {
        unknownFields.getClass();
        return new UserItem(user_id, name, username, image, bio, bioHTML, social, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserItem)) {
            return false;
        }
        UserItem userItem = (UserItem) other;
        return g76.L(unknownFields(), userItem.unknownFields()) && g76.L(this.user_id, userItem.user_id) && g76.L(this.name, userItem.name) && g76.L(this.username, userItem.username) && g76.L(this.image, userItem.image) && g76.L(this.bio, userItem.bio) && g76.L(this.bioHTML, userItem.bioHTML) && g76.L(this.social, userItem.social);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.user_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.username;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageDisplay imageDisplay = this.image;
        int iHashCode5 = (iHashCode4 + (imageDisplay != null ? imageDisplay.hashCode() : 0)) * 37;
        String str4 = this.bio;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.bioHTML;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        UserUserSocial userUserSocial = this.social;
        int iHashCode8 = iHashCode7 + (userUserSocial != null ? userUserSocial.hashCode() : 0);
        this.hashCode = iHashCode8;
        return iHashCode8;
    }

    @Override // com.squareup.wire.Message
    public final abe newBuilder() {
        abe abeVar = new abe();
        abeVar.a = this.user_id;
        abeVar.b = this.name;
        abeVar.c = this.username;
        abeVar.d = this.image;
        abeVar.e = this.bio;
        abeVar.f = this.bioHTML;
        abeVar.g = this.social;
        abeVar.addUnknownFields(unknownFields());
        return abeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.user_id;
        if (str != null) {
            lv8.D(str, "user_id=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.username;
        if (str3 != null) {
            lv8.D(str3, "username=", arrayList);
        }
        ImageDisplay imageDisplay = this.image;
        if (imageDisplay != null) {
            arrayList.add("image=" + imageDisplay);
        }
        String str4 = this.bio;
        if (str4 != null) {
            lv8.D(str4, "bio=", arrayList);
        }
        String str5 = this.bioHTML;
        if (str5 != null) {
            lv8.D(str5, "bioHTML=", arrayList);
        }
        UserUserSocial userUserSocial = this.social;
        if (userUserSocial != null) {
            arrayList.add("social=" + userUserSocial);
        }
        return bu1.F0(arrayList, ", ", "UserItem{", "}", null, 56);
    }

    public static /* synthetic */ void getBioHTML$annotations() {
    }

    public UserItem() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserItem(String str, String str2, String str3, ImageDisplay imageDisplay, String str4, String str5, UserUserSocial userUserSocial, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.user_id = str;
        this.name = str2;
        this.username = str3;
        this.image = imageDisplay;
        this.bio = str4;
        this.bioHTML = str5;
        this.social = userUserSocial;
    }
}
