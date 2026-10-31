package androidx.compose.ui.viewinterop;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import b4.v;
import c3.q2;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÂ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Landroidx/compose/ui/viewinterop/FocusTargetPropertiesElement;", "Lb3/j1;", "Lb4/v;", "<init>", "()V", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class FocusTargetPropertiesElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public static final FocusTargetPropertiesElement f14177b = new FocusTargetPropertiesElement();

    private FocusTargetPropertiesElement() {
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new v();
    }

    public final boolean equals(Object obj) {
        return obj == this;
    }

    public final int hashCode() {
        return -659549572;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("FocusTargetProperties");
    }

    @Override // b3.j1
    public final /* bridge */ /* synthetic */ void update(Modifier$Node modifier$Node) {
    }
}
