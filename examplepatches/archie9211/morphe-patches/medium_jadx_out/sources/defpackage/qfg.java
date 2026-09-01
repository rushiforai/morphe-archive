package defpackage;

import j$.util.Objects;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qfg extends AbstractSet {
    public final /* synthetic */ int a;
    public final /* synthetic */ tfg b;

    public /* synthetic */ qfg(tfg tfgVar, int i) {
        this.a = i;
        this.b = tfgVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.a;
        tfg tfgVar = this.b;
        switch (i) {
            case 0:
                tfgVar.clear();
                break;
            default:
                tfgVar.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        int i = this.a;
        tfg tfgVar = this.b;
        switch (i) {
            case 0:
                Map mapD = tfgVar.d();
                if (mapD != null) {
                    return mapD.entrySet().contains(obj);
                }
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    int i2 = tfgVar.i(entry.getKey());
                    if (i2 != -1 && Objects.equals(tfgVar.b()[i2], entry.getValue())) {
                        return true;
                    }
                }
                return false;
            default:
                return tfgVar.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        tfg tfgVar = this.b;
        switch (i) {
            case 0:
                Map mapD = tfgVar.d();
                return mapD != null ? mapD.entrySet().iterator() : new ofg(tfgVar, 1);
            default:
                Map mapD2 = tfgVar.d();
                return mapD2 != null ? mapD2.keySet().iterator() : new ofg(tfgVar, 0);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        int i = this.a;
        tfg tfgVar = this.b;
        switch (i) {
            case 0:
                Map mapD = tfgVar.d();
                if (mapD == null) {
                    if (obj instanceof Map.Entry) {
                        Map.Entry entry = (Map.Entry) obj;
                        if (!tfgVar.c()) {
                            int iG = tfgVar.g();
                            Object key = entry.getKey();
                            Object value = entry.getValue();
                            Object obj2 = tfgVar.a;
                            Objects.requireNonNull(obj2);
                            int iO = er7.O(key, value, iG, obj2, tfgVar.k(), tfgVar.a(), tfgVar.b());
                            if (iO != -1) {
                                tfgVar.f(iO, iG);
                                tfgVar.f--;
                                tfgVar.e += 32;
                            }
                        }
                    }
                    break;
                }
                break;
            default:
                Map mapD2 = tfgVar.d();
                if (mapD2 == null) {
                    if (tfgVar.j(obj) == tfg.j) {
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int i = this.a;
        tfg tfgVar = this.b;
        switch (i) {
        }
        return tfgVar.size();
    }
}
