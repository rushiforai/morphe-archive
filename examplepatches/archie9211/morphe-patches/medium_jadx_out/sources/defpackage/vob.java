package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vob {
    public static final uob c = new uob(0);
    public final LinkedHashMap a;
    public final iq1 b;

    public vob() {
        this.a = new LinkedHashMap();
        this.b = new iq1(fy3.a);
    }

    public final Object a(String str) {
        Object value;
        iq1 iq1Var = this.b;
        LinkedHashMap linkedHashMap = (LinkedHashMap) iq1Var.b;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) iq1Var.e;
        try {
            xpc xpcVar = (xpc) linkedHashMap2.get(str);
            if (xpcVar != null && (value = xpcVar.getValue()) != null) {
                return value;
            }
            return linkedHashMap.get(str);
        } catch (ClassCastException unused) {
            linkedHashMap.remove(str);
            ((LinkedHashMap) iq1Var.d).remove(str);
            linkedHashMap2.remove(str);
            return null;
        }
    }

    public final xpc b(xqc xqcVar) {
        if (!this.a.containsKey("sort_order")) {
            return this.b.D("sort_order", xqcVar);
        }
        ywb.g("StateFlow and LiveData are mutually exclusive for the same key. Please use either 'getMutableStateFlow' or 'getLiveData' for key 'sort_order', but not both.");
        return null;
    }

    public final wua c(String str, Object obj) {
        iq1 iq1Var = this.b;
        if (((LinkedHashMap) iq1Var.e).containsKey(str)) {
            return bo.A(iq1Var.D(str, obj));
        }
        LinkedHashMap linkedHashMap = (LinkedHashMap) iq1Var.b;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) iq1Var.d;
        Object objJ = linkedHashMap2.get(str);
        if (objJ == null) {
            if (!linkedHashMap.containsKey(str)) {
                linkedHashMap.put(str, obj);
            }
            objJ = vv2.j(linkedHashMap.get(str));
            linkedHashMap2.put(str, objJ);
        }
        return bo.A((xpc) objJ);
    }

    public final void d(String str, Object obj) {
        if (!xob.a(obj)) {
            obj.getClass();
            rd6.v("Can't put value with type ", obj.getClass(), " into saved state");
            return;
        }
        Object obj2 = this.a.get(str);
        n68 n68Var = obj2 instanceof n68 ? (n68) obj2 : null;
        if (n68Var != null) {
            n68Var.j(obj);
        }
        this.b.Q(str, obj);
    }

    public vob(dh7 dh7Var) {
        this.a = new LinkedHashMap();
        this.b = new iq1(dh7Var);
    }
}
