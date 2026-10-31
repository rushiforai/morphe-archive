package g0;

import android.os.Build;
import android.view.ViewConfiguration;
import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;

/* loaded from: classes2.dex */
public final class c1 {

    /* renamed from: a, reason: collision with root package name */
    public final h2 f56477a;

    /* renamed from: b, reason: collision with root package name */
    public final vm.c f56478b;

    /* renamed from: c, reason: collision with root package name */
    public final es.b0 f56479c;

    /* renamed from: d, reason: collision with root package name */
    public y3.c f56480d;

    /* renamed from: f, reason: collision with root package name */
    public boolean f56482f;

    /* renamed from: g, reason: collision with root package name */
    public t70.g2 f56483g;

    /* renamed from: e, reason: collision with root package name */
    public final v70.i f56481e = v70.o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);

    /* renamed from: h, reason: collision with root package name */
    public final c10.a f56484h = new c10.a();

    public c1(h2 h2Var, vm.c cVar, es.b0 b0Var, y3.c cVar2) {
        this.f56477a = h2Var;
        this.f56478b = cVar;
        this.f56479c = b0Var;
        this.f56480d = cVar2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x0114, code lost:
    
        if (r0.invoke(r1, r9) == r10) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c1 c1Var, h2 h2Var, w0 w0Var, float f11, float f12, ContinuationImpl continuationImpl) {
        x0 x0Var;
        Ref.FloatRef floatRef;
        float f13;
        h2 h2Var2;
        if (continuationImpl instanceof x0) {
            x0Var = (x0) continuationImpl;
            int i5 = x0Var.f56760y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x0Var.f56760y = i5 - Integer.MIN_VALUE;
            } else {
                x0Var = new x0(c1Var, continuationImpl);
            }
        }
        x0 x0Var2 = x0Var;
        Object obj = x0Var2.f56758w;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = x0Var2.f56760y;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            objectRefL.f71863a = w0Var;
            c1Var.g(w0Var);
            w0 w0VarF = f(c1Var.f56481e);
            if (w0VarF != null) {
                c1Var.g(w0VarF);
                objectRefL.f71863a = ((w0) objectRefL.f71863a).a(w0VarF);
            }
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            float fG = h2Var.g(h2Var.e(((w0) objectRefL.f71863a).f56741a));
            floatRef2.f71860a = fG;
            if (v0.a(fG)) {
                return Unit.f71706a;
            }
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            objectRef.f71863a = c0.f.b(30, 0.0f, 0.0f);
            y0 y0Var = new y0(floatRef2, objectRef, objectRefL, f11, c1Var, f12, h2Var, null);
            x0Var2.f56755t = h2Var;
            x0Var2.f56756u = floatRef2;
            x0Var2.f56757v = f12;
            x0Var2.f56760y = 1;
            if (c1Var.i(h2Var, y0Var, x0Var2) != obj2) {
                floatRef = floatRef2;
                f13 = f12;
                h2Var2 = h2Var;
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        f13 = x0Var2.f56757v;
        floatRef = x0Var2.f56756u;
        h2Var2 = x0Var2.f56755t;
        ResultKt.b(obj);
        c10.a aVar = c1Var.f56484h;
        long jC = p6.u.c(((fe.u1) aVar.f19148b).b(Float.MAX_VALUE), ((fe.u1) aVar.f19149c).b(Float.MAX_VALUE));
        if (y3.r.c(jC)) {
            float fD = h2Var2.d(Math.signum(floatRef.f71860a)) * Math.min(Math.abs(floatRef.f71860a) / 100, f13) * 1000;
            jC = fD == 0.0f ? 0L : h2Var2.f56560d == d1.f56494b ? p6.u.c(fD, 0.0f) : p6.u.c(0.0f, fD);
        }
        es.b0 b0Var = c1Var.f56479c;
        y3.r rVar = new y3.r(jC);
        x0Var2.f56755t = null;
        x0Var2.f56756u = null;
        x0Var2.f56760y = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(c1 c1Var, Ref.ObjectRef objectRef, Ref.FloatRef floatRef, h2 h2Var, Ref.ObjectRef objectRef2, long j11, ContinuationImpl continuationImpl) {
        z0 z0Var;
        h2 h2Var2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.FloatRef floatRef2;
        boolean z11;
        if (continuationImpl instanceof z0) {
            z0Var = (z0) continuationImpl;
            int i5 = z0Var.f56786z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z0Var.f56786z = i5 - Integer.MIN_VALUE;
            } else {
                z0Var = new z0(continuationImpl);
            }
        }
        Object objD = z0Var.f56785y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z0Var.f56786z;
        if (i11 == 0) {
            ResultKt.b(objD);
            if (j11 < 0) {
                return Boolean.FALSE;
            }
            a1 a1Var = new a1(c1Var, null);
            z0Var.f56780t = c1Var;
            z0Var.f56781u = objectRef;
            z0Var.f56782v = floatRef;
            h2Var2 = h2Var;
            z0Var.f56783w = h2Var2;
            objectRef3 = objectRef2;
            z0Var.f56784x = objectRef3;
            z0Var.f56786z = 1;
            objD = t70.p2.d(j11, a1Var, z0Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef4 = objectRef;
            floatRef2 = floatRef;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.ObjectRef objectRef5 = z0Var.f56784x;
            h2 h2Var3 = z0Var.f56783w;
            floatRef2 = z0Var.f56782v;
            objectRef4 = z0Var.f56781u;
            c1 c1Var2 = z0Var.f56780t;
            ResultKt.b(objD);
            objectRef3 = objectRef5;
            h2Var2 = h2Var3;
            c1Var = c1Var2;
        }
        w0 w0Var = (w0) objD;
        if (w0Var != null) {
            boolean z12 = ((w0) objectRef4.f71863a).f56743c;
            long j12 = w0Var.f56741a;
            objectRef4.f71863a = new w0(j12, w0Var.f56742b, z12);
            floatRef2.f71860a = h2Var2.g(h2Var2.e(j12));
            objectRef3.f71863a = c0.f.b(30, 0.0f, 0.0f);
            c1Var.g(w0Var);
            z11 = !v0.a(floatRef2.f71860a);
        } else {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v2, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
    public static w0 f(v70.i iVar) {
        w0 w0Var = null;
        q70.c cVarO = u90.b.O(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new p0((Object) new fr.b0(iVar, 3), (Continuation) (0 == true ? 1 : 0), 1)).f71969a);
        while (cVarO.hasNext()) {
            w0 w0VarA = (w0) cVarO.next();
            if (w0Var != null) {
                w0VarA = w0Var.a(w0VarA);
            }
            w0Var = w0VarA;
        }
        return w0Var;
    }

    public final float c(f2 f2Var, float f11) {
        h2 h2Var = this.f56477a;
        long jH = h2Var.h(h2Var.d(f11));
        h2 h2Var2 = f2Var.f56522a;
        return h2Var.g(h2Var.e(h2Var2.c(h2Var2.f56567k, jH, 1)));
    }

    public final void d(v2.m mVar, v2.n nVar) {
        long j11;
        if (nVar == v2.n.f91981b) {
            int i5 = mVar.f91979e;
            List list = mVar.f91975a;
            if (i5 == 6) {
                List list2 = list;
                int size = list2.size();
                for (int i11 = 0; i11 < size; i11++) {
                    if (((v2.t) list.get(i11)).l()) {
                        return;
                    }
                }
                y3.c cVar = this.f56480d;
                ViewConfiguration viewConfiguration = (ViewConfiguration) this.f56478b.f92857b;
                int i12 = Build.VERSION.SDK_INT;
                float f11 = -(i12 > 26 ? viewConfiguration.getScaledVerticalScrollFactor() : cVar.mo102toPx0680j_4(64));
                float f12 = -(i12 > 26 ? viewConfiguration.getScaledHorizontalScrollFactor() : cVar.mo102toPx0680j_4(64));
                h2.b bVar = new h2.b(0L);
                int size2 = list2.size();
                int i13 = 0;
                while (true) {
                    j11 = bVar.f59016a;
                    if (i13 >= size2) {
                        break;
                    }
                    bVar = new h2.b(h2.b.g(j11, ((v2.t) list.get(i13)).f91999j));
                    i13++;
                }
                long jFloatToRawIntBits = (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 >> 32)) * f12) << 32) | (4294967295L & Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 & 4294967295L)) * f11));
                h2 h2Var = this.f56477a;
                float fG = h2Var.g(h2Var.e(jFloatToRawIntBits));
                if ((fG > 0.0f ? 1 : (fG == 0.0f ? 0 : -1)) == 0 ? false : (fG > 0.0f ? 1 : (fG == 0.0f ? 0 : -1)) > 0 ? h2Var.f56557a.e() : h2Var.f56557a.c() ? !(this.f56481e.j(new w0(jFloatToRawIntBits, ((v2.t) b70.g.W0(list)).f91991b, false)) instanceof v70.q) : this.f56482f) {
                    int size3 = list2.size();
                    for (int i14 = 0; i14 < size3; i14++) {
                        ((v2.t) list.get(i14)).a();
                    }
                }
            }
        }
    }

    public final void e(t70.j0 j0Var) {
        if (this.f56483g == null) {
            this.f56483g = t70.m0.t(j0Var, null, null, new c4.k(this, (Continuation) null, 21), 3);
        }
    }

    public final void g(w0 w0Var) {
        long j11 = w0Var.f56742b;
        long j12 = w0Var.f56741a;
        c10.a aVar = this.f56484h;
        ((fe.u1) aVar.f19148b).a(Float.intBitsToFloat((int) (j12 >> 32)), j11);
        ((fe.u1) aVar.f19149c).a(Float.intBitsToFloat((int) (j12 & 4294967295L)), j11);
    }

    public final void h(y3.c cVar) {
        this.f56480d = cVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(h2 h2Var, y0 y0Var, ContinuationImpl continuationImpl) {
        b1 b1Var;
        if (continuationImpl instanceof b1) {
            b1Var = (b1) continuationImpl;
            int i5 = b1Var.f56470v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b1Var.f56470v = i5 - Integer.MIN_VALUE;
            } else {
                b1Var = new b1(this, continuationImpl);
            }
        }
        Object obj = b1Var.f56468t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b1Var.f56470v;
        if (i11 == 0) {
            ResultKt.b(obj);
            this.f56482f = true;
            c4.k kVar = new c4.k(h2Var, y0Var, null, 22);
            b1Var.f56470v = 1;
            t70.h2 h2Var2 = new t70.h2(b1Var.getContext(), b1Var, 0);
            if (w20.e.r(h2Var2, true, h2Var2, kVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f56482f = false;
        return Unit.f71706a;
    }
}
