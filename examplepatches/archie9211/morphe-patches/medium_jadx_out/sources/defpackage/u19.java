package defpackage;

import android.view.View;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.graphql.fragment.IframeData;
import com.medium.android.graphql.fragment.MediaResourceData;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u19 implements i09 {
    public final d39 a;
    public final String b;
    public final xv5 c;
    public ParagraphView d;

    public u19(d39 d39Var, String str, xv5 xv5Var) {
        str.getClass();
        this.a = d39Var;
        this.b = str;
        this.c = xv5Var;
    }

    @Override // defpackage.i09
    public final void a(l09 l09Var, ParagraphView paragraphView) {
        IframeData.MediaResource mediaResource;
        MediaResourceData mediaResourceData;
        IframeData.MediaResource mediaResource2;
        MediaResourceData mediaResourceData2;
        if (l09Var.b().getType() != ParagraphType.IFRAME) {
            ygf.f("Check failed.");
            return;
        }
        this.d = paragraphView;
        paragraphView.setParagraphContext(l09Var);
        View media = paragraphView.getMedia();
        media.getClass();
        ComposeView composeView = (ComposeView) media;
        ParagraphData.Iframe iframe = l09Var.b().getIframe();
        String thumbnailUrl = null;
        IframeData iframeData = iframe != null ? iframe.getIframeData() : null;
        String id = (iframeData == null || (mediaResource2 = iframeData.getMediaResource()) == null || (mediaResourceData2 = mediaResource2.getMediaResourceData()) == null) ? null : mediaResourceData2.getId();
        if (iframeData != null && (mediaResource = iframeData.getMediaResource()) != null && (mediaResourceData = mediaResource.getMediaResourceData()) != null) {
            thumbnailUrl = mediaResourceData.getThumbnailUrl();
        }
        String str = thumbnailUrl;
        if (iframeData == null || id == null) {
            composeView.setVisibility(8);
            return;
        }
        this.a.b(paragraphView, l09Var).e();
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new t19(id, this, str, iframeData, 0), true, 1996365019));
    }

    @Override // defpackage.i09
    public final qxb b() {
        qxb qxbVarD;
        ParagraphView paragraphView = this.d;
        if (paragraphView != null) {
            TextView text = paragraphView.getText();
            return (text == null || (qxbVarD = ok7.D(text)) == null) ? qxb.c : qxbVarD;
        }
        g76.g0("view");
        throw null;
    }
}
