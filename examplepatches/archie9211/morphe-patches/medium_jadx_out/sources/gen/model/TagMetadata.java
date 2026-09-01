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
import defpackage.g9d;
import defpackage.gy2;
import defpackage.h21;
import defpackage.h9d;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\t\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001aR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lgen/model/TagMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lg9d;", "", "follower_count", "post_count", "Lgen/model/ImageMetadata;", "cover_image", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Integer;Ljava/lang/Integer;Lgen/model/ImageMetadata;Lh21;)V", "newBuilder", "()Lg9d;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Integer;Ljava/lang/Integer;Lgen/model/ImageMetadata;Lh21;)Lgen/model/TagMetadata;", "Ljava/lang/Integer;", "Lgen/model/ImageMetadata;", "Companion", "h9d", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class TagMetadata extends AndroidMessage<TagMetadata, g9d> {
    public static final ProtoAdapter<TagMetadata> ADAPTER;
    public static final Parcelable.Creator<TagMetadata> CREATOR;
    public static final h9d Companion = new h9d();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 2, tag = 3)
    public final ImageMetadata cover_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 0, tag = 1)
    public final Integer follower_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer post_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(TagMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<TagMetadata> protoAdapter = new ProtoAdapter<TagMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.TagMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final TagMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Integer numDecode = null;
                Integer numDecode2 = null;
                ImageMetadata imageMetadataDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new TagMetadata(numDecode, numDecode2, imageMetadataDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode2 = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, TagMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 1, value.follower_count);
                protoAdapter2.encodeWithTag(writer, 2, value.post_count);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 3, value.cover_image);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(TagMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                return ImageMetadata.ADAPTER.encodedSizeWithTag(3, value.cover_image) + protoAdapter2.encodedSizeWithTag(2, value.post_count) + protoAdapter2.encodedSizeWithTag(1, value.follower_count) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final TagMetadata redact(TagMetadata value) {
                value.getClass();
                ImageMetadata imageMetadata = value.cover_image;
                return TagMetadata.copy$default(value, null, null, imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, TagMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ImageMetadata.ADAPTER.encodeWithTag(writer, 3, value.cover_image);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 2, value.post_count);
                protoAdapter2.encodeWithTag(writer, 1, value.follower_count);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ TagMetadata(Integer num, Integer num2, ImageMetadata imageMetadata, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : num, (i & 2) != 0 ? null : num2, (i & 4) != 0 ? null : imageMetadata, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ TagMetadata copy$default(TagMetadata tagMetadata, Integer num, Integer num2, ImageMetadata imageMetadata, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            num = tagMetadata.follower_count;
        }
        if ((i & 2) != 0) {
            num2 = tagMetadata.post_count;
        }
        if ((i & 4) != 0) {
            imageMetadata = tagMetadata.cover_image;
        }
        if ((i & 8) != 0) {
            h21Var = tagMetadata.unknownFields();
        }
        return tagMetadata.copy(num, num2, imageMetadata, h21Var);
    }

    public final TagMetadata copy(Integer follower_count, Integer post_count, ImageMetadata cover_image, h21 unknownFields) {
        unknownFields.getClass();
        return new TagMetadata(follower_count, post_count, cover_image, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof TagMetadata)) {
            return false;
        }
        TagMetadata tagMetadata = (TagMetadata) other;
        return g76.L(unknownFields(), tagMetadata.unknownFields()) && g76.L(this.follower_count, tagMetadata.follower_count) && g76.L(this.post_count, tagMetadata.post_count) && g76.L(this.cover_image, tagMetadata.cover_image);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Integer num = this.follower_count;
        int iIntValue = (iHashCode + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.post_count;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        ImageMetadata imageMetadata = this.cover_image;
        int iHashCode2 = iIntValue2 + (imageMetadata != null ? imageMetadata.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final g9d newBuilder() {
        g9d g9dVar = new g9d();
        g9dVar.a = this.follower_count;
        g9dVar.b = this.post_count;
        g9dVar.c = this.cover_image;
        g9dVar.addUnknownFields(unknownFields());
        return g9dVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Integer num = this.follower_count;
        if (num != null) {
            lv8.B("follower_count=", num, arrayList);
        }
        Integer num2 = this.post_count;
        if (num2 != null) {
            lv8.B("post_count=", num2, arrayList);
        }
        ImageMetadata imageMetadata = this.cover_image;
        if (imageMetadata != null) {
            arrayList.add("cover_image=" + imageMetadata);
        }
        return bu1.F0(arrayList, ", ", "TagMetadata{", "}", null, 56);
    }

    public TagMetadata() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TagMetadata(Integer num, Integer num2, ImageMetadata imageMetadata, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.follower_count = num;
        this.post_count = num2;
        this.cover_image = imageMetadata;
    }
}
