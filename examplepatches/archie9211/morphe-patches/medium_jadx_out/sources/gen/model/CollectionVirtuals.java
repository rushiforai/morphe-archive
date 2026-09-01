package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.android.common.ui.Ezz.Plbho;
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
import defpackage.wg6;
import defpackage.xt1;
import defpackage.y30;
import defpackage.yt1;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0015\u0018\u0000 32\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00024B¹\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\b\b\u0002\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u001a\u0010\u001e\u001a\u00020\u00052\b\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0096\u0002¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u000eH\u0016¢\u0006\u0004\b#\u0010$J¿\u0001\u0010%\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\b\b\u0002\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b%\u0010&R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010'R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010(R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010(R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010(R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010(R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010(R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010(R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010(R\u001c\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\r\u0010(\u0012\u0004\b)\u0010*R\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010+\u0012\u0004\b,\u0010*R\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0011\u0010-\u0012\u0004\b.\u0010*R\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0012\u0010+\u0012\u0004\b/\u0010*R\u001c\u0010\u0013\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0013\u0010(\u0012\u0004\b0\u0010*R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u00101\u0012\u0004\b2\u0010*¨\u00065"}, d2 = {"Lgen/model/CollectionVirtuals;", "Lcom/squareup/wire/AndroidMessage;", "Lxt1;", "Lgen/model/CollectionPermissions;", "permissions", "", "is_subscribed", "is_muted", "is_enrolled_in_hightower", "is_eligible_for_hightower", "is_subscribed_to_collection_emails", "can_toggle_email", "is_writer", "is_newsletter_subscribed", "", "member_of_membership_plan_id", "Lgen/model/Membership;", "membership", "medium_newsletter_id", "is_subscribed_to_medium_newsletter", "", "pts_qualified_at", "Lh21;", "unknownFields", "<init>", "(Lgen/model/CollectionPermissions;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/Membership;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lxt1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/CollectionPermissions;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/Membership;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Long;Lh21;)Lgen/model/CollectionVirtuals;", "Lgen/model/CollectionPermissions;", "Ljava/lang/Boolean;", "is_newsletter_subscribed$annotations", "()V", "Ljava/lang/String;", "getMember_of_membership_plan_id$annotations", "Lgen/model/Membership;", "getMembership$annotations", "getMedium_newsletter_id$annotations", "is_subscribed_to_medium_newsletter$annotations", "Ljava/lang/Long;", "getPts_qualified_at$annotations", "Companion", "yt1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionVirtuals extends AndroidMessage<CollectionVirtuals, xt1> {
    public static final ProtoAdapter<CollectionVirtuals> ADAPTER;
    public static final Parcelable.Creator<CollectionVirtuals> CREATOR;
    public static final yt1 Companion = new yt1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 12)
    public final Boolean can_toggle_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 7)
    public final Boolean is_eligible_for_hightower;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 6)
    public final Boolean is_enrolled_in_hightower;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 11)
    public final Boolean is_muted;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 3)
    public final Boolean is_newsletter_subscribed;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean is_subscribed;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 5, tag = 10)
    public final Boolean is_subscribed_to_collection_emails;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 12, tag = 9)
    public final Boolean is_subscribed_to_medium_newsletter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 14)
    public final Boolean is_writer;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 8)
    public final String medium_newsletter_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 4)
    public final String member_of_membership_plan_id;

    @WireField(adapter = "gen.model.Membership#ADAPTER", schemaIndex = 10, tag = 5)
    public final Membership membership;

    @WireField(adapter = "gen.model.CollectionPermissions#ADAPTER", schemaIndex = 0, tag = 1)
    public final CollectionPermissions permissions;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 13, tag = 13)
    public final Long pts_qualified_at;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionVirtuals.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionVirtuals> protoAdapter = new ProtoAdapter<CollectionVirtuals>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionVirtuals$Companion$ADAPTER$1
            {
                String str = Plbho.HdvWMBtXNo;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0024. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionVirtuals decode(ProtoReader reader) {
                CollectionPermissions collectionPermissionsDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                CollectionPermissions collectionPermissions = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                Boolean boolDecode4 = null;
                Boolean boolDecode5 = null;
                Boolean boolDecode6 = null;
                Boolean boolDecode7 = null;
                Boolean boolDecode8 = null;
                String strDecode = null;
                Membership membershipDecode = null;
                String strDecode2 = null;
                Boolean boolDecode9 = null;
                Long lDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    Boolean bool = boolDecode;
                    if (iNextTag == -1) {
                        return new CollectionVirtuals(collectionPermissions, bool, boolDecode2, boolDecode3, boolDecode4, boolDecode5, boolDecode6, boolDecode7, boolDecode8, strDecode, membershipDecode, strDecode2, boolDecode9, lDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            collectionPermissionsDecode = CollectionPermissions.ADAPTER.decode(reader);
                            boolDecode = bool;
                            break;
                        case 2:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 3:
                            boolDecode8 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 4:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 5:
                            membershipDecode = Membership.ADAPTER.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 6:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 7:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 8:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 9:
                            boolDecode9 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 10:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 11:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 12:
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 13:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        case 14:
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            boolDecode = bool;
                            collectionPermissionsDecode = collectionPermissions;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            collectionPermissionsDecode = collectionPermissions;
                            boolDecode = bool;
                            break;
                    }
                    collectionPermissions = collectionPermissionsDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionVirtuals value) {
                writer.getClass();
                value.getClass();
                CollectionPermissions.ADAPTER.encodeWithTag(writer, 1, value.permissions);
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 2, value.is_subscribed);
                protoAdapter2.encodeWithTag(writer, 11, value.is_muted);
                protoAdapter2.encodeWithTag(writer, 6, value.is_enrolled_in_hightower);
                protoAdapter2.encodeWithTag(writer, 7, value.is_eligible_for_hightower);
                protoAdapter2.encodeWithTag(writer, 10, value.is_subscribed_to_collection_emails);
                protoAdapter2.encodeWithTag(writer, 12, value.can_toggle_email);
                protoAdapter2.encodeWithTag(writer, 14, value.is_writer);
                protoAdapter2.encodeWithTag(writer, 3, value.is_newsletter_subscribed);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 4, value.member_of_membership_plan_id);
                Membership.ADAPTER.encodeWithTag(writer, 5, value.membership);
                protoAdapter3.encodeWithTag(writer, 8, value.medium_newsletter_id);
                protoAdapter2.encodeWithTag(writer, 9, value.is_subscribed_to_medium_newsletter);
                ProtoAdapter.INT64.encodeWithTag(writer, 13, value.pts_qualified_at);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionVirtuals value) {
                value.getClass();
                int iEncodedSizeWithTag = CollectionPermissions.ADAPTER.encodedSizeWithTag(1, value.permissions) + value.unknownFields().e();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(3, value.is_newsletter_subscribed) + protoAdapter2.encodedSizeWithTag(14, value.is_writer) + protoAdapter2.encodedSizeWithTag(12, value.can_toggle_email) + protoAdapter2.encodedSizeWithTag(10, value.is_subscribed_to_collection_emails) + protoAdapter2.encodedSizeWithTag(7, value.is_eligible_for_hightower) + protoAdapter2.encodedSizeWithTag(6, value.is_enrolled_in_hightower) + protoAdapter2.encodedSizeWithTag(11, value.is_muted) + protoAdapter2.encodedSizeWithTag(2, value.is_subscribed) + iEncodedSizeWithTag;
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                return ProtoAdapter.INT64.encodedSizeWithTag(13, value.pts_qualified_at) + protoAdapter2.encodedSizeWithTag(9, value.is_subscribed_to_medium_newsletter) + protoAdapter3.encodedSizeWithTag(8, value.medium_newsletter_id) + Membership.ADAPTER.encodedSizeWithTag(5, value.membership) + protoAdapter3.encodedSizeWithTag(4, value.member_of_membership_plan_id) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionVirtuals redact(CollectionVirtuals value) {
                value.getClass();
                CollectionPermissions collectionPermissions = value.permissions;
                CollectionPermissions collectionPermissionsRedact = collectionPermissions != null ? CollectionPermissions.ADAPTER.redact(collectionPermissions) : null;
                Membership membership = value.membership;
                return value.copy((15358 & 1) != 0 ? value.permissions : collectionPermissionsRedact, (15358 & 2) != 0 ? value.is_subscribed : null, (15358 & 4) != 0 ? value.is_muted : null, (15358 & 8) != 0 ? value.is_enrolled_in_hightower : null, (15358 & 16) != 0 ? value.is_eligible_for_hightower : null, (15358 & 32) != 0 ? value.is_subscribed_to_collection_emails : null, (15358 & 64) != 0 ? value.can_toggle_email : null, (15358 & 128) != 0 ? value.is_writer : null, (15358 & 256) != 0 ? value.is_newsletter_subscribed : null, (15358 & 512) != 0 ? value.member_of_membership_plan_id : null, (15358 & 1024) != 0 ? value.membership : membership != null ? Membership.ADAPTER.redact(membership) : null, (15358 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.medium_newsletter_id : null, (15358 & 4096) != 0 ? value.is_subscribed_to_medium_newsletter : null, (15358 & 8192) != 0 ? value.pts_qualified_at : null, (15358 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionVirtuals value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT64.encodeWithTag(writer, 13, value.pts_qualified_at);
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 9, value.is_subscribed_to_medium_newsletter);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 8, value.medium_newsletter_id);
                Membership.ADAPTER.encodeWithTag(writer, 5, value.membership);
                protoAdapter3.encodeWithTag(writer, 4, value.member_of_membership_plan_id);
                protoAdapter2.encodeWithTag(writer, 3, value.is_newsletter_subscribed);
                protoAdapter2.encodeWithTag(writer, 14, value.is_writer);
                protoAdapter2.encodeWithTag(writer, 12, value.can_toggle_email);
                protoAdapter2.encodeWithTag(writer, 10, value.is_subscribed_to_collection_emails);
                protoAdapter2.encodeWithTag(writer, 7, value.is_eligible_for_hightower);
                protoAdapter2.encodeWithTag(writer, 6, value.is_enrolled_in_hightower);
                protoAdapter2.encodeWithTag(writer, 11, value.is_muted);
                protoAdapter2.encodeWithTag(writer, 2, value.is_subscribed);
                CollectionPermissions.ADAPTER.encodeWithTag(writer, 1, value.permissions);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionVirtuals(CollectionPermissions collectionPermissions, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, Boolean bool8, String str, Membership membership, String str2, Boolean bool9, Long l, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : collectionPermissions, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? null : bool2, (i & 8) != 0 ? null : bool3, (i & 16) != 0 ? null : bool4, (i & 32) != 0 ? null : bool5, (i & 64) != 0 ? null : bool6, (i & 128) != 0 ? null : bool7, (i & 256) != 0 ? null : bool8, (i & 512) != 0 ? null : str, (i & 1024) != 0 ? null : membership, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str2, (i & 4096) != 0 ? null : bool9, (i & 8192) == 0 ? l : null, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? h21.d : h21Var);
    }

    public final CollectionVirtuals copy(CollectionPermissions permissions, Boolean is_subscribed, Boolean is_muted, Boolean is_enrolled_in_hightower, Boolean is_eligible_for_hightower, Boolean is_subscribed_to_collection_emails, Boolean can_toggle_email, Boolean is_writer, Boolean is_newsletter_subscribed, String member_of_membership_plan_id, Membership membership, String medium_newsletter_id, Boolean is_subscribed_to_medium_newsletter, Long pts_qualified_at, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionVirtuals(permissions, is_subscribed, is_muted, is_enrolled_in_hightower, is_eligible_for_hightower, is_subscribed_to_collection_emails, can_toggle_email, is_writer, is_newsletter_subscribed, member_of_membership_plan_id, membership, medium_newsletter_id, is_subscribed_to_medium_newsletter, pts_qualified_at, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionVirtuals)) {
            return false;
        }
        CollectionVirtuals collectionVirtuals = (CollectionVirtuals) other;
        return g76.L(unknownFields(), collectionVirtuals.unknownFields()) && g76.L(this.permissions, collectionVirtuals.permissions) && g76.L(this.is_subscribed, collectionVirtuals.is_subscribed) && g76.L(this.is_muted, collectionVirtuals.is_muted) && g76.L(this.is_enrolled_in_hightower, collectionVirtuals.is_enrolled_in_hightower) && g76.L(this.is_eligible_for_hightower, collectionVirtuals.is_eligible_for_hightower) && g76.L(this.is_subscribed_to_collection_emails, collectionVirtuals.is_subscribed_to_collection_emails) && g76.L(this.can_toggle_email, collectionVirtuals.can_toggle_email) && g76.L(this.is_writer, collectionVirtuals.is_writer) && g76.L(this.is_newsletter_subscribed, collectionVirtuals.is_newsletter_subscribed) && g76.L(this.member_of_membership_plan_id, collectionVirtuals.member_of_membership_plan_id) && g76.L(this.membership, collectionVirtuals.membership) && g76.L(this.medium_newsletter_id, collectionVirtuals.medium_newsletter_id) && g76.L(this.is_subscribed_to_medium_newsletter, collectionVirtuals.is_subscribed_to_medium_newsletter) && g76.L(this.pts_qualified_at, collectionVirtuals.pts_qualified_at);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        CollectionPermissions collectionPermissions = this.permissions;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (collectionPermissions != null ? collectionPermissions.hashCode() : 0)) * 37;
        Boolean bool = this.is_subscribed;
        int i3 = 1237;
        int i4 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.is_muted;
        int i5 = (i4 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.is_enrolled_in_hightower;
        int i6 = (i5 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool4 = this.is_eligible_for_hightower;
        int i7 = (i6 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool5 = this.is_subscribed_to_collection_emails;
        int i8 = (i7 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool6 = this.can_toggle_email;
        int i9 = (i8 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool7 = this.is_writer;
        int i10 = (i9 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool8 = this.is_newsletter_subscribed;
        int i11 = (i10 + (bool8 != null ? bool8.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str = this.member_of_membership_plan_id;
        int iHashCode3 = (i11 + (str != null ? str.hashCode() : 0)) * 37;
        Membership membership = this.membership;
        int iHashCode4 = (iHashCode3 + (membership != null ? membership.hashCode() : 0)) * 37;
        String str2 = this.medium_newsletter_id;
        int iHashCode5 = (iHashCode4 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Boolean bool9 = this.is_subscribed_to_medium_newsletter;
        if (bool9 == null) {
            i3 = 0;
        } else if (bool9.booleanValue()) {
            i3 = 1231;
        }
        int i12 = (iHashCode5 + i3) * 37;
        Long l = this.pts_qualified_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        }
        int i13 = i12 + i2;
        this.hashCode = i13;
        return i13;
    }

    @Override // com.squareup.wire.Message
    public final xt1 newBuilder() {
        xt1 xt1Var = new xt1();
        xt1Var.a = this.permissions;
        xt1Var.b = this.is_subscribed;
        xt1Var.c = this.is_muted;
        xt1Var.d = this.is_enrolled_in_hightower;
        xt1Var.e = this.is_eligible_for_hightower;
        xt1Var.f = this.is_subscribed_to_collection_emails;
        xt1Var.g = this.can_toggle_email;
        xt1Var.h = this.is_writer;
        xt1Var.i = this.is_newsletter_subscribed;
        xt1Var.j = this.member_of_membership_plan_id;
        xt1Var.k = this.membership;
        xt1Var.l = this.medium_newsletter_id;
        xt1Var.m = this.is_subscribed_to_medium_newsletter;
        xt1Var.n = this.pts_qualified_at;
        xt1Var.addUnknownFields(unknownFields());
        return xt1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        CollectionPermissions collectionPermissions = this.permissions;
        if (collectionPermissions != null) {
            arrayList.add("permissions=" + collectionPermissions);
        }
        Boolean bool = this.is_subscribed;
        if (bool != null) {
            lv8.A("is_subscribed=", bool, arrayList);
        }
        Boolean bool2 = this.is_muted;
        if (bool2 != null) {
            lv8.A("is_muted=", bool2, arrayList);
        }
        Boolean bool3 = this.is_enrolled_in_hightower;
        if (bool3 != null) {
            lv8.A("is_enrolled_in_hightower=", bool3, arrayList);
        }
        Boolean bool4 = this.is_eligible_for_hightower;
        if (bool4 != null) {
            lv8.A("is_eligible_for_hightower=", bool4, arrayList);
        }
        Boolean bool5 = this.is_subscribed_to_collection_emails;
        if (bool5 != null) {
            lv8.A("is_subscribed_to_collection_emails=", bool5, arrayList);
        }
        Boolean bool6 = this.can_toggle_email;
        if (bool6 != null) {
            lv8.A("can_toggle_email=", bool6, arrayList);
        }
        Boolean bool7 = this.is_writer;
        if (bool7 != null) {
            lv8.A("is_writer=", bool7, arrayList);
        }
        Boolean bool8 = this.is_newsletter_subscribed;
        if (bool8 != null) {
            lv8.A("is_newsletter_subscribed=", bool8, arrayList);
        }
        String str = this.member_of_membership_plan_id;
        if (str != null) {
            lv8.D(str, "member_of_membership_plan_id=", arrayList);
        }
        Membership membership = this.membership;
        if (membership != null) {
            arrayList.add("membership=" + membership);
        }
        String str2 = this.medium_newsletter_id;
        if (str2 != null) {
            lv8.D(str2, "medium_newsletter_id=", arrayList);
        }
        Boolean bool9 = this.is_subscribed_to_medium_newsletter;
        if (bool9 != null) {
            lv8.A("is_subscribed_to_medium_newsletter=", bool9, arrayList);
        }
        Long l = this.pts_qualified_at;
        if (l != null) {
            y30.A("pts_qualified_at=", l, arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionVirtuals{", "}", null, 56);
    }

    public static /* synthetic */ void getMedium_newsletter_id$annotations() {
    }

    public static /* synthetic */ void getMember_of_membership_plan_id$annotations() {
    }

    public static /* synthetic */ void getMembership$annotations() {
    }

    public static /* synthetic */ void getPts_qualified_at$annotations() {
    }

    public static /* synthetic */ void is_newsletter_subscribed$annotations() {
    }

    public static /* synthetic */ void is_subscribed_to_medium_newsletter$annotations() {
    }

    public CollectionVirtuals() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 32767, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionVirtuals(CollectionPermissions collectionPermissions, Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, Boolean bool5, Boolean bool6, Boolean bool7, Boolean bool8, String str, Membership membership, String str2, Boolean bool9, Long l, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.permissions = collectionPermissions;
        this.is_subscribed = bool;
        this.is_muted = bool2;
        this.is_enrolled_in_hightower = bool3;
        this.is_eligible_for_hightower = bool4;
        this.is_subscribed_to_collection_emails = bool5;
        this.can_toggle_email = bool6;
        this.is_writer = bool7;
        this.is_newsletter_subscribed = bool8;
        this.member_of_membership_plan_id = str;
        this.membership = membership;
        this.medium_newsletter_id = str2;
        this.is_subscribed_to_medium_newsletter = bool9;
        this.pts_qualified_at = l;
    }
}
