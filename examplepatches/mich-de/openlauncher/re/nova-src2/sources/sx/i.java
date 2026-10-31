package sx;

import android.content.Context;
import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: i, reason: collision with root package name */
    public static final b6.b f87782i = new b6.b();

    /* renamed from: j, reason: collision with root package name */
    public static volatile i f87783j;

    /* renamed from: a, reason: collision with root package name */
    public final Context f87784a;

    /* renamed from: b, reason: collision with root package name */
    public final a f87785b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f87786c;

    /* renamed from: d, reason: collision with root package name */
    public final d f87787d;

    /* renamed from: e, reason: collision with root package name */
    public final y70.d f87788e;

    /* renamed from: f, reason: collision with root package name */
    public final c80.d f87789f;

    /* renamed from: g, reason: collision with root package name */
    public final p f87790g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f87791h;

    public i(Context context, a aVar, Function0 function0, int i5) {
        aVar = (i5 & 2) != 0 ? new a(context) : aVar;
        function0 = (i5 & 4) != 0 ? new n00.d(context, 8) : function0;
        d dVar = new d(0);
        this.f87784a = context;
        this.f87785b = aVar;
        this.f87786c = function0;
        this.f87787d = dVar;
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        this.f87788e = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
        this.f87789f = new c80.d();
        this.f87790g = new p();
        this.f87791h = new LinkedHashMap();
    }

    public static final void a(i iVar, j jVar) {
        a aVar = iVar.f87785b;
        String str = jVar.f87795d.f87819b;
        o oVar = jVar.f87792a;
        String str2 = jVar.f87793b;
        int iC = aVar.c(str, str2, oVar);
        if (iC >= 20) {
            iVar.f87791h.put(new l(jVar.f87795d.f87819b, str2, oVar), new m(System.currentTimeMillis(), 0));
            mc0.d.f76206a.b("Dropped tier " + str2 + " due to " + iC + " consecutive failures", new Object[0]);
        }
    }

    public static final void b(i iVar, String str, o oVar, List list) {
        Object obj;
        long jCurrentTimeMillis = System.currentTimeMillis();
        LinkedHashMap linkedHashMap = iVar.f87791h;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            l lVar = (l) entry.getKey();
            m mVar = (m) entry.getValue();
            if (Intrinsics.b(lVar.f87801a, str) && lVar.f87802b == oVar && ((jCurrentTimeMillis - mVar.f87804a) / 3600000.0d >= 1.0d || mVar.f87805b >= 100)) {
                linkedHashMap2.put(entry.getKey(), entry.getValue());
            }
        }
        for (l lVar2 : linkedHashMap2.keySet()) {
            linkedHashMap.remove(lVar2);
            mc0.d.f76206a.b(c0.k("Recovered tier ", lVar2.f87803c), new Object[0]);
        }
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        for (Map.Entry entry2 : linkedHashMap.entrySet()) {
            l lVar3 = (l) entry2.getKey();
            if (Intrinsics.b(lVar3.f87801a, str) && lVar3.f87802b == oVar) {
                linkedHashMap3.put(entry2.getKey(), entry2.getValue());
            }
        }
        if (list.isEmpty() || linkedHashMap3.size() < list.size()) {
            return;
        }
        Iterator it = linkedHashMap3.entrySet().iterator();
        if (it.hasNext()) {
            Object next = it.next();
            if (it.hasNext()) {
                long j11 = ((m) ((Map.Entry) next).getValue()).f87804a;
                do {
                    Object next2 = it.next();
                    long j12 = ((m) ((Map.Entry) next2).getValue()).f87804a;
                    if (j11 > j12) {
                        next = next2;
                        j11 = j12;
                    }
                } while (it.hasNext());
            }
            obj = next;
        } else {
            obj = null;
        }
        Map.Entry entry3 = (Map.Entry) obj;
        if (entry3 != null) {
            l lVar4 = (l) entry3.getKey();
            linkedHashMap.remove(lVar4);
            mc0.d.f76206a.b(c0.l("Force-recovered tier ", lVar4.f87803c, " (all tiers were dropped)"), new Object[0]);
        }
    }

    public static final Set c(i iVar, String str, o oVar) {
        Set setKeySet = iVar.f87791h.keySet();
        ArrayList arrayList = new ArrayList();
        for (Object obj : setKeySet) {
            l lVar = (l) obj;
            if (Intrinsics.b(lVar.f87801a, str) && lVar.f87802b == oVar) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((l) it.next()).f87803c);
        }
        return b70.g.N1(arrayList2);
    }

    public static final void d(i iVar, String str, o oVar) {
        LinkedHashMap linkedHashMap = iVar.f87791h;
        Set setKeySet = linkedHashMap.keySet();
        ArrayList arrayList = new ArrayList();
        for (Object obj : setKeySet) {
            l lVar = (l) obj;
            if (Intrinsics.b(lVar.f87801a, str) && lVar.f87802b == oVar) {
                arrayList.add(obj);
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            l lVar2 = (l) it.next();
            m mVar = (m) linkedHashMap.get(lVar2);
            if (mVar != null) {
                linkedHashMap.put(lVar2, new m(mVar.f87804a, mVar.f87805b + 1));
            }
        }
    }

    public static void g(i iVar, j jVar) {
        m0.t(iVar.f87788e, null, null, new pu.q(iVar, jVar, null, 22), 3);
    }

    public final void e(j jVar, double d5) {
        m0.t(this.f87788e, null, null, new f(this, jVar, d5, null), 3);
    }

    public final Object f(j jVar, boolean z11, Double d5, SuspendLambda suspendLambda) throws Throwable {
        a80.e eVar = y0.f88884a;
        Object objY = m0.y(a80.d.f488c, new g(this, jVar, z11, d5, null), suspendLambda);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    public final Object h(String str, b bVar, String str2, Continuation continuation) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new h(this, str, str2, bVar, null), continuation);
    }
}
