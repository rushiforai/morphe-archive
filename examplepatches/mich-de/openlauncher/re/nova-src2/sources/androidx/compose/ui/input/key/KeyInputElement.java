package androidx.compose.ui.input.key;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import t2.e;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/input/key/KeyInputElement;", "Lb3/j1;", "Lt2/e;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class KeyInputElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14146b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f14147c;

    public KeyInputElement(Function1 function1, Function1 function12) {
        this.f14146b = function1;
        this.f14147c = function12;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        e eVar = new e();
        eVar.f88482a = this.f14146b;
        eVar.f88483b = this.f14147c;
        return eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof KeyInputElement)) {
            return false;
        }
        KeyInputElement keyInputElement = (KeyInputElement) obj;
        return this.f14146b == keyInputElement.f14146b && this.f14147c == keyInputElement.f14147c;
    }

    public final int hashCode() {
        Function1 function1 = this.f14146b;
        int iHashCode = (function1 != null ? function1.hashCode() : 0) * 31;
        Function1 function12 = this.f14147c;
        return iHashCode + (function12 != null ? function12.hashCode() : 0);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        Function1 function1 = this.f14146b;
        if (function1 != null) {
            q2Var.d("onKeyEvent");
            q2Var.b().b("onKeyEvent", function1);
        }
        Function1 function12 = this.f14147c;
        if (function12 != null) {
            q2Var.d("onPreviewKeyEvent");
            q2Var.b().b("onPreviewKeyEvent", function12);
        }
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        e eVar = (e) modifier$Node;
        eVar.f88482a = this.f14146b;
        eVar.f88483b = this.f14147c;
    }
}
