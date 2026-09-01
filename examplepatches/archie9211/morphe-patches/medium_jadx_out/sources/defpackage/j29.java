package defpackage;

import android.net.Uri;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.domain.post.models.Markup;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.MixtapeMetadataData;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j29 implements i09 {
    public final d39 a;
    public final qi1 b;
    public final tg1 c;
    public x45 d;
    public ye1 e;

    public j29(d39 d39Var, qi1 qi1Var, tg1 tg1Var) {
        qi1Var.getClass();
        tg1Var.getClass();
        this.a = d39Var;
        this.b = qi1Var;
        this.c = tg1Var;
    }

    @Override // defpackage.i09
    public final void a(l09 l09Var, ParagraphView paragraphView) {
        String href;
        MixtapeMetadataData.MediaResource mediaResource;
        MixtapeMetadataData.MediumCatalog mediumCatalog;
        CatalogPreviewData catalogPreviewData;
        zi5 zi5Var = zi5.h;
        if (l09Var.b().getType() != ParagraphType.MIXTAPE_EMBED) {
            ygf.f("Check failed.");
            return;
        }
        paragraphView.setParagraphContext(l09Var);
        this.a.b(paragraphView, l09Var).e();
        ParagraphData.MixtapeMetadata mixtapeMetadata = l09Var.b().getMixtapeMetadata();
        b85 b85Var = null;
        uri = null;
        Uri uri = null;
        MixtapeMetadataData mixtapeMetadataData = mixtapeMetadata != null ? mixtapeMetadata.getMixtapeMetadataData() : null;
        rg1 rg1VarA = (mixtapeMetadataData == null || (mediaResource = mixtapeMetadataData.getMediaResource()) == null || (mediumCatalog = mediaResource.getMediumCatalog()) == null || (catalogPreviewData = mediumCatalog.getCatalogPreviewData()) == null) ? null : this.c.a("", catalogPreviewData);
        String text = l09Var.b().getText();
        if (text != null) {
            List<ParagraphData.Markup> markups = l09Var.b().getMarkups();
            ArrayList arrayList = new ArrayList();
            Iterator<T> it2 = markups.iterator();
            while (it2.hasNext()) {
                Markup markupO = bgf.O(((ParagraphData.Markup) it2.next()).getMarkupData());
                if (markupO != null) {
                    arrayList.add(markupO);
                }
            }
            az5 az5VarF0 = bo.f0(arrayList);
            String thumbnailImageId = mixtapeMetadataData != null ? mixtapeMetadataData.getThumbnailImageId() : null;
            if (mixtapeMetadataData != null && (href = mixtapeMetadataData.getHref()) != null) {
                uri = Uri.parse(href);
            }
            b85Var = new b85(text, uri, az5VarF0, thumbnailImageId);
        }
        int i = 0;
        if (rg1VarA != null) {
            ComposeView composeView = paragraphView.getComposeView();
            if (composeView == null) {
                ay0.e("Required value was null.");
                return;
            } else {
                composeView.setViewCompositionStrategy(zi5Var);
                composeView.setContent(new mz1(new i29(rg1VarA, this, i), true, 680982869));
                return;
            }
        }
        if (b85Var != null) {
            ComposeView composeView2 = paragraphView.getComposeView();
            if (composeView2 == null) {
                ay0.e("Required value was null.");
            } else {
                composeView2.setViewCompositionStrategy(zi5Var);
                composeView2.setContent(new mz1(new h29(b85Var, this, 0), true, 797963693));
            }
        }
    }

    @Override // defpackage.i09
    public final qxb b() {
        return qxb.c;
    }
}
