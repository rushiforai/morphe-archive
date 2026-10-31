package h6;

import androidx.lifecycle.DefaultLifecycleObserver;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59397a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Object f59398b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f59399c;

    public k(DefaultLifecycleObserver defaultLifecycleObserver, y yVar) {
        Intrinsics.g(defaultLifecycleObserver, "defaultLifecycleObserver");
        this.f59398b = defaultLifecycleObserver;
        this.f59399c = yVar;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        switch (this.f59397a) {
            case 0:
                DefaultLifecycleObserver defaultLifecycleObserver = (DefaultLifecycleObserver) this.f59398b;
                switch (j.f59385a[sVar.ordinal()]) {
                    case 1:
                        defaultLifecycleObserver.onCreate(a0Var);
                        break;
                    case 2:
                        defaultLifecycleObserver.onStart(a0Var);
                        break;
                    case 3:
                        defaultLifecycleObserver.onResume(a0Var);
                        break;
                    case 4:
                        defaultLifecycleObserver.onPause(a0Var);
                        break;
                    case 5:
                        defaultLifecycleObserver.onStop(a0Var);
                        break;
                    case 6:
                        defaultLifecycleObserver.onDestroy(a0Var);
                        break;
                    case 7:
                        throw new IllegalArgumentException("ON_ANY must not been send by anybody");
                    default:
                        throw new NoWhenBranchMatchedException();
                }
                y yVar = (y) this.f59399c;
                if (yVar != null) {
                    yVar.d(a0Var, sVar);
                    return;
                }
                return;
            default:
                HashMap map = ((d) this.f59399c).f59349a;
                List list = (List) map.get(sVar);
                Object obj = this.f59398b;
                d.a(list, a0Var, sVar, obj);
                d.a((List) map.get(s.ON_ANY), a0Var, sVar, obj);
                return;
        }
    }

    public k(z zVar) {
        this.f59398b = zVar;
        f fVar = f.f59361c;
        Class<?> cls = zVar.getClass();
        d dVar = (d) fVar.f59362a.get(cls);
        this.f59399c = dVar == null ? fVar.a(cls, null) : dVar;
    }
}
