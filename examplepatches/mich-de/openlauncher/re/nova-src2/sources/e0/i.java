package e0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import l1.i2;

/* loaded from: classes2.dex */
public final class i extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f50016t;

    /* renamed from: u, reason: collision with root package name */
    public int f50017u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f50018v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Object f50019w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f50016t = i5;
        this.f50019w = obj;
    }

    public static final void e(v2.b bVar, p1.e1 e1Var, long j11) {
        float fD0 = kotlin.ranges.a.d0(Float.intBitsToFloat((int) (j11 >> 32)), 0.0f, (int) (r8.f91952f.f91974j >> 32));
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 & 4294967295L));
        v2.l0 l0Var = ((v2.j0) bVar).f91952f;
        ((Function2) e1Var.getValue()).invoke(Float.valueOf(fD0 / ((int) (l0Var.f91974j >> 32))), Float.valueOf(1.0f - (kotlin.ranges.a.d0(fIntBitsToFloat, 0.0f, (int) (l0Var.f91974j & 4294967295L)) / ((int) (l0Var.f91974j & 4294967295L)))));
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f50016t) {
            case 0:
                i iVar = new i((k) this.f50019w, continuation, 0);
                iVar.f50018v = obj;
                return iVar;
            case 1:
                i iVar2 = new i((Function0) this.f50019w, continuation, 1);
                iVar2.f50018v = obj;
                return iVar2;
            case 2:
                i iVar3 = new i((p1.e1) this.f50019w, continuation, 2);
                iVar3.f50018v = obj;
                return iVar3;
            default:
                i iVar4 = new i((i2) this.f50019w, continuation, 3);
                iVar4.f50018v = obj;
                return iVar4;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        v2.b bVar = (v2.b) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f50016t) {
        }
        return ((i) create(bVar, continuation)).invokeSuspend(Unit.f71706a);
    }

    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX WARN: Removed duplicated region for block: B:101:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x016c  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0167 A[SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:66:0x0120 -> B:68:0x0123). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            Method dump skipped, instructions count: 404
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: e0.i.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
