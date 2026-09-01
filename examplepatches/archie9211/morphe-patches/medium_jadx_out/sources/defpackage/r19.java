package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.graphql.fragment.LinkMetadataList;
import com.medium.android.graphql.type.LinkAlternateType;
import com.medium.reader.R;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r19 extends nr0 {
    public final n39 c;
    public final LinkedHashMap d = new LinkedHashMap();
    public final LinkedHashMap e = new LinkedHashMap();
    public final vq6 f = vx0.d0(yw6.NONE, new yj8(7, this));

    public r19(n39 n39Var) {
        String str;
        Uri uri;
        Uri uri2;
        this.c = n39Var;
        for (LinkMetadataList.C0000LinkMetadataList c0000LinkMetadataList : n39Var.d.getLinkMetadataList()) {
            List<LinkMetadataList.Alt> alts = c0000LinkMetadataList.getAlts();
            if (alts != null) {
                for (LinkMetadataList.Alt alt : alts) {
                    Uri uri3 = null;
                    if ((alt != null ? alt.getType() : null) != null && alt.getType() == LinkAlternateType.ANDROID_APPLINK) {
                        String url = alt.getUrl();
                        str = url != null ? url : "";
                        str = str.length() <= 0 ? null : str;
                        if (str != null && (uri2 = Uri.parse(str)) != null && uri2.isAbsolute()) {
                            uri3 = uri2;
                        }
                        if (uri3 != null) {
                            this.d.put(c0000LinkMetadataList.getUrl(), uri3);
                        }
                    } else if ((alt != null ? alt.getType() : null) != null && alt.getType() == LinkAlternateType.AMP) {
                        String url2 = alt.getUrl();
                        str = url2 != null ? url2 : "";
                        str = str.length() <= 0 ? null : str;
                        if (str != null && (uri = Uri.parse(str)) != null && uri.isAbsolute()) {
                            uri3 = uri;
                        }
                        if (uri3 != null) {
                            this.e.put(c0000LinkMetadataList.getUrl(), uri3);
                        }
                    }
                }
            }
        }
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        Context context = pr0Var.a.getContext();
        View childAt = ((gve) pr0Var.t).b.getChildAt(0);
        childAt.getClass();
        ParagraphView paragraphView = (ParagraphView) childAt;
        paragraphView.setActionHandler((h09) this.f.getValue());
        zm8 zm8Var = this.c.r;
        o19 o19Var = new o19(0, new iu(this, pr0Var, paragraphView, context, 18));
        o19 o19Var2 = new o19(1, new hb8(20));
        zm8Var.getClass();
        do6 do6Var = new do6(o19Var, o19Var2);
        zm8Var.b0(do6Var);
        this.a.a(do6Var);
    }

    @Override // defpackage.nr0
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final pr0 c(View view) {
        view.getClass();
        pr0 pr0VarC = super.c(view);
        LayoutInflater.from(new ContextThemeWrapper(view.getContext(), mk7.x(this.c.m.O()))).inflate(e(), ((gve) pr0VarC.t).b);
        return pr0VarC;
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_paragraph_item;
    }

    @Override // defpackage.nr0
    public final int e() {
        n39 n39Var = this.c;
        return n19.a(n39Var.b, n39Var.c);
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        FrameLayout frameLayout = (FrameLayout) view;
        FrameLayout frameLayout2 = (FrameLayout) vn7.x(view, R.id.paragraph_container);
        if (frameLayout2 != null) {
            return new gve(frameLayout, frameLayout2);
        }
        z72.c("Missing required view with ID: ".concat(view.getResources().getResourceName(R.id.paragraph_container)));
        return null;
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return (nr0Var instanceof r19) && g76.L(((r19) nr0Var).c, this.c);
    }

    @Override // defpackage.nr0
    public final void i(pr0 pr0Var) {
        View childAt = ((gve) pr0Var.t).b.getChildAt(0);
        childAt.getClass();
        ((ParagraphView) childAt).a(new g98(1, this.c.f, z19.class, "onHighlightPresented", "onHighlightPresented(Lcom/medium/android/domain/post/models/Highlight;)V", 0, 11));
    }

    @Override // defpackage.nr0
    public final void j(pr0 pr0Var) {
        rk6 rk6Var;
        View childAt = ((gve) pr0Var.t).b.getChildAt(0);
        childAt.getClass();
        ParagraphView paragraphView = (ParagraphView) childAt;
        TextView textView = paragraphView.c;
        ViewTreeObserver viewTreeObserver = textView != null ? textView.getViewTreeObserver() : null;
        if (viewTreeObserver != null && viewTreeObserver.isAlive() && (rk6Var = paragraphView.l) != null) {
            viewTreeObserver.removeOnPreDrawListener(rk6Var);
        }
        paragraphView.l = null;
    }

    @Override // defpackage.nr0
    /* JADX INFO: renamed from: l, reason: merged with bridge method [inline-methods] */
    public final void m(pr0 pr0Var) {
        View childAt = ((gve) pr0Var.t).b.getChildAt(0);
        childAt.getClass();
        ParagraphView paragraphView = (ParagraphView) childAt;
        ComposeView composeView = paragraphView.getComposeView();
        if (composeView != null) {
            composeView.e();
        }
        View media = paragraphView.getMedia();
        ComposeView composeView2 = media instanceof ComposeView ? (ComposeView) media : null;
        if (composeView2 != null) {
            composeView2.e();
        }
        super.m(pr0Var);
    }
}
