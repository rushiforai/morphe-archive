package defpackage;

import com.medium.android.graphql.fragment.IframeData;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.MarkupData;
import com.medium.android.graphql.fragment.MediaResourceData;
import com.medium.android.graphql.fragment.MixtapeMetadataData;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.AnchorType;
import com.medium.android.graphql.type.Iframe;
import com.medium.android.graphql.type.LayoutType;
import com.medium.android.graphql.type.Markup;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.MediaResource;
import com.medium.android.graphql.type.Paragraph;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.proto.model.CodeBlockMetadata;
import com.medium.proto.model.IframeMetadata;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.MixtapeMetadata;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.proto.obv.post.SyntaxHighlightMode;
import com.medium.reader.R;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class n19 {
    public static final int a(ParagraphData paragraphData, j09 j09Var) {
        paragraphData.getClass();
        j09Var.getClass();
        j09Var.b(paragraphData);
        l09 l09VarA = j09Var.a();
        if (l09VarA.e(l09VarA.d)) {
            return R.layout.view_post_paragraph_h4_as_kicker;
        }
        j09Var.b(paragraphData);
        l09 l09VarA2 = j09Var.a();
        if (l09VarA2.i(l09VarA2.d)) {
            return R.layout.view_post_paragraph_h3_as_title;
        }
        j09Var.b(paragraphData);
        l09 l09VarA3 = j09Var.a();
        if (l09VarA3.h(l09VarA3.d)) {
            return R.layout.view_post_paragraph_h4_as_subtitle;
        }
        ParagraphType type = paragraphData.getType();
        switch (type == null ? -1 : m19.a[type.ordinal()]) {
            case 2:
            case 14:
                return R.layout.view_post_paragraph_li;
            case 3:
                return R.layout.view_post_paragraph_h4;
            case 4:
                return R.layout.view_post_paragraph_mixtape;
            case 5:
                return R.layout.view_post_paragraph_iframe;
            case 6:
                return R.layout.view_post_paragraph_section_caption;
            case 7:
                return R.layout.view_post_paragraph_h2;
            case 8:
                return R.layout.view_post_paragraph_h3;
            case 9:
                return R.layout.view_post_paragraph_img;
            case 10:
                return R.layout.common_item_paragraph_hr;
            case 11:
                return R.layout.view_post_paragraph_bq;
            case 12:
                return R.layout.view_post_paragraph_pq;
            case 13:
                return R.layout.view_post_paragraph_pre;
            default:
                return R.layout.view_post_paragraph_p;
        }
    }

    public static final boolean b(ParagraphType paragraphType) {
        int i = m19.a[paragraphType.ordinal()];
        return i == 5 || i == 9;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean c(com.medium.proto.model.ParagraphPb r3) {
        /*
            com.medium.proto.obv.post.ParagraphType r0 = r3.type
            if (r0 != 0) goto L6
            r0 = -1
            goto Le
        L6:
            int[] r1 = defpackage.m19.d
            int r0 = r0.ordinal()
            r0 = r1[r0]
        Le:
            r1 = 1
            r2 = 0
            switch(r0) {
                case -1: goto L40;
                case 0: goto L13;
                case 1: goto L32;
                case 2: goto L32;
                case 3: goto L32;
                case 4: goto L2d;
                case 5: goto L3d;
                case 6: goto L32;
                case 7: goto L32;
                case 8: goto L32;
                case 9: goto L32;
                case 10: goto L32;
                case 11: goto L28;
                case 12: goto L32;
                case 13: goto L32;
                case 14: goto L23;
                case 15: goto L32;
                case 16: goto L17;
                default: goto L13;
            }
        L13:
            defpackage.ygf.a()
            return r2
        L17:
            java.lang.String r3 = r3.text
            if (r3 == 0) goto L21
            boolean r3 = defpackage.muc.b0(r3)
            if (r3 == 0) goto L3d
        L21:
            r2 = r1
            goto L3d
        L23:
            com.medium.proto.model.MixtapeMetadata r3 = r3.mixtape_metadata
            if (r3 != 0) goto L3d
            goto L21
        L28:
            com.medium.proto.model.IframeMetadata r3 = r3.iframe
            if (r3 != 0) goto L3d
            goto L21
        L2d:
            gen.model.ImageMetadata r3 = r3.metadata
            if (r3 != 0) goto L3d
            goto L21
        L32:
            java.lang.String r3 = r3.text
            if (r3 == 0) goto L21
            boolean r3 = defpackage.muc.b0(r3)
            if (r3 == 0) goto L3d
            goto L21
        L3d:
            r3 = r2 ^ 1
            return r3
        L40:
            java.lang.String r3 = "Unknown paragraph type"
            defpackage.ygf.f(r3)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n19.c(com.medium.proto.model.ParagraphPb):boolean");
    }

    public static final ImageMetadataData d(ImageMetadata imageMetadata) {
        imageMetadata.getClass();
        com.medium.android.graphql.type.ImageMetadata.INSTANCE.getClass();
        String str = com.medium.android.graphql.type.ImageMetadata.type.u;
        String str2 = imageMetadata.id;
        if (str2 == null) {
            return null;
        }
        Integer num = imageMetadata.original_width;
        Double dValueOf = null;
        Integer num2 = imageMetadata.original_height;
        Double dValueOf2 = imageMetadata.focus_percent_x != null ? Double.valueOf(r6.floatValue()) : null;
        if (imageMetadata.focus_percent_y != null) {
            dValueOf = Double.valueOf(r7.floatValue());
        }
        return new ImageMetadataData(str, str2, num, num2, dValueOf2, dValueOf, imageMetadata.alt);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final ParagraphData e(ParagraphPb paragraphPb) {
        String str;
        String str2;
        String str3;
        ParagraphData paragraphData;
        ParagraphData.Iframe iframe;
        ParagraphData.Metadata metadata;
        ParagraphData.MixtapeMetadata mixtapeMetadata;
        ParagraphType paragraphType;
        ParagraphData.DropCapImage dropCapImage;
        ImageMetadataData imageMetadataDataD;
        ParagraphType paragraphType2;
        ImageMetadataData imageMetadataDataD2;
        MarkupType markupType;
        Iterator it2;
        AnchorType anchorType;
        AnchorType anchorType2;
        MarkupType markupType2;
        ParagraphData.Iframe iframe2;
        ParagraphData paragraphData2;
        paragraphPb.getClass();
        Paragraph.INSTANCE.getClass();
        String str4 = Paragraph.type.u;
        String str5 = paragraphPb.id;
        if (str5 == null) {
            str5 = "";
        }
        String str6 = str5;
        String str7 = paragraphPb.name;
        String str8 = paragraphPb.href;
        String str9 = paragraphPb.text;
        IframeMetadata iframeMetadata = paragraphPb.iframe;
        if (iframeMetadata != null) {
            String str10 = iframeMetadata.media_resource_id;
            if (str10 == null) {
                str = str4;
                str2 = str6;
                str3 = str7;
                iframe2 = null;
                paragraphData2 = null;
            } else {
                Iframe.INSTANCE.getClass();
                String str11 = Iframe.type.u;
                String str12 = Iframe.type.u;
                Integer num = iframeMetadata.iframe_height;
                Integer num2 = iframeMetadata.iframe_width;
                MediaResource.INSTANCE.getClass();
                paragraphData2 = null;
                str = str4;
                str2 = str6;
                str3 = str7;
                iframe2 = new ParagraphData.Iframe(str11, new IframeData(str12, num, num2, new IframeData.MediaResource(MediaResource.type.u, str10, new MediaResourceData(MediaResource.type.u, str10, iframeMetadata.external_src, iframeMetadata.thumbnail_url))));
            }
            iframe = iframe2;
            paragraphData = paragraphData2;
        } else {
            str = str4;
            str2 = str6;
            str3 = str7;
            paragraphData = null;
            iframe = null;
        }
        BlockLayout blockLayout = paragraphPb.layout;
        LayoutType layoutTypeF = blockLayout != null ? f(blockLayout) : paragraphData;
        List<MarkupModel> list = paragraphPb.markups;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            MarkupModel markupModel = (MarkupModel) it3.next();
            Markup.INSTANCE.getClass();
            String str13 = Markup.type.u;
            String str14 = Markup.type.u;
            String str15 = markupModel.name;
            com.medium.proto.obv.post.MarkupType markupType3 = markupModel.type;
            if (markupType3 != null) {
                switch (ri7.a[markupType3.ordinal()]) {
                    case 1:
                        markupType2 = MarkupType.STRONG;
                        break;
                    case 2:
                        markupType2 = MarkupType.A;
                        break;
                    case 3:
                        markupType2 = MarkupType.EM;
                        break;
                    case 4:
                        markupType2 = MarkupType.HIGHLIGHT;
                        break;
                    case 5:
                        markupType2 = MarkupType.WARNING;
                        break;
                    case 6:
                        markupType2 = MarkupType.COMMENT;
                        break;
                    case 7:
                        markupType2 = MarkupType.QUOTE;
                        break;
                    case 8:
                        markupType2 = MarkupType.SENTENCE_DEPRECATED;
                        break;
                    case 9:
                        markupType2 = MarkupType.QUERY;
                        break;
                    case 10:
                        markupType2 = MarkupType.CODE;
                        break;
                    case 11:
                        markupType2 = MarkupType.UNUSED_DETAIL;
                        break;
                    default:
                        ygf.a();
                        return paragraphData;
                }
                markupType = markupType2;
            } else {
                markupType = paragraphData;
            }
            int iU = wgf.u(markupModel);
            int iT = wgf.t(markupModel);
            String str16 = markupModel.href;
            String str17 = markupModel.title;
            String str18 = markupModel.rel;
            com.medium.proto.obv.post.AnchorType anchorType3 = markupModel.anchor_type;
            if (anchorType3 != null) {
                int i = fk.a[anchorType3.ordinal()];
                it2 = it3;
                if (i == 1) {
                    anchorType2 = AnchorType.LINK;
                } else if (i == 2) {
                    anchorType2 = AnchorType.AUDIO;
                } else {
                    if (i != 3) {
                        ygf.a();
                        return paragraphData;
                    }
                    anchorType2 = AnchorType.USER;
                }
                anchorType = anchorType2;
            } else {
                it2 = it3;
                anchorType = paragraphData;
            }
            arrayList.add(new ParagraphData.Markup(str13, new MarkupData(str14, str15, markupType, iU, iT, str16, str17, str18, anchorType, markupModel.user_id, markupModel.creator_ids)));
            it3 = it2;
        }
        ImageMetadata imageMetadata = paragraphPb.metadata;
        if (imageMetadata != null) {
            com.medium.android.graphql.type.ImageMetadata.INSTANCE.getClass();
            String str19 = com.medium.android.graphql.type.ImageMetadata.type.u;
            String str20 = imageMetadata.id;
            metadata = (str20 == null || (imageMetadataDataD2 = d(imageMetadata)) == null) ? paragraphData : new ParagraphData.Metadata(str19, str20, imageMetadataDataD2);
        } else {
            metadata = paragraphData;
        }
        MixtapeMetadata mixtapeMetadata2 = paragraphPb.mixtape_metadata;
        if (mixtapeMetadata2 != null) {
            com.medium.android.graphql.type.MixtapeMetadata.INSTANCE.getClass();
            mixtapeMetadata = new ParagraphData.MixtapeMetadata(com.medium.android.graphql.type.MixtapeMetadata.type.u, new MixtapeMetadataData(com.medium.android.graphql.type.MixtapeMetadata.type.u, mixtapeMetadata2.media_resource_id, mixtapeMetadata2.href, mixtapeMetadata2.thumbnail_image_id, null));
        } else {
            mixtapeMetadata = paragraphData;
        }
        com.medium.proto.obv.post.ParagraphType paragraphType3 = paragraphPb.type;
        if (paragraphType3 != null) {
            switch (m19.d[paragraphType3.ordinal()]) {
                case 1:
                    paragraphType2 = ParagraphType.P;
                    break;
                case 2:
                    paragraphType2 = ParagraphType.H2;
                    break;
                case 3:
                    paragraphType2 = ParagraphType.H3;
                    break;
                case 4:
                    paragraphType2 = ParagraphType.IMG;
                    break;
                case 5:
                    paragraphType2 = ParagraphType.HR;
                    break;
                case 6:
                    paragraphType2 = ParagraphType.BQ;
                    break;
                case 7:
                    paragraphType2 = ParagraphType.PQ;
                    break;
                case 8:
                    paragraphType2 = ParagraphType.PRE;
                    break;
                case 9:
                    paragraphType2 = ParagraphType.ULI;
                    break;
                case 10:
                    paragraphType2 = ParagraphType.OLI;
                    break;
                case 11:
                    paragraphType2 = ParagraphType.IFRAME;
                    break;
                case 12:
                    paragraphType2 = ParagraphType.H1;
                    break;
                case 13:
                    paragraphType2 = ParagraphType.H4;
                    break;
                case 14:
                    paragraphType2 = ParagraphType.MIXTAPE_EMBED;
                    break;
                case 15:
                    paragraphType2 = ParagraphType.SECTION_CAPTION;
                    break;
                case 16:
                    paragraphType2 = ParagraphType.COVER_TITLE;
                    break;
                default:
                    ygf.a();
                    return paragraphData;
            }
            paragraphType = paragraphType2;
        } else {
            paragraphType = paragraphData;
        }
        Boolean bool = paragraphPb.has_drop_cap;
        ImageMetadata imageMetadata2 = paragraphPb.drop_cap_image;
        if (imageMetadata2 != null) {
            com.medium.android.graphql.type.ImageMetadata.INSTANCE.getClass();
            String str21 = com.medium.android.graphql.type.ImageMetadata.type.u;
            String str22 = imageMetadata2.id;
            dropCapImage = (str22 == null || (imageMetadataDataD = d(imageMetadata2)) == null) ? paragraphData : new ParagraphData.DropCapImage(str21, str22, imageMetadataDataD);
        } else {
            dropCapImage = paragraphData;
        }
        CodeBlockMetadata codeBlockMetadata = paragraphPb.code_block_metadata;
        ParagraphData.CodeBlockMetadata codeBlockMetadata2 = paragraphData;
        if (codeBlockMetadata != null) {
            com.medium.android.graphql.type.CodeBlockMetadata.INSTANCE.getClass();
            String str23 = com.medium.android.graphql.type.CodeBlockMetadata.type.u;
            String str24 = codeBlockMetadata.lang;
            SyntaxHighlightMode syntaxHighlightMode = codeBlockMetadata.mode;
            int i2 = syntaxHighlightMode == null ? -1 : m19.b[syntaxHighlightMode.ordinal()];
            codeBlockMetadata2 = new ParagraphData.CodeBlockMetadata(str23, str24, i2 != 1 ? i2 != 2 ? com.medium.android.graphql.type.SyntaxHighlightMode.DISABLED : com.medium.android.graphql.type.SyntaxHighlightMode.EXPLICIT : com.medium.android.graphql.type.SyntaxHighlightMode.AUTO);
        }
        return new ParagraphData(str, str2, str3, str8, str9, iframe, layoutTypeF, arrayList, metadata, mixtapeMetadata, paragraphType, bool, dropCapImage, codeBlockMetadata2);
    }

    public static final LayoutType f(BlockLayout blockLayout) {
        blockLayout.getClass();
        switch (m19.c[blockLayout.ordinal()]) {
            case 1:
                return LayoutType.INSET_CENTER;
            case 2:
                return LayoutType.INSET_LEFT;
            case 3:
                return LayoutType.OUTSET_CENTER;
            case 4:
                return LayoutType.OUTSET_LEFT;
            case 5:
                return LayoutType.FULL_WIDTH;
            case 6:
                return LayoutType.OUTSET_ROW;
            case 7:
                return LayoutType.OUTSET_ROW_CONTINUE;
            case 8:
                return LayoutType.FULL_WIDTH_CROPPED_COVER;
            case 9:
                return LayoutType.CONSTRAINED_HEIGHT_PREVIEW;
            case 10:
                return LayoutType.CROPPED_HEIGHT_PREVIEW;
            case 11:
                return LayoutType.INSET_CENTER_SMALL;
            case 12:
                return LayoutType.INSET_RIGHT;
            default:
                ygf.a();
                return null;
        }
    }
}
