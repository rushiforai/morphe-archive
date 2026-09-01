package defpackage;

import android.view.View;
import androidx.compose.ui.platform.ComposeView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ive implements ete {
    public final ComposeView a;

    public ive(ComposeView composeView) {
        this.a = composeView;
    }

    @Override // defpackage.ete
    public final View getRoot() {
        return this.a;
    }
}
