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
import defpackage.cte;
import defpackage.dte;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0016\u0010\u0017JG\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001a¨\u0006\u001e"}, d2 = {"Lgen/model/VideoMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lcte;", "", "video_id", "", "original_width", "original_height", "preview_image_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lcte;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lh21;)Lgen/model/VideoMetadata;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "dte", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class VideoMetadata extends AndroidMessage<VideoMetadata, cte> {
    public static final ProtoAdapter<VideoMetadata> ADAPTER;
    public static final Parcelable.Creator<VideoMetadata> CREATOR;
    public static final dte Companion = new dte();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer original_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer original_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String preview_image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String video_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(VideoMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<VideoMetadata> protoAdapter = new ProtoAdapter<VideoMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.VideoMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final VideoMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new VideoMetadata(strDecode, numDecode, numDecode2, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag == 3) {
                        numDecode2 = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, VideoMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.video_id);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 2, value.original_width);
                protoAdapter3.encodeWithTag(writer, 3, value.original_height);
                protoAdapter2.encodeWithTag(writer, 4, value.preview_image_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(VideoMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.video_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(4, value.preview_image_id) + protoAdapter3.encodedSizeWithTag(3, value.original_height) + protoAdapter3.encodedSizeWithTag(2, value.original_width) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final VideoMetadata redact(VideoMetadata value) {
                value.getClass();
                return VideoMetadata.copy$default(value, null, null, null, null, h21.d, 15, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, VideoMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.preview_image_id);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 3, value.original_height);
                protoAdapter3.encodeWithTag(writer, 2, value.original_width);
                protoAdapter2.encodeWithTag(writer, 1, value.video_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ VideoMetadata(String str, Integer num, Integer num2, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ VideoMetadata copy$default(VideoMetadata videoMetadata, String str, Integer num, Integer num2, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = videoMetadata.video_id;
        }
        if ((i & 2) != 0) {
            num = videoMetadata.original_width;
        }
        if ((i & 4) != 0) {
            num2 = videoMetadata.original_height;
        }
        if ((i & 8) != 0) {
            str2 = videoMetadata.preview_image_id;
        }
        if ((i & 16) != 0) {
            h21Var = videoMetadata.unknownFields();
        }
        h21 h21Var2 = h21Var;
        Integer num3 = num2;
        return videoMetadata.copy(str, num, num3, str2, h21Var2);
    }

    public final VideoMetadata copy(String video_id, Integer original_width, Integer original_height, String preview_image_id, h21 unknownFields) {
        unknownFields.getClass();
        return new VideoMetadata(video_id, original_width, original_height, preview_image_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof VideoMetadata)) {
            return false;
        }
        VideoMetadata videoMetadata = (VideoMetadata) other;
        return g76.L(unknownFields(), videoMetadata.unknownFields()) && g76.L(this.video_id, videoMetadata.video_id) && g76.L(this.original_width, videoMetadata.original_width) && g76.L(this.original_height, videoMetadata.original_height) && g76.L(this.preview_image_id, videoMetadata.preview_image_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.video_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.original_width;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.original_height;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str2 = this.preview_image_id;
        int iHashCode3 = iIntValue2 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final cte newBuilder() {
        cte cteVar = new cte();
        cteVar.a = this.video_id;
        cteVar.b = this.original_width;
        cteVar.c = this.original_height;
        cteVar.d = this.preview_image_id;
        cteVar.addUnknownFields(unknownFields());
        return cteVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.video_id;
        if (str != null) {
            lv8.D(str, "video_id=", arrayList);
        }
        Integer num = this.original_width;
        if (num != null) {
            lv8.B("original_width=", num, arrayList);
        }
        Integer num2 = this.original_height;
        if (num2 != null) {
            lv8.B("original_height=", num2, arrayList);
        }
        String str2 = this.preview_image_id;
        if (str2 != null) {
            lv8.D(str2, "preview_image_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "VideoMetadata{", "}", null, 56);
    }

    public VideoMetadata() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public VideoMetadata(String str, Integer num, Integer num2, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.video_id = str;
        this.original_width = num;
        this.original_height = num2;
        this.preview_image_id = str2;
    }
}
