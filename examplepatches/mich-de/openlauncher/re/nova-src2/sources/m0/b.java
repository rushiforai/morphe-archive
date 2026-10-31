package m0;

import androidx.compose.foundation.lazy.layout.LazyLayoutAnimateItemElement;
import c0.l1;

/* loaded from: classes.dex */
public interface b {
    static b2.t a(b bVar, b2.t tVar, int i5) {
        l1 l1VarH = (i5 & 1) != 0 ? c0.f.h(0.0f, 400.0f, null, 5) : null;
        long j11 = 1;
        l1 l1VarH2 = c0.f.h(0.0f, 400.0f, new y3.k((j11 & 4294967295L) | (j11 << 32)), 1);
        l1 l1VarH3 = (i5 & 4) != 0 ? c0.f.h(0.0f, 400.0f, null, 5) : null;
        ((c) bVar).getClass();
        return tVar.then(new LazyLayoutAnimateItemElement(l1VarH, l1VarH2, l1VarH3));
    }
}
