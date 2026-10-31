package h6;

import android.os.Bundle;
import b.i8;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.NotImplementedError;
import kotlin.Unit;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.i2;

/* loaded from: classes2.dex */
public abstract class g1 {

    /* renamed from: a, reason: collision with root package name */
    public static final i8 f59366a = new i8(27);

    public static final void a(f1 viewModel, a7.e registry, u lifecycle) {
        Intrinsics.g(viewModel, "viewModel");
        Intrinsics.g(registry, "registry");
        Intrinsics.g(lifecycle, "lifecycle");
        w0 w0Var = (w0) viewModel.getCloseable("androidx.lifecycle.savedstate.vm.tag");
        if (w0Var == null || w0Var.f59466c) {
            return;
        }
        w0Var.a(registry, lifecycle);
        j(registry, lifecycle);
    }

    public static final void b(a0 a0Var, t current, t next) {
        Intrinsics.g(current, "current");
        Intrinsics.g(next, "next");
        if (current == t.f59441b && next == t.f59440a) {
            throw new IllegalStateException(("State must be at least '" + t.f59442c + "' to be moved to '" + next + "' in component " + a0Var).toString());
        }
        t tVar = t.f59440a;
        if (current != tVar || current == next) {
            return;
        }
        throw new IllegalStateException(("State is '" + tVar + "' and cannot be moved to `" + next + "` in component " + a0Var).toString());
    }

    public static final w0 c(a7.e registry, u lifecycle, String str, Bundle bundle) throws NoSuchMethodException, SecurityException {
        u0 u0Var;
        Intrinsics.g(registry, "registry");
        Intrinsics.g(lifecycle, "lifecycle");
        Bundle bundleA = registry.a(str);
        if (bundleA != null) {
            bundle = bundleA;
        }
        if (bundle == null) {
            u0Var = new u0();
        } else {
            ClassLoader classLoader = u0.class.getClassLoader();
            Intrinsics.d(classLoader);
            bundle.setClassLoader(classLoader);
            MapBuilder mapBuilder = new MapBuilder(bundle.size());
            for (String str2 : bundle.keySet()) {
                Intrinsics.d(str2);
                mapBuilder.put(str2, bundle.get(str2));
            }
            u0Var = new u0(mapBuilder.b());
        }
        w0 w0Var = new w0(str, u0Var);
        w0Var.a(registry, lifecycle);
        j(registry, lifecycle);
        return w0Var;
    }

    public static u0 d(Bundle bundle, Bundle bundle2) {
        if (bundle == null) {
            bundle = bundle2;
        }
        if (bundle == null) {
            return new u0();
        }
        ClassLoader classLoader = u0.class.getClassLoader();
        Intrinsics.d(classLoader);
        bundle.setClassLoader(classLoader);
        MapBuilder mapBuilder = new MapBuilder(bundle.size());
        for (String str : bundle.keySet()) {
            Intrinsics.d(str);
            mapBuilder.put(str, bundle.get(str));
        }
        return new u0(mapBuilder.b());
    }

    public static final x e(a0 a0Var) {
        Intrinsics.g(a0Var, "<this>");
        u lifecycle = a0Var.getLifecycle();
        Intrinsics.g(lifecycle, "<this>");
        gu.j jVar = lifecycle.f59453a;
        while (true) {
            x xVar = (x) ((AtomicReference) jVar.f57836b).get();
            if (xVar != null) {
                return xVar;
            }
            i2 i2VarD = t70.m0.d();
            a80.e eVar = t70.y0.f88884a;
            x xVar2 = new x(lifecycle, CoroutineContext.Element.DefaultImpls.d(i2VarD, y70.o.f96819a.f90673f));
            AtomicReference atomicReference = (AtomicReference) jVar.f57836b;
            do {
                Continuation continuation = null;
                if (atomicReference.compareAndSet(null, xVar2)) {
                    a80.e eVar2 = t70.y0.f88884a;
                    t70.m0.t(xVar2, y70.o.f96819a.f90673f, null, new w(xVar2, continuation, 0), 2);
                    return xVar2;
                }
            } while (atomicReference.get() == null);
        }
    }

    public static final m6.a f(f1 f1Var) {
        m6.a aVar;
        CoroutineContext coroutineContext;
        Intrinsics.g(f1Var, "<this>");
        synchronized (f59366a) {
            aVar = (m6.a) f1Var.getCloseable("androidx.lifecycle.viewmodel.internal.ViewModelCoroutineScope.JOB_KEY");
            if (aVar == null) {
                try {
                    try {
                        a80.e eVar = t70.y0.f88884a;
                        coroutineContext = y70.o.f96819a.f90673f;
                    } catch (NotImplementedError unused) {
                        coroutineContext = EmptyCoroutineContext.f71803a;
                    }
                } catch (IllegalStateException unused2) {
                    coroutineContext = EmptyCoroutineContext.f71803a;
                }
                m6.a aVar2 = new m6.a(coroutineContext.plus(t70.m0.d()));
                f1Var.addCloseable("androidx.lifecycle.viewmodel.internal.ViewModelCoroutineScope.JOB_KEY", aVar2);
                aVar = aVar2;
            }
        }
        return aVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static i g(Function2 function2) {
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(context, "context");
        i iVar = new i();
        iVar.f59407l = new t.f();
        i2 i2Var = new i2(null);
        a80.e eVar = t70.y0.f88884a;
        y70.d dVarA = t70.k0.a(y70.o.f96819a.f90673f.plus(context).plus(i2Var));
        fr.b0 b0Var = new fr.b0(iVar, 8);
        bn.i iVar2 = new bn.i();
        iVar2.f18209a = iVar;
        iVar2.f18210b = (SuspendLambda) function2;
        iVar2.f18211c = dVarA;
        iVar2.f18212d = b0Var;
        iVar.f59377m = iVar2;
        return iVar;
    }

    public static final Object h(u uVar, t tVar, Function2 function2, SuspendLambda suspendLambda) {
        Object objD;
        if (tVar != t.f59441b) {
            return (uVar.b() != t.f59440a && (objD = t70.k0.d(new androidx.room.p(uVar, tVar, function2, (Continuation) null), suspendLambda)) == CoroutineSingletons.f71806a) ? objD : Unit.f71706a;
        }
        throw new IllegalArgumentException("repeatOnLifecycle cannot start work with the INITIALIZED lifecycle state.");
    }

    public static final Object i(a0 a0Var, t tVar, Function2 function2, SuspendLambda suspendLambda) {
        Object objH = h(a0Var.getLifecycle(), tVar, function2, suspendLambda);
        return objH == CoroutineSingletons.f71806a ? objH : Unit.f71706a;
    }

    public static void j(a7.e eVar, u uVar) throws NoSuchMethodException, SecurityException {
        t tVarB = uVar.b();
        if (tVarB == t.f59441b || tVarB.compareTo(t.f59443d) >= 0) {
            eVar.c();
        } else {
            uVar.a(new p(eVar, uVar));
        }
    }
}
