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
import defpackage.n50;
import defpackage.o50;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJS\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006\""}, d2 = {"Lcom/medium/proto/event/AppInstall;", "Lcom/squareup/wire/AndroidMessage;", "Ln50;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "referrer_url", "", "referrer_click_time", "app_install_time", "app_install_version", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ln50;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/AppInstall;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "o50", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("app.install")
public final class AppInstall extends AndroidMessage<AppInstall, n50> {
    public static final ProtoAdapter<AppInstall> ADAPTER;
    public static final Parcelable.Creator<AppInstall> CREATOR;
    public static final o50 Companion = new o50();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long app_install_time;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String app_install_version;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long referrer_click_time;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String referrer_url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AppInstall.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AppInstall> protoAdapter = new ProtoAdapter<AppInstall>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.AppInstall$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AppInstall decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AppInstall(analyticsEventCommonFieldsDecode, strDecode, lDecode, lDecode2, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    } else if (iNextTag == 4) {
                        lDecode2 = ProtoAdapter.INT64.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AppInstall value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.referrer_url);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.referrer_click_time);
                protoAdapter3.encodeWithTag(writer, 4, value.app_install_time);
                protoAdapter2.encodeWithTag(writer, 5, value.app_install_version);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AppInstall value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(2, value.referrer_url) + iEncodedSizeWithTag;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                return protoAdapter2.encodedSizeWithTag(5, value.app_install_version) + protoAdapter3.encodedSizeWithTag(4, value.app_install_time) + protoAdapter3.encodedSizeWithTag(3, value.referrer_click_time) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AppInstall redact(AppInstall value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return AppInstall.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AppInstall value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.app_install_version);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 4, value.app_install_time);
                protoAdapter3.encodeWithTag(writer, 3, value.referrer_click_time);
                protoAdapter2.encodeWithTag(writer, 2, value.referrer_url);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AppInstall(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : l2, (i & 16) != 0 ? null : str2, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AppInstall copy$default(AppInstall appInstall, AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = appInstall.common_fields;
        }
        if ((i & 2) != 0) {
            str = appInstall.referrer_url;
        }
        if ((i & 4) != 0) {
            l = appInstall.referrer_click_time;
        }
        if ((i & 8) != 0) {
            l2 = appInstall.app_install_time;
        }
        if ((i & 16) != 0) {
            str2 = appInstall.app_install_version;
        }
        if ((i & 32) != 0) {
            h21Var = appInstall.unknownFields();
        }
        String str3 = str2;
        h21 h21Var2 = h21Var;
        return appInstall.copy(analyticsEventCommonFields, str, l, l2, str3, h21Var2);
    }

    public final AppInstall copy(AnalyticsEventCommonFields common_fields, String referrer_url, Long referrer_click_time, Long app_install_time, String app_install_version, h21 unknownFields) {
        unknownFields.getClass();
        return new AppInstall(common_fields, referrer_url, referrer_click_time, app_install_time, app_install_version, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AppInstall)) {
            return false;
        }
        AppInstall appInstall = (AppInstall) other;
        return g76.L(unknownFields(), appInstall.unknownFields()) && g76.L(this.common_fields, appInstall.common_fields) && g76.L(this.referrer_url, appInstall.referrer_url) && g76.L(this.referrer_click_time, appInstall.referrer_click_time) && g76.L(this.app_install_time, appInstall.app_install_time) && g76.L(this.app_install_version, appInstall.app_install_version);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.referrer_url;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        Long l = this.referrer_click_time;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode3 + i) * 37;
        Long l2 = this.app_install_time;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i5 = (i4 + i2) * 37;
        String str2 = this.app_install_version;
        int iHashCode4 = i5 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final n50 newBuilder() {
        n50 n50Var = new n50();
        n50Var.a = this.common_fields;
        n50Var.b = this.referrer_url;
        n50Var.c = this.referrer_click_time;
        n50Var.d = this.app_install_time;
        n50Var.e = this.app_install_version;
        n50Var.addUnknownFields(unknownFields());
        return n50Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.referrer_url;
        if (str != null) {
            lv8.D(str, "referrer_url=", arrayList);
        }
        Long l = this.referrer_click_time;
        if (l != null) {
            y30.A("referrer_click_time=", l, arrayList);
        }
        Long l2 = this.app_install_time;
        if (l2 != null) {
            y30.A("app_install_time=", l2, arrayList);
        }
        String str2 = this.app_install_version;
        if (str2 != null) {
            lv8.D(str2, "app_install_version=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "AppInstall{", "}", null, 56);
    }

    public AppInstall() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppInstall(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.referrer_url = str;
        this.referrer_click_time = l;
        this.app_install_time = l2;
        this.app_install_version = str2;
    }
}
