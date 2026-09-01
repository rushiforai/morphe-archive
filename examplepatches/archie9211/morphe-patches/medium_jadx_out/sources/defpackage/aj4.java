package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aj4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ fj4 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ aj4(fj4 fj4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = fj4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        fj4 fj4Var = this.e;
        switch (i) {
            case 0:
                return new aj4(fj4Var, n92Var, 0);
            default:
                aj4 aj4Var = new aj4(fj4Var, n92Var, 1);
                aj4Var.d = obj;
                return aj4Var;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((aj4) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((aj4) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        int i = this.b;
        c1e c1eVar = c1e.a;
        fj4 fj4Var = this.e;
        switch (i) {
            case 0:
                ConcurrentHashMap concurrentHashMap = fj4Var.m;
                xpc xpcVar = fj4Var.t;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    Boolean bool = Boolean.TRUE;
                    xpcVar.getClass();
                    xpcVar.m(null, bool);
                    Set setEntrySet = concurrentHashMap.entrySet();
                    setEntrySet.getClass();
                    ArrayList<Map.Entry> arrayList = new ArrayList();
                    for (Object obj2 : setEntrySet) {
                        Map.Entry entry = (Map.Entry) obj2;
                        entry.getClass();
                        Object value = entry.getValue();
                        value.getClass();
                        if (!((Boolean) value).booleanValue()) {
                            arrayList.add(obj2);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
                    for (Map.Entry entry2 : arrayList) {
                        entry2.getClass();
                        Object key = entry2.getKey();
                        key.getClass();
                        arrayList2.add((String) key);
                    }
                    os4 os4Var = fj4Var.c;
                    this.c = 1;
                    objA = os4Var.a(arrayList2, this);
                    if (objA != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objA = ((bjb) obj).a;
                if (!(objA instanceof ajb)) {
                    Boolean bool2 = Boolean.FALSE;
                    xpcVar.getClass();
                    xpcVar.m(null, bool2);
                    Set setKeySet = concurrentHashMap.keySet();
                    setKeySet.getClass();
                    Iterator it2 = setKeySet.iterator();
                    while (it2.hasNext()) {
                        concurrentHashMap.put((String) it2.next(), Boolean.TRUE);
                    }
                    xpc xpcVar2 = fj4Var.s;
                    Boolean bool3 = Boolean.FALSE;
                    xpcVar2.getClass();
                    xpcVar2.m(null, bool3);
                }
                if (bjb.b(objA) == null) {
                    return c1eVar;
                }
                Boolean bool4 = Boolean.FALSE;
                xpcVar.getClass();
                xpcVar.m(null, bool4);
                r6c r6cVar = fj4Var.w;
                this.d = objA;
                this.c = 2;
                if (r6cVar.a(ji4.a, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                do4 do4Var = (do4) this.d;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    if (do4Var.a(wi4.a, this) != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                km4.I(wld.a, null, "Request permission", new Object[0], "Request permission");
                r6c r6cVar2 = fj4Var.w;
                this.d = null;
                this.c = 2;
                if (r6cVar2.a(ki4.a, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
