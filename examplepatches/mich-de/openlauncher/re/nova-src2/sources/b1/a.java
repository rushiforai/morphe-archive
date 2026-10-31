package b1;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import b3.o;
import e1.b0;
import e1.w0;
import g0.t2;
import g2.e0;
import g2.z;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.SequenceScope;
import p0.y;
import p1.s2;
import r1.e;
import t0.g1;
import t70.n1;
import t70.q;
import t70.x1;
import v2.g0;
import v2.j0;
import v2.m;
import v2.n;
import v2.t;
import y70.j;
import y70.k;

/* loaded from: classes2.dex */
public final class a extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16514t;

    /* renamed from: u, reason: collision with root package name */
    public int f16515u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f16516v;

    /* renamed from: w, reason: collision with root package name */
    public Object f16517w;

    /* renamed from: x, reason: collision with root package name */
    public Object f16518x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Object f16519y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(w0 w0Var, c00.d dVar, g1 g1Var, Continuation continuation) {
        super(2, continuation);
        this.f16514t = 1;
        this.f16517w = w0Var;
        this.f16518x = dVar;
        this.f16519y = g1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16514t) {
            case 0:
                a aVar = new a((c) this.f16519y, continuation, 0);
                aVar.f16516v = obj;
                return aVar;
            case 1:
                a aVar2 = new a((w0) this.f16517w, (c00.d) this.f16518x, (g1) this.f16519y, continuation);
                aVar2.f16516v = obj;
                return aVar2;
            case 2:
                a aVar3 = new a((y) this.f16519y, continuation, 2);
                aVar3.f16516v = obj;
                return aVar3;
            default:
                a aVar4 = new a((x1) this.f16519y, continuation, 3);
                aVar4.f16516v = obj;
                return aVar4;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16514t) {
            case 0:
                return ((a) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                return ((a) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 2:
                return ((a) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((a) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:280:0x039b, code lost:
    
        continue;
     */
    /* JADX WARN: Path cross not found for [B:107:0x0234, B:114:0x026c], limit reached: 287 */
    /* JADX WARN: Path cross not found for [B:109:0x024b, B:114:0x026c], limit reached: 287 */
    /* JADX WARN: Path cross not found for [B:117:0x0271, B:120:0x0277], limit reached: 287 */
    /* JADX WARN: Path cross not found for [B:143:0x02df, B:138:0x02c3], limit reached: 287 */
    /* JADX WARN: Removed duplicated region for block: B:126:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02c3  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02ff  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0303  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x044f  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x0473  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x0476  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x011c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:252:0x046e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:258:0x02bd A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:304:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:305:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01b2  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:122:0x0288 -> B:124:0x028c). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:228:0x043e -> B:92:0x01de). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0077 -> B:25:0x008b). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x00fb -> B:44:0x00fe). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        v2.b bVar;
        Object objB;
        t tVar;
        boolean z11;
        n nVar;
        Object objF;
        v2.b bVar2;
        int size;
        int i5;
        Object obj2;
        t tVar2;
        t tVar3;
        Object objF2;
        v2.b bVar3;
        int size2;
        int i11;
        Object obj3;
        t tVar4;
        v2.b bVar4;
        Object objA;
        Object objB2;
        v2.b bVar5;
        t tVar5;
        j jVarC;
        SequenceScope sequenceScope;
        k kVarG;
        int i12 = this.f16514t;
        t tVar6 = null;
        Object obj4 = this.f16519y;
        int i13 = 2;
        switch (i12) {
            case 0:
                c cVar = (c) obj4;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i14 = this.f16515u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    bVar = (v2.b) this.f16516v;
                    n nVar2 = n.f91980a;
                    this.f16516v = bVar;
                    this.f16515u = 1;
                    objB = t2.b(bVar, true, nVar2, this);
                    if (objB == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else if (i14 == 1) {
                    bVar = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    objB = obj;
                } else if (i14 == 2) {
                    n nVar3 = (n) this.f16518x;
                    tVar = (t) this.f16517w;
                    v2.b bVar6 = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    nVar = nVar3;
                    objF = obj;
                    bVar2 = bVar6;
                    m mVar = (m) objF;
                    List list = mVar.f91975a;
                    size = list.size();
                    i5 = 0;
                    while (true) {
                        if (i5 >= size) {
                            obj2 = list.get(i5);
                            t tVar7 = (t) obj2;
                            if (tVar7.l() || !g0.g(tVar7.f91990a, tVar.f91990a) || !tVar7.f91993d) {
                                i5++;
                            }
                        } else {
                            obj2 = null;
                        }
                    }
                    tVar2 = (t) obj2;
                    if (tVar2 != null) {
                        j0 j0Var = (j0) bVar2;
                        if (tVar2.f91991b - tVar.f91991b < j0Var.f91952f.E().b() && mVar.f91977c != 2) {
                            n nVar4 = nVar;
                            if (h2.b.c(h2.b.f(tVar2.f91992c, tVar.f91992c)) <= j0Var.f91952f.E().c()) {
                                nVar = nVar4;
                                bVar = bVar2;
                                i13 = 2;
                                this.f16516v = bVar;
                                this.f16517w = tVar;
                                this.f16518x = nVar;
                                this.f16515u = i13;
                                j0 j0Var2 = (j0) bVar;
                                objF = j0Var2.f(nVar, this);
                                bVar2 = j0Var2;
                                if (objF == coroutineSingletons) {
                                    return coroutineSingletons;
                                }
                                m mVar2 = (m) objF;
                                List list2 = mVar2.f91975a;
                                size = list2.size();
                                i5 = 0;
                                while (true) {
                                    if (i5 >= size) {
                                    }
                                    i5++;
                                }
                                tVar2 = (t) obj2;
                                if (tVar2 != null) {
                                }
                            }
                        }
                        if (tVar2 != null) {
                            return Unit.f71706a;
                        }
                        if (!cVar.f16523b) {
                            g2.n nVar5 = g2.n.f56884m;
                            Modifier$Node node = cVar.getNode();
                            e eVar = null;
                            while (true) {
                                if (node == null) {
                                    if (!cVar.getNode().getIsAttached()) {
                                        y2.a.b("visitChildren called on an unattached node");
                                    }
                                    e eVar2 = new e(new Modifier$Node[16]);
                                    Modifier$Node child = cVar.getNode().getChild();
                                    if (child == null) {
                                        o.a(eVar2, cVar.getNode());
                                    } else {
                                        eVar2.b(child);
                                    }
                                    while (true) {
                                        int i15 = eVar2.f85079c;
                                        if (i15 != 0) {
                                            Modifier$Node modifier$NodeB = (Modifier$Node) eVar2.k(i15 - 1);
                                            if ((modifier$NodeB.getAggregateChildKindSet() & 1024) == 0) {
                                                o.a(eVar2, modifier$NodeB);
                                            } else {
                                                while (true) {
                                                    if (modifier$NodeB == null) {
                                                        break;
                                                    }
                                                    if ((modifier$NodeB.getKindSet() & 1024) != 0) {
                                                        e eVar3 = null;
                                                        while (modifier$NodeB != null) {
                                                            if (modifier$NodeB instanceof z) {
                                                                z zVar = (z) modifier$NodeB;
                                                                if (zVar.D().f56886a) {
                                                                    zVar.H(7);
                                                                } else {
                                                                    e0.e(zVar, 7, nVar5);
                                                                }
                                                            } else if ((modifier$NodeB.getKindSet() & 1024) == 0 || !(modifier$NodeB instanceof DelegatingNode)) {
                                                                modifier$NodeB = o.b(eVar3);
                                                            } else {
                                                                int i16 = 0;
                                                                for (Modifier$Node delegate = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate != null; delegate = delegate.getChild()) {
                                                                    if ((delegate.getKindSet() & 1024) != 0) {
                                                                        i16++;
                                                                        if (i16 == 1) {
                                                                            modifier$NodeB = delegate;
                                                                        } else {
                                                                            if (eVar3 == null) {
                                                                                eVar3 = new e(new Modifier$Node[16]);
                                                                            }
                                                                            if (modifier$NodeB != null) {
                                                                                eVar3.b(modifier$NodeB);
                                                                                modifier$NodeB = null;
                                                                            }
                                                                            eVar3.b(delegate);
                                                                        }
                                                                    }
                                                                }
                                                                if (i16 != 1) {
                                                                    modifier$NodeB = o.b(eVar3);
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        modifier$NodeB = modifier$NodeB.getChild();
                                                    }
                                                }
                                            }
                                        }
                                    }
                                } else if (node instanceof z) {
                                    z zVar2 = (z) node;
                                    if (zVar2.D().f56886a) {
                                        zVar2.H(7);
                                    } else {
                                        e0.e(zVar2, 7, nVar5);
                                    }
                                } else {
                                    if ((node.getKindSet() & 1024) != 0 && (node instanceof DelegatingNode)) {
                                        int i17 = 0;
                                        for (Modifier$Node delegate2 = ((DelegatingNode) node).getDelegate(); delegate2 != null; delegate2 = delegate2.getChild()) {
                                            if ((delegate2.getKindSet() & 1024) != 0) {
                                                i17++;
                                                if (i17 == 1) {
                                                    node = delegate2;
                                                } else {
                                                    if (eVar == null) {
                                                        eVar = new e(new Modifier$Node[16]);
                                                    }
                                                    if (node != null) {
                                                        eVar.b(node);
                                                        node = null;
                                                    }
                                                    eVar.b(delegate2);
                                                }
                                            }
                                        }
                                        if (i17 == 1) {
                                        }
                                    }
                                    node = o.b(eVar);
                                }
                            }
                        }
                        cVar.f16522a.invoke();
                        tVar2.a();
                        tVar3 = tVar;
                        v2.b bVar7 = bVar2;
                        n nVar6 = n.f91980a;
                        this.f16516v = bVar7;
                        this.f16517w = tVar3;
                        tVar6 = null;
                        this.f16518x = null;
                        this.f16515u = 3;
                        j0 j0Var3 = (j0) bVar7;
                        objF2 = j0Var3.f(nVar6, this);
                        bVar3 = j0Var3;
                        if (objF2 == coroutineSingletons) {
                        }
                        bVar7 = bVar3;
                        List list3 = ((m) objF2).f91975a;
                        size2 = list3.size();
                        i11 = 0;
                        while (true) {
                            if (i11 < size2) {
                            }
                            i11++;
                        }
                        tVar4 = (t) obj3;
                        if (tVar4 == null) {
                        }
                    }
                    tVar2 = null;
                    if (tVar2 != null) {
                    }
                } else {
                    if (i14 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    tVar3 = (t) this.f16517w;
                    v2.b bVar8 = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    objF2 = obj;
                    bVar3 = bVar8;
                    bVar7 = bVar3;
                    List list32 = ((m) objF2).f91975a;
                    size2 = list32.size();
                    i11 = 0;
                    while (true) {
                        if (i11 < size2) {
                            obj3 = list32.get(i11);
                            t tVar8 = (t) obj3;
                            if (tVar8.l() || !g0.g(tVar8.f91990a, tVar3.f91990a) || !tVar8.f91993d) {
                                i11++;
                            }
                        } else {
                            obj3 = tVar6;
                        }
                    }
                    tVar4 = (t) obj3;
                    if (tVar4 == null) {
                        return Unit.f71706a;
                    }
                    tVar4.a();
                    n nVar62 = n.f91980a;
                    this.f16516v = bVar7;
                    this.f16517w = tVar3;
                    tVar6 = null;
                    this.f16518x = null;
                    this.f16515u = 3;
                    j0 j0Var32 = (j0) bVar7;
                    objF2 = j0Var32.f(nVar62, this);
                    bVar3 = j0Var32;
                    if (objF2 == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    bVar7 = bVar3;
                    List list322 = ((m) objF2).f91975a;
                    size2 = list322.size();
                    i11 = 0;
                    while (true) {
                        if (i11 < size2) {
                        }
                        i11++;
                    }
                    tVar4 = (t) obj3;
                    if (tVar4 == null) {
                    }
                }
                tVar = (t) objB;
                int i18 = tVar.f91998i;
                long j11 = tVar.f91992c;
                if (i18 != 3 && i18 != 4) {
                    return Unit.f71706a;
                }
                int i19 = (int) (j11 >> 32);
                if (Float.intBitsToFloat(i19) >= 0.0f) {
                    j0 j0Var4 = (j0) bVar;
                    if (Float.intBitsToFloat(i19) < ((int) (j0Var4.f91952f.f91974j >> 32))) {
                        int i21 = (int) (j11 & 4294967295L);
                        if (Float.intBitsToFloat(i21) >= 0.0f && Float.intBitsToFloat(i21) < ((int) (4294967295L & j0Var4.f91952f.f91974j))) {
                            z11 = true;
                        }
                        nVar = (!cVar.f16523b || z11) ? n.f91980a : n.f91981b;
                        this.f16516v = bVar;
                        this.f16517w = tVar;
                        this.f16518x = nVar;
                        this.f16515u = i13;
                        j0 j0Var22 = (j0) bVar;
                        objF = j0Var22.f(nVar, this);
                        bVar2 = j0Var22;
                        if (objF == coroutineSingletons) {
                        }
                        m mVar22 = (m) objF;
                        List list22 = mVar22.f91975a;
                        size = list22.size();
                        i5 = 0;
                        while (true) {
                            if (i5 >= size) {
                            }
                            i5++;
                        }
                        tVar2 = (t) obj2;
                        if (tVar2 != null) {
                        }
                        tVar2 = null;
                        if (tVar2 != null) {
                        }
                    }
                }
                z11 = false;
                if (cVar.f16523b) {
                }
                this.f16516v = bVar;
                this.f16517w = tVar;
                this.f16518x = nVar;
                this.f16515u = i13;
                j0 j0Var222 = (j0) bVar;
                objF = j0Var222.f(nVar, this);
                bVar2 = j0Var222;
                if (objF == coroutineSingletons) {
                }
                m mVar222 = (m) objF;
                List list222 = mVar222.f91975a;
                size = list222.size();
                i5 = 0;
                while (true) {
                    if (i5 >= size) {
                    }
                    i5++;
                }
                tVar2 = (t) obj2;
                if (tVar2 != null) {
                }
                tVar2 = null;
                if (tVar2 != null) {
                }
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i22 = this.f16515u;
                if (i22 == 0) {
                    ResultKt.b(obj);
                    bVar4 = (v2.b) this.f16516v;
                    this.f16516v = bVar4;
                    this.f16515u = 1;
                    objA = b0.a(bVar4, this);
                    if (objA == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i22 != 1) {
                        if (i22 != 2 && i22 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    bVar4 = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    objA = obj;
                }
                m mVar3 = (m) objA;
                if (b0.d(mVar3) && (mVar3.f91978d & 33) != 0) {
                    List list4 = mVar3.f91975a;
                    int size3 = list4.size();
                    for (int i23 = 0; i23 < size3; i23++) {
                        if (((t) list4.get(i23)).l()) {
                            if (!b0.d(mVar3)) {
                            }
                        }
                    }
                    w0 w0Var = (w0) this.f16517w;
                    c00.d dVar = (c00.d) this.f16518x;
                    this.f16516v = null;
                    this.f16515u = 2;
                    if (b0.b(bVar4, w0Var, dVar, mVar3, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else if (!b0.d(mVar3)) {
                    this.f16516v = null;
                    this.f16515u = 3;
                    if (b0.c(bVar4, (g1) obj4, mVar3, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                }
                return Unit.f71706a;
            case 2:
                y yVar = (y) obj4;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i24 = this.f16515u;
                if (i24 == 0) {
                    ResultKt.b(obj);
                    v2.b bVar9 = (v2.b) this.f16516v;
                    n nVar7 = n.f91980a;
                    this.f16516v = bVar9;
                    this.f16515u = 1;
                    objB2 = t2.b(bVar9, false, nVar7, this);
                    bVar5 = bVar9;
                    if (objB2 == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else if (i24 == 1) {
                    v2.b bVar10 = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    objB2 = obj;
                    bVar5 = bVar10;
                } else {
                    if (i24 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    t tVar9 = (t) this.f16518x;
                    t tVar10 = (t) this.f16517w;
                    v2.b bVar11 = (v2.b) this.f16516v;
                    ResultKt.b(obj);
                    tVar6 = tVar9;
                    bVar5 = bVar11;
                    tVar5 = tVar10;
                    Object objF3 = obj;
                    m mVar4 = (m) objF3;
                    List list5 = mVar4.f91975a;
                    int size4 = list5.size();
                    int i25 = 0;
                    while (true) {
                        if (i25 >= size4) {
                            tVar6 = (t) mVar4.f91975a.get(0);
                        } else if (g0.c((t) list5.get(i25))) {
                            i25++;
                        }
                    }
                    if (tVar6 == null) {
                        n nVar8 = n.f91980a;
                        this.f16516v = bVar5;
                        this.f16517w = tVar5;
                        this.f16518x = tVar6;
                        this.f16515u = 2;
                        j0 j0Var5 = (j0) bVar5;
                        objF3 = j0Var5.f(nVar8, this);
                        bVar5 = j0Var5;
                        if (objF3 == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                        m mVar42 = (m) objF3;
                        List list52 = mVar42.f91975a;
                        int size42 = list52.size();
                        int i252 = 0;
                        while (true) {
                            if (i252 >= size42) {
                            }
                            i252++;
                        }
                        if (tVar6 == null) {
                            ((s2) yVar.f81229c).setValue(new h2.b(h2.b.f(tVar6.f91992c, tVar5.f91992c)));
                            return Unit.f71706a;
                        }
                    }
                }
                tVar5 = (t) objB2;
                ((s2) yVar.f81229c).setValue(new h2.b(0L));
                if (tVar6 == null) {
                }
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i26 = this.f16515u;
                if (i26 == 0) {
                    ResultKt.b(obj);
                    SequenceScope sequenceScope2 = (SequenceScope) this.f16516v;
                    Object obj5 = x1.f88882a.get((x1) obj4);
                    if (obj5 instanceof q) {
                        x1 x1Var = ((q) obj5).f88852e;
                        this.f16515u = 1;
                        sequenceScope2.c(x1Var, this);
                        return coroutineSingletons4;
                    }
                    if ((obj5 instanceof n1) && (jVarC = ((n1) obj5).c()) != null) {
                        Object obj6 = k.f96807a.get(jVarC);
                        Intrinsics.e(obj6, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
                        k kVar = (k) obj6;
                        sequenceScope = sequenceScope2;
                        kVarG = kVar;
                        if (!kVarG.equals(jVarC)) {
                        }
                    }
                } else if (i26 == 1) {
                    ResultKt.b(obj);
                } else {
                    if (i26 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    kVarG = (q) this.f16518x;
                    jVarC = (j) this.f16517w;
                    sequenceScope = (SequenceScope) this.f16516v;
                    ResultKt.b(obj);
                    kVarG = kVarG.g();
                    if (!kVarG.equals(jVarC)) {
                        if (kVarG instanceof q) {
                            q qVar = (q) kVarG;
                            x1 x1Var2 = qVar.f88852e;
                            this.f16516v = sequenceScope;
                            this.f16517w = jVarC;
                            this.f16518x = qVar;
                            this.f16515u = 2;
                            sequenceScope.c(x1Var2, this);
                            CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                            return coroutineSingletons4;
                        }
                        kVarG = kVarG.g();
                        if (!kVarG.equals(jVarC)) {
                        }
                    }
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f16514t = i5;
        this.f16519y = obj;
    }
}
