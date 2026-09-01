package com.medium.proto.model;

import android.os.Parcelable;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.medium.android.explore.ui.vAWg.OphtYB;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.fb9;
import defpackage.g76;
import defpackage.gb9;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\b\u0007\u0018\u0000 (2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002)B}\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0096\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001f\u0010 J\u0083\u0001\u0010!\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b!\u0010\"R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010#R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010#R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010$R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010%R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010&R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010'R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010#R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010$¨\u0006*"}, d2 = {"Lcom/medium/proto/model/PlaybackModel;", "Lcom/squareup/wire/AndroidMessage;", "Lfb9;", "", "title", "subtitle", "caption", "Lgen/model/ImageMetadata;", "image", "Lcom/medium/proto/model/RichTextModel;", "body_model", "Lcom/medium/proto/model/PostDisplay;", "post_display", "Lcom/medium/proto/model/SelectionPb;", "selection", "meta_description", "preview_image", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Lcom/medium/proto/model/RichTextModel;Lcom/medium/proto/model/PostDisplay;Lcom/medium/proto/model/SelectionPb;Ljava/lang/String;Lgen/model/ImageMetadata;Lh21;)V", "newBuilder", "()Lfb9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Lcom/medium/proto/model/RichTextModel;Lcom/medium/proto/model/PostDisplay;Lcom/medium/proto/model/SelectionPb;Ljava/lang/String;Lgen/model/ImageMetadata;Lh21;)Lcom/medium/proto/model/PlaybackModel;", "Ljava/lang/String;", "Lgen/model/ImageMetadata;", "Lcom/medium/proto/model/RichTextModel;", "Lcom/medium/proto/model/PostDisplay;", "Lcom/medium/proto/model/SelectionPb;", "Companion", "gb9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PlaybackModel extends AndroidMessage<PlaybackModel, fb9> {
    public static final ProtoAdapter<PlaybackModel> ADAPTER;
    public static final Parcelable.Creator<PlaybackModel> CREATOR;
    public static final gb9 Companion = new gb9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.model.RichTextModel#ADAPTER", schemaIndex = 4, tag = 5)
    public final RichTextModel body_model;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String caption;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageMetadata image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String meta_description;

    @WireField(adapter = "com.medium.proto.model.PostDisplay#ADAPTER", schemaIndex = 5, tag = 6)
    public final PostDisplay post_display;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 8, tag = 9)
    public final ImageMetadata preview_image;

    @WireField(adapter = "com.medium.proto.model.SelectionPb#ADAPTER", schemaIndex = 6, tag = 7)
    public final SelectionPb selection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String subtitle;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String title;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PlaybackModel.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PlaybackModel> protoAdapter = new ProtoAdapter<PlaybackModel>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.PlaybackModel$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PlaybackModel decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                ImageMetadata imageMetadataDecode = null;
                RichTextModel richTextModelDecode = null;
                PostDisplay postDisplayDecode = null;
                SelectionPb selectionPbDecode = null;
                String strDecode4 = null;
                ImageMetadata imageMetadataDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PlaybackModel(strDecode, strDecode2, strDecode3, imageMetadataDecode, richTextModelDecode, postDisplayDecode, selectionPbDecode, strDecode4, imageMetadataDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 5:
                            richTextModelDecode = RichTextModel.ADAPTER.decode(reader);
                            break;
                        case 6:
                            postDisplayDecode = PostDisplay.ADAPTER.decode(reader);
                            break;
                        case 7:
                            selectionPbDecode = SelectionPb.ADAPTER.decode(reader);
                            break;
                        case 8:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 9:
                            imageMetadataDecode2 = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PlaybackModel value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.title);
                protoAdapter2.encodeWithTag(writer, 2, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 3, value.caption);
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 4, value.image);
                RichTextModel.ADAPTER.encodeWithTag(writer, 5, value.body_model);
                PostDisplay.ADAPTER.encodeWithTag(writer, 6, value.post_display);
                SelectionPb.ADAPTER.encodeWithTag(writer, 7, value.selection);
                protoAdapter2.encodeWithTag(writer, 8, value.meta_description);
                protoAdapter3.encodeWithTag(writer, 9, value.preview_image);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PlaybackModel value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.caption) + protoAdapter2.encodedSizeWithTag(2, value.subtitle) + protoAdapter2.encodedSizeWithTag(1, value.title) + iE;
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                return protoAdapter3.encodedSizeWithTag(9, value.preview_image) + protoAdapter2.encodedSizeWithTag(8, value.meta_description) + SelectionPb.ADAPTER.encodedSizeWithTag(7, value.selection) + PostDisplay.ADAPTER.encodedSizeWithTag(6, value.post_display) + RichTextModel.ADAPTER.encodedSizeWithTag(5, value.body_model) + protoAdapter3.encodedSizeWithTag(4, value.image) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PlaybackModel redact(PlaybackModel value) {
                value.getClass();
                ImageMetadata imageMetadata = value.image;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                RichTextModel richTextModel = value.body_model;
                RichTextModel richTextModelRedact = richTextModel != null ? RichTextModel.ADAPTER.redact(richTextModel) : null;
                PostDisplay postDisplay = value.post_display;
                PostDisplay postDisplayRedact = postDisplay != null ? PostDisplay.ADAPTER.redact(postDisplay) : null;
                SelectionPb selectionPb = value.selection;
                SelectionPb selectionPbRedact = selectionPb != null ? SelectionPb.ADAPTER.redact(selectionPb) : null;
                ImageMetadata imageMetadata2 = value.preview_image;
                return PlaybackModel.copy$default(value, null, null, null, imageMetadataRedact, richTextModelRedact, postDisplayRedact, selectionPbRedact, null, imageMetadata2 != null ? ImageMetadata.ADAPTER.redact(imageMetadata2) : null, h21.d, NikonType2MakernoteDirectory.TAG_FLASH_USED, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PlaybackModel value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ImageMetadata> protoAdapter2 = ImageMetadata.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 9, value.preview_image);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 8, value.meta_description);
                SelectionPb.ADAPTER.encodeWithTag(writer, 7, value.selection);
                PostDisplay.ADAPTER.encodeWithTag(writer, 6, value.post_display);
                RichTextModel.ADAPTER.encodeWithTag(writer, 5, value.body_model);
                protoAdapter2.encodeWithTag(writer, 4, value.image);
                protoAdapter3.encodeWithTag(writer, 3, value.caption);
                protoAdapter3.encodeWithTag(writer, 2, value.subtitle);
                protoAdapter3.encodeWithTag(writer, 1, value.title);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PlaybackModel(String str, String str2, String str3, ImageMetadata imageMetadata, RichTextModel richTextModel, PostDisplay postDisplay, SelectionPb selectionPb, String str4, ImageMetadata imageMetadata2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : imageMetadata, (i & 16) != 0 ? null : richTextModel, (i & 32) != 0 ? null : postDisplay, (i & 64) != 0 ? null : selectionPb, (i & 128) != 0 ? null : str4, (i & 256) != 0 ? null : imageMetadata2, (i & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PlaybackModel copy$default(PlaybackModel playbackModel, String str, String str2, String str3, ImageMetadata imageMetadata, RichTextModel richTextModel, PostDisplay postDisplay, SelectionPb selectionPb, String str4, ImageMetadata imageMetadata2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = playbackModel.title;
        }
        if ((i & 2) != 0) {
            str2 = playbackModel.subtitle;
        }
        if ((i & 4) != 0) {
            str3 = playbackModel.caption;
        }
        if ((i & 8) != 0) {
            imageMetadata = playbackModel.image;
        }
        if ((i & 16) != 0) {
            richTextModel = playbackModel.body_model;
        }
        if ((i & 32) != 0) {
            postDisplay = playbackModel.post_display;
        }
        if ((i & 64) != 0) {
            selectionPb = playbackModel.selection;
        }
        if ((i & 128) != 0) {
            str4 = playbackModel.meta_description;
        }
        if ((i & 256) != 0) {
            imageMetadata2 = playbackModel.preview_image;
        }
        if ((i & 512) != 0) {
            h21Var = playbackModel.unknownFields();
        }
        ImageMetadata imageMetadata3 = imageMetadata2;
        h21 h21Var2 = h21Var;
        SelectionPb selectionPb2 = selectionPb;
        String str5 = str4;
        RichTextModel richTextModel2 = richTextModel;
        PostDisplay postDisplay2 = postDisplay;
        return playbackModel.copy(str, str2, str3, imageMetadata, richTextModel2, postDisplay2, selectionPb2, str5, imageMetadata3, h21Var2);
    }

    public final PlaybackModel copy(String title, String subtitle, String caption, ImageMetadata image, RichTextModel body_model, PostDisplay post_display, SelectionPb selection, String meta_description, ImageMetadata preview_image, h21 unknownFields) {
        unknownFields.getClass();
        return new PlaybackModel(title, subtitle, caption, image, body_model, post_display, selection, meta_description, preview_image, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PlaybackModel)) {
            return false;
        }
        PlaybackModel playbackModel = (PlaybackModel) other;
        return g76.L(unknownFields(), playbackModel.unknownFields()) && g76.L(this.title, playbackModel.title) && g76.L(this.subtitle, playbackModel.subtitle) && g76.L(this.caption, playbackModel.caption) && g76.L(this.image, playbackModel.image) && g76.L(this.body_model, playbackModel.body_model) && g76.L(this.post_display, playbackModel.post_display) && g76.L(this.selection, playbackModel.selection) && g76.L(this.meta_description, playbackModel.meta_description) && g76.L(this.preview_image, playbackModel.preview_image);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.title;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.subtitle;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.caption;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.image;
        int iHashCode5 = (iHashCode4 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        RichTextModel richTextModel = this.body_model;
        int iHashCode6 = (iHashCode5 + (richTextModel != null ? richTextModel.hashCode() : 0)) * 37;
        PostDisplay postDisplay = this.post_display;
        int iHashCode7 = (iHashCode6 + (postDisplay != null ? postDisplay.hashCode() : 0)) * 37;
        SelectionPb selectionPb = this.selection;
        int iHashCode8 = (iHashCode7 + (selectionPb != null ? selectionPb.hashCode() : 0)) * 37;
        String str4 = this.meta_description;
        int iHashCode9 = (iHashCode8 + (str4 != null ? str4.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata2 = this.preview_image;
        int iHashCode10 = iHashCode9 + (imageMetadata2 != null ? imageMetadata2.hashCode() : 0);
        this.hashCode = iHashCode10;
        return iHashCode10;
    }

    @Override // com.squareup.wire.Message
    public final fb9 newBuilder() {
        fb9 fb9Var = new fb9();
        fb9Var.a = this.title;
        fb9Var.b = this.subtitle;
        fb9Var.c = this.caption;
        fb9Var.d = this.image;
        fb9Var.e = this.body_model;
        fb9Var.f = this.post_display;
        fb9Var.g = this.selection;
        fb9Var.h = this.meta_description;
        fb9Var.i = this.preview_image;
        fb9Var.addUnknownFields(unknownFields());
        return fb9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.title;
        if (str != null) {
            lv8.D(str, "title=", arrayList);
        }
        String str2 = this.subtitle;
        if (str2 != null) {
            lv8.D(str2, "subtitle=", arrayList);
        }
        String str3 = this.caption;
        if (str3 != null) {
            lv8.D(str3, "caption=", arrayList);
        }
        ImageMetadata imageMetadata = this.image;
        if (imageMetadata != null) {
            arrayList.add("image=" + imageMetadata);
        }
        RichTextModel richTextModel = this.body_model;
        if (richTextModel != null) {
            arrayList.add("body_model=" + richTextModel);
        }
        PostDisplay postDisplay = this.post_display;
        if (postDisplay != null) {
            arrayList.add("post_display=" + postDisplay);
        }
        SelectionPb selectionPb = this.selection;
        if (selectionPb != null) {
            arrayList.add("selection=" + selectionPb);
        }
        String str4 = this.meta_description;
        if (str4 != null) {
            lv8.D(str4, "meta_description=", arrayList);
        }
        ImageMetadata imageMetadata2 = this.preview_image;
        if (imageMetadata2 != null) {
            arrayList.add(OphtYB.ZJcPiVbpJbKhsJs + imageMetadata2);
        }
        return bu1.F0(arrayList, ", ", "PlaybackModel{", "}", null, 56);
    }

    public PlaybackModel() {
        this(null, null, null, null, null, null, null, null, null, null, 1023, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PlaybackModel(String str, String str2, String str3, ImageMetadata imageMetadata, RichTextModel richTextModel, PostDisplay postDisplay, SelectionPb selectionPb, String str4, ImageMetadata imageMetadata2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.title = str;
        this.subtitle = str2;
        this.caption = str3;
        this.image = imageMetadata;
        this.body_model = richTextModel;
        this.post_display = postDisplay;
        this.selection = selectionPb;
        this.meta_description = str4;
        this.preview_image = imageMetadata2;
    }
}
