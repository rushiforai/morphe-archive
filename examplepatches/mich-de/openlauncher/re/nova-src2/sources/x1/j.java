package x1;

import fa.t;
import p1.b3;
import p1.n1;
import u1.p;

/* loaded from: classes.dex */
public final class j extends u1.c implements n1 {

    /* renamed from: g, reason: collision with root package name */
    public static final j f94960g = new j(p.f90353e, 0);

    @Override // u1.c, s1.f
    public final s1.e builder() {
        i iVar = new i(this);
        iVar.f94959g = this;
        return iVar;
    }

    @Override // u1.c, kotlin.collections.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof androidx.compose.runtime.e) {
            return super.containsKey((androidx.compose.runtime.e) obj);
        }
        return false;
    }

    @Override // kotlin.collections.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof b3) {
            return super.containsValue((b3) obj);
        }
        return false;
    }

    @Override // u1.c
    /* renamed from: f */
    public final u1.e builder() {
        i iVar = new i(this);
        iVar.f94959g = this;
        return iVar;
    }

    @Override // u1.c, kotlin.collections.AbstractMap, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof androidx.compose.runtime.e) {
            return (b3) super.get((androidx.compose.runtime.e) obj);
        }
        return null;
    }

    @Override // java.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof androidx.compose.runtime.e) ? obj2 : (b3) super.getOrDefault((androidx.compose.runtime.e) obj, (b3) obj2);
    }

    public final j h(androidx.compose.runtime.e eVar, b3 b3Var) {
        t tVarU = this.f90331d.u(eVar, eVar.hashCode(), 0, b3Var);
        return tVarU == null ? this : new j((p) tVarU.f54486b, this.f90332e + tVarU.f54485a);
    }
}
