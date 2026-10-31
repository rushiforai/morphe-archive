package u1;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import kotlin.collections.AbstractMutableMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class e extends AbstractMutableMap implements s1.e {

    /* renamed from: a, reason: collision with root package name */
    public c f90336a;

    /* renamed from: b, reason: collision with root package name */
    public w1.b f90337b = new w1.b();

    /* renamed from: c, reason: collision with root package name */
    public p f90338c;

    /* renamed from: d, reason: collision with root package name */
    public Object f90339d;

    /* renamed from: e, reason: collision with root package name */
    public int f90340e;

    /* renamed from: f, reason: collision with root package name */
    public int f90341f;

    public e(c cVar) {
        this.f90336a = cVar;
        this.f90338c = cVar.f90331d;
        this.f90341f = cVar.f90332e;
    }

    @Override // kotlin.collections.AbstractMutableMap
    public final Set a() {
        return new g(0, this);
    }

    @Override // kotlin.collections.AbstractMutableMap
    public final Set b() {
        return new g(1, this);
    }

    @Override // kotlin.collections.AbstractMutableMap
    public final int c() {
        return this.f90341f;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        this.f90338c = p.f90353e;
        f(0);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object obj) {
        return this.f90338c.d(obj != null ? obj.hashCode() : 0, 0, obj);
    }

    @Override // kotlin.collections.AbstractMutableMap
    public final Collection d() {
        return new j(this);
    }

    @Override // s1.e
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public c build() {
        p pVar = this.f90338c;
        c cVar = this.f90336a;
        if (pVar != cVar.f90331d) {
            this.f90337b = new w1.b();
            cVar = new c(this.f90338c, c());
        }
        this.f90336a = cVar;
        return cVar;
    }

    public final void f(int i5) {
        this.f90341f = i5;
        this.f90340e++;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object get(Object obj) {
        return this.f90338c.g(obj != null ? obj.hashCode() : 0, 0, obj);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object put(Object obj, Object obj2) {
        this.f90339d = null;
        this.f90338c = this.f90338c.l(obj != null ? obj.hashCode() : 0, obj, obj2, 0, this);
        return this.f90339d;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void putAll(Map map) {
        c cVarBuild = null;
        c cVar = map instanceof c ? (c) map : null;
        if (cVar == null) {
            e eVar = map instanceof e ? (e) map : null;
            if (eVar != null) {
                cVarBuild = eVar.build();
            }
        } else {
            cVarBuild = cVar;
        }
        if (cVarBuild == null) {
            super.putAll(map);
            return;
        }
        w1.a aVar = new w1.a();
        aVar.f93639a = 0;
        int i5 = this.f90341f;
        p pVar = this.f90338c;
        p pVar2 = cVarBuild.f90331d;
        Intrinsics.e(pVar2, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.TrieNode<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMapBuilder, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMapBuilder>");
        this.f90338c = pVar.m(pVar2, 0, aVar, this);
        int i11 = (cVarBuild.f90332e + i5) - aVar.f93639a;
        if (i5 != i11) {
            f(i11);
        }
    }

    @Override // java.util.Map
    public final boolean remove(Object obj, Object obj2) {
        int iC = c();
        p pVarO = this.f90338c.o(obj != null ? obj.hashCode() : 0, obj, obj2, 0, this);
        if (pVarO == null) {
            pVarO = p.f90353e;
        }
        this.f90338c = pVarO;
        return iC != c();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object remove(Object obj) {
        this.f90339d = null;
        p pVarN = this.f90338c.n(obj != null ? obj.hashCode() : 0, obj, 0, this);
        if (pVarN == null) {
            pVarN = p.f90353e;
        }
        this.f90338c = pVarN;
        return this.f90339d;
    }
}
