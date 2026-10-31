package lz;

import bm.t;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import ga.j;
import java.util.HashMap;
import q9.p;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final ComponentKey f75166a;

    /* renamed from: b, reason: collision with root package name */
    public final t f75167b;

    public c(ComponentKey componentKey, t tVar) {
        this.f75166a = componentKey;
        this.f75167b = tVar;
    }

    public final ga.f a(p pVar) {
        ComponentKey componentKey = this.f75166a;
        ga.a aVarB = pVar.b(componentKey);
        if (aVarB != null) {
            return aVarB;
        }
        if (!(componentKey instanceof ShortcutKey)) {
            return null;
        }
        return (j) ((HashMap) this.f75167b.f18115g).get((ShortcutKey) componentKey);
    }

    public final ComponentKey b() {
        return this.f75166a;
    }

    public final String toString() {
        return this.f75166a.toString();
    }
}
