package u1;

import java.util.NoSuchElementException;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes2.dex */
public final class b extends a implements KMutableMap.Entry {

    /* renamed from: c, reason: collision with root package name */
    public final h f90328c;

    /* renamed from: d, reason: collision with root package name */
    public Object f90329d;

    public b(h hVar, Object obj, Object obj2) {
        super(obj, obj2);
        this.f90328c = hVar;
        this.f90329d = obj2;
    }

    @Override // u1.a, java.util.Map.Entry
    public final Object getValue() {
        return this.f90329d;
    }

    @Override // u1.a, java.util.Map.Entry
    public final Object setValue(Object obj) {
        Object obj2 = this.f90329d;
        this.f90329d = obj;
        f fVar = this.f90328c.f90348a;
        e eVar = fVar.f90342d;
        Object obj3 = this.f90326a;
        if (!eVar.containsKey(obj3)) {
            return obj2;
        }
        boolean z11 = fVar.f90335c;
        if (!z11) {
            eVar.put(obj3, obj);
        } else {
            if (!z11) {
                throw new NoSuchElementException();
            }
            q qVar = fVar.f90333a[fVar.f90334b];
            Object obj4 = qVar.f90358a[qVar.f90360c];
            eVar.put(obj3, obj);
            fVar.c(obj4 != null ? obj4.hashCode() : 0, eVar.f90338c, obj4, 0);
        }
        fVar.f90345g = eVar.f90340e;
        return obj2;
    }
}
