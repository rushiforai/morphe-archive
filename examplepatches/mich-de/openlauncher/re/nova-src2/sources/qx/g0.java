package qx;

import ads_mobile_sdk.b00;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.gu0;
import android.os.Bundle;
import b.b4;
import java.util.ArrayList;
import java.util.List;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f84495a = new g0();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(int i5, l lVar, Function1 function1, ContinuationImpl continuationImpl) {
        a0 a0Var;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i11 = a0Var.f84428v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                a0Var.f84428v = i11 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        a0 a0Var2 = a0Var;
        Object objC = a0Var2.f84426t;
        Object obj = CoroutineSingletons.f71806a;
        int i12 = a0Var2.f84428v;
        if (i12 == 0) {
            ResultKt.b(objC);
            a0Var2.f84428v = 1;
            objC = c(i5, lVar, function1, null, null, a0Var2);
            if (objC == obj) {
                return obj;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
        }
        return ((z) objC).f84658a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:23:0x0077, B:18:0x006d], limit reached: 51 */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01a6  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r11v6, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r14v8, types: [kotlin.jvm.functions.Function2] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x015e -> B:38:0x016f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(int i5, l lVar, Function1 function1, sx.j jVar, y0 y0Var, ContinuationImpl continuationImpl) {
        b0 b0Var;
        g0 g0Var;
        String strG;
        String correlator;
        Function1 function12;
        y0 y0Var2;
        sx.j jVar2;
        String str;
        g0 g0Var2;
        ArrayList arrayList;
        int i11;
        int i12;
        e eVar;
        int i13;
        l lVar2;
        Ref.ObjectRef objectRef;
        b0 b0Var2;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i14 = b0Var.H;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                b0Var.H = i14 - Integer.MIN_VALUE;
                g0Var = this;
            } else {
                g0Var = this;
                b0Var = new b0(g0Var, continuationImpl);
            }
        }
        Object objS = b0Var.F;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = b0Var.H;
        if (i15 != 0) {
            if (i15 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i16 = b0Var.E;
            int i17 = b0Var.D;
            int i18 = b0Var.C;
            e eVar2 = b0Var.B;
            List list = b0Var.A;
            String str2 = b0Var.f84443z;
            String str3 = b0Var.f84442y;
            Function2 function2 = b0Var.f84441x;
            sx.j jVar3 = b0Var.f84440w;
            Function1 function13 = b0Var.f84439v;
            l lVar3 = b0Var.f84438u;
            g0 g0Var3 = b0Var.f84437t;
            ResultKt.b(objS);
            b0 b0Var3 = b0Var;
            ArrayList arrayList2 = list;
            Function1 function14 = function13;
            l lVar4 = lVar3;
            String str4 = str2;
            i12 = i17;
            g0 g0Var4 = g0Var3;
            jVar2 = jVar3;
            y0 y0Var3 = function2;
            Pair pair = (Pair) objS;
            int i19 = i16;
            r rVar = (r) pair.f71683a;
            e eVar3 = (e) pair.f71684b;
            if (rVar == null) {
                i12++;
                if (i12 >= 2) {
                    eVar = eVar3;
                    arrayList = arrayList2;
                    return new z(arrayList, arrayList.isEmpty() ? eVar : null);
                }
                eVar2 = eVar3;
            } else {
                arrayList2.add(rVar);
                i12 = 0;
            }
            i11 = i19 + 1;
            g0 g0Var5 = g0Var4;
            arrayList = arrayList2;
            b0Var = b0Var3;
            correlator = str4;
            lVar2 = lVar4;
            str = str3;
            g0Var2 = g0Var5;
            y0 y0Var4 = y0Var3;
            eVar = eVar2;
            function12 = function14;
            y0Var2 = y0Var4;
            i13 = i18;
            if (i11 < i13) {
                b0Var.f84437t = g0Var2;
                b0Var.f84438u = lVar2;
                b0Var.f84439v = function12;
                b0Var.f84440w = jVar2;
                b0Var.f84441x = y0Var2;
                b0Var.f84442y = str;
                b0Var.f84443z = correlator;
                b0Var.A = arrayList;
                b0Var.B = eVar;
                b0Var.C = i13;
                b0Var.D = i12;
                b0Var.E = i11;
                b0Var.H = 1;
                g0Var2.getClass();
                int i21 = i13;
                int i22 = i11;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(b0Var));
                mVar.t();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                oi.e eVar4 = new oi.e(str);
                Intrinsics.g(correlator, "correlator");
                eVar4.f80448k = correlator;
                eVar4.f80447j = oi.d.f80443c;
                eVar4.f80449l = ni.b.f78246d;
                if (lb0.b.f74823c) {
                    Bundle bundle = new Bundle();
                    objectRef = objectRef2;
                    b0Var2 = b0Var;
                    bundle.putString("npa", "1");
                    eVar4.b(bundle);
                } else {
                    objectRef = objectRef2;
                    b0Var2 = b0Var;
                }
                oi.f fVarD = eVar4.d();
                String str5 = correlator;
                String str6 = str;
                Ref.ObjectRef objectRef3 = objectRef;
                f0 f0Var = new f0(lVar2, objectRef3, jVar2, mVar, function12, y0Var2);
                q qVar = q.f84576a;
                q.b(new c0(mVar, fVarD, f0Var, 0));
                mVar.v(new d0(objectRef3));
                objS = mVar.s();
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                if (objS == coroutineSingletons) {
                    return coroutineSingletons;
                }
                y0 y0Var5 = y0Var2;
                function14 = function12;
                eVar2 = eVar;
                y0Var3 = y0Var5;
                i18 = i21;
                i16 = i22;
                b0Var3 = b0Var2;
                lVar4 = lVar2;
                arrayList2 = arrayList;
                str4 = str5;
                g0Var4 = g0Var2;
                str3 = str6;
                Pair pair2 = (Pair) objS;
                int i192 = i16;
                r rVar2 = (r) pair2.f71683a;
                e eVar32 = (e) pair2.f71684b;
                if (rVar2 == null) {
                }
                i11 = i192 + 1;
                g0 g0Var52 = g0Var4;
                arrayList = arrayList2;
                b0Var = b0Var3;
                correlator = str4;
                lVar2 = lVar4;
                str = str3;
                g0Var2 = g0Var52;
                y0 y0Var42 = y0Var3;
                eVar = eVar2;
                function12 = function14;
                y0Var2 = y0Var42;
                i13 = i18;
                if (i11 < i13) {
                }
            }
            return new z(arrayList, arrayList.isEmpty() ? eVar : null);
        }
        ResultKt.b(objS);
        if (jVar != null && (strG = jVar.f87794c) != null) {
            if (strG.length() <= 0) {
                strG = null;
            }
            if (strG == null) {
            }
            if (strG.length() != 0) {
                return new z(EmptyList.f71733a, new c("icon"));
            }
            b4.f15783a.getClass();
            correlator = ((b00) ((db0) gu0.a()).f2306l3.get()).a();
            function12 = function1;
            y0Var2 = y0Var;
            jVar2 = jVar;
            str = strG;
            g0Var2 = g0Var;
            arrayList = new ArrayList();
            i11 = 0;
            i12 = 0;
            eVar = null;
            i13 = i5;
            lVar2 = lVar;
            if (i11 < i13) {
            }
            return new z(arrayList, arrayList.isEmpty() ? eVar : null);
        }
        lVar.getClass();
        strG = l.g();
        if (strG.length() != 0) {
        }
    }
}
