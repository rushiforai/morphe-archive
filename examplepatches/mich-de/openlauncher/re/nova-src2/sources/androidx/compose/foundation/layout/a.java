package androidx.compose.foundation.layout;

import b2.t;
import k0.c1;

/* loaded from: classes2.dex */
public abstract class a {
    public static t a() {
        return new AspectRatioElement();
    }

    public static final t b(t tVar, c1 c1Var) {
        return tVar.then(new IntrinsicHeightElement(c1Var));
    }

    public static final boolean c(int i5, int i11, long j11) {
        int iJ = y3.a.j(j11);
        if (i5 > y3.a.h(j11) || iJ > i5) {
            return false;
        }
        return i11 <= y3.a.g(j11) && y3.a.i(j11) <= i11;
    }

    public static final t d(t tVar, c1 c1Var) {
        return tVar.then(new IntrinsicWidthElement(c1Var));
    }
}
