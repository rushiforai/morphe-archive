package com.amplitude.android.internal.compose;

import androidx.compose.ui.Modifier$Node;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0002\u0010\u0005R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\tR\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u0007\"\u0004\b\u000b\u0010\t¨\u0006\f"}, d2 = {"Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreNode;", "Landroidx/compose/ui/Modifier$Node;", "ignoreRageClick", b.f42142b, "ignoreDeadClick", "(ZZ)V", "getIgnoreDeadClick", "()Z", "setIgnoreDeadClick", "(Z)V", "getIgnoreRageClick", "setIgnoreRageClick", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AmpFrustrationIgnoreNode extends Modifier$Node {
    private boolean ignoreDeadClick;
    private boolean ignoreRageClick;

    public AmpFrustrationIgnoreNode(boolean z11, boolean z12) {
        this.ignoreRageClick = z11;
        this.ignoreDeadClick = z12;
    }

    public final boolean getIgnoreDeadClick() {
        return this.ignoreDeadClick;
    }

    public final boolean getIgnoreRageClick() {
        return this.ignoreRageClick;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public /* bridge */ /* synthetic */ void onDensityChange() {
    }

    @Override // androidx.compose.ui.Modifier$Node
    public /* bridge */ /* synthetic */ void onLayoutDirectionChange() {
    }

    public final void setIgnoreDeadClick(boolean z11) {
        this.ignoreDeadClick = z11;
    }

    public final void setIgnoreRageClick(boolean z11) {
        this.ignoreRageClick = z11;
    }
}
