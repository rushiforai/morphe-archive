package com.medium.proto.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.obv.post.Alignment;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.proto.obv.post.ParagraphPurpose;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.proto.obv.post.TranslationStatus;
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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.n29;
import defpackage.o29;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.z73;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0017\b\u0007\u0018\u0000 A2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002BBí\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010 \u0012\b\b\u0002\u0010#\u001a\u00020\"¢\u0006\u0004\b$\u0010%J\u000f\u0010&\u001a\u00020\u0002H\u0016¢\u0006\u0004\b&\u0010'J\u001a\u0010*\u001a\u00020\u00122\b\u0010)\u001a\u0004\u0018\u00010(H\u0096\u0002¢\u0006\u0004\b*\u0010+J\u000f\u0010-\u001a\u00020,H\u0016¢\u0006\u0004\b-\u0010.J\u000f\u0010/\u001a\u00020\u0003H\u0016¢\u0006\u0004\b/\u00100Jó\u0001\u00101\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010!\u001a\u0004\u0018\u00010 2\b\b\u0002\u0010#\u001a\u00020\"¢\u0006\u0004\b1\u00102R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u00103R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u00104R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u00103R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u00105R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u00103R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u00106R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u00107R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u00108R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u00109R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u00103R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010:R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010;R\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u00106R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010<R\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u00103R\u001c\u0010\u001f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001f\u00103\u0012\u0004\b=\u0010>R\u0016\u0010!\u001a\u0004\u0018\u00010 8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010?R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010@¨\u0006C"}, d2 = {"Lcom/medium/proto/model/ParagraphPb;", "Lcom/squareup/wire/AndroidMessage;", "Ln29;", "", "name", "Lcom/medium/proto/obv/post/ParagraphType;", "type", "text", "", "Lcom/medium/proto/model/MarkupModel;", "markups", "Lcom/medium/proto/obv/post/BlockLayout;", "layout", "data_id", "Lgen/model/ImageMetadata;", "metadata", "Lcom/medium/proto/model/IframeMetadata;", "iframe", "", "has_drop_cap", "Lcom/medium/proto/obv/post/Alignment;", "alignment", "href", "Lcom/medium/proto/model/MixtapeMetadata;", "mixtape_metadata", "Lcom/medium/proto/obv/post/TranslationStatus;", "translation_status", "drop_cap_image", "Lcom/medium/proto/obv/post/ParagraphPurpose;", "purpose", "id", "code_lang", "Lcom/medium/proto/model/CodeBlockMetadata;", "code_block_metadata", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lcom/medium/proto/obv/post/ParagraphType;Ljava/lang/String;Ljava/util/List;Lcom/medium/proto/obv/post/BlockLayout;Ljava/lang/String;Lgen/model/ImageMetadata;Lcom/medium/proto/model/IframeMetadata;Ljava/lang/Boolean;Lcom/medium/proto/obv/post/Alignment;Ljava/lang/String;Lcom/medium/proto/model/MixtapeMetadata;Lcom/medium/proto/obv/post/TranslationStatus;Lgen/model/ImageMetadata;Lcom/medium/proto/obv/post/ParagraphPurpose;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/CodeBlockMetadata;Lh21;)V", "newBuilder", "()Ln29;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lcom/medium/proto/obv/post/ParagraphType;Ljava/lang/String;Ljava/util/List;Lcom/medium/proto/obv/post/BlockLayout;Ljava/lang/String;Lgen/model/ImageMetadata;Lcom/medium/proto/model/IframeMetadata;Ljava/lang/Boolean;Lcom/medium/proto/obv/post/Alignment;Ljava/lang/String;Lcom/medium/proto/model/MixtapeMetadata;Lcom/medium/proto/obv/post/TranslationStatus;Lgen/model/ImageMetadata;Lcom/medium/proto/obv/post/ParagraphPurpose;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/CodeBlockMetadata;Lh21;)Lcom/medium/proto/model/ParagraphPb;", "Ljava/lang/String;", "Lcom/medium/proto/obv/post/ParagraphType;", "Lcom/medium/proto/obv/post/BlockLayout;", "Lgen/model/ImageMetadata;", "Lcom/medium/proto/model/IframeMetadata;", "Ljava/lang/Boolean;", "Lcom/medium/proto/obv/post/Alignment;", "Lcom/medium/proto/model/MixtapeMetadata;", "Lcom/medium/proto/obv/post/TranslationStatus;", "Lcom/medium/proto/obv/post/ParagraphPurpose;", "getCode_lang$annotations", "()V", "Lcom/medium/proto/model/CodeBlockMetadata;", "Ljava/util/List;", "Companion", "o29", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ParagraphPb extends AndroidMessage<ParagraphPb, n29> {
    public static final ProtoAdapter<ParagraphPb> ADAPTER;
    public static final Parcelable.Creator<ParagraphPb> CREATOR;
    public static final o29 Companion = new o29();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.obv.post.Alignment#ADAPTER", schemaIndex = 9, tag = 10)
    public final Alignment alignment;

    @WireField(adapter = "com.medium.proto.model.CodeBlockMetadata#ADAPTER", schemaIndex = 17, tag = 18)
    public final CodeBlockMetadata code_block_metadata;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 16, tag = 17)
    public final String code_lang;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 5)
    public final String data_id;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 13, tag = 14)
    public final ImageMetadata drop_cap_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 8, tag = 9)
    public final Boolean has_drop_cap;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String href;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 15, tag = 16)
    public final String id;

    @WireField(adapter = "com.medium.proto.model.IframeMetadata#ADAPTER", schemaIndex = 7, tag = 8)
    public final IframeMetadata iframe;

    @WireField(adapter = "com.medium.proto.obv.post.BlockLayout#ADAPTER", schemaIndex = 4, tag = 6)
    public final BlockLayout layout;

    @WireField(adapter = "com.medium.proto.model.MarkupModel#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 4)
    public final List<MarkupModel> markups;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 6, tag = 7)
    public final ImageMetadata metadata;

    @WireField(adapter = "com.medium.proto.model.MixtapeMetadata#ADAPTER", schemaIndex = 11, tag = 12)
    public final MixtapeMetadata mixtape_metadata;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String name;

    @WireField(adapter = "com.medium.proto.obv.post.ParagraphPurpose#ADAPTER", schemaIndex = 14, tag = 15)
    public final ParagraphPurpose purpose;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String text;

    @WireField(adapter = "com.medium.proto.obv.post.TranslationStatus#ADAPTER", schemaIndex = 12, tag = 13)
    public final TranslationStatus translation_status;

    @WireField(adapter = "com.medium.proto.obv.post.ParagraphType#ADAPTER", schemaIndex = 1, tag = 2)
    public final ParagraphType type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ParagraphPb.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ParagraphPb> protoAdapter = new ProtoAdapter<ParagraphPb>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.ParagraphPb$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ParagraphPb decode(ProtoReader reader) {
                ParagraphType paragraphType;
                String str;
                BlockLayout blockLayout;
                String strDecode;
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String str2 = null;
                ParagraphType paragraphTypeDecode = null;
                String strDecode2 = null;
                BlockLayout blockLayoutDecode = null;
                String strDecode3 = null;
                ImageMetadata imageMetadataDecode = null;
                IframeMetadata iframeMetadataDecode = null;
                Boolean boolDecode = null;
                Alignment alignmentDecode = null;
                String strDecode4 = null;
                MixtapeMetadata mixtapeMetadataDecode = null;
                TranslationStatus translationStatusDecode = null;
                ImageMetadata imageMetadataDecode2 = null;
                ParagraphPurpose paragraphPurposeDecode = null;
                String strDecode5 = null;
                String strDecode6 = null;
                CodeBlockMetadata codeBlockMetadataDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ParagraphPb(str2, paragraphTypeDecode, strDecode2, arrayListF, blockLayoutDecode, strDecode3, imageMetadataDecode, iframeMetadataDecode, boolDecode, alignmentDecode, strDecode4, mixtapeMetadataDecode, translationStatusDecode, imageMetadataDecode2, paragraphPurposeDecode, strDecode5, strDecode6, codeBlockMetadataDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            try {
                                paragraphTypeDecode = ParagraphType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str2;
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                            }
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 4:
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            arrayListF.add(MarkupModel.ADAPTER.decode(reader));
                            strDecode = str2;
                            paragraphTypeDecode = paragraphType;
                            strDecode2 = str;
                            blockLayoutDecode = blockLayout;
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 6:
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            try {
                                blockLayoutDecode = BlockLayout.ADAPTER.decode(reader);
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str2;
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                            }
                            break;
                        case 7:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 8:
                            iframeMetadataDecode = IframeMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 9:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 10:
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            try {
                                alignmentDecode = Alignment.ADAPTER.decode(reader);
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str2;
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                            }
                            break;
                        case 11:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 12:
                            mixtapeMetadataDecode = MixtapeMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 13:
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            try {
                                translationStatusDecode = TranslationStatus.ADAPTER.decode(reader);
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                strDecode = str2;
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                            }
                            break;
                        case 14:
                            imageMetadataDecode2 = ImageMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 15:
                            try {
                                paragraphPurposeDecode = ParagraphPurpose.ADAPTER.decode(reader);
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                paragraphType = paragraphTypeDecode;
                                str = strDecode2;
                                blockLayout = blockLayoutDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                                strDecode = str2;
                                paragraphTypeDecode = paragraphType;
                                strDecode2 = str;
                                blockLayoutDecode = blockLayout;
                            }
                            break;
                        case 16:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 17:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 18:
                            codeBlockMetadataDecode = CodeBlockMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            paragraphType = paragraphTypeDecode;
                            str = strDecode2;
                            blockLayout = blockLayoutDecode;
                            strDecode = str2;
                            paragraphTypeDecode = paragraphType;
                            strDecode2 = str;
                            blockLayoutDecode = blockLayout;
                            break;
                    }
                    str2 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ParagraphPb value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.name);
                ParagraphType.ADAPTER.encodeWithTag(writer, 2, value.type);
                protoAdapter2.encodeWithTag(writer, 3, value.text);
                MarkupModel.ADAPTER.asRepeated().encodeWithTag(writer, 4, value.markups);
                BlockLayout.ADAPTER.encodeWithTag(writer, 6, value.layout);
                protoAdapter2.encodeWithTag(writer, 5, value.data_id);
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 7, value.metadata);
                IframeMetadata.ADAPTER.encodeWithTag(writer, 8, value.iframe);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.has_drop_cap);
                Alignment.ADAPTER.encodeWithTag(writer, 10, value.alignment);
                protoAdapter2.encodeWithTag(writer, 11, value.href);
                MixtapeMetadata.ADAPTER.encodeWithTag(writer, 12, value.mixtape_metadata);
                TranslationStatus.ADAPTER.encodeWithTag(writer, 13, value.translation_status);
                protoAdapter3.encodeWithTag(writer, 14, value.drop_cap_image);
                ParagraphPurpose.ADAPTER.encodeWithTag(writer, 15, value.purpose);
                protoAdapter2.encodeWithTag(writer, 16, value.id);
                protoAdapter2.encodeWithTag(writer, 17, value.code_lang);
                CodeBlockMetadata.ADAPTER.encodeWithTag(writer, 18, value.code_block_metadata);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ParagraphPb value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(5, value.data_id) + BlockLayout.ADAPTER.encodedSizeWithTag(6, value.layout) + MarkupModel.ADAPTER.asRepeated().encodedSizeWithTag(4, value.markups) + protoAdapter2.encodedSizeWithTag(3, value.text) + ParagraphType.ADAPTER.encodedSizeWithTag(2, value.type) + protoAdapter2.encodedSizeWithTag(1, value.name) + iE;
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                return CodeBlockMetadata.ADAPTER.encodedSizeWithTag(18, value.code_block_metadata) + protoAdapter2.encodedSizeWithTag(17, value.code_lang) + protoAdapter2.encodedSizeWithTag(16, value.id) + ParagraphPurpose.ADAPTER.encodedSizeWithTag(15, value.purpose) + protoAdapter3.encodedSizeWithTag(14, value.drop_cap_image) + TranslationStatus.ADAPTER.encodedSizeWithTag(13, value.translation_status) + MixtapeMetadata.ADAPTER.encodedSizeWithTag(12, value.mixtape_metadata) + protoAdapter2.encodedSizeWithTag(11, value.href) + Alignment.ADAPTER.encodedSizeWithTag(10, value.alignment) + ProtoAdapter.BOOL.encodedSizeWithTag(9, value.has_drop_cap) + IframeMetadata.ADAPTER.encodedSizeWithTag(8, value.iframe) + protoAdapter3.encodedSizeWithTag(7, value.metadata) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ParagraphPb redact(ParagraphPb value) {
                value.getClass();
                List listM97redactElements = Internal.m97redactElements(value.markups, MarkupModel.ADAPTER);
                ImageMetadata imageMetadata = value.metadata;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                IframeMetadata iframeMetadata = value.iframe;
                IframeMetadata iframeMetadataRedact = iframeMetadata != null ? IframeMetadata.ADAPTER.redact(iframeMetadata) : null;
                MixtapeMetadata mixtapeMetadata = value.mixtape_metadata;
                MixtapeMetadata mixtapeMetadataRedact = mixtapeMetadata != null ? MixtapeMetadata.ADAPTER.redact(mixtapeMetadata) : null;
                ImageMetadata imageMetadata2 = value.drop_cap_image;
                ImageMetadata imageMetadataRedact2 = imageMetadata2 != null ? ImageMetadata.ADAPTER.redact(imageMetadata2) : null;
                CodeBlockMetadata codeBlockMetadata = value.code_block_metadata;
                return value.copy((524211 & 1) != 0 ? value.name : null, (524211 & 2) != 0 ? value.type : null, (524211 & 4) != 0 ? value.text : null, (524211 & 8) != 0 ? value.markups : listM97redactElements, (524211 & 16) != 0 ? value.layout : null, (524211 & 32) != 0 ? value.data_id : null, (524211 & 64) != 0 ? value.metadata : imageMetadataRedact, (524211 & 128) != 0 ? value.iframe : iframeMetadataRedact, (524211 & 256) != 0 ? value.has_drop_cap : null, (524211 & 512) != 0 ? value.alignment : null, (524211 & 1024) != 0 ? value.href : null, (524211 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.mixtape_metadata : mixtapeMetadataRedact, (524211 & 4096) != 0 ? value.translation_status : null, (524211 & 8192) != 0 ? value.drop_cap_image : imageMetadataRedact2, (524211 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.purpose : null, (524211 & 32768) != 0 ? value.id : null, (524211 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.code_lang : null, (524211 & 131072) != 0 ? value.code_block_metadata : codeBlockMetadata != null ? CodeBlockMetadata.ADAPTER.redact(codeBlockMetadata) : null, (524211 & 262144) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ParagraphPb value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CodeBlockMetadata.ADAPTER.encodeWithTag(writer, 18, value.code_block_metadata);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 17, value.code_lang);
                protoAdapter2.encodeWithTag(writer, 16, value.id);
                ParagraphPurpose.ADAPTER.encodeWithTag(writer, 15, value.purpose);
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 14, value.drop_cap_image);
                TranslationStatus.ADAPTER.encodeWithTag(writer, 13, value.translation_status);
                MixtapeMetadata.ADAPTER.encodeWithTag(writer, 12, value.mixtape_metadata);
                protoAdapter2.encodeWithTag(writer, 11, value.href);
                Alignment.ADAPTER.encodeWithTag(writer, 10, value.alignment);
                ProtoAdapter.BOOL.encodeWithTag(writer, 9, value.has_drop_cap);
                IframeMetadata.ADAPTER.encodeWithTag(writer, 8, value.iframe);
                protoAdapter3.encodeWithTag(writer, 7, value.metadata);
                protoAdapter2.encodeWithTag(writer, 5, value.data_id);
                BlockLayout.ADAPTER.encodeWithTag(writer, 6, value.layout);
                MarkupModel.ADAPTER.asRepeated().encodeWithTag(writer, 4, value.markups);
                protoAdapter2.encodeWithTag(writer, 3, value.text);
                ParagraphType.ADAPTER.encodeWithTag(writer, 2, value.type);
                protoAdapter2.encodeWithTag(writer, 1, value.name);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ParagraphPb(String str, ParagraphType paragraphType, String str2, List list, BlockLayout blockLayout, String str3, ImageMetadata imageMetadata, IframeMetadata iframeMetadata, Boolean bool, Alignment alignment, String str4, MixtapeMetadata mixtapeMetadata, TranslationStatus translationStatus, ImageMetadata imageMetadata2, ParagraphPurpose paragraphPurpose, String str5, String str6, CodeBlockMetadata codeBlockMetadata, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : paragraphType, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? ey3.a : list, (i & 16) != 0 ? null : blockLayout, (i & 32) != 0 ? null : str3, (i & 64) != 0 ? null : imageMetadata, (i & 128) != 0 ? null : iframeMetadata, (i & 256) != 0 ? null : bool, (i & 512) != 0 ? null : alignment, (i & 1024) != 0 ? null : str4, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : mixtapeMetadata, (i & 4096) != 0 ? null : translationStatus, (i & 8192) != 0 ? null : imageMetadata2, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : paragraphPurpose, (i & 32768) != 0 ? null : str5, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str6, (i & 131072) != 0 ? null : codeBlockMetadata, (i & 262144) != 0 ? h21.d : h21Var);
    }

    public final ParagraphPb copy(String name, ParagraphType type, String text, List<MarkupModel> markups, BlockLayout layout, String data_id, ImageMetadata metadata, IframeMetadata iframe, Boolean has_drop_cap, Alignment alignment, String href, MixtapeMetadata mixtape_metadata, TranslationStatus translation_status, ImageMetadata drop_cap_image, ParagraphPurpose purpose, String id, String code_lang, CodeBlockMetadata code_block_metadata, h21 unknownFields) {
        markups.getClass();
        unknownFields.getClass();
        return new ParagraphPb(name, type, text, markups, layout, data_id, metadata, iframe, has_drop_cap, alignment, href, mixtape_metadata, translation_status, drop_cap_image, purpose, id, code_lang, code_block_metadata, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ParagraphPb)) {
            return false;
        }
        ParagraphPb paragraphPb = (ParagraphPb) other;
        return g76.L(unknownFields(), paragraphPb.unknownFields()) && g76.L(this.name, paragraphPb.name) && this.type == paragraphPb.type && g76.L(this.text, paragraphPb.text) && g76.L(this.markups, paragraphPb.markups) && this.layout == paragraphPb.layout && g76.L(this.data_id, paragraphPb.data_id) && g76.L(this.metadata, paragraphPb.metadata) && g76.L(this.iframe, paragraphPb.iframe) && g76.L(this.has_drop_cap, paragraphPb.has_drop_cap) && this.alignment == paragraphPb.alignment && g76.L(this.href, paragraphPb.href) && g76.L(this.mixtape_metadata, paragraphPb.mixtape_metadata) && this.translation_status == paragraphPb.translation_status && g76.L(this.drop_cap_image, paragraphPb.drop_cap_image) && this.purpose == paragraphPb.purpose && g76.L(this.id, paragraphPb.id) && g76.L(this.code_lang, paragraphPb.code_lang) && g76.L(this.code_block_metadata, paragraphPb.code_block_metadata);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.name;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        ParagraphType paragraphType = this.type;
        int iHashCode3 = (iHashCode2 + (paragraphType != null ? paragraphType.hashCode() : 0)) * 37;
        String str2 = this.text;
        int iP = wgd.p((iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37, 37, this.markups);
        BlockLayout blockLayout = this.layout;
        int iHashCode4 = (iP + (blockLayout != null ? blockLayout.hashCode() : 0)) * 37;
        String str3 = this.data_id;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.metadata;
        int iHashCode6 = (iHashCode5 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        IframeMetadata iframeMetadata = this.iframe;
        int iHashCode7 = (iHashCode6 + (iframeMetadata != null ? iframeMetadata.hashCode() : 0)) * 37;
        Boolean bool = this.has_drop_cap;
        int i2 = (iHashCode7 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Alignment alignment = this.alignment;
        int iHashCode8 = (i2 + (alignment != null ? alignment.hashCode() : 0)) * 37;
        String str4 = this.href;
        int iHashCode9 = (iHashCode8 + (str4 != null ? str4.hashCode() : 0)) * 37;
        MixtapeMetadata mixtapeMetadata = this.mixtape_metadata;
        int iHashCode10 = (iHashCode9 + (mixtapeMetadata != null ? mixtapeMetadata.hashCode() : 0)) * 37;
        TranslationStatus translationStatus = this.translation_status;
        int iHashCode11 = (iHashCode10 + (translationStatus != null ? translationStatus.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata2 = this.drop_cap_image;
        int iHashCode12 = (iHashCode11 + (imageMetadata2 != null ? imageMetadata2.hashCode() : 0)) * 37;
        ParagraphPurpose paragraphPurpose = this.purpose;
        int iHashCode13 = (iHashCode12 + (paragraphPurpose != null ? paragraphPurpose.hashCode() : 0)) * 37;
        String str5 = this.id;
        int iHashCode14 = (iHashCode13 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.code_lang;
        int iHashCode15 = (iHashCode14 + (str6 != null ? str6.hashCode() : 0)) * 37;
        CodeBlockMetadata codeBlockMetadata = this.code_block_metadata;
        int iHashCode16 = iHashCode15 + (codeBlockMetadata != null ? codeBlockMetadata.hashCode() : 0);
        this.hashCode = iHashCode16;
        return iHashCode16;
    }

    @Override // com.squareup.wire.Message
    public final n29 newBuilder() {
        n29 n29Var = new n29();
        n29Var.a = this.name;
        n29Var.b = this.type;
        n29Var.c = this.text;
        n29Var.d = this.markups;
        n29Var.e = this.layout;
        n29Var.f = this.data_id;
        n29Var.g = this.metadata;
        n29Var.h = this.iframe;
        n29Var.i = this.has_drop_cap;
        n29Var.j = this.alignment;
        n29Var.k = this.href;
        n29Var.l = this.mixtape_metadata;
        n29Var.m = this.translation_status;
        n29Var.n = this.drop_cap_image;
        n29Var.o = this.purpose;
        n29Var.p = this.id;
        n29Var.q = this.code_lang;
        n29Var.r = this.code_block_metadata;
        n29Var.addUnknownFields(unknownFields());
        return n29Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.name;
        if (str != null) {
            lv8.D(str, "name=", arrayList);
        }
        ParagraphType paragraphType = this.type;
        if (paragraphType != null) {
            arrayList.add("type=" + paragraphType);
        }
        String str2 = this.text;
        if (str2 != null) {
            lv8.D(str2, "text=", arrayList);
        }
        if (!this.markups.isEmpty()) {
            b09.J("markups=", this.markups, arrayList);
        }
        BlockLayout blockLayout = this.layout;
        if (blockLayout != null) {
            arrayList.add("layout=" + blockLayout);
        }
        String str3 = this.data_id;
        if (str3 != null) {
            lv8.D(str3, "data_id=", arrayList);
        }
        ImageMetadata imageMetadata = this.metadata;
        if (imageMetadata != null) {
            arrayList.add("metadata=" + imageMetadata);
        }
        IframeMetadata iframeMetadata = this.iframe;
        if (iframeMetadata != null) {
            arrayList.add("iframe=" + iframeMetadata);
        }
        Boolean bool = this.has_drop_cap;
        if (bool != null) {
            lv8.A("has_drop_cap=", bool, arrayList);
        }
        Alignment alignment = this.alignment;
        if (alignment != null) {
            arrayList.add("alignment=" + alignment);
        }
        String str4 = this.href;
        if (str4 != null) {
            lv8.D(str4, "href=", arrayList);
        }
        MixtapeMetadata mixtapeMetadata = this.mixtape_metadata;
        if (mixtapeMetadata != null) {
            arrayList.add("mixtape_metadata=" + mixtapeMetadata);
        }
        TranslationStatus translationStatus = this.translation_status;
        if (translationStatus != null) {
            arrayList.add("translation_status=" + translationStatus);
        }
        ImageMetadata imageMetadata2 = this.drop_cap_image;
        if (imageMetadata2 != null) {
            arrayList.add("drop_cap_image=" + imageMetadata2);
        }
        ParagraphPurpose paragraphPurpose = this.purpose;
        if (paragraphPurpose != null) {
            arrayList.add("purpose=" + paragraphPurpose);
        }
        String str5 = this.id;
        if (str5 != null) {
            lv8.D(str5, "id=", arrayList);
        }
        String str6 = this.code_lang;
        if (str6 != null) {
            lv8.D(str6, "code_lang=", arrayList);
        }
        CodeBlockMetadata codeBlockMetadata = this.code_block_metadata;
        if (codeBlockMetadata != null) {
            arrayList.add("code_block_metadata=" + codeBlockMetadata);
        }
        return bu1.F0(arrayList, ", ", "ParagraphPb{", "}", null, 56);
    }

    public ParagraphPb() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524287, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphPb(String str, ParagraphType paragraphType, String str2, List<MarkupModel> list, BlockLayout blockLayout, String str3, ImageMetadata imageMetadata, IframeMetadata iframeMetadata, Boolean bool, Alignment alignment, String str4, MixtapeMetadata mixtapeMetadata, TranslationStatus translationStatus, ImageMetadata imageMetadata2, ParagraphPurpose paragraphPurpose, String str5, String str6, CodeBlockMetadata codeBlockMetadata, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.name = str;
        this.type = paragraphType;
        this.text = str2;
        this.layout = blockLayout;
        this.data_id = str3;
        this.metadata = imageMetadata;
        this.iframe = iframeMetadata;
        this.has_drop_cap = bool;
        this.alignment = alignment;
        this.href = str4;
        this.mixtape_metadata = mixtapeMetadata;
        this.translation_status = translationStatus;
        this.drop_cap_image = imageMetadata2;
        this.purpose = paragraphPurpose;
        this.id = str5;
        this.code_lang = str6;
        this.code_block_metadata = codeBlockMetadata;
        this.markups = Internal.immutableCopyOf("markups", list);
    }

    @z73
    public static /* synthetic */ void getCode_lang$annotations() {
    }
}
