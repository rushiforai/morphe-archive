package com.medium.proto.event;

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
import defpackage.i3a;
import defpackage.j3a;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0014\u001a\u00020\t2\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ_\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001fR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001e¨\u0006\""}, d2 = {"Lcom/medium/proto/event/ProfileViewed;", "Lcom/squareup/wire/AndroidMessage;", "Li3a;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "profile_id", "referrer_source", "book_author_id", "", "tracking_v2", "source", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)V", "newBuilder", "()Li3a;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/ProfileViewed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "j3a", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("profile.viewed")
public final class ProfileViewed extends AndroidMessage<ProfileViewed, i3a> {
    public static final ProtoAdapter<ProfileViewed> ADAPTER;
    public static final Parcelable.Creator<ProfileViewed> CREATOR;
    public static final j3a Companion = new j3a();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String book_author_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String profile_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean tracking_v2;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ProfileViewed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ProfileViewed> protoAdapter = new ProtoAdapter<ProfileViewed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ProfileViewed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ProfileViewed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ProfileViewed(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, boolDecode, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ProfileViewed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.profile_id);
                protoAdapter2.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 4, value.book_author_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                protoAdapter2.encodeWithTag(writer, 6, value.source);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ProfileViewed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(6, value.source) + ProtoAdapter.BOOL.encodedSizeWithTag(5, value.tracking_v2) + protoAdapter2.encodedSizeWithTag(4, value.book_author_id) + protoAdapter2.encodedSizeWithTag(3, value.referrer_source) + protoAdapter2.encodedSizeWithTag(2, value.profile_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ProfileViewed redact(ProfileViewed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ProfileViewed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, h21.d, 62, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ProfileViewed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.source);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                protoAdapter2.encodeWithTag(writer, 4, value.book_author_id);
                protoAdapter2.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 2, value.profile_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ProfileViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : bool, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ProfileViewed copy$default(ProfileViewed profileViewed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = profileViewed.common_fields;
        }
        if ((i & 2) != 0) {
            str = profileViewed.profile_id;
        }
        if ((i & 4) != 0) {
            str2 = profileViewed.referrer_source;
        }
        if ((i & 8) != 0) {
            str3 = profileViewed.book_author_id;
        }
        if ((i & 16) != 0) {
            bool = profileViewed.tracking_v2;
        }
        if ((i & 32) != 0) {
            str4 = profileViewed.source;
        }
        if ((i & 64) != 0) {
            h21Var = profileViewed.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        Boolean bool2 = bool;
        String str6 = str2;
        return profileViewed.copy(analyticsEventCommonFields, str, str6, str3, bool2, str5, h21Var2);
    }

    public final ProfileViewed copy(AnalyticsEventCommonFields common_fields, String profile_id, String referrer_source, String book_author_id, Boolean tracking_v2, String source, h21 unknownFields) {
        unknownFields.getClass();
        return new ProfileViewed(common_fields, profile_id, referrer_source, book_author_id, tracking_v2, source, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ProfileViewed)) {
            return false;
        }
        ProfileViewed profileViewed = (ProfileViewed) other;
        return g76.L(unknownFields(), profileViewed.unknownFields()) && g76.L(this.common_fields, profileViewed.common_fields) && g76.L(this.profile_id, profileViewed.profile_id) && g76.L(this.referrer_source, profileViewed.referrer_source) && g76.L(this.book_author_id, profileViewed.book_author_id) && g76.L(this.tracking_v2, profileViewed.tracking_v2) && g76.L(this.source, profileViewed.source);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.profile_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.referrer_source;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.book_author_id;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool = this.tracking_v2;
        int i2 = (iHashCode5 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.source;
        int iHashCode6 = i2 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final i3a newBuilder() {
        i3a i3aVar = new i3a();
        i3aVar.a = this.common_fields;
        i3aVar.b = this.profile_id;
        i3aVar.c = this.referrer_source;
        i3aVar.d = this.book_author_id;
        i3aVar.e = this.tracking_v2;
        i3aVar.f = this.source;
        i3aVar.addUnknownFields(unknownFields());
        return i3aVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.profile_id;
        if (str != null) {
            lv8.D(str, "profile_id=", arrayList);
        }
        String str2 = this.referrer_source;
        if (str2 != null) {
            lv8.D(str2, "referrer_source=", arrayList);
        }
        String str3 = this.book_author_id;
        if (str3 != null) {
            lv8.D(str3, "book_author_id=", arrayList);
        }
        Boolean bool = this.tracking_v2;
        if (bool != null) {
            lv8.A("tracking_v2=", bool, arrayList);
        }
        String str4 = this.source;
        if (str4 != null) {
            lv8.D(str4, "source=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "ProfileViewed{", "}", null, 56);
    }

    public ProfileViewed() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ProfileViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.profile_id = str;
        this.referrer_source = str2;
        this.book_author_id = str3;
        this.tracking_v2 = bool;
        this.source = str4;
    }
}
