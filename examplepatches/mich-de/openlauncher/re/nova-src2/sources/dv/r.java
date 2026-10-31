package dv;

import android.app.Application;
import android.content.Context;
import h6.f1;
import h6.j1;
import h6.u0;
import java.util.Arrays;
import jt.b1;
import jt.c1;
import jt.z0;
import kotlin.collections.EmptySet;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import ps.i0;
import t70.y0;

/* loaded from: classes4.dex */
public final class r implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49638a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f49639b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f49638a = i5;
        this.f49639b = obj;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        k6.e eVar;
        int i5 = this.f49638a;
        int i11 = 0;
        Object obj = this.f49639b;
        Intrinsics.g(extras, "extras");
        switch (i5) {
            case 0:
                q qVar = (q) ((g) obj).invoke();
                lv.f fVar = new lv.f(qVar.f49632a);
                Application applicationT = jk.b.T(extras);
                a80.e eVar2 = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                dVar.getClass();
                br.c cVar = new br.c();
                br.a aVar = new br.a(0);
                s40.h hVarB = s40.c.b(new av.a(cVar, 1));
                s40.h hVarB2 = s40.c.b(new br.b(aVar, ev.a.f53030a, i11));
                av.a aVar2 = new av.a(new as.h(s40.e.a(applicationT), 5), 4);
                u0 u0VarA = h6.y0.a(extras);
                ar.c cVar2 = new ar.c(applicationT, 25);
                jt.b bVar = jt.b.f69756b;
                CoroutineContext coroutineContext = (CoroutineContext) hVarB.get();
                EmptySet emptySet = EmptySet.f71734a;
                i0.i(emptySet);
                ar.c cVar3 = new ar.c(applicationT, 25);
                i0.i(emptySet);
                return new w(qVar, new lv.e(new z0(applicationT, cVar2, bVar, coroutineContext, emptySet, new jt.a(applicationT, cVar3, emptySet), new fr.l((xq.c) hVarB2.get(), (CoroutineContext) hVarB.get()), (xq.c) hVarB2.get()), aVar2, fVar, dVar), new f(), u0VarA);
            case 1:
                KClass modelClass = JvmClassMappingKt.e(cls);
                k6.e[] eVarArr = (k6.e[]) obj;
                k6.e[] initializers = (k6.e[]) Arrays.copyOf(eVarArr, eVarArr.length);
                Intrinsics.g(modelClass, "modelClass");
                Intrinsics.g(initializers, "initializers");
                int length = initializers.length;
                while (true) {
                    if (i11 < length) {
                        eVar = initializers[i11];
                        if (!Intrinsics.b(eVar.f71151a, modelClass)) {
                            i11++;
                        }
                    } else {
                        eVar = null;
                    }
                }
                f1 f1Var = eVar != null ? (f1) eVar.f71152b.invoke(extras) : null;
                if (f1Var != null) {
                    return f1Var;
                }
                throw new IllegalArgumentException(("No initializer set for given class " + modelClass.getQualifiedName()).toString());
            default:
                n0.w wVar = new n0.w(this, 27);
                c1.f69772a.getClass();
                return new ww.v(new wm.b(this, 2), new z0((Context) obj, wVar, b1.f69764b, null, null, null, null, null, null, 65528));
        }
    }

    public r(k6.e[] initializers) {
        this.f49638a = 1;
        Intrinsics.g(initializers, "initializers");
        this.f49639b = initializers;
    }
}
