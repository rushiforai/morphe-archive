package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hve implements ete {
    public final ComposeView a;

    public hve(ComposeView composeView) {
        this.a = composeView;
    }

    public static hve a(View view) {
        if (view != null) {
            return new hve((ComposeView) view);
        }
        z72.c("rootView");
        return null;
    }

    @Override // defpackage.ete
    public final View getRoot() {
        return this.a;
    }
}
