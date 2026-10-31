package t00;

import c0.l1;
import e0.a2;
import g0.m1;
import java.util.LinkedHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import p1.e1;
import p1.s2;
import t70.j0;

/* loaded from: classes4.dex */
public final class c0 extends ah.a {

    /* renamed from: g, reason: collision with root package name */
    public static final ab.c0 f88331g = new ab.c0(7, new s(3), new s10.i(16));

    /* renamed from: e, reason: collision with root package name */
    public final a2 f88332e;

    /* renamed from: f, reason: collision with root package name */
    public int f88333f;

    public c0(int i5, int i11, String str, boolean z11) {
        super(str, z11);
        this.f88332e = new a2(i5);
        this.f88333f = i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ah.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(ContinuationImpl continuationImpl) {
        b0 b0Var;
        c0 c0Var;
        c0 c0Var2;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f88329w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f88329w = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object obj = b0Var.f88327u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f88329w;
        if (i11 == 0) {
            ResultKt.b(obj);
            ((s2) ((e1) this.f12803a)).setValue(null);
            b0Var.f88326t = this;
            b0Var.f88329w = 1;
            if (m1.c(this.f88332e, b0Var) != coroutineSingletons) {
                c0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c0Var2 = b0Var.f88326t;
            ResultKt.b(obj);
            ((s2) ((e1) c0Var2.f12805c)).setValue(Boolean.FALSE);
            return Unit.f71706a;
        }
        c0Var = b0Var.f88326t;
        ResultKt.b(obj);
        a2 a2Var = c0Var.f88332e;
        int i12 = c0Var.f88333f;
        b0Var.f88326t = c0Var;
        b0Var.f88329w = 2;
        if (a2Var.f(i12, new l1(0.0f, 7, (Object) null), b0Var) != coroutineSingletons) {
            c0Var2 = c0Var;
            ((s2) ((e1) c0Var2.f12805c)).setValue(Boolean.FALSE);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    @Override // ah.a
    public final Object j(String str, Continuation continuation) {
        ((s2) ((e1) this.f12805c)).setValue(Boolean.TRUE);
        ((s2) ((e1) this.f12803a)).setValue(str);
        a2 a2Var = this.f88332e;
        this.f88333f = a2Var.h();
        Integer num = (Integer) ((LinkedHashMap) this.f12806d).get(str);
        Object objF = a2Var.f(num != null ? num.intValue() : 0, new l1(400.0f, 4, (Object) null), (ContinuationImpl) continuation);
        return objF == CoroutineSingletons.f71806a ? objF : Unit.f71706a;
    }

    public final b2.t n(j0 j0Var, String str) {
        return androidx.compose.ui.layout.b.b(b2.r.f17024a, new l10.z(new n00.u(9, this, j0Var, str), 20));
    }
}
