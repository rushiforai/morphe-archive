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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.u9e;
import defpackage.v9e;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/UserActivityPreferenceUpdated;", "Lcom/squareup/wire/AndroidMessage;", "Lu9e;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "allow_claps", "allow_highlights", "allow_responses", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lu9e;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/UserActivityPreferenceUpdated;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Boolean;", "Companion", "v9e", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("user.activityPreference.updated")
public final class UserActivityPreferenceUpdated extends AndroidMessage<UserActivityPreferenceUpdated, u9e> {
    public static final ProtoAdapter<UserActivityPreferenceUpdated> ADAPTER;
    public static final Parcelable.Creator<UserActivityPreferenceUpdated> CREATOR;
    public static final v9e Companion = new v9e();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean allow_claps;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean allow_highlights;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 4)
    public final Boolean allow_responses;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserActivityPreferenceUpdated.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserActivityPreferenceUpdated> protoAdapter = new ProtoAdapter<UserActivityPreferenceUpdated>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.UserActivityPreferenceUpdated$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserActivityPreferenceUpdated decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UserActivityPreferenceUpdated(analyticsEventCommonFieldsDecode, boolDecode, boolDecode2, boolDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag == 3) {
                        boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserActivityPreferenceUpdated value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 2, value.allow_claps);
                protoAdapter2.encodeWithTag(writer, 3, value.allow_highlights);
                protoAdapter2.encodeWithTag(writer, 4, value.allow_responses);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserActivityPreferenceUpdated value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(4, value.allow_responses) + protoAdapter2.encodedSizeWithTag(3, value.allow_highlights) + protoAdapter2.encodedSizeWithTag(2, value.allow_claps) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserActivityPreferenceUpdated redact(UserActivityPreferenceUpdated value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return UserActivityPreferenceUpdated.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserActivityPreferenceUpdated value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 4, value.allow_responses);
                protoAdapter2.encodeWithTag(writer, 3, value.allow_highlights);
                protoAdapter2.encodeWithTag(writer, 2, value.allow_claps);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserActivityPreferenceUpdated(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, Boolean bool2, Boolean bool3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? null : bool2, (i & 8) != 0 ? null : bool3, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UserActivityPreferenceUpdated copy$default(UserActivityPreferenceUpdated userActivityPreferenceUpdated, AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, Boolean bool2, Boolean bool3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = userActivityPreferenceUpdated.common_fields;
        }
        if ((i & 2) != 0) {
            bool = userActivityPreferenceUpdated.allow_claps;
        }
        if ((i & 4) != 0) {
            bool2 = userActivityPreferenceUpdated.allow_highlights;
        }
        if ((i & 8) != 0) {
            bool3 = userActivityPreferenceUpdated.allow_responses;
        }
        if ((i & 16) != 0) {
            h21Var = userActivityPreferenceUpdated.unknownFields();
        }
        h21 h21Var2 = h21Var;
        Boolean bool4 = bool2;
        return userActivityPreferenceUpdated.copy(analyticsEventCommonFields, bool, bool4, bool3, h21Var2);
    }

    public final UserActivityPreferenceUpdated copy(AnalyticsEventCommonFields common_fields, Boolean allow_claps, Boolean allow_highlights, Boolean allow_responses, h21 unknownFields) {
        unknownFields.getClass();
        return new UserActivityPreferenceUpdated(common_fields, allow_claps, allow_highlights, allow_responses, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserActivityPreferenceUpdated)) {
            return false;
        }
        UserActivityPreferenceUpdated userActivityPreferenceUpdated = (UserActivityPreferenceUpdated) other;
        return g76.L(unknownFields(), userActivityPreferenceUpdated.unknownFields()) && g76.L(this.common_fields, userActivityPreferenceUpdated.common_fields) && g76.L(this.allow_claps, userActivityPreferenceUpdated.allow_claps) && g76.L(this.allow_highlights, userActivityPreferenceUpdated.allow_highlights) && g76.L(this.allow_responses, userActivityPreferenceUpdated.allow_responses);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Boolean bool = this.allow_claps;
        int i2 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.allow_highlights;
        int i3 = (i2 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.allow_responses;
        int i4 = i3 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i4;
        return i4;
    }

    @Override // com.squareup.wire.Message
    public final u9e newBuilder() {
        u9e u9eVar = new u9e();
        u9eVar.a = this.common_fields;
        u9eVar.b = this.allow_claps;
        u9eVar.c = this.allow_highlights;
        u9eVar.d = this.allow_responses;
        u9eVar.addUnknownFields(unknownFields());
        return u9eVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Boolean bool = this.allow_claps;
        if (bool != null) {
            lv8.A("allow_claps=", bool, arrayList);
        }
        Boolean bool2 = this.allow_highlights;
        if (bool2 != null) {
            lv8.A("allow_highlights=", bool2, arrayList);
        }
        Boolean bool3 = this.allow_responses;
        if (bool3 != null) {
            lv8.A("allow_responses=", bool3, arrayList);
        }
        return bu1.F0(arrayList, ", ", "UserActivityPreferenceUpdated{", "}", null, 56);
    }

    public UserActivityPreferenceUpdated() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserActivityPreferenceUpdated(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, Boolean bool2, Boolean bool3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.allow_claps = bool;
        this.allow_highlights = bool2;
        this.allow_responses = bool3;
    }
}
