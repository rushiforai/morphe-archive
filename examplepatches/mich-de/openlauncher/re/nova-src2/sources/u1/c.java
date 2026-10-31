package u1;

import java.util.Collection;
import java.util.Set;
import kotlin.collections.AbstractMap;

/* loaded from: classes.dex */
public class c extends AbstractMap implements s1.f {

    /* renamed from: f, reason: collision with root package name */
    public static final c f90330f = new c(p.f90353e, 0);

    /* renamed from: d, reason: collision with root package name */
    public final p f90331d;

    /* renamed from: e, reason: collision with root package name */
    public final int f90332e;

    public c(p pVar, int i5) {
        this.f90331d = pVar;
        this.f90332e = i5;
    }

    @Override // kotlin.collections.AbstractMap
    public final Set a() {
        return new k(this);
    }

    @Override // kotlin.collections.AbstractMap
    public final Set b() {
        return new m(this);
    }

    @Override // kotlin.collections.AbstractMap
    public final int c() {
        return this.f90332e;
    }

    @Override // kotlin.collections.AbstractMap, java.util.Map
    public boolean containsKey(Object obj) {
        return this.f90331d.d(obj != null ? obj.hashCode() : 0, 0, obj);
    }

    @Override // kotlin.collections.AbstractMap
    public final Collection d() {
        return new o(this);
    }

    @Override // s1.f
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public e builder() {
        return new e(this);
    }

    public final c g(Object obj, v1.a aVar) {
        fa.t tVarU = this.f90331d.u(obj, obj != null ? obj.hashCode() : 0, 0, aVar);
        return tVarU == null ? this : new c((p) tVarU.f54486b, this.f90332e + tVarU.f54485a);
    }

    @Override // kotlin.collections.AbstractMap, java.util.Map
    public Object get(Object obj) {
        return this.f90331d.g(obj != null ? obj.hashCode() : 0, 0, obj);
    }
}
