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
import defpackage.fd5;
import defpackage.g76;
import defpackage.gd5;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB1\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J7\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0014\u0010\u0007\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lcom/medium/proto/event/GiveTipClicked;", "Lcom/squareup/wire/AndroidMessage;", "Lfd5;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "post_creator_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lfd5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/GiveTipClicked;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "gd5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("giveTip.submitButtonClicked")
public final class GiveTipClicked extends AndroidMessage<GiveTipClicked, fd5> {
    public static final ProtoAdapter<GiveTipClicked> ADAPTER;
    public static final Parcelable.Creator<GiveTipClicked> CREATOR;
    public static final gd5 Companion = new gd5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postCreatorId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final String post_creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(GiveTipClicked.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<GiveTipClicked> protoAdapter = new ProtoAdapter<GiveTipClicked>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.GiveTipClicked$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final GiveTipClicked decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                String strDecode2 = "";
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new GiveTipClicked(analyticsEventCommonFieldsDecode, strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, GiveTipClicked value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.post_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                }
                if (!g76.L(value.post_creator_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_creator_id);
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(GiveTipClicked value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.post_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.post_id);
                }
                return !g76.L(value.post_creator_id, "") ? ProtoAdapter.STRING.encodedSizeWithTag(3, value.post_creator_id) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final GiveTipClicked redact(GiveTipClicked value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return GiveTipClicked.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, GiveTipClicked value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                if (!g76.L(value.post_creator_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_creator_id);
                }
                if (!g76.L(value.post_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                }
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ GiveTipClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? "" : str2, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ GiveTipClicked copy$default(GiveTipClicked giveTipClicked, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = giveTipClicked.common_fields;
        }
        if ((i & 2) != 0) {
            str = giveTipClicked.post_id;
        }
        if ((i & 4) != 0) {
            str2 = giveTipClicked.post_creator_id;
        }
        if ((i & 8) != 0) {
            h21Var = giveTipClicked.unknownFields();
        }
        return giveTipClicked.copy(analyticsEventCommonFields, str, str2, h21Var);
    }

    public final GiveTipClicked copy(AnalyticsEventCommonFields common_fields, String post_id, String post_creator_id, h21 unknownFields) {
        post_id.getClass();
        post_creator_id.getClass();
        unknownFields.getClass();
        return new GiveTipClicked(common_fields, post_id, post_creator_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof GiveTipClicked)) {
            return false;
        }
        GiveTipClicked giveTipClicked = (GiveTipClicked) other;
        return g76.L(unknownFields(), giveTipClicked.unknownFields()) && g76.L(this.common_fields, giveTipClicked.common_fields) && g76.L(this.post_id, giveTipClicked.post_id) && g76.L(this.post_creator_id, giveTipClicked.post_creator_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = this.post_creator_id.hashCode() + wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.post_id);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final fd5 newBuilder() {
        fd5 fd5Var = new fd5();
        fd5Var.b = "";
        fd5Var.c = "";
        fd5Var.a = this.common_fields;
        fd5Var.b = this.post_id;
        fd5Var.c = this.post_creator_id;
        fd5Var.addUnknownFields(unknownFields());
        return fd5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.post_id, "post_id=", arrayList);
        lv8.D(this.post_creator_id, "post_creator_id=", arrayList);
        return bu1.F0(arrayList, ", ", "GiveTipClicked{", "}", null, 56);
    }

    public GiveTipClicked() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GiveTipClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.post_creator_id = str2;
    }
}
