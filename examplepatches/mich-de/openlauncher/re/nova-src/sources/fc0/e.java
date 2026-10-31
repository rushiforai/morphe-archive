package fc0;

import b.c0;
import b.u4;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/* loaded from: classes5.dex */
public abstract class e implements x60.f, Serializable, Comparable {

    /* renamed from: b, reason: collision with root package name */
    public static final c f54605b = new c();

    /* renamed from: c, reason: collision with root package name */
    public static final h60.i f54606c = new h60.i();

    /* renamed from: a, reason: collision with root package name */
    public List f54607a;

    @Override // x60.f
    public final double b(double d5) {
        return a() ? d5 : i(Double.valueOf(d5)).doubleValue();
    }

    @Override // x60.f
    public final List c() {
        List list = this.f54607a;
        if (list != null) {
            return list;
        }
        if (!(this instanceof d)) {
            List listSingletonList = Collections.singletonList(this);
            this.f54607a = listSingletonList;
            return listSingletonList;
        }
        d dVar = (d) this;
        List listC = dVar.f54603d.c();
        List listC2 = dVar.f54604e.c();
        ArrayList arrayList = new ArrayList(listC2.size() + listC.size());
        arrayList.addAll(listC);
        arrayList.addAll(listC2);
        this.f54607a = arrayList;
        return arrayList;
    }

    @Override // x60.f
    public final x60.f d(x60.f fVar) {
        int i5;
        Objects.requireNonNull(fVar, "Cannot compose with converter that is null.");
        if (fVar instanceof e) {
            e eVar = (e) fVar;
            a aVar = new a();
            b bVar = new b(0);
            h60.i iVar = f54606c;
            iVar.getClass();
            if (a()) {
                if (!eVar.a() || !iVar.b(this, eVar)) {
                    return eVar;
                }
            } else if (!eVar.a()) {
                if (h(eVar)) {
                    return l(eVar);
                }
                d dVar = (e() && eVar.e() && !iVar.a(this, eVar)) ? new d(eVar, this) : new d(this, eVar);
                fl.l lVar = new fl.l(new hc0.a(iVar, 0), new hc0.a(iVar, 1), aVar, bVar, 11);
                e[] eVarArr = (e[]) dVar.c().toArray(new e[0]);
                lVar.f55375c = eVarArr;
                lVar.B(eVarArr);
                while (true) {
                    e[] eVarArr2 = (e[]) lVar.f55375c;
                    if (eVarArr2.length < 2) {
                        i5 = 0;
                    } else {
                        i5 = 0;
                        for (int i11 = 1; i11 < eVarArr2.length; i11++) {
                            int i12 = i11 - 1;
                            e eVarL = eVarArr2[i12];
                            if (eVarL != null) {
                                e eVar2 = eVarArr2[i11];
                                if (eVarL.a()) {
                                    eVarL = eVar2;
                                } else if (!eVar2.a()) {
                                    eVarL = eVarL.h(eVar2) ? eVarL.l(eVar2) : null;
                                }
                                if (eVarL != null) {
                                    eVarArr2[i12] = eVarL;
                                    eVarArr2[i11] = null;
                                    i5++;
                                }
                            }
                        }
                    }
                    if (i5 > 0) {
                        Object[] objArrCopyOf = Arrays.copyOf(eVarArr2, eVarArr2.length - i5);
                        int i13 = 0;
                        for (e eVar3 : eVarArr2) {
                            if (eVar3 != null) {
                                objArrCopyOf[i13] = eVar3;
                                i13++;
                            }
                        }
                        lVar.f55375c = (e[]) objArrCopyOf;
                    }
                    if (i5 <= 0) {
                        break;
                    }
                    lVar.B((e[]) lVar.f55375c);
                }
                e[] eVarArr3 = (e[]) lVar.f55375c;
                if (eVarArr3 == null || eVarArr3.length == 0) {
                    return f54605b;
                }
                if (eVarArr3.length == 1) {
                    return eVarArr3[0];
                }
                return (e) Arrays.stream(eVarArr3).skip(2L).reduce(new d(eVarArr3[0], eVarArr3[1]), new b(2));
            }
        } else if (!fVar.a()) {
            return a() ? fVar : new d(this, fVar);
        }
        return this;
    }

    public Object getValue() {
        return toString();
    }

    public abstract boolean h(e eVar);

    public abstract Number i(Number number);

    @Override // x60.f
    /* renamed from: j, reason: merged with bridge method [inline-methods] */
    public final e g() {
        return a() ? this : k();
    }

    public abstract e k();

    public e l(e eVar) {
        throw new IllegalStateException(String.format("Concrete UnitConverter '%s' does not implement reduce(...).", this));
    }

    public abstract String m();

    public final String toString() {
        String simpleName = getClass().getSimpleName();
        if (simpleName.endsWith("Converter")) {
            simpleName = u4.f(9, 0, simpleName);
        }
        if (a()) {
            return c0.E(simpleName, "(IDENTITY)");
        }
        String strM = m();
        if (strM != null && strM.length() != 0) {
            return a80.m.h(simpleName, "(", strM, ")");
        }
        return simpleName;
    }
}
