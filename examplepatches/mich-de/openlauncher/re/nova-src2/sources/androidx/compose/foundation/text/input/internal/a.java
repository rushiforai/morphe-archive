package androidx.compose.foundation.text.input.internal;

import b2.t;
import c1.c;
import e1.a1;
import t0.y0;

/* loaded from: classes.dex */
public abstract class a {
    public static final t a(t tVar, c cVar, y0 y0Var, a1 a1Var) {
        return tVar.then(new LegacyAdaptingPlatformTextInputModifier(cVar, y0Var, a1Var));
    }
}
