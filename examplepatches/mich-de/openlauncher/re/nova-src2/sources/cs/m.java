package cs;

import androidx.fragment.app.m0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w70.n f47829a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f47830b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ m0 f47831c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f47832d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f47833e;

    public m(w70.n nVar, p pVar, m0 m0Var, String str, String str2) {
        this.f47829a = nVar;
        this.f47830b = pVar;
        this.f47831c = m0Var;
        this.f47832d = str;
        this.f47833e = str2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0092, code lost:
    
        if (r2.emit(r9, r0) == r1) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        l lVar;
        w70.n nVar;
        Object sVar;
        w70.n nVar2;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i5 = lVar.f47826u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f47826u = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuation);
            }
        }
        Object objB = lVar.f47825t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f47826u;
        if (i11 == 0) {
            ResultKt.b(objB);
            e eVar = (e) obj;
            boolean zB = Intrinsics.b(eVar, b.f47804a);
            nVar = this.f47829a;
            if (zB) {
                lVar.f47827v = nVar;
                lVar.f47826u = 1;
                int i12 = p.f47847d;
                objB = this.f47830b.b(this.f47831c, this.f47832d, this.f47833e, lVar);
                if (objB != coroutineSingletons) {
                    nVar2 = nVar;
                }
                return coroutineSingletons;
            }
            if (Intrinsics.b(eVar, c.f47805a)) {
                sVar = null;
            } else if (eVar instanceof d) {
                sVar = new t(((d) eVar).f47806a);
            } else {
                if (!(eVar instanceof a)) {
                    throw new NoWhenBranchMatchedException();
                }
                sVar = new s(((a) eVar).f47803a);
            }
            if (sVar != null) {
                lVar.f47827v = null;
                lVar.f47826u = 2;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return Unit.f71706a;
        }
        nVar2 = lVar.f47827v;
        ResultKt.b(objB);
        sVar = (u) objB;
        nVar = nVar2;
        if (sVar != null) {
        }
        return Unit.f71706a;
    }
}
