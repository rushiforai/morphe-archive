package hn;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
public final class m extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59921a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f59922b;

    public /* synthetic */ m(Object obj, int i5) {
        this.f59921a = i5;
        this.f59922b = obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        switch (this.f59921a) {
            case 0:
                ((o) this.f59922b).clear();
                break;
            case 1:
                ((o) this.f59922b).clear();
                break;
            default:
                super.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        n nVarA;
        switch (this.f59921a) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                o oVar = (o) this.f59922b;
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                n nVar = null;
                if (key != null) {
                    try {
                        nVarA = oVar.a(key, false);
                    } catch (ClassCastException unused) {
                    }
                } else {
                    nVarA = null;
                }
                if (nVarA != null && Objects.equals(nVarA.f59930h, entry.getValue())) {
                    nVar = nVarA;
                }
                return nVar != null;
            case 1:
                return ((o) this.f59922b).containsKey(obj);
            default:
                return super.contains(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        switch (this.f59921a) {
            case 0:
                return new l((o) this.f59922b, 0);
            case 1:
                return new l((o) this.f59922b, 1);
            default:
                return new ma0.i(this, 0);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean remove(Object obj) {
        n nVarA;
        switch (this.f59921a) {
            case 0:
                o oVar = (o) this.f59922b;
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                n nVar = null;
                if (key != null) {
                    try {
                        nVarA = oVar.a(key, false);
                    } catch (ClassCastException unused) {
                    }
                } else {
                    nVarA = null;
                }
                if (nVarA != null && Objects.equals(nVarA.f59930h, entry.getValue())) {
                    nVar = nVarA;
                }
                if (nVar == null) {
                    return false;
                }
                oVar.c(nVar, true);
                return true;
            case 1:
                o oVar2 = (o) this.f59922b;
                n nVarA2 = null;
                if (obj != null) {
                    try {
                        nVarA2 = oVar2.a(obj, false);
                    } catch (ClassCastException unused2) {
                    }
                }
                if (nVarA2 != null) {
                    oVar2.c(nVarA2, true);
                }
                return nVarA2 != null;
            default:
                return super.remove(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.f59921a) {
            case 0:
                return ((o) this.f59922b).f59936d;
            case 1:
                return ((o) this.f59922b).f59936d;
            default:
                return ((ja0.m) this.f59922b).f69354m;
        }
    }
}
