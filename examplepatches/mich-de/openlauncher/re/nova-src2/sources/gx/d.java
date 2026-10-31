package gx;

import f1.z1;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public volatile dx.j0 f58058a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f58059b;

    /* renamed from: c, reason: collision with root package name */
    public final c80.d f58060c;

    /* renamed from: d, reason: collision with root package name */
    public final ConcurrentHashMap f58061d;

    public d(dx.j0 j0Var) {
        z1 z1Var = new z1(17);
        this.f58058a = j0Var;
        this.f58059b = z1Var;
        this.f58060c = new c80.d();
        this.f58061d = new ConcurrentHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        a aVar;
        d dVar;
        c80.d dVar2;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f58015x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f58015x = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f58013v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f58015x;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar.f58011t = this;
            c80.d dVar3 = this.f58060c;
            aVar.f58012u = dVar3;
            aVar.f58015x = 1;
            if (dVar3.e(aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            dVar = this;
            dVar2 = dVar3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar2 = aVar.f58012u;
            dVar = aVar.f58011t;
            ResultKt.b(obj);
        }
        try {
            Collection<ArrayDeque> collectionValues = dVar.f58061d.values();
            Intrinsics.f(collectionValues, "<get-values>(...)");
            for (ArrayDeque arrayDeque : collectionValues) {
                Intrinsics.d(arrayDeque);
                Iterator<E> it = arrayDeque.iterator();
                while (it.hasNext()) {
                    c0 c0Var = (c0) it.next();
                    try {
                        int i12 = Result.f71687b;
                        c0Var.f58052a.destroy();
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        int i13 = Result.f71687b;
                        ResultKt.a(th2);
                    }
                }
            }
            dVar.f58061d.clear();
            Unit unit2 = Unit.f71706a;
            dVar2.g(null);
            return unit2;
        } catch (Throwable th3) {
            dVar2.g(null);
            throw th3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00c4 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, c0 c0Var, ContinuationImpl continuationImpl) {
        b bVar;
        d dVar;
        String str2;
        c80.d dVar2;
        Object objA;
        Object result;
        Object objPutIfAbsent;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f58025z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f58025z = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f58023x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f58025z;
        if (i11 == 0) {
            ResultKt.b(obj);
            c80.d dVar3 = this.f58060c;
            bVar.f58019t = this;
            bVar.f58020u = str;
            bVar.f58021v = c0Var;
            bVar.f58022w = dVar3;
            bVar.f58025z = 1;
            if (dVar3.e(bVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            dVar = this;
            str2 = str;
            dVar2 = dVar3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar2 = bVar.f58022w;
            c0Var = bVar.f58021v;
            str2 = bVar.f58020u;
            dVar = bVar.f58019t;
            ResultKt.b(obj);
        }
        try {
            f0 f0Var = c0Var.f58052a;
            long jB = f0Var.b(dVar.f58058a);
            if (!dVar.f58058a.f49718b || !dVar.f58058a.f49719c || ((f0Var instanceof ex.b) && !dVar.f58058a.f49731q)) {
                try {
                    int i12 = Result.f71687b;
                    f0Var.destroy();
                    objA = Unit.f71706a;
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                result = new Result(objA);
            } else if (c0Var.f58055d && c0Var.f58056e != null) {
                long jLongValue = ((Number) dVar.f58059b.invoke()).longValue();
                Long l9 = c0Var.f58056e;
                Intrinsics.d(l9);
                if (jLongValue - l9.longValue() < jB && c0Var.f58057f < dVar.f58058a.f49721e && f0Var.d()) {
                    ConcurrentHashMap concurrentHashMap = dVar.f58061d;
                    dx.t tVar = new dx.t(str2);
                    Object arrayDeque = concurrentHashMap.get(tVar);
                    if (arrayDeque == null && (objPutIfAbsent = concurrentHashMap.putIfAbsent(tVar, (arrayDeque = new ArrayDeque()))) != null) {
                        arrayDeque = objPutIfAbsent;
                    }
                    ((ArrayDeque) arrayDeque).addLast(c0Var);
                    result = Unit.f71706a;
                }
            }
            dVar2.g(null);
            return result;
        } catch (Throwable th3) {
            dVar2.g(null);
            throw th3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, dx.f fVar, ContinuationImpl continuationImpl) {
        c cVar;
        c80.d dVar;
        d dVar2;
        c0 c0Var;
        ArrayDeque arrayDeque;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f58051z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f58051z = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f58049x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f58051z;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = this.f58060c;
            cVar.f58045t = this;
            cVar.f58046u = str;
            cVar.f58047v = fVar;
            cVar.f58048w = dVar;
            cVar.f58051z = 1;
            if (dVar.e(cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            dVar2 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c80.d dVar3 = cVar.f58048w;
            fVar = cVar.f58047v;
            String str2 = cVar.f58046u;
            dVar2 = cVar.f58045t;
            ResultKt.b(obj);
            dVar = dVar3;
            str = str2;
        }
        try {
            if (dVar2.f58058a.f49718b && dVar2.f58058a.f49719c && (arrayDeque = (ArrayDeque) dVar2.f58061d.get(new dx.t(str))) != null) {
                String strZ = com.google.android.gms.internal.consent_sdk.k0.z(fVar);
                Iterator<E> it = arrayDeque.iterator();
                long jLongValue = ((Number) dVar2.f58059b.invoke()).longValue();
                while (it.hasNext()) {
                    c0Var = (c0) it.next();
                    long jB = c0Var.f58052a.b(dVar2.f58058a);
                    Long l9 = c0Var.f58056e;
                    if (jLongValue - (l9 != null ? l9.longValue() : 0L) >= jB || !c0Var.f58052a.d()) {
                        it.remove();
                        try {
                            int i12 = Result.f71687b;
                            c0Var.f58052a.destroy();
                            Unit unit = Unit.f71706a;
                        } catch (Throwable th2) {
                            int i13 = Result.f71687b;
                            ResultKt.a(th2);
                        }
                    } else if (!(c0Var.f58052a instanceof ex.b) || dVar2.f58058a.f49731q) {
                        if (Intrinsics.b(c0Var.f58053b, strZ) && c0Var.f58057f < dVar2.f58058a.f49721e) {
                            it.remove();
                            c0Var.f58057f++;
                            break;
                        }
                    }
                }
                c0Var = null;
            } else {
                c0Var = null;
            }
            return c0Var;
        } finally {
            dVar.g(null);
        }
    }
}
