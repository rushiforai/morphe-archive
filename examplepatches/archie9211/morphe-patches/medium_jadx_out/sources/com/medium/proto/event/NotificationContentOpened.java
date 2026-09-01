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
import defpackage.vi8;
import defpackage.wg6;
import defpackage.wi8;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001d¨\u0006!"}, d2 = {"Lcom/medium/proto/event/NotificationContentOpened;", "Lcom/squareup/wire/AndroidMessage;", "Lvi8;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "notification_type", "notification_uri", "", "notification_combined_count", "post_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lvi8;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/NotificationContentOpened;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "wi8", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("notification.contentOpened")
public final class NotificationContentOpened extends AndroidMessage<NotificationContentOpened, vi8> {
    public static final ProtoAdapter<NotificationContentOpened> ADAPTER;
    public static final Parcelable.Creator<NotificationContentOpened> CREATOR;
    public static final wi8 Companion = new wi8();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 4)
    public final Integer notification_combined_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String notification_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String notification_uri;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(NotificationContentOpened.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<NotificationContentOpened> protoAdapter = new ProtoAdapter<NotificationContentOpened>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.NotificationContentOpened$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final NotificationContentOpened decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                Integer numDecode = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new NotificationContentOpened(analyticsEventCommonFieldsDecode, strDecode, strDecode2, numDecode, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, NotificationContentOpened value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.notification_type);
                protoAdapter2.encodeWithTag(writer, 3, value.notification_uri);
                ProtoAdapter.INT32.encodeWithTag(writer, 4, value.notification_combined_count);
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(NotificationContentOpened value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.post_id) + ProtoAdapter.INT32.encodedSizeWithTag(4, value.notification_combined_count) + protoAdapter2.encodedSizeWithTag(3, value.notification_uri) + protoAdapter2.encodedSizeWithTag(2, value.notification_type) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final NotificationContentOpened redact(NotificationContentOpened value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return NotificationContentOpened.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, NotificationContentOpened value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 4, value.notification_combined_count);
                protoAdapter2.encodeWithTag(writer, 3, value.notification_uri);
                protoAdapter2.encodeWithTag(writer, 2, value.notification_type);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ NotificationContentOpened(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : num, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ NotificationContentOpened copy$default(NotificationContentOpened notificationContentOpened, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = notificationContentOpened.common_fields;
        }
        if ((i & 2) != 0) {
            str = notificationContentOpened.notification_type;
        }
        if ((i & 4) != 0) {
            str2 = notificationContentOpened.notification_uri;
        }
        if ((i & 8) != 0) {
            num = notificationContentOpened.notification_combined_count;
        }
        if ((i & 16) != 0) {
            str3 = notificationContentOpened.post_id;
        }
        if ((i & 32) != 0) {
            h21Var = notificationContentOpened.unknownFields();
        }
        String str4 = str3;
        h21 h21Var2 = h21Var;
        return notificationContentOpened.copy(analyticsEventCommonFields, str, str2, num, str4, h21Var2);
    }

    public final NotificationContentOpened copy(AnalyticsEventCommonFields common_fields, String notification_type, String notification_uri, Integer notification_combined_count, String post_id, h21 unknownFields) {
        unknownFields.getClass();
        return new NotificationContentOpened(common_fields, notification_type, notification_uri, notification_combined_count, post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof NotificationContentOpened)) {
            return false;
        }
        NotificationContentOpened notificationContentOpened = (NotificationContentOpened) other;
        return g76.L(unknownFields(), notificationContentOpened.unknownFields()) && g76.L(this.common_fields, notificationContentOpened.common_fields) && g76.L(this.notification_type, notificationContentOpened.notification_type) && g76.L(this.notification_uri, notificationContentOpened.notification_uri) && g76.L(this.notification_combined_count, notificationContentOpened.notification_combined_count) && g76.L(this.post_id, notificationContentOpened.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.notification_type;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.notification_uri;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Integer num = this.notification_combined_count;
        int iIntValue = (iHashCode4 + (num != null ? num.intValue() : 0)) * 37;
        String str3 = this.post_id;
        int iHashCode5 = iIntValue + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final vi8 newBuilder() {
        vi8 vi8Var = new vi8();
        vi8Var.a = this.common_fields;
        vi8Var.b = this.notification_type;
        vi8Var.c = this.notification_uri;
        vi8Var.d = this.notification_combined_count;
        vi8Var.e = this.post_id;
        vi8Var.addUnknownFields(unknownFields());
        return vi8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.notification_type;
        if (str != null) {
            lv8.D(str, "notification_type=", arrayList);
        }
        String str2 = this.notification_uri;
        if (str2 != null) {
            lv8.D(str2, "notification_uri=", arrayList);
        }
        Integer num = this.notification_combined_count;
        if (num != null) {
            lv8.B("notification_combined_count=", num, arrayList);
        }
        String str3 = this.post_id;
        if (str3 != null) {
            lv8.D(str3, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "NotificationContentOpened{", "}", null, 56);
    }

    public NotificationContentOpened() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public NotificationContentOpened(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.notification_type = str;
        this.notification_uri = str2;
        this.notification_combined_count = num;
        this.post_id = str3;
    }
}
