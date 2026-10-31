package x1;

import p1.b3;
import u1.p;

/* loaded from: classes.dex */
public final class i extends u1.e {

    /* renamed from: g, reason: collision with root package name */
    public j f94959g;

    @Override // u1.e, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof androidx.compose.runtime.e) {
            return super.containsKey((androidx.compose.runtime.e) obj);
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj instanceof b3) {
            return super.containsValue((b3) obj);
        }
        return false;
    }

    @Override // u1.e
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public final j build() {
        p pVar = this.f90338c;
        j jVar = this.f94959g;
        if (pVar != jVar.f90331d) {
            this.f90337b = new w1.b();
            jVar = new j(this.f90338c, c());
        }
        this.f94959g = jVar;
        return jVar;
    }

    @Override // u1.e, java.util.AbstractMap, java.util.Map
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

    @Override // u1.e, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof androidx.compose.runtime.e) {
            return (b3) super.remove((androidx.compose.runtime.e) obj);
        }
        return null;
    }
}
