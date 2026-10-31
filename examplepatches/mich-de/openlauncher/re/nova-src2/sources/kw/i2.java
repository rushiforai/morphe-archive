package kw;

import b.u4;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i2 implements x0 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f72417a;

    /* renamed from: b, reason: collision with root package name */
    public final List f72418b;

    /* renamed from: c, reason: collision with root package name */
    public final fl.l f72419c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f72420d;

    /* renamed from: e, reason: collision with root package name */
    public final ResolvableString f72421e;

    public i2(IdentifierSpec identifierSpec, List list, fl.l lVar) {
        ResolvableString resolvableStringC;
        this.f72417a = identifierSpec;
        this.f72418b = list;
        this.f72419c = lVar;
        List list2 = list;
        boolean z11 = false;
        if (!(list2 instanceof Collection) || !list2.isEmpty()) {
            Iterator it = list2.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (((k2) it.next()).d()) {
                    z11 = true;
                    break;
                }
            }
        }
        this.f72420d = z11;
        Iterator it2 = this.f72418b.iterator();
        while (true) {
            if (!it2.hasNext()) {
                resolvableStringC = null;
                break;
            } else {
                resolvableStringC = ((k2) it2.next()).c();
                if (resolvableStringC != null) {
                    break;
                }
            }
        }
        this.f72421e = resolvableStringC;
    }

    @Override // kw.x0
    public final void a(boolean z11) {
        Iterator it = this.f72418b.iterator();
        while (it.hasNext()) {
            ((k2) it.next()).a(z11);
        }
    }

    @Override // kw.x0
    public final IdentifierSpec b() {
        return this.f72417a;
    }

    @Override // kw.x0
    public final ResolvableString c() {
        return this.f72421e;
    }

    @Override // kw.x0
    public final boolean d() {
        return this.f72420d;
    }

    @Override // kw.x0
    public final w70.g2 e() {
        List list = this.f72418b;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((k2) it.next()).e());
        }
        return new uw.c(arrayList.isEmpty() ? ps.v.y(b70.c.v0(b70.g.I1(EmptyList.f71733a))) : new cw.m0((w70.m[]) b70.g.I1(arrayList).toArray(new w70.m[0]), 9), new cw.n0(arrayList, 8));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i2)) {
            return false;
        }
        i2 i2Var = (i2) obj;
        return Intrinsics.b(this.f72417a, i2Var.f72417a) && Intrinsics.b(this.f72418b, i2Var.f72418b) && Intrinsics.b(this.f72419c, i2Var.f72419c);
    }

    @Override // kw.x0
    public final w70.g2 f() {
        List list = this.f72418b;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((k2) it.next()).f());
        }
        return new uw.c(arrayList.isEmpty() ? ps.v.y(b70.c.v0(b70.g.I1(EmptyList.f71733a))) : new cw.m0((w70.m[]) b70.g.I1(arrayList).toArray(new w70.m[0]), 10), new cw.n0(arrayList, 9));
    }

    public final int hashCode() {
        return this.f72419c.hashCode() + u4.c(this.f72417a.hashCode() * 31, 31, this.f72418b);
    }

    public final String toString() {
        return "SectionElement(identifier=" + this.f72417a + ", fields=" + this.f72418b + ", controller=" + this.f72419c + ")";
    }
}
