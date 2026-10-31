package g2;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c extends Modifier$Node implements e {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f56857a;

    /* renamed from: b, reason: collision with root package name */
    public w f56858b;

    @Override // g2.e
    public final void onFocusEvent(v vVar) {
        if (Intrinsics.b(this.f56858b, vVar)) {
            return;
        }
        this.f56858b = (w) vVar;
        this.f56857a.invoke(vVar);
    }
}
