package androidx.compose.foundation.gestures;

import b2.t;
import e0.f1;
import e10.h2;
import g0.d1;
import g0.p1;
import g0.q1;
import g0.r1;
import g0.s1;
import g0.t1;
import h2.b;
import i0.i;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final h2 f13929a = new h2(8);

    /* renamed from: b, reason: collision with root package name */
    public static final q1 f13930b = new q1();

    /* renamed from: c, reason: collision with root package name */
    public static final p1 f13931c = new p1();

    /* renamed from: d, reason: collision with root package name */
    public static final r1 f13932d = new r1();

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(g0.h2 h2Var, long j11, ContinuationImpl continuationImpl) {
        s1 s1Var;
        Ref.FloatRef floatRef;
        g0.h2 h2Var2;
        if (continuationImpl instanceof s1) {
            s1Var = (s1) continuationImpl;
            int i5 = s1Var.f56690w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s1Var.f56690w = i5 - Integer.MIN_VALUE;
            } else {
                s1Var = new s1(continuationImpl);
            }
        }
        Object obj = s1Var.f56689v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s1Var.f56690w;
        if (i11 == 0) {
            ResultKt.b(obj);
            floatRef = new Ref.FloatRef();
            f1 f1Var = f1.f49976a;
            t1 t1Var = new t1(h2Var, j11, floatRef, null);
            s1Var.f56687t = h2Var;
            s1Var.f56688u = floatRef;
            s1Var.f56690w = 1;
            if (h2Var.f(f1Var, t1Var, s1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            h2Var2 = h2Var;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.FloatRef floatRef2 = s1Var.f56688u;
            g0.h2 h2Var3 = s1Var.f56687t;
            ResultKt.b(obj);
            floatRef = floatRef2;
            h2Var2 = h2Var3;
        }
        return new b(h2Var2.h(floatRef.f71860a));
    }

    public static t b(t0.s1 s1Var, d1 d1Var, boolean z11, boolean z12, i iVar) {
        return new ScrollableElement(s1Var, d1Var, z11, z12, iVar);
    }
}
