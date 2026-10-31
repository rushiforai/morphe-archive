package h6;

import android.os.Looper;
import androidx.lifecycle.DefaultLifecycleObserver;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class c0 extends u {

    /* renamed from: b, reason: collision with root package name */
    public final boolean f59340b;

    /* renamed from: c, reason: collision with root package name */
    public t.a f59341c;

    /* renamed from: d, reason: collision with root package name */
    public t f59342d;

    /* renamed from: e, reason: collision with root package name */
    public final WeakReference f59343e;

    /* renamed from: f, reason: collision with root package name */
    public int f59344f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f59345g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f59346h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f59347i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f59348j;

    public c0(a0 a0Var, boolean z11) {
        this.f59340b = z11;
        this.f59341c = new t.a();
        t tVar = t.f59441b;
        this.f59342d = tVar;
        this.f59347i = new ArrayList();
        this.f59343e = new WeakReference(a0Var);
        this.f59348j = u1.c(tVar);
    }

    @Override // h6.u
    public final void a(z observer) {
        y kVar;
        Object obj;
        a0 a0Var;
        Intrinsics.g(observer, "observer");
        e("addObserver");
        t tVar = this.f59342d;
        t tVar2 = t.f59440a;
        if (tVar != tVar2) {
            tVar2 = t.f59441b;
        }
        b0 b0Var = new b0();
        HashMap map = e0.f59356a;
        boolean z11 = observer instanceof y;
        boolean z12 = observer instanceof DefaultLifecycleObserver;
        if (z11 && z12) {
            kVar = new k((DefaultLifecycleObserver) observer, (y) observer);
        } else if (z12) {
            kVar = new k((DefaultLifecycleObserver) observer, null);
        } else if (z11) {
            kVar = (y) observer;
        } else {
            Class<?> cls = observer.getClass();
            if (e0.b(cls) == 2) {
                Object obj2 = e0.f59357b.get(cls);
                Intrinsics.d(obj2);
                List list = (List) obj2;
                if (list.size() == 1) {
                    e0.a((Constructor) list.get(0), observer);
                    throw null;
                }
                int size = list.size();
                m[] mVarArr = new m[size];
                if (size > 0) {
                    e0.a((Constructor) list.get(0), observer);
                    throw null;
                }
                kVar = new g(mVarArr);
            } else {
                kVar = new k(observer);
            }
        }
        b0Var.f59330b = kVar;
        b0Var.f59329a = tVar2;
        t.a aVar = this.f59341c;
        t.c cVarB = aVar.b(observer);
        if (cVarB != null) {
            obj = cVarB.f87871b;
        } else {
            HashMap map2 = aVar.f87866e;
            t.c cVar = new t.c(observer, b0Var);
            aVar.f87880d++;
            t.c cVar2 = aVar.f87878b;
            if (cVar2 == null) {
                aVar.f87877a = cVar;
                aVar.f87878b = cVar;
            } else {
                cVar2.f87872c = cVar;
                cVar.f87873d = cVar2;
                aVar.f87878b = cVar;
            }
            map2.put(observer, cVar);
            obj = null;
        }
        if (((b0) obj) == null && (a0Var = (a0) this.f59343e.get()) != null) {
            boolean z13 = this.f59344f != 0 || this.f59345g;
            t tVarD = d(observer);
            this.f59344f++;
            while (b0Var.f59329a.compareTo(tVarD) < 0 && this.f59341c.f87866e.containsKey(observer)) {
                t tVar3 = b0Var.f59329a;
                ArrayList arrayList = this.f59347i;
                arrayList.add(tVar3);
                q qVar = s.Companion;
                t state = b0Var.f59329a;
                qVar.getClass();
                Intrinsics.g(state, "state");
                int iOrdinal = state.ordinal();
                s sVar = iOrdinal != 1 ? iOrdinal != 2 ? iOrdinal != 3 ? null : s.ON_RESUME : s.ON_START : s.ON_CREATE;
                if (sVar == null) {
                    throw new IllegalStateException("no event up from " + b0Var.f59329a);
                }
                b0Var.a(a0Var, sVar);
                arrayList.remove(arrayList.size() - 1);
                tVarD = d(observer);
            }
            if (!z13) {
                i();
            }
            this.f59344f--;
        }
    }

    @Override // h6.u
    public final t b() {
        return this.f59342d;
    }

    @Override // h6.u
    public final void c(z observer) {
        Intrinsics.g(observer, "observer");
        e("removeObserver");
        this.f59341c.c(observer);
    }

    public final t d(z zVar) {
        HashMap map = this.f59341c.f87866e;
        t.c cVar = map.containsKey(zVar) ? ((t.c) map.get(zVar)).f87873d : null;
        t tVar = cVar != null ? ((b0) cVar.f87871b).f59329a : null;
        ArrayList arrayList = this.f59347i;
        t tVar2 = arrayList.isEmpty() ? null : (t) c1.l(arrayList, 1);
        t state1 = this.f59342d;
        Intrinsics.g(state1, "state1");
        if (tVar == null || tVar.compareTo(state1) >= 0) {
            tVar = state1;
        }
        return (tVar2 == null || tVar2.compareTo(tVar) >= 0) ? tVar : tVar2;
    }

    public final void e(String str) {
        if (this.f59340b) {
            s.a.b0().f86500b.getClass();
            if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
                throw new IllegalStateException(b.c0.l("Method ", str, " must be called on the main thread").toString());
            }
        }
    }

    public final void f(s event) {
        Intrinsics.g(event, "event");
        e("handleLifecycleEvent");
        g(event.a());
    }

    public final void g(t tVar) {
        if (this.f59342d == tVar) {
            return;
        }
        g1.b((a0) this.f59343e.get(), this.f59342d, tVar);
        this.f59342d = tVar;
        if (this.f59345g || this.f59344f != 0) {
            this.f59346h = true;
            return;
        }
        this.f59345g = true;
        i();
        this.f59345g = false;
        if (this.f59342d == t.f59440a) {
            this.f59341c = new t.a();
        }
    }

    public final void h(t state) {
        Intrinsics.g(state, "state");
        e("setCurrentState");
        g(state);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0030, code lost:
    
        r8.f59346h = false;
        r8.f59348j.j(r8.f59342d);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0039, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i() {
        a0 a0Var = (a0) this.f59343e.get();
        if (a0Var == null) {
            throw new IllegalStateException("LifecycleOwner of this LifecycleRegistry is already garbage collected. It is too late to change lifecycle state.");
        }
        while (true) {
            t.a aVar = this.f59341c;
            if (aVar.f87880d != 0) {
                t.c cVar = aVar.f87877a;
                Intrinsics.d(cVar);
                t tVar = ((b0) cVar.f87871b).f59329a;
                t.c cVar2 = this.f59341c.f87878b;
                Intrinsics.d(cVar2);
                t tVar2 = ((b0) cVar2.f87871b).f59329a;
                if (tVar == tVar2 && this.f59342d == tVar2) {
                    break;
                }
                this.f59346h = false;
                t tVar3 = this.f59342d;
                t.c cVar3 = this.f59341c.f87877a;
                Intrinsics.d(cVar3);
                int iCompareTo = tVar3.compareTo(((b0) cVar3.f87871b).f59329a);
                ArrayList arrayList = this.f59347i;
                if (iCompareTo < 0) {
                    t.a aVar2 = this.f59341c;
                    t.b bVar = new t.b(aVar2.f87878b, aVar2.f87877a, 1);
                    aVar2.f87879c.put(bVar, Boolean.FALSE);
                    while (bVar.hasNext() && !this.f59346h) {
                        Map.Entry entry = (Map.Entry) bVar.next();
                        Intrinsics.d(entry);
                        z zVar = (z) entry.getKey();
                        b0 b0Var = (b0) entry.getValue();
                        while (b0Var.f59329a.compareTo(this.f59342d) > 0 && !this.f59346h && this.f59341c.f87866e.containsKey(zVar)) {
                            q qVar = s.Companion;
                            t tVar4 = b0Var.f59329a;
                            qVar.getClass();
                            s sVarA = q.a(tVar4);
                            if (sVarA == null) {
                                throw new IllegalStateException("no event down from " + b0Var.f59329a);
                            }
                            arrayList.add(sVarA.a());
                            b0Var.a(a0Var, sVarA);
                            arrayList.remove(arrayList.size() - 1);
                        }
                    }
                }
                t.c cVar4 = this.f59341c.f87878b;
                if (!this.f59346h && cVar4 != null && this.f59342d.compareTo(((b0) cVar4.f87871b).f59329a) > 0) {
                    t.a aVar3 = this.f59341c;
                    aVar3.getClass();
                    t.d dVar = new t.d(aVar3);
                    aVar3.f87879c.put(dVar, Boolean.FALSE);
                    while (dVar.hasNext() && !this.f59346h) {
                        Map.Entry entry2 = (Map.Entry) dVar.next();
                        z zVar2 = (z) entry2.getKey();
                        b0 b0Var2 = (b0) entry2.getValue();
                        while (b0Var2.f59329a.compareTo(this.f59342d) < 0 && !this.f59346h && this.f59341c.f87866e.containsKey(zVar2)) {
                            arrayList.add(b0Var2.f59329a);
                            q qVar2 = s.Companion;
                            t state = b0Var2.f59329a;
                            qVar2.getClass();
                            Intrinsics.g(state, "state");
                            int iOrdinal = state.ordinal();
                            s sVar = iOrdinal != 1 ? iOrdinal != 2 ? iOrdinal != 3 ? null : s.ON_RESUME : s.ON_START : s.ON_CREATE;
                            if (sVar == null) {
                                throw new IllegalStateException("no event up from " + b0Var2.f59329a);
                            }
                            b0Var2.a(a0Var, sVar);
                            arrayList.remove(arrayList.size() - 1);
                        }
                    }
                }
            } else {
                break;
            }
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public c0(a0 provider) {
        this(provider, true);
        Intrinsics.g(provider, "provider");
    }
}
