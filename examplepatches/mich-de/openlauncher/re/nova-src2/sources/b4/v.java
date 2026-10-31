package b4;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class v extends Modifier$Node implements g2.q {
    @Override // g2.q
    public final void applyFocusProperties(g2.m mVar) {
        mVar.b(getNode().getIsAttached() && o.c(this).hasFocusable());
    }
}
