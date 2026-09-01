package defpackage;

import j$.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h89 extends m89 {
    public i89 f;

    public h89(i89 i89Var) {
        this.a = new no3(19);
        this.b = i89Var.a;
        this.e = i89Var.b;
        this.f = i89Var;
    }

    @Override // defpackage.m89, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof d8a) {
            return super.containsKey((d8a) obj);
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof gqe) {
            return super.containsValue((gqe) obj);
        }
        return false;
    }

    @Override // defpackage.m89, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof d8a) {
            return (gqe) super.get((d8a) obj);
        }
        return null;
    }

    @Override // defpackage.m89, java.util.Map, j$.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof d8a) ? obj2 : (gqe) Map.CC.$default$getOrDefault(this, (d8a) obj, (gqe) obj2);
    }

    public final i89 h() {
        zsd zsdVar = this.b;
        i89 i89Var = this.f;
        if (zsdVar != i89Var.a) {
            this.a = new no3(19);
            i89Var = new i89(this.b, c());
        }
        this.f = i89Var;
        return i89Var;
    }

    @Override // defpackage.m89, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof d8a) {
            return (gqe) super.remove((d8a) obj);
        }
        return null;
    }
}
