package gen.model;

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
import defpackage.f85;
import defpackage.g76;
import defpackage.g85;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB9\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J?\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001cR\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001d¨\u0006 "}, d2 = {"Lgen/model/GeoCountryBlock;", "Lcom/squareup/wire/AndroidMessage;", "Lf85;", "Lgen/model/GeoBlockType;", "block_type", "", "", "blocked_country_codes", "chilling_effects_id", "Lh21;", "unknownFields", "<init>", "(Lgen/model/GeoBlockType;Ljava/util/List;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lf85;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/GeoBlockType;Ljava/util/List;Ljava/lang/String;Lh21;)Lgen/model/GeoCountryBlock;", "Lgen/model/GeoBlockType;", "Ljava/lang/String;", "Ljava/util/List;", "Companion", "g85", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GeoCountryBlock extends AndroidMessage<GeoCountryBlock, f85> {
    public static final ProtoAdapter<GeoCountryBlock> ADAPTER;
    public static final Parcelable.Creator<GeoCountryBlock> CREATOR;
    public static final g85 Companion = new g85();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.GeoBlockType#ADAPTER", schemaIndex = 0, tag = 1)
    public final GeoBlockType block_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<String> blocked_country_codes;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String chilling_effects_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(GeoCountryBlock.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<GeoCountryBlock> protoAdapter = new ProtoAdapter<GeoCountryBlock>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.GeoCountryBlock$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final GeoCountryBlock decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                GeoBlockType geoBlockTypeDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new GeoCountryBlock(geoBlockTypeDecode, arrayListF, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        try {
                            geoBlockTypeDecode = GeoBlockType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag == 2) {
                        arrayListF.add(ProtoAdapter.STRING.decode(reader));
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, GeoCountryBlock value) {
                writer.getClass();
                value.getClass();
                GeoBlockType.ADAPTER.encodeWithTag(writer, 1, value.block_type);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.asRepeated().encodeWithTag(writer, 2, value.blocked_country_codes);
                protoAdapter2.encodeWithTag(writer, 3, value.chilling_effects_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(GeoCountryBlock value) {
                value.getClass();
                int iEncodedSizeWithTag = GeoBlockType.ADAPTER.encodedSizeWithTag(1, value.block_type) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(3, value.chilling_effects_id) + protoAdapter2.asRepeated().encodedSizeWithTag(2, value.blocked_country_codes) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final GeoCountryBlock redact(GeoCountryBlock value) {
                value.getClass();
                return GeoCountryBlock.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, GeoCountryBlock value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.chilling_effects_id);
                protoAdapter2.asRepeated().encodeWithTag(writer, 2, value.blocked_country_codes);
                GeoBlockType.ADAPTER.encodeWithTag(writer, 1, value.block_type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ GeoCountryBlock(GeoBlockType geoBlockType, List list, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : geoBlockType, (i & 2) != 0 ? ey3.a : list, (i & 4) != 0 ? null : str, (i & 8) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ GeoCountryBlock copy$default(GeoCountryBlock geoCountryBlock, GeoBlockType geoBlockType, List list, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            geoBlockType = geoCountryBlock.block_type;
        }
        if ((i & 2) != 0) {
            list = geoCountryBlock.blocked_country_codes;
        }
        if ((i & 4) != 0) {
            str = geoCountryBlock.chilling_effects_id;
        }
        if ((i & 8) != 0) {
            h21Var = geoCountryBlock.unknownFields();
        }
        return geoCountryBlock.copy(geoBlockType, list, str, h21Var);
    }

    public final GeoCountryBlock copy(GeoBlockType block_type, List<String> blocked_country_codes, String chilling_effects_id, h21 unknownFields) {
        blocked_country_codes.getClass();
        unknownFields.getClass();
        return new GeoCountryBlock(block_type, blocked_country_codes, chilling_effects_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof GeoCountryBlock)) {
            return false;
        }
        GeoCountryBlock geoCountryBlock = (GeoCountryBlock) other;
        return g76.L(unknownFields(), geoCountryBlock.unknownFields()) && this.block_type == geoCountryBlock.block_type && g76.L(this.blocked_country_codes, geoCountryBlock.blocked_country_codes) && g76.L(this.chilling_effects_id, geoCountryBlock.chilling_effects_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        GeoBlockType geoBlockType = this.block_type;
        int iP = wgd.p((iHashCode + (geoBlockType != null ? geoBlockType.hashCode() : 0)) * 37, 37, this.blocked_country_codes);
        String str = this.chilling_effects_id;
        int iHashCode2 = iP + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final f85 newBuilder() {
        f85 f85Var = new f85();
        f85Var.b = ey3.a;
        f85Var.a = this.block_type;
        f85Var.b = this.blocked_country_codes;
        f85Var.c = this.chilling_effects_id;
        f85Var.addUnknownFields(unknownFields());
        return f85Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        GeoBlockType geoBlockType = this.block_type;
        if (geoBlockType != null) {
            arrayList.add("block_type=" + geoBlockType);
        }
        if (!this.blocked_country_codes.isEmpty()) {
            arrayList.add("blocked_country_codes=".concat(Internal.sanitize(this.blocked_country_codes)));
        }
        String str = this.chilling_effects_id;
        if (str != null) {
            lv8.D(str, "chilling_effects_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "GeoCountryBlock{", "}", null, 56);
    }

    public GeoCountryBlock() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GeoCountryBlock(GeoBlockType geoBlockType, List<String> list, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.block_type = geoBlockType;
        this.chilling_effects_id = str;
        this.blocked_country_codes = Internal.immutableCopyOf("blocked_country_codes", list);
    }
}
