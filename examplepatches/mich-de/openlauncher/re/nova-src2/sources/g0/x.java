package g0;

import androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException;
import c3.n3;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public abstract class x {

    /* renamed from: a, reason: collision with root package name */
    public static final float f56754a = ((float) 0.125d) / 18;

    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c5, code lost:
    
        if (v2.g0.k(r11) != false) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0065 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x008f A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0066 -> B:22:0x006b). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(v2.b bVar, long j11, BaseContinuationImpl baseContinuationImpl) {
        r rVar;
        Ref.LongRef longRef;
        v2.b bVar2;
        Object objF;
        Object obj;
        Object obj2;
        if (baseContinuationImpl instanceof r) {
            rVar = (r) baseContinuationImpl;
            int i5 = rVar.f56675w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f56675w = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(baseContinuationImpl);
            }
        }
        Object obj3 = rVar.f56674v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f56675w;
        if (i11 == 0) {
            ResultKt.b(obj3);
            if (!d(((v2.j0) bVar).f91952f.f91969e, j11)) {
                longRef = new Ref.LongRef();
                longRef.f71862a = j11;
                bVar2 = bVar;
                rVar.f56672t = bVar2;
                rVar.f56673u = longRef;
                rVar.f56675w = 1;
                objF = ((v2.j0) bVar2).f(v2.n.f91981b, rVar);
                if (objF != coroutineSingletons) {
                }
            }
            return null;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Ref.LongRef longRef2 = rVar.f56673u;
        v2.b bVar3 = rVar.f56672t;
        ResultKt.b(obj3);
        Ref.LongRef longRef3 = longRef2;
        bVar2 = bVar3;
        v2.m mVar = (v2.m) obj3;
        List list = mVar.f91975a;
        int size = list.size();
        int i12 = 0;
        int i13 = 0;
        while (true) {
            if (i13 < size) {
                obj = null;
                break;
            }
            obj = list.get(i13);
            if (v2.g0.g(((v2.t) obj).f91990a, longRef3.f71862a)) {
                break;
            }
            i13++;
        }
        v2.t tVar = (v2.t) obj;
        if (tVar == null) {
            if (v2.g0.d(tVar)) {
                List list2 = mVar.f91975a;
                int size2 = list2.size();
                while (true) {
                    if (i12 >= size2) {
                        obj2 = null;
                        break;
                    }
                    obj2 = list2.get(i12);
                    if (((v2.t) obj2).f91993d) {
                        break;
                    }
                    i12++;
                }
                v2.t tVar2 = (v2.t) obj2;
                if (tVar2 != null) {
                    longRef3.f71862a = tVar2.f91990a;
                    longRef = longRef3;
                    rVar.f56672t = bVar2;
                    rVar.f56673u = longRef;
                    rVar.f56675w = 1;
                    objF = ((v2.j0) bVar2).f(v2.n.f91981b, rVar);
                    if (objF != coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    Ref.LongRef longRef4 = longRef;
                    obj3 = objF;
                    longRef3 = longRef4;
                }
            }
            v2.m mVar2 = (v2.m) obj3;
            List list3 = mVar2.f91975a;
            int size3 = list3.size();
            int i122 = 0;
            int i132 = 0;
            while (true) {
                if (i132 < size3) {
                }
                i132++;
            }
            v2.t tVar3 = (v2.t) obj;
            if (tVar3 == null) {
                tVar3 = null;
            }
        }
        if (tVar3 == null || tVar3.l()) {
            return null;
        }
        return tVar3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v3, types: [kotlin.jvm.internal.Ref$ObjectRef] */
    /* JADX WARN: Type inference failed for: r11v6 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(v2.b bVar, long j11, BaseContinuationImpl baseContinuationImpl) {
        s sVar;
        Object obj;
        v2.t tVar;
        Ref.BooleanRef booleanRef;
        if (baseContinuationImpl instanceof s) {
            sVar = (s) baseContinuationImpl;
            int i5 = sVar.f56685x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f56685x = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(baseContinuationImpl);
            }
        }
        Object obj2 = sVar.f56684w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar.f56685x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                v2.j0 j0Var = (v2.j0) bVar;
                if (!d(j0Var.f91952f.f91969e, j11)) {
                    v2.l0 l0Var = j0Var.f91952f;
                    List list = l0Var.f91969e.f91975a;
                    int size = list.size();
                    int i12 = 0;
                    while (true) {
                        if (i12 >= size) {
                            obj = null;
                            break;
                        }
                        obj = list.get(i12);
                        if (v2.g0.g(((v2.t) obj).f91990a, j11)) {
                            break;
                        }
                        i12++;
                    }
                    tVar = (v2.t) obj;
                    if (tVar != null) {
                        Ref.ObjectRef objectRef = new Ref.ObjectRef();
                        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                        objectRef2.f71863a = tVar;
                        long jB = l0Var.E().b();
                        Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
                        t tVar2 = new t(booleanRef2, objectRef2, objectRef, null);
                        sVar.f56681t = tVar;
                        sVar.f56682u = objectRef;
                        sVar.f56683v = booleanRef2;
                        sVar.f56685x = 1;
                        if (((v2.j0) bVar).k(jB, tVar2, sVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        booleanRef = booleanRef2;
                        j11 = objectRef;
                    }
                }
                return null;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            booleanRef = sVar.f56683v;
            Ref.ObjectRef objectRef3 = sVar.f56682u;
            tVar = sVar.f56681t;
            ResultKt.b(obj2);
            j11 = objectRef3;
            if (booleanRef.f71859a) {
                v2.t tVar3 = (v2.t) j11.f71863a;
                return tVar3 == null ? tVar : tVar3;
            }
            return null;
        } catch (PointerEventTimeoutCancellationException unused) {
            v2.t tVar4 = (v2.t) j11.f71863a;
            return tVar4 == null ? tVar : tVar4;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0049 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0047 -> B:18:0x004a). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(v2.b bVar, long j11, Function1 function1, BaseContinuationImpl baseContinuationImpl) {
        w wVar;
        v2.t tVar;
        if (baseContinuationImpl instanceof w) {
            wVar = (w) baseContinuationImpl;
            int i5 = wVar.f56740w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f56740w = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(baseContinuationImpl);
            }
        }
        Object objA = wVar.f56739v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f56740w;
        if (i11 == 0) {
            ResultKt.b(objA);
            wVar.f56737t = bVar;
            wVar.f56738u = function1;
            wVar.f56740w = 1;
            objA = a(bVar, j11, wVar);
            if (objA == coroutineSingletons) {
            }
            tVar = (v2.t) objA;
            if (tVar == null) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Function1 function12 = wVar.f56738u;
            v2.b bVar2 = wVar.f56737t;
            ResultKt.b(objA);
            function1 = function12;
            bVar = bVar2;
            tVar = (v2.t) objA;
            if (tVar == null) {
                if (v2.g0.d(tVar)) {
                    return Boolean.TRUE;
                }
                function1.invoke(tVar);
                j11 = tVar.f91990a;
                wVar.f56737t = bVar;
                wVar.f56738u = function1;
                wVar.f56740w = 1;
                objA = a(bVar, j11, wVar);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                tVar = (v2.t) objA;
                if (tVar == null) {
                    return Boolean.FALSE;
                }
            }
        }
    }

    public static final boolean d(v2.m mVar, long j11) {
        Object obj;
        List list = mVar.f91975a;
        int size = list.size();
        boolean z11 = false;
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                obj = null;
                break;
            }
            obj = list.get(i5);
            if (v2.g0.g(((v2.t) obj).f91990a, j11)) {
                break;
            }
            i5++;
        }
        v2.t tVar = (v2.t) obj;
        if (tVar != null && tVar.f91993d) {
            z11 = true;
        }
        return true ^ z11;
    }

    public static final float e(n3 n3Var, int i5) {
        return i5 == 2 ? n3Var.f() * f56754a : n3Var.f();
    }
}
