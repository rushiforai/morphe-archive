package g0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class j2 extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public long f56598t;

    /* renamed from: u, reason: collision with root package name */
    public int f56599u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56600v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ v2.t f56601w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j2(v2.t tVar, Continuation continuation) {
        super(2, continuation);
        this.f56601w = tVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        j2 j2Var = new j2(this.f56601w, continuation);
        j2Var.f56600v = obj;
        return j2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((j2) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0044 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:14:0x004d A[RETURN] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x0042 -> B:12:0x0045). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            r7 = this;
            kotlin.coroutines.intrinsics.CoroutineSingletons r0 = kotlin.coroutines.intrinsics.CoroutineSingletons.f71806a
            int r1 = r7.f56599u
            r2 = 1
            if (r1 == 0) goto L1b
            if (r1 != r2) goto L13
            long r3 = r7.f56598t
            java.lang.Object r1 = r7.f56600v
            v2.b r1 = (v2.b) r1
            kotlin.ResultKt.b(r8)
            goto L45
        L13:
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r8.<init>(r0)
            throw r8
        L1b:
            kotlin.ResultKt.b(r8)
            java.lang.Object r8 = r7.f56600v
            v2.b r8 = (v2.b) r8
            v2.t r1 = r7.f56601w
            long r3 = r1.f91991b
            r1 = r8
            v2.j0 r1 = (v2.j0) r1
            v2.l0 r1 = r1.f91952f
            c3.n3 r1 = r1.E()
            r1.getClass()
            r5 = 40
            long r5 = r5 + r3
            r1 = r8
            r3 = r5
        L37:
            r7.f56600v = r1
            r7.f56598t = r3
            r7.f56599u = r2
            r8 = 3
            java.lang.Object r8 = g0.t2.c(r1, r7, r8)
            if (r8 != r0) goto L45
            return r0
        L45:
            v2.t r8 = (v2.t) r8
            long r5 = r8.f91991b
            int r5 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r5 < 0) goto L37
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: g0.j2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
