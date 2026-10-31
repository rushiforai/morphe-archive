package androidx.compose.ui.input.key;

import b2.t;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class a {
    public static final t a(Function1 function1) {
        return new KeyInputElement(function1, null);
    }

    public static final t b(t tVar, Function1 function1) {
        return tVar.then(new KeyInputElement(null, function1));
    }
}
