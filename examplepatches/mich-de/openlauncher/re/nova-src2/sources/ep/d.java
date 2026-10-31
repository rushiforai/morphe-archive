package ep;

import cp.a0;
import cp.z;
import e1.m0;
import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class d extends z {

    /* renamed from: a, reason: collision with root package name */
    public volatile z f52858a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f52859b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f52860c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ cp.m f52861d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ jp.a f52862e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ e f52863f;

    public d(e eVar, boolean z11, boolean z12, cp.m mVar, jp.a aVar) {
        this.f52863f = eVar;
        this.f52859b = z11;
        this.f52860c = z12;
        this.f52861d = mVar;
        this.f52862e = aVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0087 A[SYNTHETIC] */
    @Override // cp.z
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(kp.a aVar) {
        Iterator it;
        if (this.f52859b) {
            aVar.l0();
            return null;
        }
        z zVarC = this.f52858a;
        if (zVarC == null) {
            cp.m mVar = this.f52861d;
            e eVar = this.f52863f;
            jp.a aVar2 = this.f52862e;
            fp.q qVar = mVar.f47760d;
            qVar.getClass();
            ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) qVar.f55538c;
            if (eVar == fp.q.f55535d) {
                eVar = qVar;
                it = mVar.f47761e.iterator();
                boolean z11 = false;
                while (true) {
                    if (it.hasNext()) {
                        a0 a0Var = (a0) it.next();
                        if (z11) {
                            z zVarA = a0Var.a(mVar, aVar2);
                            if (zVarA != null) {
                                zVarC = zVarA;
                                break;
                            }
                        } else if (a0Var == eVar) {
                            z11 = true;
                        }
                    } else {
                        if (z11) {
                            throw new IllegalArgumentException("GSON cannot serialize or deserialize " + aVar2);
                        }
                        zVarC = mVar.c(aVar2);
                    }
                }
                this.f52858a = zVarC;
            } else {
                Class cls = aVar2.f69629a;
                a0 a0Var2 = (a0) concurrentHashMap.get(cls);
                if (a0Var2 != null) {
                    if (a0Var2 == eVar) {
                    }
                    it = mVar.f47761e.iterator();
                    boolean z112 = false;
                    while (true) {
                        if (it.hasNext()) {
                        }
                    }
                    this.f52858a = zVarC;
                } else {
                    dp.a aVar3 = (dp.a) cls.getAnnotation(dp.a.class);
                    if (aVar3 != null) {
                        Class clsValue = aVar3.value();
                        if (a0.class.isAssignableFrom(clsValue)) {
                            a0 a0Var3 = (a0) ((m0) qVar.f55537b).e(new jp.a(clsValue), true).a();
                            a0 a0Var4 = (a0) concurrentHashMap.putIfAbsent(cls, a0Var3);
                            if (a0Var4 != null) {
                                a0Var3 = a0Var4;
                            }
                            if (a0Var3 == eVar) {
                            }
                        }
                    }
                    it = mVar.f47761e.iterator();
                    boolean z1122 = false;
                    while (true) {
                        if (it.hasNext()) {
                        }
                    }
                    this.f52858a = zVarC;
                }
            }
        }
        return zVarC.b(aVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0086 A[SYNTHETIC] */
    @Override // cp.z
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(kp.b bVar, Object obj) throws IOException {
        Iterator it;
        if (this.f52860c) {
            bVar.p();
            return;
        }
        z zVarC = this.f52858a;
        if (zVarC == null) {
            cp.m mVar = this.f52861d;
            e eVar = this.f52863f;
            jp.a aVar = this.f52862e;
            fp.q qVar = mVar.f47760d;
            qVar.getClass();
            ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) qVar.f55538c;
            if (eVar == fp.q.f55535d) {
                eVar = qVar;
                it = mVar.f47761e.iterator();
                boolean z11 = false;
                while (true) {
                    if (it.hasNext()) {
                        a0 a0Var = (a0) it.next();
                        if (z11) {
                            z zVarA = a0Var.a(mVar, aVar);
                            if (zVarA != null) {
                                zVarC = zVarA;
                                break;
                            }
                        } else if (a0Var == eVar) {
                            z11 = true;
                        }
                    } else {
                        if (z11) {
                            throw new IllegalArgumentException("GSON cannot serialize or deserialize " + aVar);
                        }
                        zVarC = mVar.c(aVar);
                    }
                }
                this.f52858a = zVarC;
            } else {
                Class cls = aVar.f69629a;
                a0 a0Var2 = (a0) concurrentHashMap.get(cls);
                if (a0Var2 != null) {
                    if (a0Var2 == eVar) {
                    }
                    it = mVar.f47761e.iterator();
                    boolean z112 = false;
                    while (true) {
                        if (it.hasNext()) {
                        }
                    }
                    this.f52858a = zVarC;
                } else {
                    dp.a aVar2 = (dp.a) cls.getAnnotation(dp.a.class);
                    if (aVar2 != null) {
                        Class clsValue = aVar2.value();
                        if (a0.class.isAssignableFrom(clsValue)) {
                            a0 a0Var3 = (a0) ((m0) qVar.f55537b).e(new jp.a(clsValue), true).a();
                            a0 a0Var4 = (a0) concurrentHashMap.putIfAbsent(cls, a0Var3);
                            if (a0Var4 != null) {
                                a0Var3 = a0Var4;
                            }
                            if (a0Var3 == eVar) {
                            }
                        }
                    }
                    it = mVar.f47761e.iterator();
                    boolean z1122 = false;
                    while (true) {
                        if (it.hasNext()) {
                        }
                    }
                    this.f52858a = zVarC;
                }
            }
        }
        zVarC.c(bVar, obj);
    }
}
