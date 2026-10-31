package p1;

import b.u4;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.sequences.SequenceScope;

/* loaded from: classes2.dex */
public final class l extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f81487t;

    /* renamed from: u, reason: collision with root package name */
    public int f81488u;

    /* renamed from: v, reason: collision with root package name */
    public int f81489v;

    /* renamed from: w, reason: collision with root package name */
    public int f81490w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f81491x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ m f81492y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, Continuation continuation) {
        super(2, continuation);
        this.f81492y = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        l lVar = new l(this.f81492y, continuation);
        lVar.f81491x = obj;
        return lVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        int i5;
        int i11;
        int i12;
        String strH;
        int i13;
        int i14;
        String str;
        m mVar = this.f81492y;
        z.u0 u0Var = mVar.f81502a;
        z.k kVar = mVar.f81504c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = this.f81490w;
        if (i15 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f81491x;
            i5 = 0;
            i11 = 0;
            i12 = 0;
        } else {
            if (i15 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = this.f81489v;
            i11 = this.f81488u;
            i12 = this.f81487t;
            sequenceScope = (SequenceScope) this.f81491x;
            ResultKt.b(obj);
        }
        if (i12 >= Math.min(mVar.f81505d, kVar.f97784b)) {
            return Unit.f71706a;
        }
        int i16 = i12 + 1;
        int iA = kVar.a(i12);
        switch (iA) {
            case 0:
                strH = "up";
                break;
            case 1:
                String strH2 = u4.h(u0Var.b(i11), "down ");
                i11++;
                strH = strH2;
                break;
            case 2:
                strH = "remove " + kVar.a(i16) + ' ' + kVar.a(i12 + 2);
                i16 = i12 + 3;
                break;
            case 3:
                strH = "move " + kVar.a(i16) + ' ' + kVar.a(i12 + 2) + ' ' + kVar.a(i12 + 3);
                i16 = i12 + 4;
                break;
            case 4:
                strH = "clear";
                break;
            case 5:
                i13 = i12 + 2;
                int iA2 = kVar.a(i16);
                i14 = i11 + 1;
                str = "insertBottomUp " + iA2 + ' ' + u0Var.b(i11);
                int i17 = i13;
                strH = str;
                i16 = i17;
                i11 = i14;
                break;
            case 6:
                i13 = i12 + 2;
                int iA3 = kVar.a(i16);
                i14 = i11 + 1;
                str = "insertTopDown " + iA3 + ' ' + u0Var.b(i11);
                int i172 = i13;
                strH = str;
                i16 = i172;
                i11 = i14;
                break;
            case 7:
                int i18 = i11 + 1;
                Object objB = u0Var.b(i11);
                Intrinsics.e(objB, "null cannot be cast to non-null type @[ExtensionFunctionType] kotlin.Function2<kotlin.Any?, kotlin.Any?, kotlin.Unit>");
                TypeIntrinsics.e(2, objB);
                i11 += 2;
                strH = "apply " + ((Function2) objB) + ' ' + u0Var.b(i18);
                break;
            case 8:
                strH = "reuse " + mVar.f81503b.b(i5);
                i5++;
                break;
            default:
                strH = b.c0.h(iA, "unknown op: ");
                break;
        }
        this.f81491x = sequenceScope;
        this.f81487t = i16;
        this.f81488u = i11;
        this.f81489v = i5;
        this.f81490w = 1;
        sequenceScope.c(i12 + ": " + strH, this);
        return coroutineSingletons;
    }
}
