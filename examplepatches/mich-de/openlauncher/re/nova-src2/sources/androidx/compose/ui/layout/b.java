package androidx.compose.ui.layout;

import b2.t;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public abstract class b {
    public static final t a(t tVar, Function3 function3) {
        return tVar.then(new LayoutElement(function3));
    }

    public static final t b(t tVar, Function1 function1) {
        return tVar.then(new OnGloballyPositionedElement(function1));
    }
}
