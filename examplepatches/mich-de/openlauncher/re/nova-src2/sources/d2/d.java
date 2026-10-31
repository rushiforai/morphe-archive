package d2;

import ab.e0;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewStructure;
import android.view.autofill.AutofillId;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.lifecycle.DefaultLifecycleObserver;
import b3.t1;
import c1.m;
import c3.b3;
import c3.m1;
import c3.s;
import j3.a0;
import j3.h;
import j3.j;
import j3.k;
import j3.q;
import j3.r;
import j3.t;
import j3.w;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import m3.g;
import m3.k0;
import m3.l0;
import m3.p0;
import t70.t0;
import v70.i;
import v70.o;
import y3.p;
import z.c0;
import z.n;
import z.o0;

/* loaded from: classes.dex */
public final class d implements DefaultLifecycleObserver, View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final AndroidComposeView f48854a;

    /* renamed from: b, reason: collision with root package name */
    public final s f48855b;

    /* renamed from: c, reason: collision with root package name */
    public m f48856c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f48857d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final long f48858e = 100;

    /* renamed from: f, reason: collision with root package name */
    public a f48859f = a.f48847a;

    /* renamed from: g, reason: collision with root package name */
    public boolean f48860g = true;

    /* renamed from: h, reason: collision with root package name */
    public final i f48861h = o.b(1, 6, null);

    /* renamed from: i, reason: collision with root package name */
    public final Handler f48862i = new Handler(Looper.getMainLooper());

    /* renamed from: j, reason: collision with root package name */
    public c0 f48863j;

    /* renamed from: k, reason: collision with root package name */
    public long f48864k;

    /* renamed from: l, reason: collision with root package name */
    public final c0 f48865l;

    /* renamed from: m, reason: collision with root package name */
    public b3 f48866m;
    public boolean n;
    public final ae.m o;

    public d(AndroidComposeView androidComposeView, s sVar) {
        this.f48854a = androidComposeView;
        this.f48855b = sVar;
        c0 c0Var = n.f97803a;
        Intrinsics.e(c0Var, "null cannot be cast to non-null type androidx.collection.IntObjectMap<V of androidx.collection.IntObjectMapKt.intObjectMapOf>");
        this.f48863j = c0Var;
        this.f48865l = new c0();
        q qVarA = androidComposeView.getSemanticsOwner().a();
        Intrinsics.e(c0Var, "null cannot be cast to non-null type androidx.collection.IntObjectMap<V of androidx.collection.IntObjectMapKt.intObjectMapOf>");
        this.f48866m = new b3(qVarA, c0Var);
        this.o = new ae.m(this, 4);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v7, types: [v70.n] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x0081 -> B:17:0x0047). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        c cVar;
        Object obj;
        v70.b bVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f48853w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f48853w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuation);
            }
        }
        Object objA = cVar.f48851u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f48853w;
        if (i11 == 0) {
            ResultKt.b(objA);
            i iVar = this.f48861h;
            iVar.getClass();
            bVar = new v70.b(iVar);
        } else {
            if (i11 == 1) {
                Object obj2 = cVar.f48850t;
                ResultKt.b(objA);
                obj = obj2;
                if (((Boolean) objA).booleanValue()) {
                    return Unit.f71706a;
                }
                v70.b bVar2 = (v70.b) obj;
                bVar2.b();
                if (f()) {
                    g();
                }
                if (!this.n) {
                    this.n = true;
                    this.f48862i.post(this.o);
                }
                cVar.f48850t = bVar2;
                cVar.f48853w = 2;
                bVar = bVar2;
                if (t0.b(this.f48858e, cVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r22 = cVar.f48850t;
            ResultKt.b(objA);
            bVar = r22;
        }
        cVar.f48850t = bVar;
        cVar.f48853w = 1;
        v70.b bVar3 = bVar;
        objA = bVar3.a(cVar);
        obj = bVar3;
        if (objA != coroutineSingletons) {
            if (((Boolean) objA).booleanValue()) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(z.m mVar) {
        int[] iArr;
        long[] jArr;
        int[] iArr2;
        long[] jArr2;
        long j11;
        char c11;
        long j12;
        int i5;
        long[] jArr3;
        long[] jArr4;
        long j13;
        long j14;
        z.m mVar2 = mVar;
        int[] iArr3 = mVar2.f97795b;
        long[] jArr5 = mVar2.f97794a;
        int length = jArr5.length - 2;
        if (length < 0) {
            return;
        }
        int i11 = 0;
        while (true) {
            long j15 = jArr5[i11];
            char c12 = 7;
            long j16 = -9187201950435737472L;
            if ((((~j15) << 7) & j15 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i12 = 8;
                int i13 = 8 - ((~(i11 - length)) >>> 31);
                int i14 = 0;
                while (i14 < i13) {
                    if ((j15 & 255) < 128) {
                        int i15 = iArr3[(i11 << 3) + i14];
                        c11 = c12;
                        b3 b3Var = (b3) this.f48865l.b(i15);
                        r rVar = (r) mVar2.b(i15);
                        q qVarB = rVar != null ? rVar.b() : null;
                        if (qVarB == null) {
                            throw a2.c.r("no value for specified key");
                        }
                        j12 = j16;
                        int i16 = qVarB.f68826g;
                        k kVar = qVarB.f68823d;
                        if (b3Var == null) {
                            o0 o0Var = kVar.f68812a;
                            Object[] objArr = o0Var.f97867b;
                            long[] jArr6 = o0Var.f97866a;
                            int length2 = jArr6.length - 2;
                            iArr2 = iArr3;
                            if (length2 >= 0) {
                                int i17 = i12;
                                int i18 = 0;
                                while (true) {
                                    long j17 = jArr6[i18];
                                    j11 = j15;
                                    if ((((~j17) << c11) & j17 & j12) != j12) {
                                        int i19 = 8 - ((~(i18 - length2)) >>> 31);
                                        for (int i21 = 0; i21 < i19; i21++) {
                                            if ((j17 & 255) < 128) {
                                                j14 = j17;
                                                a0 a0Var = (a0) objArr[(i18 << 3) + i21];
                                                a0 a0Var2 = w.f68852a;
                                                a0 a0Var3 = w.A;
                                                if (Intrinsics.b(a0Var, a0Var3)) {
                                                    List list = (List) e0.F(kVar, a0Var3);
                                                    i(i16, String.valueOf(list != null ? (g) b70.g.Y0(list) : null));
                                                }
                                            } else {
                                                j14 = j17;
                                            }
                                            j17 = j14 >> i17;
                                        }
                                        if (i19 != i17) {
                                            break;
                                        }
                                        if (i18 == length2) {
                                            break;
                                        }
                                        i18++;
                                        j15 = j11;
                                        i17 = 8;
                                    }
                                    j15 = j11 >> 8;
                                    i14 = i5 + 1;
                                    jArr5 = jArr2;
                                    c12 = c11;
                                    j16 = j12;
                                    iArr3 = iArr2;
                                    i12 = 8;
                                    mVar2 = mVar;
                                }
                            } else {
                                j11 = j15;
                            }
                        } else {
                            iArr2 = iArr3;
                            j11 = j15;
                            o0 o0Var2 = kVar.f68812a;
                            Object[] objArr2 = o0Var2.f97867b;
                            long[] jArr7 = o0Var2.f97866a;
                            int length3 = jArr7.length - 2;
                            if (length3 >= 0) {
                                Object[] objArr3 = objArr2;
                                jArr2 = jArr5;
                                int i22 = 0;
                                while (true) {
                                    long j18 = jArr7[i22];
                                    Object[] objArr4 = objArr3;
                                    i5 = i14;
                                    if ((((~j18) << c11) & j18 & j12) != j12) {
                                        int i23 = 8 - ((~(i22 - length3)) >>> 31);
                                        int i24 = 0;
                                        while (i24 < i23) {
                                            if ((j18 & 255) < 128) {
                                                jArr4 = jArr7;
                                                a0 a0Var4 = (a0) objArr4[(i22 << 3) + i24];
                                                a0 a0Var5 = w.f68852a;
                                                j13 = j18;
                                                a0 a0Var6 = w.A;
                                                if (Intrinsics.b(a0Var4, a0Var6)) {
                                                    List list2 = (List) e0.F(b3Var.f19231a, a0Var6);
                                                    g gVar = list2 != null ? (g) b70.g.Y0(list2) : null;
                                                    List list3 = (List) e0.F(kVar, a0Var6);
                                                    g gVar2 = list3 != null ? (g) b70.g.Y0(list3) : null;
                                                    if (!Intrinsics.b(gVar, gVar2)) {
                                                        i(i16, String.valueOf(gVar2));
                                                    }
                                                }
                                            } else {
                                                jArr4 = jArr7;
                                                j13 = j18;
                                            }
                                            j18 = j13 >> 8;
                                            i24++;
                                            jArr7 = jArr4;
                                        }
                                        jArr3 = jArr7;
                                        if (i23 != 8) {
                                            break;
                                        }
                                    } else {
                                        jArr3 = jArr7;
                                    }
                                    if (i22 == length3) {
                                        break;
                                    }
                                    i22++;
                                    i14 = i5;
                                    objArr3 = objArr4;
                                    jArr7 = jArr3;
                                }
                                j15 = j11 >> 8;
                                i14 = i5 + 1;
                                jArr5 = jArr2;
                                c12 = c11;
                                j16 = j12;
                                iArr3 = iArr2;
                                i12 = 8;
                                mVar2 = mVar;
                            }
                        }
                        jArr2 = jArr5;
                    } else {
                        iArr2 = iArr3;
                        jArr2 = jArr5;
                        j11 = j15;
                        c11 = c12;
                        j12 = j16;
                    }
                    i5 = i14;
                    j15 = j11 >> 8;
                    i14 = i5 + 1;
                    jArr5 = jArr2;
                    c12 = c11;
                    j16 = j12;
                    iArr3 = iArr2;
                    i12 = 8;
                    mVar2 = mVar;
                }
                iArr = iArr3;
                int i25 = i12;
                jArr = jArr5;
                if (i13 != i25) {
                    return;
                }
            } else {
                iArr = iArr3;
                jArr = jArr5;
            }
            if (i11 == length) {
                return;
            }
            i11++;
            mVar2 = mVar;
            jArr5 = jArr;
            iArr3 = iArr;
        }
    }

    public final void c(q qVar, Function2 function2) {
        qVar.getClass();
        List listJ = q.j(4, qVar);
        int size = listJ.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            Object obj = listJ.get(i11);
            if (e().a(((q) obj).f68826g)) {
                function2.invoke(Integer.valueOf(i5), obj);
                i5++;
            }
        }
    }

    public final z.m e() {
        if (this.f48860g) {
            this.f48860g = false;
            this.f48863j = t.a(this.f48854a.getSemanticsOwner());
            this.f48864k = System.currentTimeMillis();
        }
        return this.f48863j;
    }

    public final boolean f() {
        return this.f48856c != null;
    }

    public final void g() {
        m mVar = this.f48856c;
        if (mVar == null) {
            return;
        }
        Object obj = mVar.f19098a;
        if (Build.VERSION.SDK_INT < 29) {
            return;
        }
        ArrayList arrayList = this.f48857d;
        if (arrayList.isEmpty()) {
            return;
        }
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            e eVar = (e) arrayList.get(i5);
            int iOrdinal = eVar.c().ordinal();
            if (iOrdinal == 0) {
                cm.f fVarB = eVar.b();
                if (fVarB != null) {
                    ViewStructure viewStructureM = fVarB.M();
                    if (Build.VERSION.SDK_INT >= 29) {
                        m1.d(ez.a.j(obj), viewStructureM);
                    }
                }
            } else {
                if (iOrdinal != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                AutofillId autofillIdB = mVar.b(eVar.a());
                if (autofillIdB != null && Build.VERSION.SDK_INT >= 29) {
                    m1.e(ez.a.j(obj), autofillIdB);
                }
            }
        }
        if (Build.VERSION.SDK_INT >= 29) {
            m1.g(ez.a.j(obj), mVar.f19099b.getAutofillId(), new long[]{Long.MIN_VALUE});
        }
        arrayList.clear();
    }

    public final void h(q qVar, b3 b3Var) {
        c(qVar, new c4.n(1, b3Var, this));
        List listJ = q.j(4, qVar);
        int size = listJ.size();
        for (int i5 = 0; i5 < size; i5++) {
            q qVar2 = (q) listJ.get(i5);
            z.m mVarE = e();
            int i11 = qVar2.f68826g;
            if (mVarE.a(i11)) {
                c0 c0Var = this.f48865l;
                if (c0Var.a(i11)) {
                    Object objB = c0Var.b(i11);
                    if (objB == null) {
                        throw a2.c.r("node not present in pruned tree before this change");
                    }
                    h(qVar2, (b3) objB);
                } else {
                    continue;
                }
            }
        }
    }

    public final void i(int i5, String str) {
        m mVar;
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 29 && (mVar = this.f48856c) != null) {
            AutofillId autofillIdB = mVar.b(i5);
            if (autofillIdB == null) {
                throw a2.c.r("Invalid content capture ID");
            }
            if (i11 >= 29) {
                m1.f(ez.a.j(mVar.f19098a), autofillIdB, str);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0070  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void j(int i5, q qVar) {
        Function1 function1;
        int i11;
        h2.c cVarA;
        cm.f fVar;
        String strX;
        Function1 function12;
        if (f()) {
            o0 o0Var = qVar.f68823d.f68812a;
            Object objD = o0Var.d(w.C);
            if (objD == null) {
                objD = null;
            }
            Boolean bool = (Boolean) objD;
            if (this.f48859f == a.f48847a && Intrinsics.b(bool, Boolean.TRUE)) {
                Object objD2 = o0Var.d(j.f68799l);
                if (objD2 == null) {
                    objD2 = null;
                }
                j3.a aVar = (j3.a) objD2;
                if (aVar != null && (function12 = (Function1) aVar.f68765b) != null) {
                }
            } else if (this.f48859f == a.f48848b && Intrinsics.b(bool, Boolean.FALSE)) {
                Object objD3 = o0Var.d(j.f68799l);
                if (objD3 == null) {
                    objD3 = null;
                }
                j3.a aVar2 = (j3.a) objD3;
                if (aVar2 != null && (function1 = (Function1) aVar2.f68765b) != null) {
                }
            }
            int i12 = qVar.f68826g;
            m mVar = this.f48856c;
            if (mVar != null && (i11 = Build.VERSION.SDK_INT) >= 29) {
                AutofillId autofillId = this.f48854a.getAutofillId();
                q qVarL = qVar.l();
                int i13 = qVar.f68826g;
                if (qVarL == null || (autofillId = mVar.b(qVarL.f68826g)) != null) {
                    cm.f fVarN = i11 >= 29 ? cm.f.N(m1.c(ez.a.j(mVar.f19098a), autofillId, i13)) : null;
                    if (fVarN == null) {
                        fVar = null;
                    } else {
                        k kVar = qVar.f68823d;
                        a0 a0Var = w.J;
                        o0 o0Var2 = kVar.f68812a;
                        if (!o0Var2.b(a0Var)) {
                            Bundle bundleA = fVarN.A();
                            if (bundleA != null) {
                                bundleA.putLong("android.view.contentcapture.EventTimestamp", this.f48864k);
                                bundleA.putInt("android.view.ViewStructure.extra.EXTRA_VIEW_NODE_INDEX", i5);
                            }
                            Object objD4 = o0Var2.d(w.f68874y);
                            if (objD4 == null) {
                                objD4 = null;
                            }
                            String str = (String) objD4;
                            if (str != null) {
                                fVarN.J(i13, str);
                            }
                            Object objD5 = o0Var2.d(w.f68864m);
                            if (objD5 == null) {
                                objD5 = null;
                            }
                            if (((Boolean) objD5) != null) {
                                fVarN.F("android.widget.ViewGroup");
                            }
                            Object objD6 = o0Var2.d(w.A);
                            if (objD6 == null) {
                                objD6 = null;
                            }
                            List list = (List) objD6;
                            if (list != null) {
                                fVarN.F("android.widget.TextView");
                                fVarN.K(a4.b.b(list, "\n", null, 62));
                            }
                            Object objD7 = o0Var2.d(w.E);
                            if (objD7 == null) {
                                objD7 = null;
                            }
                            g gVar = (g) objD7;
                            if (gVar != null) {
                                fVarN.F("android.widget.EditText");
                                fVarN.K(gVar);
                            }
                            Object objD8 = o0Var2.d(w.f68852a);
                            if (objD8 == null) {
                                objD8 = null;
                            }
                            List list2 = (List) objD8;
                            if (list2 != null) {
                                fVarN.G(a4.b.b(list2, "\n", null, 62));
                            }
                            Object objD9 = o0Var2.d(w.f68873x);
                            if (objD9 == null) {
                                objD9 = null;
                            }
                            h hVar = (h) objD9;
                            if (hVar != null && (strX = io.sentry.config.a.X(hVar.f68785a)) != null) {
                                fVarN.F(strX);
                            }
                            l0 l0VarK = io.sentry.config.a.K(kVar);
                            if (l0VarK != null) {
                                k0 k0Var = l0VarK.f75927a;
                                p0 p0Var = k0Var.f75915b;
                                y3.c cVar = k0Var.f75920g;
                                fVarN.L(cVar.getFontScale() * cVar.getDensity() * p.c(p0Var.f75956a.f75884b));
                            }
                            t1 t1VarD = qVar.d();
                            if (t1VarD == null) {
                                cVarA = h2.c.f59017e;
                                float f11 = cVarA.f59018a;
                                float f12 = cVarA.f59019b;
                                fVarN.H((int) f11, (int) f12, (int) (cVarA.f59020c - f11), (int) (cVarA.f59021d - f12));
                                fVar = fVarN;
                            } else {
                                t1 t1Var = t1VarD.isAttached() ? t1VarD : null;
                                if (t1Var != null) {
                                    cVarA = qVar.a(t1Var);
                                }
                                float f112 = cVarA.f59018a;
                                float f122 = cVarA.f59019b;
                                fVarN.H((int) f112, (int) f122, (int) (cVarA.f59020c - f112), (int) (cVarA.f59021d - f122));
                                fVar = fVarN;
                            }
                        }
                    }
                }
            }
            if (fVar != null) {
                this.f48857d.add(new e(i12, this.f48864k, f.f48871a, fVar));
            }
            c(qVar, new b0.g(this, 3));
        }
    }

    public final void k(q qVar) {
        if (f()) {
            this.f48857d.add(new e(qVar.f68826g, this.f48864k, f.f48872b, null));
            List listJ = q.j(4, qVar);
            int size = listJ.size();
            for (int i5 = 0; i5 < size; i5++) {
                k((q) listJ.get(i5));
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l() {
        c0 c0Var = this.f48865l;
        c0Var.c();
        z.m mVarE = e();
        int[] iArr = mVarE.f97795b;
        Object[] objArr = mVarE.f97796c;
        long[] jArr = mVarE.f97794a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128) {
                            int i13 = (i5 << 3) + i12;
                            c0Var.h(iArr[i13], new b3(((r) objArr[i13]).b(), e()));
                        }
                        j11 >>= 8;
                    }
                    if (i11 != 8) {
                        break;
                    } else if (i5 == length) {
                        break;
                    } else {
                        i5++;
                    }
                }
            }
        }
        this.f48866m = new b3(this.f48854a.getSemanticsOwner().a(), e());
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStart(h6.a0 a0Var) {
        this.f48856c = (m) this.f48855b.invoke();
        j(-1, this.f48854a.getSemanticsOwner().a());
        g();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onStop(h6.a0 a0Var) {
        k(this.f48854a.getSemanticsOwner().a());
        g();
        this.f48856c = null;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f48862i.removeCallbacks(this.o);
        this.f48856c = null;
    }
}
