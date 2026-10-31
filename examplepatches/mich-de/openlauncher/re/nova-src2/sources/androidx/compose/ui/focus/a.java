package androidx.compose.ui.focus;

import b2.t;
import g2.s;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class a {
    public static final t a(t tVar, s sVar) {
        return tVar.then(new FocusRequesterElement(sVar));
    }

    public static final t b(t tVar, Function1 function1) {
        return tVar.then(new FocusChangedElement(function1));
    }
}
