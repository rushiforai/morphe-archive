package androidx.compose.ui.draw;

import b2.d;
import b2.f;
import b2.t;
import kotlin.jvm.functions.Function1;
import n2.c;
import z2.l;

/* loaded from: classes.dex */
public abstract class a {
    public static final t a(t tVar, Function1 function1) {
        return tVar.then(new DrawBehindElement(function1));
    }

    public static final t b(t tVar, Function1 function1) {
        return tVar.then(new DrawWithCacheElement(function1));
    }

    public static final t c(t tVar, Function1 function1) {
        return tVar.then(new DrawWithContentElement(function1));
    }

    public static t d(t tVar, c cVar, f fVar, l lVar, float f11, i2.t tVar2, int i5) {
        if ((i5 & 4) != 0) {
            fVar = d.f17001e;
        }
        f fVar2 = fVar;
        if ((i5 & 16) != 0) {
            f11 = 1.0f;
        }
        return tVar.then(new PainterElement(cVar, fVar2, lVar, f11, tVar2));
    }
}
