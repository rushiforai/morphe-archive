package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g1 implements t2 {

    /* renamed from: b, reason: collision with root package name */
    public static final g1 f81422b = new g1(0);

    /* renamed from: c, reason: collision with root package name */
    public static final g1 f81423c = new g1(1);

    /* renamed from: d, reason: collision with root package name */
    public static final g1 f81424d = new g1(2);

    /* renamed from: e, reason: collision with root package name */
    public static final g1 f81425e = new g1(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81426a;

    public /* synthetic */ g1(int i5) {
        this.f81426a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void b(g1 g1Var) {
        w70.i2 i2Var;
        s1.g gVar;
        v1.b bVar;
        w70.i2 i2Var2 = y1.f81644y;
        do {
            i2Var = y1.f81644y;
            gVar = (s1.g) i2Var.getValue();
            bVar = (v1.b) gVar;
            u1.c cVarG = bVar.f91892d;
            v1.a aVar = (v1.a) cVarG.get(g1Var);
            if (aVar != null) {
                Object obj = aVar.f91887a;
                Object obj2 = aVar.f91888b;
                u1.p pVar = cVarG.f90331d;
                u1.p pVarV = pVar.v(g1Var != null ? g1Var.hashCode() : 0, 0, g1Var);
                if (pVar != pVarV) {
                    if (pVarV == null) {
                        cVarG = u1.c.f90330f;
                        Intrinsics.e(cVarG, "null cannot be cast to non-null type androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap<K of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf, V of androidx.compose.runtime.external.kotlinx.collections.immutable.implementations.immutableMap.PersistentHashMap.Companion.emptyOf>");
                    } else {
                        cVarG = new u1.c(pVarV, cVarG.f90332e - 1);
                    }
                }
                w1.b bVar2 = w1.b.f93640a;
                if (obj != bVar2) {
                    V v11 = cVarG.get(obj);
                    Intrinsics.d(v11);
                    cVarG = cVarG.g(obj, new v1.a(((v1.a) v11).f91887a, obj2));
                }
                if (obj2 != bVar2) {
                    V v12 = cVarG.get(obj2);
                    Intrinsics.d(v12);
                    cVarG = cVarG.g(obj2, new v1.a(obj, ((v1.a) v12).f91888b));
                }
                Object obj3 = obj != bVar2 ? bVar.f91890b : obj2;
                if (obj2 != bVar2) {
                    obj = bVar.f91891c;
                }
                bVar = new v1.b(obj3, obj, cVarG);
            }
            if (gVar == bVar) {
                return;
            }
        } while (!i2Var.i(gVar, bVar));
    }

    @Override // p1.t2
    public boolean a(Object obj, Object obj2) {
        switch (this.f81426a) {
            case 0:
                return false;
            case 1:
                return obj == obj2;
            default:
                return Intrinsics.b(obj, obj2);
        }
    }

    public String toString() {
        switch (this.f81426a) {
            case 0:
                return "NeverEqualPolicy";
            case 1:
                return "ReferentialEqualityPolicy";
            case 2:
            default:
                return super.toString();
            case 3:
                return "StructuralEqualityPolicy";
            case 4:
                return "Empty";
        }
    }
}
