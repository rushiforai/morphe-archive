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
import defpackage.aw5;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.zv5;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J_\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001cR\u001c\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010\u001c\u0012\u0004\b\u001e\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001c¨\u0006\""}, d2 = {"Lcom/medium/proto/model/IframeMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lzv5;", "", "media_resource_id", "", "iframe_width", "iframe_height", "external_src", "iframe_src", "thumbnail_url", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lzv5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/model/IframeMetadata;", "Ljava/lang/String;", "Ljava/lang/Integer;", "getIframe_src$annotations", "()V", "Companion", "aw5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class IframeMetadata extends AndroidMessage<IframeMetadata, zv5> {
    public static final ProtoAdapter<IframeMetadata> ADAPTER;
    public static final Parcelable.Creator<IframeMetadata> CREATOR;
    public static final aw5 Companion = new aw5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 5)
    public final String external_src;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer iframe_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 4)
    public final String iframe_src;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer iframe_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String media_resource_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String thumbnail_url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(IframeMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<IframeMetadata> protoAdapter = new ProtoAdapter<IframeMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.IframeMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final IframeMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new IframeMetadata(strDecode, numDecode, numDecode2, strDecode2, strDecode3, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 3:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, IframeMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 2, value.iframe_width);
                protoAdapter3.encodeWithTag(writer, 3, value.iframe_height);
                protoAdapter2.encodeWithTag(writer, 5, value.external_src);
                protoAdapter2.encodeWithTag(writer, 4, value.iframe_src);
                protoAdapter2.encodeWithTag(writer, 6, value.thumbnail_url);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(IframeMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.media_resource_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(6, value.thumbnail_url) + protoAdapter2.encodedSizeWithTag(4, value.iframe_src) + protoAdapter2.encodedSizeWithTag(5, value.external_src) + protoAdapter3.encodedSizeWithTag(3, value.iframe_height) + protoAdapter3.encodedSizeWithTag(2, value.iframe_width) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final IframeMetadata redact(IframeMetadata value) {
                value.getClass();
                return IframeMetadata.copy$default(value, null, null, null, null, null, null, h21.d, 63, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, IframeMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.thumbnail_url);
                protoAdapter2.encodeWithTag(writer, 4, value.iframe_src);
                protoAdapter2.encodeWithTag(writer, 5, value.external_src);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 3, value.iframe_height);
                protoAdapter3.encodeWithTag(writer, 2, value.iframe_width);
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ IframeMetadata(String str, Integer num, Integer num2, String str2, String str3, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ IframeMetadata copy$default(IframeMetadata iframeMetadata, String str, Integer num, Integer num2, String str2, String str3, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = iframeMetadata.media_resource_id;
        }
        if ((i & 2) != 0) {
            num = iframeMetadata.iframe_width;
        }
        if ((i & 4) != 0) {
            num2 = iframeMetadata.iframe_height;
        }
        if ((i & 8) != 0) {
            str2 = iframeMetadata.external_src;
        }
        if ((i & 16) != 0) {
            str3 = iframeMetadata.iframe_src;
        }
        if ((i & 32) != 0) {
            str4 = iframeMetadata.thumbnail_url;
        }
        if ((i & 64) != 0) {
            h21Var = iframeMetadata.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        String str6 = str3;
        Integer num3 = num2;
        return iframeMetadata.copy(str, num, num3, str2, str6, str5, h21Var2);
    }

    public final IframeMetadata copy(String media_resource_id, Integer iframe_width, Integer iframe_height, String external_src, String iframe_src, String thumbnail_url, h21 unknownFields) {
        unknownFields.getClass();
        return new IframeMetadata(media_resource_id, iframe_width, iframe_height, external_src, iframe_src, thumbnail_url, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof IframeMetadata)) {
            return false;
        }
        IframeMetadata iframeMetadata = (IframeMetadata) other;
        return g76.L(unknownFields(), iframeMetadata.unknownFields()) && g76.L(this.media_resource_id, iframeMetadata.media_resource_id) && g76.L(this.iframe_width, iframeMetadata.iframe_width) && g76.L(this.iframe_height, iframeMetadata.iframe_height) && g76.L(this.external_src, iframeMetadata.external_src) && g76.L(this.iframe_src, iframeMetadata.iframe_src) && g76.L(this.thumbnail_url, iframeMetadata.thumbnail_url);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.media_resource_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.iframe_width;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.iframe_height;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str2 = this.external_src;
        int iHashCode3 = (iIntValue2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.iframe_src;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.thumbnail_url;
        int iHashCode5 = iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final zv5 newBuilder() {
        zv5 zv5Var = new zv5();
        zv5Var.a = this.media_resource_id;
        zv5Var.b = this.iframe_width;
        zv5Var.c = this.iframe_height;
        zv5Var.d = this.external_src;
        zv5Var.e = this.iframe_src;
        zv5Var.f = this.thumbnail_url;
        zv5Var.addUnknownFields(unknownFields());
        return zv5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.media_resource_id;
        if (str != null) {
            lv8.D(str, "media_resource_id=", arrayList);
        }
        Integer num = this.iframe_width;
        if (num != null) {
            lv8.B("iframe_width=", num, arrayList);
        }
        Integer num2 = this.iframe_height;
        if (num2 != null) {
            lv8.B("iframe_height=", num2, arrayList);
        }
        String str2 = this.external_src;
        if (str2 != null) {
            lv8.D(str2, "external_src=", arrayList);
        }
        String str3 = this.iframe_src;
        if (str3 != null) {
            lv8.D(str3, "iframe_src=", arrayList);
        }
        String str4 = this.thumbnail_url;
        if (str4 != null) {
            lv8.D(str4, "thumbnail_url=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "IframeMetadata{", "}", null, 56);
    }

    public static /* synthetic */ void getIframe_src$annotations() {
    }

    public IframeMetadata() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public IframeMetadata(String str, Integer num, Integer num2, String str2, String str3, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.media_resource_id = str;
        this.iframe_width = num;
        this.iframe_height = num2;
        this.external_src = str2;
        this.iframe_src = str3;
        this.thumbnail_url = str4;
    }
}
