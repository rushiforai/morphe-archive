package k0;

import androidx.compose.foundation.layout.LayoutWeightElement;

/* loaded from: classes.dex */
public interface y {
    static b2.t a(b2.t tVar) {
        if (1.0f <= 0.0d) {
            l0.a.a("invalid weight; must be greater than zero");
        }
        return tVar.then(new LayoutWeightElement(1.0f, true));
    }
}
