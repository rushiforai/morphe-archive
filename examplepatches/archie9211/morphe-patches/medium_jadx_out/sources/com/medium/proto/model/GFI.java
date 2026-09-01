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
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.h65;
import defpackage.i65;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB9\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J?\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001bR\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/model/GFI;", "Lcom/squareup/wire/AndroidMessage;", "Lh65;", "", "asset", "", "", "tag_indices", "string_offset", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lh65;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/model/GFI;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/util/List;", "Companion", "i65", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GFI extends AndroidMessage<GFI, h65> {
    public static final ProtoAdapter<GFI> ADAPTER;
    public static final Parcelable.Creator<GFI> CREATOR;
    public static final i65 Companion = new i65();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String asset;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#UINT32", schemaIndex = 2, tag = 3)
    public final Integer string_offset;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#UINT32", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<Integer> tag_indices;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(GFI.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<GFI> protoAdapter = new ProtoAdapter<GFI>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.GFI$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final GFI decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new GFI(strDecode, arrayListF, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        arrayListF.add(ProtoAdapter.UINT32.decode(reader));
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode = ProtoAdapter.UINT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, GFI value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.asset);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.UINT32;
                protoAdapter2.asRepeated().encodeWithTag(writer, 2, value.tag_indices);
                protoAdapter2.encodeWithTag(writer, 3, value.string_offset);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(GFI value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.STRING.encodedSizeWithTag(1, value.asset) + value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.UINT32;
                return protoAdapter2.encodedSizeWithTag(3, value.string_offset) + protoAdapter2.asRepeated().encodedSizeWithTag(2, value.tag_indices) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final GFI redact(GFI value) {
                value.getClass();
                return GFI.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, GFI value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.UINT32;
                protoAdapter2.encodeWithTag(writer, 3, value.string_offset);
                protoAdapter2.asRepeated().encodeWithTag(writer, 2, value.tag_indices);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.asset);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ GFI(String str, List list, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? ey3.a : list, (i & 4) != 0 ? null : num, (i & 8) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ GFI copy$default(GFI gfi, String str, List list, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = gfi.asset;
        }
        if ((i & 2) != 0) {
            list = gfi.tag_indices;
        }
        if ((i & 4) != 0) {
            num = gfi.string_offset;
        }
        if ((i & 8) != 0) {
            h21Var = gfi.unknownFields();
        }
        return gfi.copy(str, list, num, h21Var);
    }

    public final GFI copy(String asset, List<Integer> tag_indices, Integer string_offset, h21 unknownFields) {
        tag_indices.getClass();
        unknownFields.getClass();
        return new GFI(asset, tag_indices, string_offset, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof GFI)) {
            return false;
        }
        GFI gfi = (GFI) other;
        return g76.L(unknownFields(), gfi.unknownFields()) && g76.L(this.asset, gfi.asset) && g76.L(this.tag_indices, gfi.tag_indices) && g76.L(this.string_offset, gfi.string_offset);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.asset;
        int iP = wgd.p((iHashCode + (str != null ? str.hashCode() : 0)) * 37, 37, this.tag_indices);
        Integer num = this.string_offset;
        int iIntValue = iP + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final h65 newBuilder() {
        h65 h65Var = new h65();
        h65Var.b = ey3.a;
        h65Var.a = this.asset;
        h65Var.b = this.tag_indices;
        h65Var.c = this.string_offset;
        h65Var.addUnknownFields(unknownFields());
        return h65Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.asset;
        if (str != null) {
            lv8.D(str, "asset=", arrayList);
        }
        if (!this.tag_indices.isEmpty()) {
            b09.J("tag_indices=", this.tag_indices, arrayList);
        }
        Integer num = this.string_offset;
        if (num != null) {
            lv8.B("string_offset=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "GFI{", "}", null, 56);
    }

    public GFI() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GFI(String str, List<Integer> list, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.asset = str;
        this.string_offset = num;
        this.tag_indices = Internal.immutableCopyOf("tag_indices", list);
    }
}
