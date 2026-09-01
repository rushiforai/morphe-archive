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
import defpackage.bu1;
import defpackage.ds1;
import defpackage.es1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u000b\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0007\u0010\u001a\u0012\u0004\b\u001c\u0010\u001d¨\u0006 "}, d2 = {"Lgen/model/CollectionMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lds1;", "", "follower_count", "", "active_at", "post_count", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lds1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Integer;Lh21;)Lgen/model/CollectionMetadata;", "Ljava/lang/Integer;", "Ljava/lang/Long;", "getPost_count$annotations", "()V", "Companion", "es1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionMetadata extends AndroidMessage<CollectionMetadata, ds1> {
    public static final ProtoAdapter<CollectionMetadata> ADAPTER;
    public static final Parcelable.Creator<CollectionMetadata> CREATOR;
    public static final es1 Companion = new es1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 1, tag = 3)
    public final Long active_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 0, tag = 1)
    public final Integer follower_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 2)
    public final Integer post_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionMetadata> protoAdapter = new ProtoAdapter<CollectionMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Integer numDecode = null;
                Long lDecode = null;
                Integer numDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionMetadata(numDecode, lDecode, numDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode2 = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 1, value.follower_count);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.active_at);
                protoAdapter2.encodeWithTag(writer, 2, value.post_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(2, value.post_count) + ProtoAdapter.INT64.encodedSizeWithTag(3, value.active_at) + protoAdapter2.encodedSizeWithTag(1, value.follower_count) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionMetadata redact(CollectionMetadata value) {
                value.getClass();
                return CollectionMetadata.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 2, value.post_count);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.active_at);
                protoAdapter2.encodeWithTag(writer, 1, value.follower_count);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionMetadata(Integer num, Long l, Integer num2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : num, (i & 2) != 0 ? null : l, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionMetadata copy$default(CollectionMetadata collectionMetadata, Integer num, Long l, Integer num2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            num = collectionMetadata.follower_count;
        }
        if ((i & 2) != 0) {
            l = collectionMetadata.active_at;
        }
        if ((i & 4) != 0) {
            num2 = collectionMetadata.post_count;
        }
        if ((i & 8) != 0) {
            h21Var = collectionMetadata.unknownFields();
        }
        return collectionMetadata.copy(num, l, num2, h21Var);
    }

    public final CollectionMetadata copy(Integer follower_count, Long active_at, Integer post_count, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionMetadata(follower_count, active_at, post_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionMetadata)) {
            return false;
        }
        CollectionMetadata collectionMetadata = (CollectionMetadata) other;
        return g76.L(unknownFields(), collectionMetadata.unknownFields()) && g76.L(this.follower_count, collectionMetadata.follower_count) && g76.L(this.active_at, collectionMetadata.active_at) && g76.L(this.post_count, collectionMetadata.post_count);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Integer num = this.follower_count;
        int iIntValue = (iHashCode + (num != null ? num.intValue() : 0)) * 37;
        Long l = this.active_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i3 = (iIntValue + i) * 37;
        Integer num2 = this.post_count;
        int iIntValue2 = i3 + (num2 != null ? num2.intValue() : 0);
        this.hashCode = iIntValue2;
        return iIntValue2;
    }

    @Override // com.squareup.wire.Message
    public final ds1 newBuilder() {
        ds1 ds1Var = new ds1();
        ds1Var.a = this.follower_count;
        ds1Var.b = this.active_at;
        ds1Var.c = this.post_count;
        ds1Var.addUnknownFields(unknownFields());
        return ds1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Integer num = this.follower_count;
        if (num != null) {
            lv8.B("follower_count=", num, arrayList);
        }
        Long l = this.active_at;
        if (l != null) {
            y30.A("active_at=", l, arrayList);
        }
        Integer num2 = this.post_count;
        if (num2 != null) {
            lv8.B("post_count=", num2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionMetadata{", "}", null, 56);
    }

    public CollectionMetadata() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionMetadata(Integer num, Long l, Integer num2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.follower_count = num;
        this.active_at = l;
        this.post_count = num2;
    }

    public static /* synthetic */ void getPost_count$annotations() {
    }
}
