package io.branch.search.internal.multiprocess;

import androidx.lifecycle.DefaultLifecycleObserver;
import b70.g;
import b70.h;
import io.branch.search.internal.Af;
import io.branch.search.internal.C3158g2;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.C3308p0;
import io.branch.search.internal.C3350r9;
import io.branch.search.internal.C4;
import io.branch.search.internal.C8;
import io.branch.search.internal.F4;
import io.branch.search.internal.F6;
import io.branch.search.internal.InterfaceC3227k4;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.internal.W;
import io.branch.search.internal.X;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import t70.j0;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/internal/multiprocess/LifecycleNotifier;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class LifecycleNotifier implements DefaultLifecycleObserver {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3227k4 f65287a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3158g2 f65288b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C8 f65289c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final j0 f65290d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final F4 f65291e;

    public LifecycleNotifier(@NotNull InterfaceC3227k4 delegate, @NotNull C3158g2 impressionsBuffer, @NotNull C8 observerMechanism, @NotNull j0 bgScope, @NotNull F4 contextDelegate) {
        Intrinsics.g(delegate, "delegate");
        Intrinsics.g(impressionsBuffer, "impressionsBuffer");
        Intrinsics.g(observerMechanism, "observerMechanism");
        Intrinsics.g(bgScope, "bgScope");
        Intrinsics.g(contextDelegate, "contextDelegate");
        this.f65287a = delegate;
        this.f65288b = impressionsBuffer;
        this.f65289c = observerMechanism;
        this.f65290d = bgScope;
        this.f65291e = contextDelegate;
    }

    public static final Object a(LifecycleNotifier lifecycleNotifier, Continuation continuation) {
        C4.i.d dVar;
        C3350r9<X> c3350r9;
        List listI1;
        Iterator<Map.Entry<String, Collection<X>>> it;
        Iterator it2;
        InterfaceC3227k4 interfaceC3227k4 = lifecycleNotifier.f65287a;
        String packageName = lifecycleNotifier.f65291e.f62438a.getPackageName();
        Intrinsics.f(packageName, "context.packageName");
        C3158g2 c3158g2 = lifecycleNotifier.f65288b;
        c3158g2.getClass();
        try {
            try {
                Collection collectionValues = c3158g2.f64544a.values();
                ArrayList arrayList = new ArrayList();
                for (Object obj : collectionValues) {
                    if (((Af) obj).f62054k != null) {
                        arrayList.add(obj);
                    }
                }
                Iterator it3 = arrayList.iterator();
                while (it3.hasNext()) {
                    ((Af) it3.next()).b();
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator<Map.Entry<String, Collection<X>>> it4 = c3158g2.f64549f.f64657a.f65624h.entrySet().iterator();
                while (it4.hasNext()) {
                    Map.Entry<String, Collection<X>> next = it4.next();
                    String key = next.getKey();
                    Collection<X> value = next.getValue();
                    ArrayList arrayList3 = new ArrayList();
                    Iterator it5 = value.iterator();
                    while (it5.hasNext()) {
                        X x11 = (X) it5.next();
                        List<W.b> list = (List) c3158g2.f64547d.get(Integer.valueOf(x11.c()));
                        if (list != null && !list.isEmpty()) {
                            ArrayList arrayList4 = new ArrayList();
                            for (W.b bVar : list) {
                                if (bVar.f63550c == null) {
                                    long jCurrentTimeMillis = System.currentTimeMillis();
                                    if (bVar.f63550c != null) {
                                        C3308p0.a("encounter being completed again");
                                    } else {
                                        bVar.f63550c = Long.valueOf(jCurrentTimeMillis - bVar.f63549b);
                                    }
                                }
                                Long l9 = bVar.f63550c;
                                if (l9 != null) {
                                    arrayList4.add(new C4.i.b(bVar.f63548a, bVar.f63549b, l9.longValue()));
                                }
                            }
                            if (x11 instanceof InterfaceC3331q6.b) {
                                it = it4;
                                it2 = it5;
                                arrayList3.add(new C4.i.c(((InterfaceC3331q6.b) x11).f65551j, ((InterfaceC3331q6.b) x11).f65553l, ((InterfaceC3331q6.b) x11).f65552k, ((InterfaceC3331q6.b) x11).f65550i, ((InterfaceC3331q6.b) x11).f65546e, ((InterfaceC3331q6.b) x11).o, ((InterfaceC3331q6.b) x11).n, ((InterfaceC3331q6.b) x11).f65555p, null, arrayList4, Long.valueOf(((InterfaceC3331q6.b) x11).f65549h), ((InterfaceC3331q6.b) x11).f65557r, ((InterfaceC3331q6.b) x11).f65558s));
                            } else {
                                it = it4;
                                it2 = it5;
                                if (x11 instanceof InterfaceC3331q6.a) {
                                    arrayList3.add(new C4.i.c(((InterfaceC3331q6.a) x11).f65534c, null, ((InterfaceC3331q6.a) x11).f65535d, ((InterfaceC3331q6.a) x11).f65536e, null, null, ((InterfaceC3331q6.a) x11).f65539h, ((InterfaceC3331q6.a) x11).f65537f, ((InterfaceC3331q6.a) x11).f65532a, arrayList4, null, h.f17594a, false));
                                }
                            }
                            it4 = it;
                            it5 = it2;
                        }
                    }
                    Iterator<Map.Entry<String, Collection<X>>> it6 = it4;
                    if (!arrayList3.isEmpty()) {
                        arrayList2.add(new C4.i.a(key, arrayList3));
                    }
                    it4 = it6;
                }
                ArrayList failureQueue = C3296o5.f65427b;
                Intrinsics.f(failureQueue, "failureQueue");
                List listI12 = g.I1(failureQueue);
                failureQueue.clear();
                synchronized (c3158g2.f64550g) {
                    listI1 = g.I1(c3158g2.f64550g);
                }
                dVar = new C4.i.d(arrayList2, listI1, listI12);
                Iterator it7 = c3158g2.f64544a.entrySet().iterator();
                while (it7.hasNext()) {
                    ((Af) ((Map.Entry) it7.next()).getValue()).d();
                }
                c3158g2.f64547d.clear();
                c3350r9 = c3158g2.f64549f.f64657a;
            } catch (Exception e3) {
                C3296o5.a aVar = C3296o5.f65426a;
                C3296o5.a(new F6("BranchImpressionTracking", "onStop failed", null, e3, null));
                ArrayList arrayList5 = new ArrayList();
                EmptyList emptyList = EmptyList.f71733a;
                dVar = new C4.i.d(arrayList5, emptyList, emptyList);
                Iterator it8 = c3158g2.f64544a.entrySet().iterator();
                while (it8.hasNext()) {
                    ((Af) ((Map.Entry) it8.next()).getValue()).d();
                }
                c3158g2.f64547d.clear();
                c3350r9 = c3158g2.f64549f.f64657a;
            }
            c3350r9.f65624h.clear();
            c3158g2.f64550g.clear();
            Object objA = interfaceC3227k4.a(packageName, dVar, (Continuation<? super Unit>) continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        } catch (Throwable th2) {
            Iterator it9 = c3158g2.f64544a.entrySet().iterator();
            while (it9.hasNext()) {
                ((Af) ((Map.Entry) it9.next()).getValue()).d();
            }
            c3158g2.f64547d.clear();
            c3158g2.f64549f.f64657a.f65624h.clear();
            c3158g2.f64550g.clear();
            throw th2;
        }
    }
}
