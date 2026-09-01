package defpackage;

import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g39 implements i09 {
    public final d39 a;
    public ParagraphView b;

    public g39(d39 d39Var) {
        this.a = d39Var;
    }

    @Override // defpackage.i09
    public final void a(l09 l09Var, ParagraphView paragraphView) {
        this.b = paragraphView;
        ComposeView composeView = paragraphView.getComposeView();
        if (composeView != null) {
            composeView.setVisibility(8);
        }
        paragraphView.setParagraphContext(l09Var);
        this.a.b(paragraphView, l09Var).e();
    }

    @Override // defpackage.i09
    public final qxb b() {
        qxb qxbVarD;
        ParagraphView paragraphView = this.b;
        if (paragraphView != null) {
            TextView text = paragraphView.getText();
            return (text == null || (qxbVarD = ok7.D(text)) == null) ? qxb.c : qxbVarD;
        }
        g76.g0("view");
        throw null;
    }
}
