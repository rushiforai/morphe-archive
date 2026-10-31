package androidx.compose.ui.focus;

import b2.t;
import g2.p;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public abstract class b {
    public static final t a(Function1 function1) {
        return new FocusPropertiesElement(new p(function1));
    }

    public static final t b(t tVar, Function1 function1) {
        return tVar.then(new FocusEventElement(function1));
    }
}
