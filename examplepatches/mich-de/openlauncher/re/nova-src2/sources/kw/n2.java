package kw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class n2 implements k2 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f72501a;

    public n2(IdentifierSpec identifier) {
        Intrinsics.g(identifier, "identifier");
        this.f72501a = identifier;
    }

    @Override // kw.k2
    public final void a(boolean z11) {
        k().a(z11);
    }

    @Override // kw.k2
    public IdentifierSpec b() {
        return this.f72501a;
    }

    @Override // kw.k2
    public w70.g2 e() {
        return ps.v.u(k().j(), new h10.y0(this, 26));
    }

    @Override // kw.k2
    public w70.g2 f() {
        List listP = ul.b.P(b());
        if (!(k() instanceof y2)) {
            listP = null;
        }
        if (listP == null) {
            listP = EmptyList.f71733a;
        }
        return w70.u1.c(listP);
    }

    @Override // kw.k2
    public void h(Map rawValuesMap) {
        Intrinsics.g(rawValuesMap, "rawValuesMap");
        String str = (String) rawValuesMap.get(b());
        if (str != null) {
            k().t(str);
        }
    }

    @Override // kw.k2
    public final l2 i() {
        return k();
    }

    public abstract b1 k();
}
