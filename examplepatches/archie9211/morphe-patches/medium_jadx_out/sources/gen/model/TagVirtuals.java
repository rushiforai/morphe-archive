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
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.rdd;
import defpackage.sdd;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\t\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0010\u001a\u00020\u00032\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J;\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001aR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u0019¨\u0006\u001d"}, d2 = {"Lgen/model/TagVirtuals;", "Lcom/squareup/wire/AndroidMessage;", "Lrdd;", "", "is_following", "", "new_top_stories_count", "has_top_writers", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lrdd;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Lh21;)Lgen/model/TagVirtuals;", "Ljava/lang/Boolean;", "Ljava/lang/Integer;", "Companion", "sdd", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class TagVirtuals extends AndroidMessage<TagVirtuals, rdd> {
    public static final ProtoAdapter<TagVirtuals> ADAPTER;
    public static final Parcelable.Creator<TagVirtuals> CREATOR;
    public static final sdd Companion = new sdd();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean has_top_writers;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 0, tag = 1)
    public final Boolean is_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer new_top_stories_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(TagVirtuals.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<TagVirtuals> protoAdapter = new ProtoAdapter<TagVirtuals>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.TagVirtuals$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final TagVirtuals decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Boolean boolDecode = null;
                Integer numDecode = null;
                Boolean boolDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new TagVirtuals(boolDecode, numDecode, boolDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, TagVirtuals value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 1, value.is_following);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.new_top_stories_count);
                protoAdapter2.encodeWithTag(writer, 3, value.has_top_writers);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(TagVirtuals value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(3, value.has_top_writers) + ProtoAdapter.INT32.encodedSizeWithTag(2, value.new_top_stories_count) + protoAdapter2.encodedSizeWithTag(1, value.is_following) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final TagVirtuals redact(TagVirtuals value) {
                value.getClass();
                return TagVirtuals.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, TagVirtuals value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 3, value.has_top_writers);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.new_top_stories_count);
                protoAdapter2.encodeWithTag(writer, 1, value.is_following);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ TagVirtuals(Boolean bool, Integer num, Boolean bool2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : bool2, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ TagVirtuals copy$default(TagVirtuals tagVirtuals, Boolean bool, Integer num, Boolean bool2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            bool = tagVirtuals.is_following;
        }
        if ((i & 2) != 0) {
            num = tagVirtuals.new_top_stories_count;
        }
        if ((i & 4) != 0) {
            bool2 = tagVirtuals.has_top_writers;
        }
        if ((i & 8) != 0) {
            h21Var = tagVirtuals.unknownFields();
        }
        return tagVirtuals.copy(bool, num, bool2, h21Var);
    }

    public final TagVirtuals copy(Boolean is_following, Integer new_top_stories_count, Boolean has_top_writers, h21 unknownFields) {
        unknownFields.getClass();
        return new TagVirtuals(is_following, new_top_stories_count, has_top_writers, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof TagVirtuals)) {
            return false;
        }
        TagVirtuals tagVirtuals = (TagVirtuals) other;
        return g76.L(unknownFields(), tagVirtuals.unknownFields()) && g76.L(this.is_following, tagVirtuals.is_following) && g76.L(this.new_top_stories_count, tagVirtuals.new_top_stories_count) && g76.L(this.has_top_writers, tagVirtuals.has_top_writers);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Boolean bool = this.is_following;
        int i2 = 0;
        int i3 = (iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Integer num = this.new_top_stories_count;
        int iIntValue = (i3 + (num != null ? num.intValue() : 0)) * 37;
        Boolean bool2 = this.has_top_writers;
        if (bool2 != null) {
            i2 = bool2.booleanValue() ? 1231 : 1237;
        }
        int i4 = iIntValue + i2;
        this.hashCode = i4;
        return i4;
    }

    @Override // com.squareup.wire.Message
    public final rdd newBuilder() {
        rdd rddVar = new rdd();
        rddVar.a = this.is_following;
        rddVar.b = this.new_top_stories_count;
        rddVar.c = this.has_top_writers;
        rddVar.addUnknownFields(unknownFields());
        return rddVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Boolean bool = this.is_following;
        if (bool != null) {
            lv8.A("is_following=", bool, arrayList);
        }
        Integer num = this.new_top_stories_count;
        if (num != null) {
            lv8.B("new_top_stories_count=", num, arrayList);
        }
        Boolean bool2 = this.has_top_writers;
        if (bool2 != null) {
            lv8.A("has_top_writers=", bool2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "TagVirtuals{", "}", null, 56);
    }

    public TagVirtuals() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TagVirtuals(Boolean bool, Integer num, Boolean bool2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.is_following = bool;
        this.new_top_stories_count = num;
        this.has_top_writers = bool2;
    }
}
