package fp;

import cp.a0;
import cp.z;
import e1.m0;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class q implements a0 {

    /* renamed from: d, reason: collision with root package name */
    public static final a f55535d = new a(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55536a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f55537b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f55538c;

    public /* synthetic */ q(Class cls, z zVar, int i5) {
        this.f55536a = i5;
        this.f55537b = cls;
        this.f55538c = zVar;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        switch (this.f55536a) {
            case 0:
                if (aVar.f69629a == ((Class) this.f55537b)) {
                    return (z) this.f55538c;
                }
                return null;
            case 1:
                Class<?> cls = aVar.f69629a;
                if (((Class) this.f55537b).isAssignableFrom(cls)) {
                    return new b(3, this, cls);
                }
                return null;
            default:
                dp.a aVar2 = (dp.a) aVar.f69629a.getAnnotation(dp.a.class);
                if (aVar2 == null) {
                    return null;
                }
                return b((m0) this.f55537b, mVar, aVar, aVar2, true);
        }
    }

    public z b(m0 m0Var, cp.m mVar, jp.a aVar, dp.a aVar2, boolean z11) {
        z zVarA;
        Object objA = m0Var.e(new jp.a(aVar2.value()), true).a();
        boolean zNullSafe = aVar2.nullSafe();
        if (objA instanceof z) {
            zVarA = (z) objA;
        } else {
            if (!(objA instanceof a0)) {
                throw new IllegalArgumentException("Invalid attempt to bind an instance of " + objA.getClass().getName() + " as a @JsonAdapter for " + ep.i.k(aVar.f69630b) + ". @JsonAdapter value must be a TypeAdapter, TypeAdapterFactory, JsonSerializer or JsonDeserializer.");
            }
            a0 a0Var = (a0) objA;
            if (z11) {
                a0 a0Var2 = (a0) ((ConcurrentHashMap) this.f55538c).putIfAbsent(aVar.f69629a, a0Var);
                if (a0Var2 != null) {
                    a0Var = a0Var2;
                }
            }
            zVarA = a0Var.a(mVar, aVar);
        }
        return (zVarA == null || !zNullSafe) ? zVarA : zVarA.a();
    }

    public String toString() {
        switch (this.f55536a) {
            case 0:
                return "Factory[type=" + ((Class) this.f55537b).getName() + ",adapter=" + ((z) this.f55538c) + "]";
            case 1:
                return "Factory[typeHierarchy=" + ((Class) this.f55537b).getName() + ",adapter=" + ((z) this.f55538c) + "]";
            default:
                return super.toString();
        }
    }

    public q(m0 m0Var) {
        this.f55536a = 2;
        this.f55537b = m0Var;
        this.f55538c = new ConcurrentHashMap();
    }
}
