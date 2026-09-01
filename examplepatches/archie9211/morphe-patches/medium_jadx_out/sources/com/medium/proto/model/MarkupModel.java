package com.medium.proto.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
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
import defpackage.li7;
import defpackage.lv8;
import defpackage.mi7;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0012\b\u0007\u0018\u0000 +2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002,B\u0099\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b\u0012\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\b0\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0096\u0002¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\bH\u0016¢\u0006\u0004\b \u0010!J\u009f\u0001\u0010\"\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b2\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\b0\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\"\u0010#R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010$R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010%R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010%R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010&R\u0016\u0010\n\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010&R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010&R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010'R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010&R\u001c\u0010\u000f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010&\u0012\u0004\b(\u0010)R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010&R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\b0\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010*¨\u0006-"}, d2 = {"Lcom/medium/proto/model/MarkupModel;", "Lcom/squareup/wire/AndroidMessage;", "Lli7;", "Lcom/medium/proto/obv/post/MarkupType;", "type", "", "start", "end", "", "href", "title", "rel", "Lcom/medium/proto/obv/post/AnchorType;", "anchor_type", "name", "creator_id", "", "creator_ids", "user_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/obv/post/MarkupType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/obv/post/AnchorType;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lli7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/obv/post/MarkupType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/obv/post/AnchorType;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lh21;)Lcom/medium/proto/model/MarkupModel;", "Lcom/medium/proto/obv/post/MarkupType;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Lcom/medium/proto/obv/post/AnchorType;", "getCreator_id$annotations", "()V", "Ljava/util/List;", "Companion", "mi7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MarkupModel extends AndroidMessage<MarkupModel, li7> {
    public static final ProtoAdapter<MarkupModel> ADAPTER;
    public static final Parcelable.Creator<MarkupModel> CREATOR;
    public static final mi7 Companion = new mi7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.obv.post.AnchorType#ADAPTER", schemaIndex = 6, tag = 8)
    public final AnchorType anchor_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 9)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 9, tag = 10)
    public final List<String> creator_ids;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer end;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String href;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 7)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String rel;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer start;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String title;

    @WireField(adapter = "com.medium.proto.obv.post.MarkupType#ADAPTER", schemaIndex = 0, tag = 1)
    public final MarkupType type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MarkupModel.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MarkupModel> protoAdapter = new ProtoAdapter<MarkupModel>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.MarkupModel$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MarkupModel decode(ProtoReader reader) {
                MarkupType markupType;
                Integer num;
                Integer num2;
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                MarkupType markupTypeDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                AnchorType anchorTypeDecode = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MarkupModel(markupTypeDecode, numDecode, numDecode2, strDecode, strDecode2, strDecode3, anchorTypeDecode, strDecode4, strDecode5, arrayListF, strDecode6, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            markupType = markupTypeDecode;
                            num = numDecode;
                            num2 = numDecode2;
                            try {
                                markupTypeDecode = MarkupType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                markupTypeDecode = markupType;
                            }
                            numDecode = num;
                            numDecode2 = num2;
                            break;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 3:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 4:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            try {
                                anchorTypeDecode = AnchorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                markupType = markupTypeDecode;
                                num = numDecode;
                                num2 = numDecode2;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                markupTypeDecode = markupType;
                                numDecode = num;
                                numDecode2 = num2;
                            }
                            break;
                        case 9:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 10:
                            arrayListF.add(ProtoAdapter.STRING.decode(reader));
                            markupType = markupTypeDecode;
                            num = numDecode;
                            num2 = numDecode2;
                            markupTypeDecode = markupType;
                            numDecode = num;
                            numDecode2 = num2;
                            break;
                        case 11:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            markupType = markupTypeDecode;
                            num = numDecode;
                            num2 = numDecode2;
                            markupTypeDecode = markupType;
                            numDecode = num;
                            numDecode2 = num2;
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MarkupModel value) {
                writer.getClass();
                value.getClass();
                MarkupType.ADAPTER.encodeWithTag(writer, 1, value.type);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 2, value.start);
                protoAdapter2.encodeWithTag(writer, 3, value.end);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 4, value.href);
                protoAdapter3.encodeWithTag(writer, 5, value.title);
                protoAdapter3.encodeWithTag(writer, 6, value.rel);
                AnchorType.ADAPTER.encodeWithTag(writer, 8, value.anchor_type);
                protoAdapter3.encodeWithTag(writer, 7, value.name);
                protoAdapter3.encodeWithTag(writer, 9, value.creator_id);
                protoAdapter3.asRepeated().encodeWithTag(writer, 10, value.creator_ids);
                protoAdapter3.encodeWithTag(writer, 11, value.user_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MarkupModel value) {
                value.getClass();
                int iEncodedSizeWithTag = MarkupType.ADAPTER.encodedSizeWithTag(1, value.type) + value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(3, value.end) + protoAdapter2.encodedSizeWithTag(2, value.start) + iEncodedSizeWithTag;
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                return protoAdapter3.encodedSizeWithTag(11, value.user_id) + protoAdapter3.asRepeated().encodedSizeWithTag(10, value.creator_ids) + protoAdapter3.encodedSizeWithTag(9, value.creator_id) + protoAdapter3.encodedSizeWithTag(7, value.name) + AnchorType.ADAPTER.encodedSizeWithTag(8, value.anchor_type) + protoAdapter3.encodedSizeWithTag(6, value.rel) + protoAdapter3.encodedSizeWithTag(5, value.title) + protoAdapter3.encodedSizeWithTag(4, value.href) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MarkupModel redact(MarkupModel value) {
                value.getClass();
                return MarkupModel.copy$default(value, null, null, null, null, null, null, null, null, null, null, null, h21.d, 2047, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MarkupModel value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 11, value.user_id);
                protoAdapter2.asRepeated().encodeWithTag(writer, 10, value.creator_ids);
                protoAdapter2.encodeWithTag(writer, 9, value.creator_id);
                protoAdapter2.encodeWithTag(writer, 7, value.name);
                AnchorType.ADAPTER.encodeWithTag(writer, 8, value.anchor_type);
                protoAdapter2.encodeWithTag(writer, 6, value.rel);
                protoAdapter2.encodeWithTag(writer, 5, value.title);
                protoAdapter2.encodeWithTag(writer, 4, value.href);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 3, value.end);
                protoAdapter3.encodeWithTag(writer, 2, value.start);
                MarkupType.ADAPTER.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MarkupModel(MarkupType markupType, Integer num, Integer num2, String str, String str2, String str3, AnchorType anchorType, String str4, String str5, List list, String str6, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : markupType, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : str, (i & 16) != 0 ? null : str2, (i & 32) != 0 ? null : str3, (i & 64) != 0 ? null : anchorType, (i & 128) != 0 ? null : str4, (i & 256) != 0 ? null : str5, (i & 512) != 0 ? ey3.a : list, (i & 1024) != 0 ? null : str6, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ MarkupModel copy$default(MarkupModel markupModel, MarkupType markupType, Integer num, Integer num2, String str, String str2, String str3, AnchorType anchorType, String str4, String str5, List list, String str6, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            markupType = markupModel.type;
        }
        if ((i & 2) != 0) {
            num = markupModel.start;
        }
        if ((i & 4) != 0) {
            num2 = markupModel.end;
        }
        if ((i & 8) != 0) {
            str = markupModel.href;
        }
        if ((i & 16) != 0) {
            str2 = markupModel.title;
        }
        if ((i & 32) != 0) {
            str3 = markupModel.rel;
        }
        if ((i & 64) != 0) {
            anchorType = markupModel.anchor_type;
        }
        if ((i & 128) != 0) {
            str4 = markupModel.name;
        }
        if ((i & 256) != 0) {
            str5 = markupModel.creator_id;
        }
        if ((i & 512) != 0) {
            list = markupModel.creator_ids;
        }
        if ((i & 1024) != 0) {
            str6 = markupModel.user_id;
        }
        if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
            h21Var = markupModel.unknownFields();
        }
        String str7 = str6;
        h21 h21Var2 = h21Var;
        String str8 = str5;
        List list2 = list;
        AnchorType anchorType2 = anchorType;
        String str9 = str4;
        String str10 = str2;
        String str11 = str3;
        return markupModel.copy(markupType, num, num2, str, str10, str11, anchorType2, str9, str8, list2, str7, h21Var2);
    }

    public final MarkupModel copy(MarkupType type, Integer start, Integer end, String href, String title, String rel, AnchorType anchor_type, String name, String creator_id, List<String> creator_ids, String user_id, h21 unknownFields) {
        creator_ids.getClass();
        unknownFields.getClass();
        return new MarkupModel(type, start, end, href, title, rel, anchor_type, name, creator_id, creator_ids, user_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MarkupModel)) {
            return false;
        }
        MarkupModel markupModel = (MarkupModel) other;
        return g76.L(unknownFields(), markupModel.unknownFields()) && this.type == markupModel.type && g76.L(this.start, markupModel.start) && g76.L(this.end, markupModel.end) && g76.L(this.href, markupModel.href) && g76.L(this.title, markupModel.title) && g76.L(this.rel, markupModel.rel) && this.anchor_type == markupModel.anchor_type && g76.L(this.name, markupModel.name) && g76.L(this.creator_id, markupModel.creator_id) && g76.L(this.creator_ids, markupModel.creator_ids) && g76.L(this.user_id, markupModel.user_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        MarkupType markupType = this.type;
        int iHashCode2 = (iHashCode + (markupType != null ? markupType.hashCode() : 0)) * 37;
        Integer num = this.start;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.end;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str = this.href;
        int iHashCode3 = (iIntValue2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.title;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.rel;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        AnchorType anchorType = this.anchor_type;
        int iHashCode6 = (iHashCode5 + (anchorType != null ? anchorType.hashCode() : 0)) * 37;
        String str4 = this.name;
        int iHashCode7 = (iHashCode6 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.creator_id;
        int iP = wgd.p((iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37, 37, this.creator_ids);
        String str6 = this.user_id;
        int iHashCode8 = iP + (str6 != null ? str6.hashCode() : 0);
        this.hashCode = iHashCode8;
        return iHashCode8;
    }

    @Override // com.squareup.wire.Message
    public final li7 newBuilder() {
        li7 li7Var = new li7();
        li7Var.a = this.type;
        li7Var.b = this.start;
        li7Var.c = this.end;
        li7Var.d = this.href;
        li7Var.e = this.title;
        li7Var.f = this.rel;
        li7Var.g = this.anchor_type;
        li7Var.h = this.name;
        li7Var.i = this.creator_id;
        li7Var.j = this.creator_ids;
        li7Var.k = this.user_id;
        li7Var.addUnknownFields(unknownFields());
        return li7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        MarkupType markupType = this.type;
        if (markupType != null) {
            arrayList.add("type=" + markupType);
        }
        Integer num = this.start;
        if (num != null) {
            lv8.B("start=", num, arrayList);
        }
        Integer num2 = this.end;
        if (num2 != null) {
            lv8.B("end=", num2, arrayList);
        }
        String str = this.href;
        if (str != null) {
            lv8.D(str, "href=", arrayList);
        }
        String str2 = this.title;
        if (str2 != null) {
            lv8.D(str2, "title=", arrayList);
        }
        String str3 = this.rel;
        if (str3 != null) {
            lv8.D(str3, "rel=", arrayList);
        }
        AnchorType anchorType = this.anchor_type;
        if (anchorType != null) {
            arrayList.add("anchor_type=" + anchorType);
        }
        String str4 = this.name;
        if (str4 != null) {
            lv8.D(str4, "name=", arrayList);
        }
        String str5 = this.creator_id;
        if (str5 != null) {
            lv8.D(str5, "creator_id=", arrayList);
        }
        if (!this.creator_ids.isEmpty()) {
            arrayList.add("creator_ids=".concat(Internal.sanitize(this.creator_ids)));
        }
        String str6 = this.user_id;
        if (str6 != null) {
            lv8.D(str6, "user_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MarkupModel{", "}", null, 56);
    }

    public static /* synthetic */ void getCreator_id$annotations() {
    }

    public MarkupModel() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, 4095, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MarkupModel(MarkupType markupType, Integer num, Integer num2, String str, String str2, String str3, AnchorType anchorType, String str4, String str5, List<String> list, String str6, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.type = markupType;
        this.start = num;
        this.end = num2;
        this.href = str;
        this.title = str2;
        this.rel = str3;
        this.anchor_type = anchorType;
        this.name = str4;
        this.creator_id = str5;
        this.user_id = str6;
        this.creator_ids = Internal.immutableCopyOf("creator_ids", list);
    }
}
