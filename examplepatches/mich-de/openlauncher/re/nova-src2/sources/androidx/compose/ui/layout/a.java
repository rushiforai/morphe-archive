package androidx.compose.ui.layout;

import b2.t;
import kotlin.jvm.functions.Function1;
import z2.q0;
import z2.z;

/* loaded from: classes2.dex */
public abstract class a {
    public static final Object a(q0 q0Var) {
        Object objK = q0Var.k();
        z zVar = objK instanceof z ? (z) objK : null;
        if (zVar != null) {
            return zVar.f98181a;
        }
        return null;
    }

    public static final t b(t tVar, Object obj) {
        return tVar.then(new LayoutIdElement(obj));
    }

    public static final t c(t tVar, Function1 function1) {
        return tVar.then(new OnSizeChangedModifier(function1));
    }
}
