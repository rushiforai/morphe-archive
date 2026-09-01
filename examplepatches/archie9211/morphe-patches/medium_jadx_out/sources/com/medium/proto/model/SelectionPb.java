package com.medium.proto.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.kxb;
import defpackage.lv8;
import defpackage.lxb;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB9\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00062\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JC\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0014\u0010\u0005\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001bR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/model/SelectionPb;", "Lcom/squareup/wire/AndroidMessage;", "Lkxb;", "Lcom/medium/proto/model/SelectionPoint;", "start", "end", "", "is_reversed", "is_invalid", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/model/SelectionPoint;Lcom/medium/proto/model/SelectionPoint;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lkxb;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/model/SelectionPoint;Lcom/medium/proto/model/SelectionPoint;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/model/SelectionPb;", "Lcom/medium/proto/model/SelectionPoint;", "Ljava/lang/Boolean;", "Companion", "lxb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SelectionPb extends AndroidMessage<SelectionPb, kxb> {
    public static final ProtoAdapter<SelectionPb> ADAPTER;
    public static final Parcelable.Creator<SelectionPb> CREATOR;
    public static final lxb Companion = new lxb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.model.SelectionPoint#ADAPTER", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final SelectionPoint end;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 4)
    public final Boolean is_invalid;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean is_reversed;

    @WireField(adapter = "com.medium.proto.model.SelectionPoint#ADAPTER", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final SelectionPoint start;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SelectionPb.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SelectionPb> protoAdapter = new ProtoAdapter<SelectionPb>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.SelectionPb$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SelectionPb decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                SelectionPoint selectionPointDecode = null;
                SelectionPoint selectionPointDecode2 = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        break;
                    }
                    if (iNextTag == 1) {
                        selectionPointDecode = SelectionPoint.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        selectionPointDecode2 = SelectionPoint.ADAPTER.decode(reader);
                    } else if (iNextTag == 3) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                    }
                }
                h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                SelectionPoint selectionPoint = selectionPointDecode;
                if (selectionPoint == null) {
                    Internal.missingRequiredFields(selectionPointDecode, "start");
                    throw null;
                }
                SelectionPoint selectionPoint2 = selectionPointDecode2;
                if (selectionPoint2 != null) {
                    return new SelectionPb(selectionPoint, selectionPoint2, boolDecode, boolDecode2, h21VarEndMessageAndGetUnknownFields);
                }
                Internal.missingRequiredFields(selectionPointDecode2, "end");
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SelectionPb value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<SelectionPoint> protoAdapter2 = SelectionPoint.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.start);
                protoAdapter2.encodeWithTag(writer, 2, value.end);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 3, value.is_reversed);
                protoAdapter3.encodeWithTag(writer, 4, value.is_invalid);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SelectionPb value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<SelectionPoint> protoAdapter2 = SelectionPoint.ADAPTER;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.end) + protoAdapter2.encodedSizeWithTag(1, value.start) + iE;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(4, value.is_invalid) + protoAdapter3.encodedSizeWithTag(3, value.is_reversed) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SelectionPb redact(SelectionPb value) {
                value.getClass();
                ProtoAdapter<SelectionPoint> protoAdapter2 = SelectionPoint.ADAPTER;
                return SelectionPb.copy$default(value, protoAdapter2.redact(value.start), protoAdapter2.redact(value.end), null, null, h21.d, 12, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SelectionPb value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 4, value.is_invalid);
                protoAdapter2.encodeWithTag(writer, 3, value.is_reversed);
                ProtoAdapter<SelectionPoint> protoAdapter3 = SelectionPoint.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 2, value.end);
                protoAdapter3.encodeWithTag(writer, 1, value.start);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SelectionPb(SelectionPoint selectionPoint, SelectionPoint selectionPoint2, Boolean bool, Boolean bool2, h21 h21Var) {
        super(ADAPTER, h21Var);
        selectionPoint.getClass();
        selectionPoint2.getClass();
        h21Var.getClass();
        this.start = selectionPoint;
        this.end = selectionPoint2;
        this.is_reversed = bool;
        this.is_invalid = bool2;
    }

    public static /* synthetic */ SelectionPb copy$default(SelectionPb selectionPb, SelectionPoint selectionPoint, SelectionPoint selectionPoint2, Boolean bool, Boolean bool2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            selectionPoint = selectionPb.start;
        }
        if ((i & 2) != 0) {
            selectionPoint2 = selectionPb.end;
        }
        if ((i & 4) != 0) {
            bool = selectionPb.is_reversed;
        }
        if ((i & 8) != 0) {
            bool2 = selectionPb.is_invalid;
        }
        if ((i & 16) != 0) {
            h21Var = selectionPb.unknownFields();
        }
        h21 h21Var2 = h21Var;
        Boolean bool3 = bool;
        return selectionPb.copy(selectionPoint, selectionPoint2, bool3, bool2, h21Var2);
    }

    public final SelectionPb copy(SelectionPoint start, SelectionPoint end, Boolean is_reversed, Boolean is_invalid, h21 unknownFields) {
        start.getClass();
        end.getClass();
        unknownFields.getClass();
        return new SelectionPb(start, end, is_reversed, is_invalid, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SelectionPb)) {
            return false;
        }
        SelectionPb selectionPb = (SelectionPb) other;
        return g76.L(unknownFields(), selectionPb.unknownFields()) && g76.L(this.start, selectionPb.start) && g76.L(this.end, selectionPb.end) && g76.L(this.is_reversed, selectionPb.is_reversed) && g76.L(this.is_invalid, selectionPb.is_invalid);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = (this.end.hashCode() + ((this.start.hashCode() + (unknownFields().hashCode() * 37)) * 37)) * 37;
        Boolean bool = this.is_reversed;
        int i2 = (iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.is_invalid;
        int i3 = i2 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final kxb newBuilder() {
        kxb kxbVar = new kxb();
        kxbVar.a = this.start;
        kxbVar.b = this.end;
        kxbVar.c = this.is_reversed;
        kxbVar.d = this.is_invalid;
        kxbVar.addUnknownFields(unknownFields());
        return kxbVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        arrayList.add("start=" + this.start);
        arrayList.add("end=" + this.end);
        Boolean bool = this.is_reversed;
        if (bool != null) {
            lv8.A("is_reversed=", bool, arrayList);
        }
        Boolean bool2 = this.is_invalid;
        if (bool2 != null) {
            lv8.A("is_invalid=", bool2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "SelectionPb{", "}", null, 56);
    }

    public /* synthetic */ SelectionPb(SelectionPoint selectionPoint, SelectionPoint selectionPoint2, Boolean bool, Boolean bool2, h21 h21Var, int i, gy2 gy2Var) {
        this(selectionPoint, selectionPoint2, (i & 4) != 0 ? null : bool, (i & 8) != 0 ? null : bool2, (i & 16) != 0 ? h21.d : h21Var);
    }
}
