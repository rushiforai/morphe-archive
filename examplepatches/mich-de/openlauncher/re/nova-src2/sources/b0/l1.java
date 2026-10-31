package b0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public abstract class l1 extends Modifier$Node implements b3.e0 {
    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return sVar.b(i5);
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return sVar.F(i5);
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return sVar.t(i5);
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return sVar.E(i5);
    }
}
