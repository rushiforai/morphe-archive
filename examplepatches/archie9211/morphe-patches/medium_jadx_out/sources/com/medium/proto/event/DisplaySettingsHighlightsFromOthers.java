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
import defpackage.ch3;
import defpackage.dh3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/DisplaySettingsHighlightsFromOthers;", "Lcom/squareup/wire/AndroidMessage;", "Lch3;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "show_highlights", "", "post_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lch3;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/DisplaySettingsHighlightsFromOthers;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Boolean;", "Ljava/lang/String;", "Companion", "dh3", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("displaySettings.highlights_from_others")
public final class DisplaySettingsHighlightsFromOthers extends AndroidMessage<DisplaySettingsHighlightsFromOthers, ch3> {
    public static final ProtoAdapter<DisplaySettingsHighlightsFromOthers> ADAPTER;
    public static final Parcelable.Creator<DisplaySettingsHighlightsFromOthers> CREATOR;
    public static final dh3 Companion = new dh3();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean show_highlights;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(DisplaySettingsHighlightsFromOthers.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<DisplaySettingsHighlightsFromOthers> protoAdapter = new ProtoAdapter<DisplaySettingsHighlightsFromOthers>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.DisplaySettingsHighlightsFromOthers$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final DisplaySettingsHighlightsFromOthers decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Boolean boolDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new DisplaySettingsHighlightsFromOthers(analyticsEventCommonFieldsDecode, boolDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, DisplaySettingsHighlightsFromOthers value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.show_highlights);
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(DisplaySettingsHighlightsFromOthers value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(3, value.post_id) + ProtoAdapter.BOOL.encodedSizeWithTag(2, value.show_highlights) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final DisplaySettingsHighlightsFromOthers redact(DisplaySettingsHighlightsFromOthers value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return DisplaySettingsHighlightsFromOthers.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, DisplaySettingsHighlightsFromOthers value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.show_highlights);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ DisplaySettingsHighlightsFromOthers(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? null : str, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ DisplaySettingsHighlightsFromOthers copy$default(DisplaySettingsHighlightsFromOthers displaySettingsHighlightsFromOthers, AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = displaySettingsHighlightsFromOthers.common_fields;
        }
        if ((i & 2) != 0) {
            bool = displaySettingsHighlightsFromOthers.show_highlights;
        }
        if ((i & 4) != 0) {
            str = displaySettingsHighlightsFromOthers.post_id;
        }
        if ((i & 8) != 0) {
            h21Var = displaySettingsHighlightsFromOthers.unknownFields();
        }
        return displaySettingsHighlightsFromOthers.copy(analyticsEventCommonFields, bool, str, h21Var);
    }

    public final DisplaySettingsHighlightsFromOthers copy(AnalyticsEventCommonFields common_fields, Boolean show_highlights, String post_id, h21 unknownFields) {
        unknownFields.getClass();
        return new DisplaySettingsHighlightsFromOthers(common_fields, show_highlights, post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof DisplaySettingsHighlightsFromOthers)) {
            return false;
        }
        DisplaySettingsHighlightsFromOthers displaySettingsHighlightsFromOthers = (DisplaySettingsHighlightsFromOthers) other;
        return g76.L(unknownFields(), displaySettingsHighlightsFromOthers.unknownFields()) && g76.L(this.common_fields, displaySettingsHighlightsFromOthers.common_fields) && g76.L(this.show_highlights, displaySettingsHighlightsFromOthers.show_highlights) && g76.L(this.post_id, displaySettingsHighlightsFromOthers.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Boolean bool = this.show_highlights;
        int i2 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = i2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final ch3 newBuilder() {
        ch3 ch3Var = new ch3();
        ch3Var.a = this.common_fields;
        ch3Var.b = this.show_highlights;
        ch3Var.c = this.post_id;
        ch3Var.addUnknownFields(unknownFields());
        return ch3Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Boolean bool = this.show_highlights;
        if (bool != null) {
            lv8.A("show_highlights=", bool, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "DisplaySettingsHighlightsFromOthers{", "}", null, 56);
    }

    public DisplaySettingsHighlightsFromOthers() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DisplaySettingsHighlightsFromOthers(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.show_highlights = bool;
        this.post_id = str;
    }
}
