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
import defpackage.e11;
import defpackage.f11;
import defpackage.g76;
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
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fBK\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JQ\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/ButtonClicked;", "Lcom/squareup/wire/AndroidMessage;", "Le11;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "button_type", "book_id", "edition_id", "post_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Le11;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/ButtonClicked;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "f11", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("button.clicked")
public final class ButtonClicked extends AndroidMessage<ButtonClicked, e11> {
    public static final ProtoAdapter<ButtonClicked> ADAPTER;
    public static final Parcelable.Creator<ButtonClicked> CREATOR;
    public static final f11 Companion = new f11();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "bookId", schemaIndex = 2, tag = 3)
    public final String book_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "buttonType", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String button_type;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "editionId", schemaIndex = 3, tag = 4)
    public final String edition_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 4, tag = 5)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ButtonClicked.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ButtonClicked> protoAdapter = new ProtoAdapter<ButtonClicked>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ButtonClicked$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ButtonClicked decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = "";
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ButtonClicked(analyticsEventCommonFieldsDecode, strDecode3, strDecode4, strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode4 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ButtonClicked value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.button_type, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.button_type);
                }
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.book_id);
                protoAdapter2.encodeWithTag(writer, 4, value.edition_id);
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ButtonClicked value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.button_type, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.button_type);
                }
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.post_id) + protoAdapter2.encodedSizeWithTag(4, value.edition_id) + protoAdapter2.encodedSizeWithTag(3, value.book_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ButtonClicked redact(ButtonClicked value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ButtonClicked.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ButtonClicked value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.edition_id);
                protoAdapter2.encodeWithTag(writer, 3, value.book_id);
                if (!g76.L(value.button_type, "")) {
                    protoAdapter2.encodeWithTag(writer, 2, value.button_type);
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

    public /* synthetic */ ButtonClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ButtonClicked copy$default(ButtonClicked buttonClicked, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = buttonClicked.common_fields;
        }
        if ((i & 2) != 0) {
            str = buttonClicked.button_type;
        }
        if ((i & 4) != 0) {
            str2 = buttonClicked.book_id;
        }
        if ((i & 8) != 0) {
            str3 = buttonClicked.edition_id;
        }
        if ((i & 16) != 0) {
            str4 = buttonClicked.post_id;
        }
        if ((i & 32) != 0) {
            h21Var = buttonClicked.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        return buttonClicked.copy(analyticsEventCommonFields, str, str2, str3, str5, h21Var2);
    }

    public final ButtonClicked copy(AnalyticsEventCommonFields common_fields, String button_type, String book_id, String edition_id, String post_id, h21 unknownFields) {
        button_type.getClass();
        unknownFields.getClass();
        return new ButtonClicked(common_fields, button_type, book_id, edition_id, post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ButtonClicked)) {
            return false;
        }
        ButtonClicked buttonClicked = (ButtonClicked) other;
        return g76.L(unknownFields(), buttonClicked.unknownFields()) && g76.L(this.common_fields, buttonClicked.common_fields) && g76.L(this.button_type, buttonClicked.button_type) && g76.L(this.book_id, buttonClicked.book_id) && g76.L(this.edition_id, buttonClicked.edition_id) && g76.L(this.post_id, buttonClicked.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.button_type);
        String str = this.book_id;
        int iHashCode2 = (iO + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.edition_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.post_id;
        int iHashCode4 = iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final e11 newBuilder() {
        e11 e11Var = new e11();
        e11Var.b = "";
        e11Var.a = this.common_fields;
        e11Var.b = this.button_type;
        e11Var.c = this.book_id;
        e11Var.d = this.edition_id;
        e11Var.e = this.post_id;
        e11Var.addUnknownFields(unknownFields());
        return e11Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.button_type, "button_type=", arrayList);
        String str = this.book_id;
        if (str != null) {
            lv8.D(str, "book_id=", arrayList);
        }
        String str2 = this.edition_id;
        if (str2 != null) {
            lv8.D(str2, "edition_id=", arrayList);
        }
        String str3 = this.post_id;
        if (str3 != null) {
            lv8.D(str3, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "ButtonClicked{", "}", null, 56);
    }

    public ButtonClicked() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ButtonClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.button_type = str;
        this.book_id = str2;
        this.edition_id = str3;
        this.post_id = str4;
    }
}
