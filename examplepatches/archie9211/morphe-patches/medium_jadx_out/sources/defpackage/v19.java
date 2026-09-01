package defpackage;

import android.content.Context;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.fragment.ParagraphData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v19 implements i09 {
    public final d39 a;
    public final String b;
    public final w19 c;
    public ParagraphView d;

    public v19(d39 d39Var, String str, w19 w19Var) {
        str.getClass();
        this.a = d39Var;
        this.b = str;
        this.c = w19Var;
    }

    @Override // defpackage.i09
    public final void a(l09 l09Var, ParagraphView paragraphView) {
        this.d = paragraphView;
        View media = paragraphView.getMedia();
        media.getClass();
        ImageView imageView = (ImageView) media;
        ParagraphData paragraphDataB = l09Var.b();
        ParagraphData.Metadata metadata = paragraphDataB.getMetadata();
        ImageMetadataData imageMetadataData = metadata != null ? metadata.getImageMetadataData() : null;
        paragraphView.setVisibility(imageMetadataData != null ? 0 : 8);
        if (imageMetadataData == null) {
            return;
        }
        paragraphView.setParagraphContext(l09Var);
        this.a.b(paragraphView, l09Var).e();
        imageView.setContentDescription(imageMetadataData.getAlt());
        Context context = imageView.getContext();
        context.getClass();
        cfc cfcVarA = new x19(context, l09Var.b().getLayout(), imageMetadataData.getOriginalWidth(), imageMetadataData.getOriginalHeight(), l09Var.d == 0).a();
        ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
        if (layoutParams == null) {
            z72.c("null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
            return;
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        xe3 xe3Var = cfcVarA.a;
        int i = xe3Var instanceof ue3 ? ((ue3) xe3Var).a : 0;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            marginLayoutParams.width = numValueOf.intValue();
        }
        xe3 xe3Var2 = cfcVarA.b;
        int i2 = xe3Var2 instanceof ue3 ? ((ue3) xe3Var2).a : 0;
        Integer numValueOf2 = i2 != 0 ? Integer.valueOf(i2) : null;
        if (numValueOf2 != null) {
            marginLayoutParams.height = numValueOf2.intValue();
        }
        imageView.setLayoutParams(marginLayoutParams);
        gx5 gx5VarA = yec.a(imageView.getContext());
        nx5 nx5Var = new nx5(imageView.getContext());
        nx5Var.c = imageMetadataData;
        q84 q84Var = wx5.a;
        nx5Var.d = new fy5(imageView);
        nx5Var.r = dqb.FIT;
        nx5Var.c(cfcVarA);
        if (Build.VERSION.SDK_INT == 26) {
            nx5Var.b().a(wx5.f, Boolean.FALSE);
        }
        Context context2 = imageView.getContext();
        context2.getClass();
        hlg.Y(nx5Var, context2);
        ((kva) gx5VarA).a(nx5Var.a());
        String href = paragraphDataB.getHref();
        if (href != null && href.length() != 0) {
            imageView.setOnClickListener(new f19(this, 2, href));
        } else if (l09Var.e.getAreImagesZoomable()) {
            imageView.setOnClickListener(new pa4(imageView, this, l09Var, imageMetadataData, 2));
        }
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
