package com.medium.proto.model;

import android.os.Parcelable;
import com.medium.proto.obv.post.SelectionPointType;
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
import defpackage.mxb;
import defpackage.n1b;
import defpackage.nxb;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\t\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB)\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J5\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0014\u0010\u0007\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lcom/medium/proto/model/SelectionPoint;", "Lcom/squareup/wire/AndroidMessage;", "Lmxb;", "Lcom/medium/proto/obv/post/SelectionPointType;", "type", "", "paragraph_index", "offset", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/obv/post/SelectionPointType;IILh21;)V", "newBuilder", "()Lmxb;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/obv/post/SelectionPointType;IILh21;)Lcom/medium/proto/model/SelectionPoint;", "Lcom/medium/proto/obv/post/SelectionPointType;", "I", "Companion", "nxb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SelectionPoint extends AndroidMessage<SelectionPoint, mxb> {
    public static final ProtoAdapter<SelectionPoint> ADAPTER;
    public static final Parcelable.Creator<SelectionPoint> CREATOR;
    public static final nxb Companion = new nxb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REQUIRED, schemaIndex = 2, tag = 3)
    public final int offset;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final int paragraph_index;

    @WireField(adapter = "com.medium.proto.obv.post.SelectionPointType#ADAPTER", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final SelectionPointType type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SelectionPoint.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SelectionPoint> protoAdapter = new ProtoAdapter<SelectionPoint>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.SelectionPoint$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SelectionPoint decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                SelectionPointType selectionPointTypeDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        break;
                    }
                    if (iNextTag == 1) {
                        try {
                            selectionPointTypeDecode = SelectionPointType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode2 = ProtoAdapter.INT32.decode(reader);
                    }
                }
                h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                SelectionPointType selectionPointType = selectionPointTypeDecode;
                if (selectionPointType == null) {
                    Internal.missingRequiredFields(selectionPointTypeDecode, "type");
                    throw null;
                }
                Integer num = numDecode;
                if (num == null) {
                    Internal.missingRequiredFields(numDecode, "paragraph_index");
                    throw null;
                }
                int iIntValue = num.intValue();
                Integer num2 = numDecode2;
                if (num2 != null) {
                    return new SelectionPoint(selectionPointType, iIntValue, num2.intValue(), h21VarEndMessageAndGetUnknownFields);
                }
                Internal.missingRequiredFields(numDecode2, "offset");
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SelectionPoint value) {
                writer.getClass();
                value.getClass();
                SelectionPointType.ADAPTER.encodeWithTag(writer, 1, value.type);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 2, Integer.valueOf(value.paragraph_index));
                protoAdapter2.encodeWithTag(writer, 3, Integer.valueOf(value.offset));
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SelectionPoint value) {
                value.getClass();
                int iEncodedSizeWithTag = SelectionPointType.ADAPTER.encodedSizeWithTag(1, value.type) + value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(3, Integer.valueOf(value.offset)) + protoAdapter2.encodedSizeWithTag(2, Integer.valueOf(value.paragraph_index)) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SelectionPoint redact(SelectionPoint value) {
                value.getClass();
                return SelectionPoint.copy$default(value, null, 0, 0, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SelectionPoint value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 3, Integer.valueOf(value.offset));
                protoAdapter2.encodeWithTag(writer, 2, Integer.valueOf(value.paragraph_index));
                SelectionPointType.ADAPTER.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SelectionPoint(SelectionPointType selectionPointType, int i, int i2, h21 h21Var) {
        super(ADAPTER, h21Var);
        selectionPointType.getClass();
        h21Var.getClass();
        this.type = selectionPointType;
        this.paragraph_index = i;
        this.offset = i2;
    }

    public static /* synthetic */ SelectionPoint copy$default(SelectionPoint selectionPoint, SelectionPointType selectionPointType, int i, int i2, h21 h21Var, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            selectionPointType = selectionPoint.type;
        }
        if ((i3 & 2) != 0) {
            i = selectionPoint.paragraph_index;
        }
        if ((i3 & 4) != 0) {
            i2 = selectionPoint.offset;
        }
        if ((i3 & 8) != 0) {
            h21Var = selectionPoint.unknownFields();
        }
        return selectionPoint.copy(selectionPointType, i, i2, h21Var);
    }

    public final SelectionPoint copy(SelectionPointType type, int paragraph_index, int offset, h21 unknownFields) {
        type.getClass();
        unknownFields.getClass();
        return new SelectionPoint(type, paragraph_index, offset, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SelectionPoint)) {
            return false;
        }
        SelectionPoint selectionPoint = (SelectionPoint) other;
        return g76.L(unknownFields(), selectionPoint.unknownFields()) && this.type == selectionPoint.type && this.paragraph_index == selectionPoint.paragraph_index && this.offset == selectionPoint.offset;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = ((((this.type.hashCode() + (unknownFields().hashCode() * 37)) * 37) + this.paragraph_index) * 37) + this.offset;
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final mxb newBuilder() {
        mxb mxbVar = new mxb();
        mxbVar.a = this.type;
        mxbVar.b = Integer.valueOf(this.paragraph_index);
        mxbVar.c = Integer.valueOf(this.offset);
        mxbVar.addUnknownFields(unknownFields());
        return mxbVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        arrayList.add("type=" + this.type);
        arrayList.add("paragraph_index=" + this.paragraph_index);
        arrayList.add("offset=" + this.offset);
        return bu1.F0(arrayList, ", ", "SelectionPoint{", "}", null, 56);
    }

    public /* synthetic */ SelectionPoint(SelectionPointType selectionPointType, int i, int i2, h21 h21Var, int i3, gy2 gy2Var) {
        this(selectionPointType, i, i2, (i3 & 8) != 0 ? h21.d : h21Var);
    }
}
