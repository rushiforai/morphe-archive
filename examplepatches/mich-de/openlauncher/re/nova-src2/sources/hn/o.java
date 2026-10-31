package hn;

import androidx.recyclerview.widget.c0;
import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Comparator;
import java.util.Set;

/* loaded from: classes.dex */
public final class o extends AbstractMap implements Serializable {

    /* renamed from: i, reason: collision with root package name */
    public static final c0 f59932i = new c0(5);

    /* renamed from: b, reason: collision with root package name */
    public final boolean f59934b;

    /* renamed from: c, reason: collision with root package name */
    public n f59935c;

    /* renamed from: f, reason: collision with root package name */
    public final n f59938f;

    /* renamed from: g, reason: collision with root package name */
    public m f59939g;

    /* renamed from: h, reason: collision with root package name */
    public m f59940h;

    /* renamed from: d, reason: collision with root package name */
    public int f59936d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f59937e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Comparator f59933a = f59932i;

    public o(boolean z11) {
        this.f59934b = z11;
        this.f59938f = new n(z11);
    }

    public final n a(Object obj, boolean z11) {
        int iCompareTo;
        n nVar;
        n nVar2 = this.f59935c;
        c0 c0Var = f59932i;
        Comparator comparator = this.f59933a;
        if (nVar2 != null) {
            Comparable comparable = comparator == c0Var ? (Comparable) obj : null;
            while (true) {
                Object obj2 = nVar2.f59928f;
                iCompareTo = comparable != null ? comparable.compareTo(obj2) : comparator.compare(obj, obj2);
                if (iCompareTo == 0) {
                    return nVar2;
                }
                n nVar3 = iCompareTo < 0 ? nVar2.f59924b : nVar2.f59925c;
                if (nVar3 == null) {
                    break;
                }
                nVar2 = nVar3;
            }
        } else {
            iCompareTo = 0;
        }
        n nVar4 = nVar2;
        if (!z11) {
            return null;
        }
        n nVar5 = this.f59938f;
        if (nVar4 != null) {
            nVar = new n(this.f59934b, nVar4, obj, nVar5, nVar5.f59927e);
            if (iCompareTo < 0) {
                nVar4.f59924b = nVar;
            } else {
                nVar4.f59925c = nVar;
            }
            b(nVar4, true);
        } else {
            if (comparator == c0Var && !(obj instanceof Comparable)) {
                throw new ClassCastException(obj.getClass().getName().concat(" is not Comparable"));
            }
            nVar = new n(this.f59934b, nVar4, obj, nVar5, nVar5.f59927e);
            this.f59935c = nVar;
        }
        this.f59936d++;
        this.f59937e++;
        return nVar;
    }

    public final void b(n nVar, boolean z11) {
        while (nVar != null) {
            n nVar2 = nVar.f59924b;
            n nVar3 = nVar.f59925c;
            int i5 = nVar2 != null ? nVar2.f59931i : 0;
            int i11 = nVar3 != null ? nVar3.f59931i : 0;
            int i12 = i5 - i11;
            if (i12 == -2) {
                n nVar4 = nVar3.f59924b;
                n nVar5 = nVar3.f59925c;
                int i13 = (nVar4 != null ? nVar4.f59931i : 0) - (nVar5 != null ? nVar5.f59931i : 0);
                if (i13 == -1 || (i13 == 0 && !z11)) {
                    e(nVar);
                } else {
                    f(nVar3);
                    e(nVar);
                }
                if (z11) {
                    return;
                }
            } else if (i12 == 2) {
                n nVar6 = nVar2.f59924b;
                n nVar7 = nVar2.f59925c;
                int i14 = (nVar6 != null ? nVar6.f59931i : 0) - (nVar7 != null ? nVar7.f59931i : 0);
                if (i14 == 1 || (i14 == 0 && !z11)) {
                    f(nVar);
                } else {
                    e(nVar2);
                    f(nVar);
                }
                if (z11) {
                    return;
                }
            } else if (i12 == 0) {
                nVar.f59931i = i5 + 1;
                if (z11) {
                    return;
                }
            } else {
                nVar.f59931i = Math.max(i5, i11) + 1;
                if (!z11) {
                    return;
                }
            }
            nVar = nVar.f59923a;
        }
    }

