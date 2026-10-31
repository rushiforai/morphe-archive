package g0;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class t extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public v2.m f56695t;

    /* renamed from: u, reason: collision with root package name */
    public int f56696u;

    /* renamed from: v, reason: collision with root package name */
    public int f56697v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56698w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f56699x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56700y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56701z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(Ref.BooleanRef booleanRef, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Continuation continuation) {
        super(2, continuation);
        this.f56699x = booleanRef;
        this.f56700y = objectRef;
        this.f56701z = objectRef2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        t tVar = new t(this.f56699x, this.f56700y, this.f56701z, continuation);
        tVar.f56698w = obj;
        return tVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((t) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x009f, code lost:
    
        r2 = 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:12:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00e3 A[EDGE_INSN: B:69:0x00e3->B:45:0x00e3 BREAK  A[LOOP:0: B:40:0x00d0->B:44:0x00e0], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0070 A[SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00bf -> B:39:0x00c4). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        v2.b bVar;
        int i5;
        Object objF;
        v2.b bVar2;
        v2.m mVar;
        int size;
        int i11;
        int size2;
        int i12;
        Object objF2;
        Object obj2;
        Object obj3;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = this.f56697v;
        v2.m mVar2 = null;
        int i14 = 2;
        int i15 = 1;
        if (i13 == 0) {
            ResultKt.b(obj);
            bVar = (v2.b) this.f56698w;
            i5 = 0;
            if (i5 != 0) {
            }
        } else {
            if (i13 == 1) {
                i5 = this.f56696u;
                v2.b bVar3 = (v2.b) this.f56698w;
                ResultKt.b(obj);
                objF = obj;
                bVar2 = bVar3;
                mVar = (v2.m) objF;
                List list = mVar.f91975a;
                size = list.size();
                i11 = 0;
                while (true) {
                    if (i11 >= size) {
                    }
                    i11++;
                }
                List list2 = mVar.f91975a;
                size2 = list2.size();
                while (i12 < size2) {
                }
                if (mVar.f91977c != i14) {
                }
                v2.n nVar = v2.n.f91982c;
                this.f56698w = bVar2;
                this.f56695t = mVar;
                this.f56696u = i5;
                this.f56697v = i14;
                v2.j0 j0Var = (v2.j0) bVar2;
                objF2 = j0Var.f(nVar, this);
                if (objF2 != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = this.f56696u;
            v2.m mVar3 = this.f56695t;
            v2.b bVar4 = (v2.b) this.f56698w;
            ResultKt.b(obj);
            int i16 = 1;
            objF2 = obj;
            List list3 = ((v2.m) objF2).f91975a;
            int size3 = list3.size();
            int i17 = 0;
            while (true) {
                if (i17 >= size3) {
                    break;
                }
                if (((v2.t) list3.get(i17)).l()) {
                    i5 = i16;
                    break;
                }
                i17++;
            }
            Ref.ObjectRef objectRef = this.f56700y;
            boolean zD = x.d(mVar3, ((v2.t) objectRef.f71863a).f91990a);
            List list4 = mVar3.f91975a;
            Ref.ObjectRef objectRef2 = this.f56701z;
            if (!zD) {
                int size4 = list4.size();
                int i18 = 0;
                while (true) {
                    if (i18 >= size4) {
                        obj3 = mVar2;
                        break;
                    }
                    obj3 = list4.get(i18);
                    if (((v2.t) obj3).f91993d) {
                        break;
                    }
                    i18++;
                }
                v2.t tVar = (v2.t) obj3;
                if (tVar == null) {
                    i5 = i16;
                    i15 = i5;
                    bVar = bVar4;
                    if (i5 != 0) {
                        return Unit.f71706a;
                    }
                    v2.n nVar2 = v2.n.f91981b;
                    this.f56698w = bVar;
                    this.f56695t = mVar2;
                    this.f56696u = i5;
                    this.f56697v = i15;
                    v2.j0 j0Var2 = (v2.j0) bVar;
                    objF = j0Var2.f(nVar2, this);
                    bVar2 = j0Var2;
                    if (objF != coroutineSingletons) {
                        mVar = (v2.m) objF;
                        List list5 = mVar.f91975a;
                        size = list5.size();
                        i11 = 0;
                        while (true) {
                            if (i11 >= size) {
                                i5 = i15;
                                break;
                            }
                            if (!v2.g0.d((v2.t) list5.get(i11))) {
                                break;
                            }
                            i11++;
                        }
                        List list22 = mVar.f91975a;
                        size2 = list22.size();
                        for (i12 = 0; i12 < size2; i12++) {
                            v2.t tVar2 = (v2.t) list22.get(i12);
                            if (tVar2.l()) {
                                break;
                            }
                            v2.j0 j0Var3 = (v2.j0) bVar2;
                            if (v2.g0.i(tVar2, j0Var3.f91952f.f91974j, j0Var3.j())) {
                                break;
                            }
                        }
                        if (mVar.f91977c != i14) {
                            i16 = 1;
                            this.f56699x.f71859a = true;
                            i5 = 1;
                        } else {
                            i16 = 1;
                        }
                        v2.n nVar3 = v2.n.f91982c;
                        this.f56698w = bVar2;
                        this.f56695t = mVar;
                        this.f56696u = i5;
                        this.f56697v = i14;
                        v2.j0 j0Var4 = (v2.j0) bVar2;
                        objF2 = j0Var4.f(nVar3, this);
                        if (objF2 != coroutineSingletons) {
                            bVar4 = j0Var4;
                            mVar3 = mVar;
                            List list32 = ((v2.m) objF2).f91975a;
                            int size32 = list32.size();
                            int i172 = 0;
                            while (true) {
                                if (i172 >= size32) {
                                }
                                i172++;
                            }
                            Ref.ObjectRef objectRef3 = this.f56700y;
                            boolean zD2 = x.d(mVar3, ((v2.t) objectRef3.f71863a).f91990a);
                            List list42 = mVar3.f91975a;
                            Ref.ObjectRef objectRef22 = this.f56701z;
                            if (!zD2) {
                                int size5 = list42.size();
                                int i19 = 0;
                                while (true) {
                                    if (i19 >= size5) {
                                        obj2 = null;
                                        break;
                                    }
                                    obj2 = list42.get(i19);
                                    if (v2.g0.g(((v2.t) obj2).f91990a, ((v2.t) objectRef3.f71863a).f91990a)) {
                                        break;
                                    }
                                    i19++;
                                }
                                objectRef22.f71863a = obj2;
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                objectRef3.f71863a = tVar;
                objectRef22.f71863a = tVar;
            }
            i15 = i16;
            bVar = bVar4;
            mVar2 = null;
            i14 = 2;
            if (i5 != 0) {
            }
        }
    }
}
