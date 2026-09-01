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
import defpackage.wg6;
import defpackage.x5e;
import defpackage.y5e;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\u0018\u0000 \"2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002#Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJw\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001eR\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u0012\u0004\b\u001f\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010!R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001eR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010!R\u0016\u0010\f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010!¨\u0006$"}, d2 = {"Lgen/model/UploadInfo;", "Lcom/squareup/wire/AndroidMessage;", "Lx5e;", "", "file_id", "md5", "bucket", "mime_type", "", "file_size", "file_name", "img_width", "img_height", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lx5e;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)Lgen/model/UploadInfo;", "Ljava/lang/String;", "getBucket$annotations", "()V", "Ljava/lang/Integer;", "Companion", "y5e", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UploadInfo extends AndroidMessage<UploadInfo, x5e> {
    public static final ProtoAdapter<UploadInfo> ADAPTER;
    public static final Parcelable.Creator<UploadInfo> CREATOR;
    public static final y5e Companion = new y5e();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String bucket;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String file_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String file_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 5)
    public final Integer file_size;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 7, tag = 8)
    public final Integer img_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 6, tag = 7)
    public final Integer img_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String md5;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String mime_type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UploadInfo.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UploadInfo> protoAdapter = new ProtoAdapter<UploadInfo>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UploadInfo$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UploadInfo decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                Integer numDecode = null;
                String strDecode5 = null;
                Integer numDecode2 = null;
                Integer numDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UploadInfo(strDecode, strDecode2, strDecode3, strDecode4, numDecode, strDecode5, numDecode2, numDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 8:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UploadInfo value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.file_id);
                protoAdapter2.encodeWithTag(writer, 2, value.md5);
                protoAdapter2.encodeWithTag(writer, 3, value.bucket);
                protoAdapter2.encodeWithTag(writer, 4, value.mime_type);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 5, value.file_size);
                protoAdapter2.encodeWithTag(writer, 6, value.file_name);
                protoAdapter3.encodeWithTag(writer, 7, value.img_width);
                protoAdapter3.encodeWithTag(writer, 8, value.img_height);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UploadInfo value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(4, value.mime_type) + protoAdapter2.encodedSizeWithTag(3, value.bucket) + protoAdapter2.encodedSizeWithTag(2, value.md5) + protoAdapter2.encodedSizeWithTag(1, value.file_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                return protoAdapter3.encodedSizeWithTag(8, value.img_height) + protoAdapter3.encodedSizeWithTag(7, value.img_width) + protoAdapter2.encodedSizeWithTag(6, value.file_name) + protoAdapter3.encodedSizeWithTag(5, value.file_size) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UploadInfo redact(UploadInfo value) {
                value.getClass();
                return UploadInfo.copy$default(value, null, null, null, null, null, null, null, null, h21.d, 255, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UploadInfo value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 8, value.img_height);
                protoAdapter2.encodeWithTag(writer, 7, value.img_width);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 6, value.file_name);
                protoAdapter2.encodeWithTag(writer, 5, value.file_size);
                protoAdapter3.encodeWithTag(writer, 4, value.mime_type);
                protoAdapter3.encodeWithTag(writer, 3, value.bucket);
                protoAdapter3.encodeWithTag(writer, 2, value.md5);
                protoAdapter3.encodeWithTag(writer, 1, value.file_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UploadInfo(String str, String str2, String str3, String str4, Integer num, String str5, Integer num2, Integer num3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : num, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : num2, (i & 128) != 0 ? null : num3, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UploadInfo copy$default(UploadInfo uploadInfo, String str, String str2, String str3, String str4, Integer num, String str5, Integer num2, Integer num3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = uploadInfo.file_id;
        }
        if ((i & 2) != 0) {
            str2 = uploadInfo.md5;
        }
        if ((i & 4) != 0) {
            str3 = uploadInfo.bucket;
        }
        if ((i & 8) != 0) {
            str4 = uploadInfo.mime_type;
        }
        if ((i & 16) != 0) {
            num = uploadInfo.file_size;
        }
        if ((i & 32) != 0) {
            str5 = uploadInfo.file_name;
        }
        if ((i & 64) != 0) {
            num2 = uploadInfo.img_width;
        }
        if ((i & 128) != 0) {
            num3 = uploadInfo.img_height;
        }
        if ((i & 256) != 0) {
            h21Var = uploadInfo.unknownFields();
        }
        Integer num4 = num3;
        h21 h21Var2 = h21Var;
        String str6 = str5;
        Integer num5 = num2;
        Integer num6 = num;
        String str7 = str3;
        return uploadInfo.copy(str, str2, str7, str4, num6, str6, num5, num4, h21Var2);
    }

    public final UploadInfo copy(String file_id, String md5, String bucket, String mime_type, Integer file_size, String file_name, Integer img_width, Integer img_height, h21 unknownFields) {
        unknownFields.getClass();
        return new UploadInfo(file_id, md5, bucket, mime_type, file_size, file_name, img_width, img_height, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UploadInfo)) {
            return false;
        }
        UploadInfo uploadInfo = (UploadInfo) other;
        return g76.L(unknownFields(), uploadInfo.unknownFields()) && g76.L(this.file_id, uploadInfo.file_id) && g76.L(this.md5, uploadInfo.md5) && g76.L(this.bucket, uploadInfo.bucket) && g76.L(this.mime_type, uploadInfo.mime_type) && g76.L(this.file_size, uploadInfo.file_size) && g76.L(this.file_name, uploadInfo.file_name) && g76.L(this.img_width, uploadInfo.img_width) && g76.L(this.img_height, uploadInfo.img_height);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.file_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.md5;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.bucket;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.mime_type;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Integer num = this.file_size;
        int iIntValue = (iHashCode5 + (num != null ? num.intValue() : 0)) * 37;
        String str5 = this.file_name;
        int iHashCode6 = (iIntValue + (str5 != null ? str5.hashCode() : 0)) * 37;
        Integer num2 = this.img_width;
        int iIntValue2 = (iHashCode6 + (num2 != null ? num2.intValue() : 0)) * 37;
        Integer num3 = this.img_height;
        int iIntValue3 = iIntValue2 + (num3 != null ? num3.intValue() : 0);
        this.hashCode = iIntValue3;
        return iIntValue3;
    }

    @Override // com.squareup.wire.Message
    public final x5e newBuilder() {
        x5e x5eVar = new x5e();
        x5eVar.a = this.file_id;
        x5eVar.b = this.md5;
        x5eVar.c = this.bucket;
        x5eVar.d = this.mime_type;
        x5eVar.e = this.file_size;
        x5eVar.f = this.file_name;
        x5eVar.g = this.img_width;
        x5eVar.h = this.img_height;
        x5eVar.addUnknownFields(unknownFields());
        return x5eVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.file_id;
        if (str != null) {
            lv8.D(str, "file_id=", arrayList);
        }
        String str2 = this.md5;
        if (str2 != null) {
            lv8.D(str2, "md5=", arrayList);
        }
        String str3 = this.bucket;
        if (str3 != null) {
            lv8.D(str3, "bucket=", arrayList);
        }
        String str4 = this.mime_type;
        if (str4 != null) {
            lv8.D(str4, "mime_type=", arrayList);
        }
        Integer num = this.file_size;
        if (num != null) {
            lv8.B("file_size=", num, arrayList);
        }
        String str5 = this.file_name;
        if (str5 != null) {
            lv8.D(str5, "file_name=", arrayList);
        }
        Integer num2 = this.img_width;
        if (num2 != null) {
            lv8.B("img_width=", num2, arrayList);
        }
        Integer num3 = this.img_height;
        if (num3 != null) {
            lv8.B("img_height=", num3, arrayList);
        }
        return bu1.F0(arrayList, ", ", "UploadInfo{", "}", null, 56);
    }

    public static /* synthetic */ void getBucket$annotations() {
    }

    public UploadInfo() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UploadInfo(String str, String str2, String str3, String str4, Integer num, String str5, Integer num2, Integer num3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.file_id = str;
        this.md5 = str2;
        this.bucket = str3;
        this.mime_type = str4;
        this.file_size = num;
        this.file_name = str5;
        this.img_width = num2;
        this.img_height = num3;
    }
}