    public final void c(n nVar, boolean z11) {
        n nVar2;
        n nVar3;
        int i5;
        if (z11) {
            n nVar4 = nVar.f59927e;
            nVar4.f59926d = nVar.f59926d;
            nVar.f59926d.f59927e = nVar4;
        }
        n nVar5 = nVar.f59924b;
        n nVar6 = nVar.f59925c;
        n nVar7 = nVar.f59923a;
        int i11 = 0;
        if (nVar5 == null || nVar6 == null) {
            if (nVar5 != null) {
                d(nVar, nVar5);
                nVar.f59924b = null;
            } else if (nVar6 != null) {
                d(nVar, nVar6);
                nVar.f59925c = null;
            } else {
                d(nVar, null);
            }
            b(nVar7, false);
            this.f59936d--;
            this.f59937e++;
            return;
        }
        if (nVar5.f59931i > nVar6.f59931i) {
            n nVar8 = nVar5.f59925c;
            while (true) {
                n nVar9 = nVar8;
                nVar3 = nVar5;
                nVar5 = nVar9;
                if (nVar5 == null) {
                    break;
                } else {
                    nVar8 = nVar5.f59925c;
                }
            }
        } else {
            n nVar10 = nVar6.f59924b;
            while (true) {
                nVar2 = nVar6;
                nVar6 = nVar10;
                if (nVar6 == null) {
                    break;
                } else {
                    nVar10 = nVar6.f59924b;
                }
            }
            nVar3 = nVar2;
        }
        c(nVar3, false);
        n nVar11 = nVar.f59924b;
        if (nVar11 != null) {
            i5 = nVar11.f59931i;
            nVar3.f59924b = nVar11;
            nVar11.f59923a = nVar3;
            nVar.f59924b = null;
        } else {
            i5 = 0;
        }
        n nVar12 = nVar.f59925c;
        if (nVar12 != null) {
            i11 = nVar12.f59931i;
            nVar3.f59925c = nVar12;
            nVar12.f59923a = nVar3;
            nVar.f59925c = null;
        }
        nVar3.f59931i = Math.max(i5, i11) + 1;
        d(nVar, nVar3);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        this.f59935c = null;
        this.f59936d = 0;
        this.f59937e++;
        n nVar = this.f59938f;
        nVar.f59927e = nVar;
        nVar.f59926d = nVar;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        n nVarA = null;
        if (obj != null) {
            try {
                nVarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        }
        return nVarA != null;
    }

    public final void d(n nVar, n nVar2) {
        n nVar3 = nVar.f59923a;
        nVar.f59923a = null;
        if (nVar2 != null) {
            nVar2.f59923a = nVar3;
        }
        if (nVar3 == null) {
            this.f59935c = nVar2;
        } else if (nVar3.f59924b == nVar) {
            nVar3.f59924b = nVar2;
        } else {
            nVar3.f59925c = nVar2;
        }
    }

    public final void e(n nVar) {
        n nVar2 = nVar.f59924b;
        n nVar3 = nVar.f59925c;
        n nVar4 = nVar3.f59924b;
        n nVar5 = nVar3.f59925c;
        nVar.f59925c = nVar4;
        if (nVar4 != null) {
            nVar4.f59923a = nVar;
        }
        d(nVar, nVar3);
        nVar3.f59924b = nVar;
        nVar.f59923a = nVar3;
        int iMax = Math.max(nVar2 != null ? nVar2.f59931i : 0, nVar4 != null ? nVar4.f59931i : 0) + 1;
        nVar.f59931i = iMax;
        nVar3.f59931i = Math.max(iMax, nVar5 != null ? nVar5.f59931i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        m mVar = this.f59939g;
        if (mVar != null) {
            return mVar;
        }
        m mVar2 = new m(this, 0);
        this.f59939g = mVar2;
        return mVar2;
    }

    public final void f(n nVar) {
        n nVar2 = nVar.f59924b;
        n nVar3 = nVar.f59925c;
        n nVar4 = nVar2.f59924b;
        n nVar5 = nVar2.f59925c;
        nVar.f59924b = nVar5;
        if (nVar5 != null) {
            nVar5.f59923a = nVar;
        }
        d(nVar, nVar2);
        nVar2.f59925c = nVar;
        nVar.f59923a = nVar2;
        int iMax = Math.max(nVar3 != null ? nVar3.f59931i : 0, nVar5 != null ? nVar5.f59931i : 0) + 1;
        nVar.f59931i = iMax;
        nVar2.f59931i = Math.max(iMax, nVar4 != null ? nVar4.f59931i : 0) + 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        n nVarA;
        if (obj != null) {
            try {
                nVarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        } else {
            nVarA = null;
        }
        if (nVarA != null) {
            return nVarA.f59930h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set keySet() {
        m mVar = this.f59940h;
        if (mVar != null) {
            return mVar;
        }
        m mVar2 = new m(this, 1);
        this.f59940h = mVar2;
        return mVar2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        if (obj == null) {
            throw new NullPointerException("key == null");
        }
        if (obj2 == null && !this.f59934b) {
            throw new NullPointerException("value == null");
        }
        n nVarA = a(obj, true);
        Object obj3 = nVarA.f59930h;
        nVarA.f59930h = obj2;
        return obj3;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        n nVarA;
        if (obj != null) {
            try {
                nVarA = a(obj, false);
            } catch (ClassCastException unused) {
            }
        } else {
            nVarA = null;
        }
        if (nVarA != null) {
            c(nVarA, true);
        }
        if (nVarA != null) {
            return nVarA.f59930h;
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f59936d;
    }
}
