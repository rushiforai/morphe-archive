package defpackage;

import android.net.Uri;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.graphql.CreateMediaResourceMutation;
import com.medium.proto.model.IframeMetadata;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.MixtapeMetadata;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SectionModel;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import com.medium.proto.obv.post.ParagraphType;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qm7 implements ou3 {
    public final fi9 a;

    public qm7(fi9 fi9Var) {
        this.a = fi9Var;
    }

    @Override // defpackage.ou3
    public final boolean a(SelectionPb selectionPb) {
        selectionPb.getClass();
        return false;
    }

    @Override // defpackage.ou3
    public final boolean b(yw1 yw1Var) {
        return yw1Var instanceof uw1;
    }

    @Override // defpackage.ou3
    public final void d(yw1 yw1Var, SelectionPb selectionPb) {
        fi9 fi9Var;
        SectionModel sectionModel;
        ParagraphPb paragraphPb;
        String description;
        EditPostBodyView editPostBodyView;
        int length;
        ParagraphPb paragraphPb2;
        CreateMediaResourceMutation.PreviewContent previewContent;
        selectionPb.getClass();
        if (!(yw1Var instanceof uw1)) {
            ygf.f("Check failed.");
            return;
        }
        tw1 tw1Var = ((uw1) yw1Var).a;
        boolean z = tw1Var instanceof sw1;
        fi9 fi9Var2 = this.a;
        if (z) {
            sw1 sw1Var = (sw1) tw1Var;
            int i = sw1Var.a;
            EditPostBodyView editPostBodyView2 = (EditPostBodyView) fi9Var2;
            SectionModel sectionModelE = editPostBodyView2.e(i);
            ParagraphPb paragraphPb3 = new ParagraphPb(sw1Var.b, ParagraphType.MIXTAPE_EMBED, null, ey3.a, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524276, null);
            if (sectionModelE == null || sectionModelE.start_index != i) {
                editPostBodyView2.o(i);
                editPostBodyView2.g(i, paragraphPb3);
                SelectionPb selectionPb2 = rxb.a;
                fi9Var2.setSelection(rxb.b(i));
            } else {
                editPostBodyView2.g(i + 1, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
                int i2 = i + 2;
                editPostBodyView2.g(i2, paragraphPb3);
                SelectionPb selectionPb3 = rxb.a;
                fi9Var2.setSelection(rxb.b(i2));
                editPostBodyView2.o(i);
                editPostBodyView2.o(i);
            }
            editPostBodyView2.g(i + 1, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
            return;
        }
        if (!(tw1Var instanceof rw1)) {
            if (tw1Var instanceof qw1) {
                ((EditPostBodyView) fi9Var2).o(((qw1) tw1Var).a);
                return;
            } else if (tw1Var instanceof pw1) {
                ((EditPostBodyView) fi9Var2).o(((pw1) tw1Var).a);
                return;
            } else {
                ygf.a();
                return;
            }
        }
        rw1 rw1Var = (rw1) tw1Var;
        String str = rw1Var.b;
        int i3 = rw1Var.a;
        CreateMediaResourceMutation.OnMediaResource onMediaResource = rw1Var.c;
        EditPostBodyView editPostBodyView3 = (EditPostBodyView) fi9Var2;
        SectionModel sectionModelE2 = editPostBodyView3.e(i3);
        ParagraphPb paragraphPbR = editPostBodyView3.r(i3);
        String iframeSrc = onMediaResource.getIframeSrc();
        if (iframeSrc == null || muc.b0(iframeSrc)) {
            iframeSrc = null;
        }
        if (iframeSrc != null) {
            editPostBodyView = editPostBodyView3;
            sectionModel = sectionModelE2;
            fi9Var = fi9Var2;
            paragraphPb = paragraphPbR;
            paragraphPb2 = new ParagraphPb(str, ParagraphType.IFRAME, null, null, null, null, null, new IframeMetadata(onMediaResource.getId(), onMediaResource.getIframeWidth(), onMediaResource.getIframeHeight(), null, onMediaResource.getIframeSrc(), onMediaResource.getThumbnailUrl(), null, 72, null), null, null, null, null, null, null, null, null, null, null, null, 524156, null);
        } else {
            fi9Var = fi9Var2;
            sectionModel = sectionModelE2;
            paragraphPb = paragraphPbR;
            String title = onMediaResource.getTitle();
            if (title == null || muc.b0(title)) {
                title = null;
            }
            if (title == null && onMediaResource.getMediumPost() == null && onMediaResource.getMediumCatalog() == null) {
                editPostBodyView3.o(i3);
                return;
            }
            String title2 = onMediaResource.getTitle();
            if (title2 == null || muc.b0(title2)) {
                title2 = null;
            }
            CreateMediaResourceMutation.MediumPost mediumPost = onMediaResource.getMediumPost();
            CreateMediaResourceMutation.MediumCatalog mediumCatalog = onMediaResource.getMediumCatalog();
            String description2 = onMediaResource.getDescription();
            if (description2 == null || muc.b0(description2)) {
                description2 = null;
            }
            if (mediumPost == null ? !(mediumCatalog == null || (description = mediumCatalog.getDescription()) == null) : !((previewContent = mediumPost.getPreviewContent()) == null || (description = previewContent.getSubtitle()) == null)) {
                description2 = description;
            }
            String str2 = rw1Var.d;
            String host = Uri.parse(str2).getHost();
            StringBuilder sb = new StringBuilder();
            if (title2 != null) {
                sb.append(title2.concat("\n"));
            }
            if (description2 != null) {
                sb.append(description2);
            }
            if (host != null) {
                sb.append("\n".concat(host));
            }
            String string = sb.toString();
            ArrayList arrayList = new ArrayList();
            String str3 = title2;
            editPostBodyView = editPostBodyView3;
            arrayList.add(new MarkupModel(MarkupType.A, 0, Integer.valueOf(string.length()), str2, str2, null, AnchorType.LINK, null, null, null, null, null, 4000, null));
            if (str3 != null) {
                arrayList.add(new MarkupModel(MarkupType.STRONG, 0, Integer.valueOf(str3.length() + 1), null, null, null, null, null, null, null, null, null, 4088, null));
                length = str3.length();
            } else {
                length = 0;
            }
            arrayList.add(new MarkupModel(MarkupType.EM, Integer.valueOf(length), Integer.valueOf(string.length() - (host != null ? host.length() + 1 : 0)), null, null, null, null, null, null, null, null, null, 4088, null));
            paragraphPb2 = new ParagraphPb(str, ParagraphType.MIXTAPE_EMBED, string, arrayList, null, null, null, null, null, null, null, new MixtapeMetadata(onMediaResource.getId(), onMediaResource.getThumbnailImageId(), str2, null, 8, null), null, null, null, null, null, null, null, 522224, null);
        }
        ParagraphType paragraphType = paragraphPb != null ? paragraphPb.type : null;
        if (paragraphType == null) {
            editPostBodyView.g(i3, paragraphPb2);
            SelectionPb selectionPb4 = rxb.a;
            fi9Var.setSelection(rxb.b(i3));
            editPostBodyView.g(i3 + 1, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
            return;
        }
        fi9 fi9Var3 = fi9Var;
        ParagraphType paragraphType2 = ParagraphType.MIXTAPE_EMBED;
        if (paragraphType == paragraphType2 && paragraphPb2.type == ParagraphType.IFRAME) {
            editPostBodyView.o(i3);
            editPostBodyView.g(i3, paragraphPb2);
            SelectionPb selectionPb5 = rxb.a;
            fi9Var3.setSelection(rxb.b(i3));
            return;
        }
        ParagraphType paragraphType3 = ParagraphType.IFRAME;
        if (paragraphType == paragraphType3 && paragraphPb2.type == paragraphType2) {
            editPostBodyView.o(i3);
            editPostBodyView.g(i3, paragraphPb2);
            SelectionPb selectionPb6 = rxb.a;
            fi9Var3.setSelection(rxb.b(i3));
            return;
        }
        if (paragraphType == paragraphType3 || paragraphType == paragraphType2) {
            String str4 = paragraphPb.text;
            String str5 = (str4 == null || muc.b0(str4)) ? null : str4;
            if (str5 == null) {
                editPostBodyView.o(i3);
                editPostBodyView.g(i3, paragraphPb2);
                SelectionPb selectionPb7 = rxb.a;
                fi9Var3.setSelection(rxb.b(i3));
                return;
            }
            ParagraphPb paragraphPb4 = new ParagraphPb(null, ParagraphType.P, str5, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524281, null);
            editPostBodyView.o(i3);
            editPostBodyView.g(i3, paragraphPb4);
            SelectionPb selectionPb8 = rxb.a;
            fi9Var3.setSelection(rxb.a(i3, str5.length()));
            return;
        }
        if (!l28.c(paragraphType)) {
            editPostBodyView.g(i3 + 1, paragraphPb2);
            SelectionPb selectionPb9 = rxb.a;
            fi9Var3.setSelection(rxb.b(i3));
            return;
        }
        SectionModel sectionModel2 = sectionModel;
        if (sectionModel2 == null || sectionModel2.start_index != i3) {
            editPostBodyView.o(i3);
            editPostBodyView.g(i3, paragraphPb2);
            SelectionPb selectionPb10 = rxb.a;
            fi9Var3.setSelection(rxb.b(i3));
            return;
        }
        editPostBodyView.g(i3 + 1, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
        int i4 = i3 + 2;
        editPostBodyView.g(i4, paragraphPb2);
        SelectionPb selectionPb11 = rxb.a;
        fi9Var3.setSelection(rxb.b(i4));
        editPostBodyView.o(i3);
        editPostBodyView.o(i3);
    }
}
