package com.medium.proto.model;

import android.os.Parcelable;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
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
import defpackage.kr9;
import defpackage.lr9;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import gen.model.ImageInfo;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0011\u0018\u0000 +2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002,B}\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00102\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0096\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001f\u0010 J\u0083\u0001\u0010!\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b!\u0010\"R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0004\u0010#\u0012\u0004\b$\u0010%R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010#R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010&R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010'R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010(R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010#R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010)R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010*¨\u0006-"}, d2 = {"Lcom/medium/proto/model/PostViewContent;", "Lcom/squareup/wire/AndroidMessage;", "Lkr9;", "", "body", "subtitle", "caption", "Lgen/model/ImageInfo;", "image", "Lcom/medium/proto/model/RichTextModel;", "body_model", "Lcom/medium/proto/model/PostDisplay;", "post_display", "meta_description", "Lgen/model/ImageMetadata;", "preview_image", "", "is_locked_preview_only", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageInfo;Lcom/medium/proto/model/RichTextModel;Lcom/medium/proto/model/PostDisplay;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lkr9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageInfo;Lcom/medium/proto/model/RichTextModel;Lcom/medium/proto/model/PostDisplay;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/model/PostViewContent;", "Ljava/lang/String;", "getBody$annotations", "()V", "Lgen/model/ImageInfo;", "Lcom/medium/proto/model/RichTextModel;", "Lcom/medium/proto/model/PostDisplay;", "Lgen/model/ImageMetadata;", "Ljava/lang/Boolean;", "Companion", "lr9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostViewContent extends AndroidMessage<PostViewContent, kr9> {
    public static final ProtoAdapter<PostViewContent> ADAPTER;
    public static final Parcelable.Creator<PostViewContent> CREATOR;
    public static final lr9 Companion = new lr9();
    public static final boolean DEFAULT_IS_LOCKED_PREVIEW_ONLY = false;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String body;

    @WireField(adapter = "com.medium.proto.model.RichTextModel#ADAPTER", schemaIndex = 4, tag = 5)
    public final RichTextModel body_model;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String caption;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageInfo image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean is_locked_preview_only;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String meta_description;

    @WireField(adapter = "com.medium.proto.model.PostDisplay#ADAPTER", schemaIndex = 5, tag = 6)
    public final PostDisplay post_display;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 7, tag = 8)
    public final ImageMetadata preview_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String subtitle;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostViewContent.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostViewContent> protoAdapter = new ProtoAdapter<PostViewContent>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.PostViewContent$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostViewContent decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                ImageInfo imageInfoDecode = null;
                RichTextModel richTextModelDecode = null;
                PostDisplay postDisplayDecode = null;
                String strDecode4 = null;
                ImageMetadata imageMetadataDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostViewContent(strDecode, strDecode2, strDecode3, imageInfoDecode, richTextModelDecode, postDisplayDecode, strDecode4, imageMetadataDecode, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            imageInfoDecode = ImageInfo.ADAPTER.decode(reader);
                            break;
                        case 5:
                            richTextModelDecode = RichTextModel.ADAPTER.decode(reader);
                            break;
                        case 6:
                            postDisplayDecode = PostDisplay.ADAPTER.decode(reader);
                            break;
                        case 7:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 9:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostViewContent value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.body);
                protoAdapter2.encodeWithTag(writer, 2, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 3, value.caption);
                ImageInfo.ADAPTER.encodeWithTag(writer, 4, value.image);
                RichTextModel.ADAPTER.encodeWithTag(writer, 5, value.body_model);
                PostDisplay.ADAPTER.encodeWithTag(writer, 6, value.post_display);
                protoAdapter2.encodeWithTag(writer, 7, value.meta_description);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 8, value.preview_image);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.is_locked_preview_only);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostViewContent value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(9, value.is_locked_preview_only) + ImageMetadata.ADAPTER.encodedSizeWithTag(8, value.preview_image) + protoAdapter2.encodedSizeWithTag(7, value.meta_description) + PostDisplay.ADAPTER.encodedSizeWithTag(6, value.post_display) + RichTextModel.ADAPTER.encodedSizeWithTag(5, value.body_model) + ImageInfo.ADAPTER.encodedSizeWithTag(4, value.image) + protoAdapter2.encodedSizeWithTag(3, value.caption) + protoAdapter2.encodedSizeWithTag(2, value.subtitle) + protoAdapter2.encodedSizeWithTag(1, value.body) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostViewContent redact(PostViewContent value) {
                value.getClass();
                ImageInfo imageInfo = value.image;
                ImageInfo imageInfoRedact = imageInfo != null ? ImageInfo.ADAPTER.redact(imageInfo) : null;
                RichTextModel richTextModel = value.body_model;
                RichTextModel richTextModelRedact = richTextModel != null ? RichTextModel.ADAPTER.redact(richTextModel) : null;
                PostDisplay postDisplay = value.post_display;
                PostDisplay postDisplayRedact = postDisplay != null ? PostDisplay.ADAPTER.redact(postDisplay) : null;
                ImageMetadata imageMetadata = value.preview_image;
                return PostViewContent.copy$default(value, null, null, null, imageInfoRedact, richTextModelRedact, postDisplayRedact, null, imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null, null, h21.d, 327, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostViewContent value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.is_locked_preview_only);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 8, value.preview_image);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 7, value.meta_description);
                PostDisplay.ADAPTER.encodeWithTag(writer, 6, value.post_display);
                RichTextModel.ADAPTER.encodeWithTag(writer, 5, value.body_model);
                ImageInfo.ADAPTER.encodeWithTag(writer, 4, value.image);
                protoAdapter2.encodeWithTag(writer, 3, value.caption);
                protoAdapter2.encodeWithTag(writer, 2, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 1, value.body);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostViewContent(String str, String str2, String str3, ImageInfo imageInfo, RichTextModel richTextModel, PostDisplay postDisplay, String str4, ImageMetadata imageMetadata, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : imageInfo, (i & 16) != 0 ? null : richTextModel, (i & 32) != 0 ? null : postDisplay, (i & 64) != 0 ? null : str4, (i & 128) != 0 ? null : imageMetadata, (i & 256) != 0 ? null : bool, (i & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostViewContent copy$default(PostViewContent postViewContent, String str, String str2, String str3, ImageInfo imageInfo, RichTextModel richTextModel, PostDisplay postDisplay, String str4, ImageMetadata imageMetadata, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postViewContent.body;
        }
        if ((i & 2) != 0) {
            str2 = postViewContent.subtitle;
        }
        if ((i & 4) != 0) {
            str3 = postViewContent.caption;
        }
        if ((i & 8) != 0) {
            imageInfo = postViewContent.image;
        }
        if ((i & 16) != 0) {
            richTextModel = postViewContent.body_model;
        }
        if ((i & 32) != 0) {
            postDisplay = postViewContent.post_display;
        }
        if ((i & 64) != 0) {
            str4 = postViewContent.meta_description;
        }
        if ((i & 128) != 0) {
            imageMetadata = postViewContent.preview_image;
        }
        if ((i & 256) != 0) {
            bool = postViewContent.is_locked_preview_only;
        }
        if ((i & 512) != 0) {
            h21Var = postViewContent.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        String str5 = str4;
        ImageMetadata imageMetadata2 = imageMetadata;
        RichTextModel richTextModel2 = richTextModel;
        PostDisplay postDisplay2 = postDisplay;
        return postViewContent.copy(str, str2, str3, imageInfo, richTextModel2, postDisplay2, str5, imageMetadata2, bool2, h21Var2);
    }

    public static /* synthetic */ void getBody$annotations() {
    }

    public final PostViewContent copy(String body, String subtitle, String caption, ImageInfo image, RichTextModel body_model, PostDisplay post_display, String meta_description, ImageMetadata preview_image, Boolean is_locked_preview_only, h21 unknownFields) {
        unknownFields.getClass();
        return new PostViewContent(body, subtitle, caption, image, body_model, post_display, meta_description, preview_image, is_locked_preview_only, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostViewContent)) {
            return false;
        }
        PostViewContent postViewContent = (PostViewContent) other;
        return g76.L(unknownFields(), postViewContent.unknownFields()) && g76.L(this.body, postViewContent.body) && g76.L(this.subtitle, postViewContent.subtitle) && g76.L(this.caption, postViewContent.caption) && g76.L(this.image, postViewContent.image) && g76.L(this.body_model, postViewContent.body_model) && g76.L(this.post_display, postViewContent.post_display) && g76.L(this.meta_description, postViewContent.meta_description) && g76.L(this.preview_image, postViewContent.preview_image) && g76.L(this.is_locked_preview_only, postViewContent.is_locked_preview_only);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.body;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.subtitle;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.caption;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageInfo imageInfo = this.image;
        int iHashCode5 = (iHashCode4 + (imageInfo != null ? imageInfo.hashCode() : 0)) * 37;
        RichTextModel richTextModel = this.body_model;
        int iHashCode6 = (iHashCode5 + (richTextModel != null ? richTextModel.hashCode() : 0)) * 37;
        PostDisplay postDisplay = this.post_display;
        int iHashCode7 = (iHashCode6 + (postDisplay != null ? postDisplay.hashCode() : 0)) * 37;
        String str4 = this.meta_description;
        int iHashCode8 = (iHashCode7 + (str4 != null ? str4.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.preview_image;
        int iHashCode9 = (iHashCode8 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        Boolean bool = this.is_locked_preview_only;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode9 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final kr9 newBuilder() {
        kr9 kr9Var = new kr9();
        kr9Var.a = this.body;
        kr9Var.b = this.subtitle;
        kr9Var.c = this.caption;
        kr9Var.d = this.image;
        kr9Var.e = this.body_model;
        kr9Var.f = this.post_display;
        kr9Var.g = this.meta_description;
        kr9Var.h = this.preview_image;
        kr9Var.i = this.is_locked_preview_only;
        kr9Var.addUnknownFields(unknownFields());
        return kr9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.body;
        if (str != null) {
            lv8.D(str, QFTsJPDEnO.yJImgCcV, arrayList);
        }
        String str2 = this.subtitle;
        if (str2 != null) {
            lv8.D(str2, "subtitle=", arrayList);
        }
        String str3 = this.caption;
        if (str3 != null) {
            lv8.D(str3, "caption=", arrayList);
        }
        ImageInfo imageInfo = this.image;
        if (imageInfo != null) {
            arrayList.add("image=" + imageInfo);
        }
        RichTextModel richTextModel = this.body_model;
        if (richTextModel != null) {
            arrayList.add("body_model=" + richTextModel);
        }
        PostDisplay postDisplay = this.post_display;
        if (postDisplay != null) {
            arrayList.add("post_display=" + postDisplay);
        }
        String str4 = this.meta_description;
        if (str4 != null) {
            lv8.D(str4, "meta_description=", arrayList);
        }
        ImageMetadata imageMetadata = this.preview_image;
        if (imageMetadata != null) {
            arrayList.add("preview_image=" + imageMetadata);
        }
        Boolean bool = this.is_locked_preview_only;
        if (bool != null) {
            lv8.A("is_locked_preview_only=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostViewContent{", "}", null, 56);
    }

    public PostViewContent() {
        this(null, null, null, null, null, null, null, null, null, null, 1023, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostViewContent(String str, String str2, String str3, ImageInfo imageInfo, RichTextModel richTextModel, PostDisplay postDisplay, String str4, ImageMetadata imageMetadata, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.body = str;
        this.subtitle = str2;
        this.caption = str3;
        this.image = imageInfo;
        this.body_model = richTextModel;
        this.post_display = postDisplay;
        this.meta_description = str4;
        this.preview_image = imageMetadata;
        this.is_locked_preview_only = bool;
    }
}
