package androidx.compose.ui.viewinterop;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import b4.u;
import c3.q2;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Landroidx/compose/ui/viewinterop/FocusGroupPropertiesElement;", "Lb3/j1;", "Lb4/u;", "<init>", "()V", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class FocusGroupPropertiesElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public static final FocusGroupPropertiesElement f14176b = new FocusGroupPropertiesElement();

    private FocusGroupPropertiesElement() {
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new u();
    }

    public final boolean equals(Object obj) {
        return obj == this;
    }

    public final int hashCode() {
        return -1929324230;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("FocusGroupProperties");
    }

    @Override // b3.j1
    public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
    }
}
