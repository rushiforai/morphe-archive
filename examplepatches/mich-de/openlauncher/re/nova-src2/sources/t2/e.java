package t2;

import android.view.KeyEvent;
import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class e extends Modifier$Node implements d {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f88482a;

    /* renamed from: b, reason: collision with root package name */
    public Function1 f88483b;

    @Override // t2.d
    public final boolean n(KeyEvent keyEvent) {
        Function1 function1 = this.f88483b;
        if (function1 != null) {
            return ((Boolean) function1.invoke(b.a(keyEvent))).booleanValue();
        }
        return false;
    }

    @Override // t2.d
    public final boolean o(KeyEvent keyEvent) {
        Function1 function1 = this.f88482a;
        if (function1 != null) {
            return ((Boolean) function1.invoke(b.a(keyEvent))).booleanValue();
        }
        return false;
    }
}
