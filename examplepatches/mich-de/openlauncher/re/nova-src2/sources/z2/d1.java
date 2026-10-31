package z2;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class d1 extends Modifier$Node implements b3.r {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f98034a;

    @Override // b3.r
    public final void onGloballyPositioned(y yVar) {
        this.f98034a.invoke(yVar);
    }
}
