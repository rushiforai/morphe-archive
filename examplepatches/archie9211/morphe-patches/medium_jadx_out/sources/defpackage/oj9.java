package defpackage;

import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oj9 extends nr0 {
    public final pj9 c;

    public oj9(pj9 pj9Var) {
        this.c = pj9Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ive iveVar = (ive) pr0Var.t;
        Resources resources = iveVar.a.getContext().getResources();
        ComposeView composeView = iveVar.a;
        ViewGroup.LayoutParams layoutParams = composeView.getLayoutParams();
        layoutParams.getClass();
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        marginLayoutParams.topMargin = resources.getDimensionPixelSize(R.dimen.paywall_offset);
        composeView.setLayoutParams(marginLayoutParams);
        iveVar.a.setContent(new mz1(new nj9(this, 0), true, 1515848946));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_post_paywall;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return new ive((ComposeView) view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return (nr0Var instanceof oj9) && ((oj9) nr0Var).c == this.c;
    }
}
