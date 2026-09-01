package com.medium.proto.model;

import android.os.Parcelable;
import com.medium.proto.obv.post.ColorType;
import com.medium.proto.obv.post.SectionImageLayout;
import com.medium.proto.obv.post.SectionTextLayout;
import com.medium.proto.obv.post.SectionType;
import com.medium.proto.obv.post.SectionVideoLayout;
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
import defpackage.ivb;
import defpackage.jvb;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import gen.model.ImageMetadata;
import gen.model.VideoMetadata;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0014\b\u0007\u0018\u0000 /2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00020By\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u001a\u0010\u001e\u001a\u00020\u001d2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0096\u0002¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0005H\u0016¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\"\u0010#J\u0081\u0001\u0010$\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b$\u0010%R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010&R\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010'R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010(R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010)R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010*R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010+R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010,R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010-R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010.¨\u00061"}, d2 = {"Lcom/medium/proto/model/SectionModel;", "Lcom/squareup/wire/AndroidMessage;", "Livb;", "", "name", "", "start_index", "Lgen/model/ImageMetadata;", "background_image", "Lgen/model/VideoMetadata;", "background_video", "Lcom/medium/proto/obv/post/SectionTextLayout;", "text_layout", "Lcom/medium/proto/obv/post/SectionImageLayout;", "image_layout", "Lcom/medium/proto/obv/post/SectionVideoLayout;", "video_layout", "Lcom/medium/proto/obv/post/ColorType;", "background_color", "Lcom/medium/proto/obv/post/SectionType;", "type", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;ILgen/model/ImageMetadata;Lgen/model/VideoMetadata;Lcom/medium/proto/obv/post/SectionTextLayout;Lcom/medium/proto/obv/post/SectionImageLayout;Lcom/medium/proto/obv/post/SectionVideoLayout;Lcom/medium/proto/obv/post/ColorType;Lcom/medium/proto/obv/post/SectionType;Lh21;)V", "newBuilder", "()Livb;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;ILgen/model/ImageMetadata;Lgen/model/VideoMetadata;Lcom/medium/proto/obv/post/SectionTextLayout;Lcom/medium/proto/obv/post/SectionImageLayout;Lcom/medium/proto/obv/post/SectionVideoLayout;Lcom/medium/proto/obv/post/ColorType;Lcom/medium/proto/obv/post/SectionType;Lh21;)Lcom/medium/proto/model/SectionModel;", "Ljava/lang/String;", "I", "Lgen/model/ImageMetadata;", "Lgen/model/VideoMetadata;", "Lcom/medium/proto/obv/post/SectionTextLayout;", "Lcom/medium/proto/obv/post/SectionImageLayout;", "Lcom/medium/proto/obv/post/SectionVideoLayout;", "Lcom/medium/proto/obv/post/ColorType;", "Lcom/medium/proto/obv/post/SectionType;", "Companion", "jvb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SectionModel extends AndroidMessage<SectionModel, ivb> {
    public static final ProtoAdapter<SectionModel> ADAPTER;
    public static final Parcelable.Creator<SectionModel> CREATOR;
    public static final jvb Companion = new jvb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.obv.post.ColorType#ADAPTER", schemaIndex = 7, tag = 6)
    public final ColorType background_color;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 2, tag = 3)
    public final ImageMetadata background_image;

    @WireField(adapter = "gen.model.VideoMetadata#ADAPTER", schemaIndex = 3, tag = 8)
    public final VideoMetadata background_video;

    @WireField(adapter = "com.medium.proto.obv.post.SectionImageLayout#ADAPTER", schemaIndex = 5, tag = 5)
    public final SectionImageLayout image_layout;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final int start_index;

    @WireField(adapter = "com.medium.proto.obv.post.SectionTextLayout#ADAPTER", schemaIndex = 4, tag = 4)
    public final SectionTextLayout text_layout;

    @WireField(adapter = "com.medium.proto.obv.post.SectionType#ADAPTER", schemaIndex = 8, tag = 7)
    public final SectionType type;

    @WireField(adapter = "com.medium.proto.obv.post.SectionVideoLayout#ADAPTER", schemaIndex = 6, tag = 9)
    public final SectionVideoLayout video_layout;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SectionModel.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SectionModel> protoAdapter = new ProtoAdapter<SectionModel>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.SectionModel$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SectionModel decode(ProtoReader reader) {
                String str;
                Integer num;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                ImageMetadata imageMetadataDecode = null;
                VideoMetadata videoMetadataDecode = null;
                SectionTextLayout sectionTextLayoutDecode = null;
                SectionImageLayout sectionImageLayoutDecode = null;
                SectionVideoLayout sectionVideoLayoutDecode = null;
                ColorType colorTypeDecode = null;
                SectionType sectionTypeDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        Integer num2 = numDecode;
                        h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                        String str2 = strDecode;
                        Integer num3 = num2;
                        if (num3 != null) {
                            return new SectionModel(str2, num3.intValue(), imageMetadataDecode, videoMetadataDecode, sectionTextLayoutDecode, sectionImageLayoutDecode, sectionVideoLayoutDecode, colorTypeDecode, sectionTypeDecode, h21VarEndMessageAndGetUnknownFields);
                        }
                        Internal.missingRequiredFields(num2, "start_index");
                        throw null;
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 3:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 4:
                            str = strDecode;
                            num = numDecode;
                            try {
                                sectionTextLayoutDecode = SectionTextLayout.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 5:
                            str = strDecode;
                            num = numDecode;
                            try {
                                sectionImageLayoutDecode = SectionImageLayout.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 6:
                            str = strDecode;
                            num = numDecode;
                            try {
                                colorTypeDecode = ColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                            }
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 7:
                            str = strDecode;
                            try {
                                sectionTypeDecode = SectionType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                num = numDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                numDecode = num;
                            }
                            strDecode = str;
                            break;
                        case 8:
                            videoMetadataDecode = VideoMetadata.ADAPTER.decode(reader);
                            break;
                        case 9:
                            try {
                                sectionVideoLayoutDecode = SectionVideoLayout.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                str = strDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                                num = numDecode;
                                numDecode = num;
                                strDecode = str;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode;
                            num = numDecode;
                            numDecode = num;
                            strDecode = str;
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SectionModel value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.name);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(value.start_index));
                ImageMetadata.ADAPTER.encodeWithTag(writer, 3, value.background_image);
                VideoMetadata.ADAPTER.encodeWithTag(writer, 8, value.background_video);
                SectionTextLayout.ADAPTER.encodeWithTag(writer, 4, value.text_layout);
                SectionImageLayout.ADAPTER.encodeWithTag(writer, 5, value.image_layout);
                SectionVideoLayout.ADAPTER.encodeWithTag(writer, 9, value.video_layout);
                ColorType.ADAPTER.encodeWithTag(writer, 6, value.background_color);
                SectionType.ADAPTER.encodeWithTag(writer, 7, value.type);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SectionModel value) {
                value.getClass();
                return SectionType.ADAPTER.encodedSizeWithTag(7, value.type) + ColorType.ADAPTER.encodedSizeWithTag(6, value.background_color) + SectionVideoLayout.ADAPTER.encodedSizeWithTag(9, value.video_layout) + SectionImageLayout.ADAPTER.encodedSizeWithTag(5, value.image_layout) + SectionTextLayout.ADAPTER.encodedSizeWithTag(4, value.text_layout) + VideoMetadata.ADAPTER.encodedSizeWithTag(8, value.background_video) + ImageMetadata.ADAPTER.encodedSizeWithTag(3, value.background_image) + ProtoAdapter.INT32.encodedSizeWithTag(2, Integer.valueOf(value.start_index)) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.name) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SectionModel redact(SectionModel value) {
                value.getClass();
                ImageMetadata imageMetadata = value.background_image;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                VideoMetadata videoMetadata = value.background_video;
                return SectionModel.copy$default(value, null, 0, imageMetadataRedact, videoMetadata != null ? VideoMetadata.ADAPTER.redact(videoMetadata) : null, null, null, null, null, null, h21.d, 499, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SectionModel value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                SectionType.ADAPTER.encodeWithTag(writer, 7, value.type);
                ColorType.ADAPTER.encodeWithTag(writer, 6, value.background_color);
                SectionVideoLayout.ADAPTER.encodeWithTag(writer, 9, value.video_layout);
                SectionImageLayout.ADAPTER.encodeWithTag(writer, 5, value.image_layout);
                SectionTextLayout.ADAPTER.encodeWithTag(writer, 4, value.text_layout);
                VideoMetadata.ADAPTER.encodeWithTag(writer, 8, value.background_video);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 3, value.background_image);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, Integer.valueOf(value.start_index));
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.name);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SectionModel(String str, int i, ImageMetadata imageMetadata, VideoMetadata videoMetadata, SectionTextLayout sectionTextLayout, SectionImageLayout sectionImageLayout, SectionVideoLayout sectionVideoLayout, ColorType colorType, SectionType sectionType, h21 h21Var, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? null : str, i, (i2 & 4) != 0 ? null : imageMetadata, (i2 & 8) != 0 ? null : videoMetadata, (i2 & 16) != 0 ? null : sectionTextLayout, (i2 & 32) != 0 ? null : sectionImageLayout, (i2 & 64) != 0 ? null : sectionVideoLayout, (i2 & 128) != 0 ? null : colorType, (i2 & 256) != 0 ? null : sectionType, (i2 & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SectionModel copy$default(SectionModel sectionModel, String str, int i, ImageMetadata imageMetadata, VideoMetadata videoMetadata, SectionTextLayout sectionTextLayout, SectionImageLayout sectionImageLayout, SectionVideoLayout sectionVideoLayout, ColorType colorType, SectionType sectionType, h21 h21Var, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = sectionModel.name;
        }
        if ((i2 & 2) != 0) {
            i = sectionModel.start_index;
        }
        if ((i2 & 4) != 0) {
            imageMetadata = sectionModel.background_image;
        }
        if ((i2 & 8) != 0) {
            videoMetadata = sectionModel.background_video;
        }
        if ((i2 & 16) != 0) {
            sectionTextLayout = sectionModel.text_layout;
        }
        if ((i2 & 32) != 0) {
            sectionImageLayout = sectionModel.image_layout;
        }
        if ((i2 & 64) != 0) {
            sectionVideoLayout = sectionModel.video_layout;
        }
        if ((i2 & 128) != 0) {
            colorType = sectionModel.background_color;
        }
        if ((i2 & 256) != 0) {
            sectionType = sectionModel.type;
        }
        if ((i2 & 512) != 0) {
            h21Var = sectionModel.unknownFields();
        }
        SectionType sectionType2 = sectionType;
        h21 h21Var2 = h21Var;
        SectionVideoLayout sectionVideoLayout2 = sectionVideoLayout;
        ColorType colorType2 = colorType;
        SectionTextLayout sectionTextLayout2 = sectionTextLayout;
        SectionImageLayout sectionImageLayout2 = sectionImageLayout;
        return sectionModel.copy(str, i, imageMetadata, videoMetadata, sectionTextLayout2, sectionImageLayout2, sectionVideoLayout2, colorType2, sectionType2, h21Var2);
    }

    public final SectionModel copy(String name, int start_index, ImageMetadata background_image, VideoMetadata background_video, SectionTextLayout text_layout, SectionImageLayout image_layout, SectionVideoLayout video_layout, ColorType background_color, SectionType type, h21 unknownFields) {
        unknownFields.getClass();
        return new SectionModel(name, start_index, background_image, background_video, text_layout, image_layout, video_layout, background_color, type, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SectionModel)) {
            return false;
        }
        SectionModel sectionModel = (SectionModel) other;
        return g76.L(unknownFields(), sectionModel.unknownFields()) && g76.L(this.name, sectionModel.name) && this.start_index == sectionModel.start_index && g76.L(this.background_image, sectionModel.background_image) && g76.L(this.background_video, sectionModel.background_video) && this.text_layout == sectionModel.text_layout && this.image_layout == sectionModel.image_layout && this.video_layout == sectionModel.video_layout && this.background_color == sectionModel.background_color && this.type == sectionModel.type;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.name;
        int iHashCode2 = (((iHashCode + (str != null ? str.hashCode() : 0)) * 37) + this.start_index) * 37;
        ImageMetadata imageMetadata = this.background_image;
        int iHashCode3 = (iHashCode2 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        VideoMetadata videoMetadata = this.background_video;
        int iHashCode4 = (iHashCode3 + (videoMetadata != null ? videoMetadata.hashCode() : 0)) * 37;
        SectionTextLayout sectionTextLayout = this.text_layout;
        int iHashCode5 = (iHashCode4 + (sectionTextLayout != null ? sectionTextLayout.hashCode() : 0)) * 37;
        SectionImageLayout sectionImageLayout = this.image_layout;
        int iHashCode6 = (iHashCode5 + (sectionImageLayout != null ? sectionImageLayout.hashCode() : 0)) * 37;
        SectionVideoLayout sectionVideoLayout = this.video_layout;
        int iHashCode7 = (iHashCode6 + (sectionVideoLayout != null ? sectionVideoLayout.hashCode() : 0)) * 37;
        ColorType colorType = this.background_color;
        int iHashCode8 = (iHashCode7 + (colorType != null ? colorType.hashCode() : 0)) * 37;
        SectionType sectionType = this.type;
        int iHashCode9 = iHashCode8 + (sectionType != null ? sectionType.hashCode() : 0);
        this.hashCode = iHashCode9;
        return iHashCode9;
    }

    @Override // com.squareup.wire.Message
    public final ivb newBuilder() {
        ivb ivbVar = new ivb();
        ivbVar.a = this.name;
        ivbVar.b = Integer.valueOf(this.start_index);
        ivbVar.c = this.background_image;
        ivbVar.d = this.background_video;
        ivbVar.e = this.text_layout;
        ivbVar.f = this.image_layout;
        ivbVar.g = this.video_layout;
        ivbVar.h = this.background_color;
        ivbVar.i = this.type;
        ivbVar.addUnknownFields(unknownFields());
        return ivbVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.name;
        if (str != null) {
            lv8.D(str, "name=", arrayList);
        }
        arrayList.add("start_index=" + this.start_index);
        ImageMetadata imageMetadata = this.background_image;
        if (imageMetadata != null) {
            arrayList.add("background_image=" + imageMetadata);
        }
        VideoMetadata videoMetadata = this.background_video;
        if (videoMetadata != null) {
            arrayList.add("background_video=" + videoMetadata);
        }
        SectionTextLayout sectionTextLayout = this.text_layout;
        if (sectionTextLayout != null) {
            arrayList.add("text_layout=" + sectionTextLayout);
        }
        SectionImageLayout sectionImageLayout = this.image_layout;
        if (sectionImageLayout != null) {
            arrayList.add("image_layout=" + sectionImageLayout);
        }
        SectionVideoLayout sectionVideoLayout = this.video_layout;
        if (sectionVideoLayout != null) {
            arrayList.add("video_layout=" + sectionVideoLayout);
        }
        ColorType colorType = this.background_color;
        if (colorType != null) {
            arrayList.add("background_color=" + colorType);
        }
        SectionType sectionType = this.type;
        if (sectionType != null) {
            arrayList.add("type=" + sectionType);
        }
        return bu1.F0(arrayList, ", ", "SectionModel{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SectionModel(String str, int i, ImageMetadata imageMetadata, VideoMetadata videoMetadata, SectionTextLayout sectionTextLayout, SectionImageLayout sectionImageLayout, SectionVideoLayout sectionVideoLayout, ColorType colorType, SectionType sectionType, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.name = str;
        this.start_index = i;
        this.background_image = imageMetadata;
        this.background_video = videoMetadata;
        this.text_layout = sectionTextLayout;
        this.image_layout = sectionImageLayout;
        this.video_layout = sectionVideoLayout;
        this.background_color = colorType;
        this.type = sectionType;
    }
}
