package gen.model;

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
import defpackage.ks1;
import defpackage.ls1;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.z73;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\n\u0018\u0000 ,2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002-Bõ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001f\u001a\u00020\u00032\b\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0096\u0002¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010\"\u001a\u00020!H\u0016¢\u0006\u0004\b\"\u0010#J\u000f\u0010%\u001a\u00020$H\u0016¢\u0006\u0004\b%\u0010&Jû\u0001\u0010'\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b'\u0010(R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010)R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010)R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010)R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010)R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010)R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010)R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010)R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010)R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010)R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010)R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010)R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010)R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010)R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010)R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010)R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010)R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010)R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u0010)\u0012\u0004\b*\u0010+R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010)¨\u0006."}, d2 = {"Lgen/model/CollectionPermissions;", "Lcom/squareup/wire/AndroidMessage;", "Lks1;", "", "can_publish", "can_publish_all", "can_republish", "can_remove", "can_manage_all", "can_submit", "can_edit_posts", "can_add_writers", "can_view_stats", "can_send_newsletter", "can_view_locked_posts", "can_view_cloaked", "can_edit_own_posts", "can_be_assigned_author", "can_enroll_in_hightower", "can_lock_posts_for_medium_members", "can_lock_own_posts_for_medium_members", "can_view_newsletter_v2_stats", "can_create_newsletter_v3", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lks1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)Lgen/model/CollectionPermissions;", "Ljava/lang/Boolean;", "getCan_view_newsletter_v2_stats$annotations", "()V", "Companion", "ls1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionPermissions extends AndroidMessage<CollectionPermissions, ks1> {
    public static final ProtoAdapter<CollectionPermissions> ADAPTER;
    public static final Parcelable.Creator<CollectionPermissions> CREATOR;
    public static final ls1 Companion = new ls1();
    public static final boolean DEFAULT_CAN_EDIT_OWN_POSTS = true;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 8)
    public final Boolean can_add_writers;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 13, tag = 14)
    public final Boolean can_be_assigned_author;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 18, tag = 19)
    public final Boolean can_create_newsletter_v3;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 12, tag = 13)
    public final Boolean can_edit_own_posts;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 7)
    public final Boolean can_edit_posts;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 14, tag = 15)
    public final Boolean can_enroll_in_hightower;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 16, tag = 17)
    public final Boolean can_lock_own_posts_for_medium_members;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 15, tag = 16)
    public final Boolean can_lock_posts_for_medium_members;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean can_manage_all;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 0, tag = 1)
    public final Boolean can_publish;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean can_publish_all;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 4)
    public final Boolean can_remove;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean can_republish;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 9, tag = 10)
    public final Boolean can_send_newsletter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 5, tag = 6)
    public final Boolean can_submit;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 11, tag = 12)
    public final Boolean can_view_cloaked;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 10, tag = 11)
    public final Boolean can_view_locked_posts;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 17, tag = 18)
    public final Boolean can_view_newsletter_v2_stats;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean can_view_stats;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionPermissions.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionPermissions> protoAdapter = new ProtoAdapter<CollectionPermissions>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionPermissions$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x002e. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPermissions decode(ProtoReader reader) {
                Boolean boolDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Boolean bool = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                Boolean boolDecode4 = null;
                Boolean boolDecode5 = null;
                Boolean boolDecode6 = null;
                Boolean boolDecode7 = null;
                Boolean boolDecode8 = null;
                Boolean boolDecode9 = null;
                Boolean boolDecode10 = null;
                Boolean boolDecode11 = null;
                Boolean boolDecode12 = null;
                Boolean boolDecode13 = null;
                Boolean boolDecode14 = null;
                Boolean boolDecode15 = null;
                Boolean boolDecode16 = null;
                Boolean boolDecode17 = null;
                Boolean boolDecode18 = null;
                Boolean boolDecode19 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    Boolean bool2 = boolDecode2;
                    if (iNextTag == -1) {
                        return new CollectionPermissions(bool, bool2, boolDecode3, boolDecode4, boolDecode5, boolDecode6, boolDecode7, boolDecode8, boolDecode9, boolDecode10, boolDecode11, boolDecode12, boolDecode13, boolDecode14, boolDecode15, boolDecode16, boolDecode17, boolDecode18, boolDecode19, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            break;
                        case 2:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            break;
                        case 3:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 4:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 5:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 6:
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 7:
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 8:
                            boolDecode8 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 9:
                            boolDecode9 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 10:
                            boolDecode10 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 11:
                            boolDecode11 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 12:
                            boolDecode12 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 13:
                            boolDecode13 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 14:
                            boolDecode14 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 15:
                            boolDecode15 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 16:
                            boolDecode16 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 17:
                            boolDecode17 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 18:
                            boolDecode18 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        case 19:
                            boolDecode19 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode2 = bool2;
                            boolDecode = bool;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            boolDecode = bool;
                            boolDecode2 = bool2;
                            break;
                    }
                    bool = boolDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionPermissions value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 1, value.can_publish);
                protoAdapter2.encodeWithTag(writer, 2, value.can_publish_all);
                protoAdapter2.encodeWithTag(writer, 3, value.can_republish);
                protoAdapter2.encodeWithTag(writer, 4, value.can_remove);
                protoAdapter2.encodeWithTag(writer, 5, value.can_manage_all);
                protoAdapter2.encodeWithTag(writer, 6, value.can_submit);
                protoAdapter2.encodeWithTag(writer, 7, value.can_edit_posts);
                protoAdapter2.encodeWithTag(writer, 8, value.can_add_writers);
                protoAdapter2.encodeWithTag(writer, 9, value.can_view_stats);
                protoAdapter2.encodeWithTag(writer, 10, value.can_send_newsletter);
                protoAdapter2.encodeWithTag(writer, 11, value.can_view_locked_posts);
                protoAdapter2.encodeWithTag(writer, 12, value.can_view_cloaked);
                protoAdapter2.encodeWithTag(writer, 13, value.can_edit_own_posts);
                protoAdapter2.encodeWithTag(writer, 14, value.can_be_assigned_author);
                protoAdapter2.encodeWithTag(writer, 15, value.can_enroll_in_hightower);
                protoAdapter2.encodeWithTag(writer, 16, value.can_lock_posts_for_medium_members);
                protoAdapter2.encodeWithTag(writer, 17, value.can_lock_own_posts_for_medium_members);
                protoAdapter2.encodeWithTag(writer, 18, value.can_view_newsletter_v2_stats);
                protoAdapter2.encodeWithTag(writer, 19, value.can_create_newsletter_v3);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionPermissions value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(19, value.can_create_newsletter_v3) + protoAdapter2.encodedSizeWithTag(18, value.can_view_newsletter_v2_stats) + protoAdapter2.encodedSizeWithTag(17, value.can_lock_own_posts_for_medium_members) + protoAdapter2.encodedSizeWithTag(16, value.can_lock_posts_for_medium_members) + protoAdapter2.encodedSizeWithTag(15, value.can_enroll_in_hightower) + protoAdapter2.encodedSizeWithTag(14, value.can_be_assigned_author) + protoAdapter2.encodedSizeWithTag(13, value.can_edit_own_posts) + protoAdapter2.encodedSizeWithTag(12, value.can_view_cloaked) + protoAdapter2.encodedSizeWithTag(11, value.can_view_locked_posts) + protoAdapter2.encodedSizeWithTag(10, value.can_send_newsletter) + protoAdapter2.encodedSizeWithTag(9, value.can_view_stats) + protoAdapter2.encodedSizeWithTag(8, value.can_add_writers) + protoAdapter2.encodedSizeWithTag(7, value.can_edit_posts) + protoAdapter2.encodedSizeWithTag(6, value.can_submit) + protoAdapter2.encodedSizeWithTag(5, value.can_manage_all) + protoAdapter2.encodedSizeWithTag(4, value.can_remove) + protoAdapter2.encodedSizeWithTag(3, value.can_republish) + protoAdapter2.encodedSizeWithTag(2, value.can_publish_all) + protoAdapter2.encodedSizeWithTag(1, value.can_publish) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPermissions redact(CollectionPermissions value) {
                value.getClass();
                return value.copy((524287 & 1) != 0 ? value.can_publish : null, (524287 & 2) != 0 ? value.can_publish_all : null, (524287 & 4) != 0 ? value.can_republish : null, (524287 & 8) != 0 ? value.can_remove : null, (524287 & 16) != 0 ? value.can_manage_all : null, (524287 & 32) != 0 ? value.can_submit : null, (524287 & 64) != 0 ? value.can_edit_posts : null, (524287 & 128) != 0 ? value.can_add_writers : null, (524287 & 256) != 0 ? value.can_view_stats : null, (524287 & 512) != 0 ? value.can_send_newsletter : null, (524287 & 1024) != 0 ? value.can_view_locked_posts : null, (524287 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.can_view_cloaked : null, (524287 & 4096) != 0 ? value.can_edit_own_posts : null, (524287 & 8192) != 0 ? value.can_be_assigned_author : null, (524287 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.can_enroll_in_hightower : null, (524287 & 32768) != 0 ? value.can_lock_posts_for_medium_members : null, (524287 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.can_lock_own_posts_for_medium_members : null, (524287 & 131072) != 0 ? value.can_view_newsletter_v2_stats : null, (524287 & 262144) != 0 ? value.can_create_newsletter_v3 : null, (524287 & 524288) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionPermissions value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 19, value.can_create_newsletter_v3);
                protoAdapter2.encodeWithTag(writer, 18, value.can_view_newsletter_v2_stats);
                protoAdapter2.encodeWithTag(writer, 17, value.can_lock_own_posts_for_medium_members);
                protoAdapter2.encodeWithTag(writer, 16, value.can_lock_posts_for_medium_members);
                protoAdapter2.encodeWithTag(writer, 15, value.can_enroll_in_hightower);
                protoAdapter2.encodeWithTag(writer, 14, value.can_be_assigned_author);
                protoAdapter2.encodeWithTag(writer, 13, value.can_edit_own_posts);
                protoAdapter2.encodeWithTag(writer, 12, value.can_view_cloaked);
                protoAdapter2.encodeWithTag(writer, 11, value.can_view_locked_posts);
                protoAdapter2.encodeWithTag(writer, 10, value.can_send_newsletter);
                protoAdapter2.encodeWithTag(writer, 9, value.can_view_stats);
                protoAdapter2.encodeWithTag(writer, 8, value.can_add_writers);
                protoAdapter2.encodeWithTag(writer, 7, value.can_edit_posts);
                protoAdapter2.encodeWithTag(writer, 6, value.can_submit);
                protoAdapter2.encodeWithTag(writer, 5, value.can_manage_all);
                protoAdapter2.encodeWithTag(writer, 4, value.can_remove);
                protoAdapter2.encodeWithTag(writer, 3, value.can_republish);
                protoAdapter2.encodeWithTag(writer, 2, value.can_publish_all);
                protoAdapter2.encodeWithTag(writer, 1, value.can_publish);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionPermissions(Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, Boolean bool8, Boolean bool9, Boolean bool10, Boolean bool11, Boolean bool12, Boolean bool13, Boolean bool14, Boolean bool15, Boolean bool16, Boolean bool17, Boolean bool18, Boolean bool19, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? null : bool2, (i & 4) != 0 ? null : bool3, (i & 8) != 0 ? null : bool4, (i & 16) != 0 ? null : bool5, (i & 32) != 0 ? null : bool6, (i & 64) != 0 ? null : bool7, (i & 128) != 0 ? null : bool8, (i & 256) != 0 ? null : bool9, (i & 512) != 0 ? null : bool10, (i & 1024) != 0 ? null : bool11, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool12, (i & 4096) != 0 ? null : bool13, (i & 8192) != 0 ? null : bool14, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : bool15, (i & 32768) != 0 ? null : bool16, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : bool17, (i & 131072) != 0 ? null : bool18, (i & 262144) != 0 ? null : bool19, (i & 524288) != 0 ? h21.d : h21Var);
    }

    public final CollectionPermissions copy(Boolean can_publish, Boolean can_publish_all, Boolean can_republish, Boolean can_remove, Boolean can_manage_all, Boolean can_submit, Boolean can_edit_posts, Boolean can_add_writers, Boolean can_view_stats, Boolean can_send_newsletter, Boolean can_view_locked_posts, Boolean can_view_cloaked, Boolean can_edit_own_posts, Boolean can_be_assigned_author, Boolean can_enroll_in_hightower, Boolean can_lock_posts_for_medium_members, Boolean can_lock_own_posts_for_medium_members, Boolean can_view_newsletter_v2_stats, Boolean can_create_newsletter_v3, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionPermissions(can_publish, can_publish_all, can_republish, can_remove, can_manage_all, can_submit, can_edit_posts, can_add_writers, can_view_stats, can_send_newsletter, can_view_locked_posts, can_view_cloaked, can_edit_own_posts, can_be_assigned_author, can_enroll_in_hightower, can_lock_posts_for_medium_members, can_lock_own_posts_for_medium_members, can_view_newsletter_v2_stats, can_create_newsletter_v3, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionPermissions)) {
            return false;
        }
        CollectionPermissions collectionPermissions = (CollectionPermissions) other;
        return g76.L(unknownFields(), collectionPermissions.unknownFields()) && g76.L(this.can_publish, collectionPermissions.can_publish) && g76.L(this.can_publish_all, collectionPermissions.can_publish_all) && g76.L(this.can_republish, collectionPermissions.can_republish) && g76.L(this.can_remove, collectionPermissions.can_remove) && g76.L(this.can_manage_all, collectionPermissions.can_manage_all) && g76.L(this.can_submit, collectionPermissions.can_submit) && g76.L(this.can_edit_posts, collectionPermissions.can_edit_posts) && g76.L(this.can_add_writers, collectionPermissions.can_add_writers) && g76.L(this.can_view_stats, collectionPermissions.can_view_stats) && g76.L(this.can_send_newsletter, collectionPermissions.can_send_newsletter) && g76.L(this.can_view_locked_posts, collectionPermissions.can_view_locked_posts) && g76.L(this.can_view_cloaked, collectionPermissions.can_view_cloaked) && g76.L(this.can_edit_own_posts, collectionPermissions.can_edit_own_posts) && g76.L(this.can_be_assigned_author, collectionPermissions.can_be_assigned_author) && g76.L(this.can_enroll_in_hightower, collectionPermissions.can_enroll_in_hightower) && g76.L(this.can_lock_posts_for_medium_members, collectionPermissions.can_lock_posts_for_medium_members) && g76.L(this.can_lock_own_posts_for_medium_members, collectionPermissions.can_lock_own_posts_for_medium_members) && g76.L(this.can_view_newsletter_v2_stats, collectionPermissions.can_view_newsletter_v2_stats) && g76.L(this.can_create_newsletter_v3, collectionPermissions.can_create_newsletter_v3);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Boolean bool = this.can_publish;
        int i2 = (iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.can_publish_all;
        int i3 = (i2 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.can_republish;
        int i4 = (i3 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool4 = this.can_remove;
        int i5 = (i4 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool5 = this.can_manage_all;
        int i6 = (i5 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool6 = this.can_submit;
        int i7 = (i6 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool7 = this.can_edit_posts;
        int i8 = (i7 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool8 = this.can_add_writers;
        int i9 = (i8 + (bool8 != null ? bool8.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool9 = this.can_view_stats;
        int i10 = (i9 + (bool9 != null ? bool9.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool10 = this.can_send_newsletter;
        int i11 = (i10 + (bool10 != null ? bool10.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool11 = this.can_view_locked_posts;
        int i12 = (i11 + (bool11 != null ? bool11.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool12 = this.can_view_cloaked;
        int i13 = (i12 + (bool12 != null ? bool12.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool13 = this.can_edit_own_posts;
        int i14 = (i13 + (bool13 != null ? bool13.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool14 = this.can_be_assigned_author;
        int i15 = (i14 + (bool14 != null ? bool14.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool15 = this.can_enroll_in_hightower;
        int i16 = (i15 + (bool15 != null ? bool15.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool16 = this.can_lock_posts_for_medium_members;
        int i17 = (i16 + (bool16 != null ? bool16.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool17 = this.can_lock_own_posts_for_medium_members;
        int i18 = (i17 + (bool17 != null ? bool17.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool18 = this.can_view_newsletter_v2_stats;
        int i19 = (i18 + (bool18 != null ? bool18.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool19 = this.can_create_newsletter_v3;
        int i20 = i19 + (bool19 != null ? bool19.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i20;
        return i20;
    }

    @Override // com.squareup.wire.Message
    public final ks1 newBuilder() {
        ks1 ks1Var = new ks1();
        ks1Var.a = this.can_publish;
        ks1Var.b = this.can_publish_all;
        ks1Var.c = this.can_republish;
        ks1Var.d = this.can_remove;
        ks1Var.e = this.can_manage_all;
        ks1Var.f = this.can_submit;
        ks1Var.g = this.can_edit_posts;
        ks1Var.h = this.can_add_writers;
        ks1Var.i = this.can_view_stats;
        ks1Var.j = this.can_send_newsletter;
        ks1Var.k = this.can_view_locked_posts;
        ks1Var.l = this.can_view_cloaked;
        ks1Var.m = this.can_edit_own_posts;
        ks1Var.n = this.can_be_assigned_author;
        ks1Var.o = this.can_enroll_in_hightower;
        ks1Var.p = this.can_lock_posts_for_medium_members;
        ks1Var.q = this.can_lock_own_posts_for_medium_members;
        ks1Var.r = this.can_view_newsletter_v2_stats;
        ks1Var.s = this.can_create_newsletter_v3;
        ks1Var.addUnknownFields(unknownFields());
        return ks1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Boolean bool = this.can_publish;
        if (bool != null) {
            lv8.A("can_publish=", bool, arrayList);
        }
        Boolean bool2 = this.can_publish_all;
        if (bool2 != null) {
            lv8.A("can_publish_all=", bool2, arrayList);
        }
        Boolean bool3 = this.can_republish;
        if (bool3 != null) {
            lv8.A("can_republish=", bool3, arrayList);
        }
        Boolean bool4 = this.can_remove;
        if (bool4 != null) {
            lv8.A("can_remove=", bool4, arrayList);
        }
        Boolean bool5 = this.can_manage_all;
        if (bool5 != null) {
            lv8.A("can_manage_all=", bool5, arrayList);
        }
        Boolean bool6 = this.can_submit;
        if (bool6 != null) {
            lv8.A("can_submit=", bool6, arrayList);
        }
        Boolean bool7 = this.can_edit_posts;
        if (bool7 != null) {
            lv8.A("can_edit_posts=", bool7, arrayList);
        }
        Boolean bool8 = this.can_add_writers;
        if (bool8 != null) {
            lv8.A("can_add_writers=", bool8, arrayList);
        }
        Boolean bool9 = this.can_view_stats;
        if (bool9 != null) {
            lv8.A("can_view_stats=", bool9, arrayList);
        }
        Boolean bool10 = this.can_send_newsletter;
        if (bool10 != null) {
            lv8.A("can_send_newsletter=", bool10, arrayList);
        }
        Boolean bool11 = this.can_view_locked_posts;
        if (bool11 != null) {
            lv8.A("can_view_locked_posts=", bool11, arrayList);
        }
        Boolean bool12 = this.can_view_cloaked;
        if (bool12 != null) {
            lv8.A("can_view_cloaked=", bool12, arrayList);
        }
        Boolean bool13 = this.can_edit_own_posts;
        if (bool13 != null) {
            lv8.A("can_edit_own_posts=", bool13, arrayList);
        }
        Boolean bool14 = this.can_be_assigned_author;
        if (bool14 != null) {
            lv8.A("can_be_assigned_author=", bool14, arrayList);
        }
        Boolean bool15 = this.can_enroll_in_hightower;
        if (bool15 != null) {
            lv8.A("can_enroll_in_hightower=", bool15, arrayList);
        }
        Boolean bool16 = this.can_lock_posts_for_medium_members;
        if (bool16 != null) {
            lv8.A("can_lock_posts_for_medium_members=", bool16, arrayList);
        }
        Boolean bool17 = this.can_lock_own_posts_for_medium_members;
        if (bool17 != null) {
            lv8.A("can_lock_own_posts_for_medium_members=", bool17, arrayList);
        }
        Boolean bool18 = this.can_view_newsletter_v2_stats;
        if (bool18 != null) {
            lv8.A("can_view_newsletter_v2_stats=", bool18, arrayList);
        }
        Boolean bool19 = this.can_create_newsletter_v3;
        if (bool19 != null) {
            lv8.A("can_create_newsletter_v3=", bool19, arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionPermissions{", "}", null, 56);
    }

    public CollectionPermissions() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 1048575, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionPermissions(Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, Boolean bool8, Boolean bool9, Boolean bool10, Boolean bool11, Boolean bool12, Boolean bool13, Boolean bool14, Boolean bool15, Boolean bool16, Boolean bool17, Boolean bool18, Boolean bool19, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.can_publish = bool;
        this.can_publish_all = bool2;
        this.can_republish = bool3;
        this.can_remove = bool4;
        this.can_manage_all = bool5;
        this.can_submit = bool6;
        this.can_edit_posts = bool7;
        this.can_add_writers = bool8;
        this.can_view_stats = bool9;
        this.can_send_newsletter = bool10;
        this.can_view_locked_posts = bool11;
        this.can_view_cloaked = bool12;
        this.can_edit_own_posts = bool13;
        this.can_be_assigned_author = bool14;
        this.can_enroll_in_hightower = bool15;
        this.can_lock_posts_for_medium_members = bool16;
        this.can_lock_own_posts_for_medium_members = bool17;
        this.can_view_newsletter_v2_stats = bool18;
        this.can_create_newsletter_v3 = bool19;
    }

    @z73
    public static /* synthetic */ void getCan_view_newsletter_v2_stats$annotations() {
    }
}
