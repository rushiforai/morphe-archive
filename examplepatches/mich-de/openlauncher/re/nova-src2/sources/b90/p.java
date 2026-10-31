package b90;

import ads_mobile_sdk.cw0;
import ads_mobile_sdk.iv1;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.nv1;
import ads_mobile_sdk.pv1;
import ads_mobile_sdk.qv1;
import ads_mobile_sdk.rw0;
import ads_mobile_sdk.xu0;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import b.b8;
import b.x2;
import b00.z0;
import b3.h0;
import com.google.android.gms.internal.measurement.v6;
import g0.z1;
import java.net.Proxy;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ni.i0;
import o9.t1;
import t70.j0;
import t70.m0;
import ui.q;
import x80.w;
import ya.r;
import ya.x;

/* loaded from: classes.dex */
public final class p implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public int f17724a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f17725b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f17726c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f17727d;

    /* renamed from: e, reason: collision with root package name */
    public Object f17728e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f17729f;

    public p(j0 backgroundScope, q nativeRequest, jr0 flags, iv1 nativeAdSettingsDataStore, ni.q baseRequest, rw0 gmaUtil, int i5) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(nativeAdSettingsDataStore, "nativeAdSettingsDataStore");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(gmaUtil, "gmaUtil");
        this.f17725b = backgroundScope;
        this.f17726c = nativeRequest;
        this.f17727d = nativeAdSettingsDataStore;
        this.f17728e = baseRequest;
        this.f17729f = gmaUtil;
        this.f17724a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(Continuation continuation) {
        qv1 qv1Var;
        String strL;
        long longVersionCode;
        PackageInfo packageInfo;
        long j11;
        p pVar;
        long j12;
        PackageInfo packageInfo2;
        if (continuation instanceof qv1) {
            qv1Var = (qv1) continuation;
            int i5 = qv1Var.f8831g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qv1Var.f8831g = i5 - Integer.MIN_VALUE;
            } else {
                qv1Var = new qv1(this, (ContinuationImpl) continuation);
            }
        }
        Object objK = qv1Var.f8829e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qv1Var.f8831g;
        Continuation continuation2 = null;
        if (i11 == 0) {
            ResultKt.b(objK);
            strL = ((ni.q) this.f17728e).l();
            if (strL == null) {
                return null;
            }
            Context context = ((rw0) this.f17729f).f9331a;
            if (Build.VERSION.SDK_INT >= 33) {
                PackageManager packageManager = context.getPackageManager();
                longVersionCode = (packageManager == null || (packageInfo2 = packageManager.getPackageInfo(context.getPackageName(), PackageManager.PackageInfoFlags.of(128L))) == null) ? 0L : packageInfo2.getLongVersionCode();
            } else {
                PackageManager packageManager2 = context.getPackageManager();
                longVersionCode = (packageManager2 == null || (packageInfo = packageManager2.getPackageInfo(context.getPackageName(), 128)) == null) ? 0 : packageInfo.versionCode;
            }
            iv1 iv1Var = (iv1) this.f17727d;
            qv1Var.f8825a = this;
            qv1Var.f8826b = strL;
            qv1Var.f8827c = longVersionCode;
            qv1Var.f8828d = longVersionCode;
            qv1Var.f8831g = 1;
            objK = iv1Var.k(qv1Var);
            if (objK != coroutineSingletons) {
                j11 = longVersionCode;
                pVar = this;
                j12 = j11;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objK);
            return objK;
        }
        j12 = qv1Var.f8828d;
        long j13 = qv1Var.f8827c;
        strL = qv1Var.f8826b;
        p pVar2 = qv1Var.f8825a;
        ResultKt.b(objK);
        pVar = pVar2;
        j11 = j13;
        if (j12 == ((Number) objK).longValue()) {
            iv1 iv1Var2 = (iv1) pVar.f17727d;
            qv1Var.f8825a = null;
            qv1Var.f8826b = null;
            qv1Var.f8831g = 2;
            Object objB = iv1Var2.b(strL, qv1Var);
            return objB == coroutineSingletons ? coroutineSingletons : objB;
        }
        j0 j0Var = (j0) pVar.f17725b;
        z1 z1Var = new z1(pVar, j11, continuation2, 2);
        EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context2, "context");
        m0.t(j0Var, context2, null, new ar.a(z1Var, null), 2);
        return null;
    }

    public void c() {
        HashMap map;
        synchronized (((fa.q) this.f17727d)) {
            map = new HashMap(((fa.q) this.f17727d).f54469f);
        }
        ((x) this.f17725b).execute(new b80.a(5, this, new z0(map, 11)));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object d(Continuation continuation) {
        pv1 pv1Var;
        String str;
        List listA;
        Boolean bool;
        Boolean boolValueOf;
        Integer num;
        Boolean bool2;
        ArrayList arrayList;
        p pVar;
        Integer num2;
        Boolean bool3;
        Integer num3;
        i0 i0Var;
        if (continuation instanceof pv1) {
            pv1Var = (pv1) continuation;
            int i5 = pv1Var.o;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pv1Var.o = i5 - Integer.MIN_VALUE;
            } else {
                pv1Var = new pv1(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = pv1Var.f8402m;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pv1Var.o;
        if (i11 == 0) {
            ResultKt.b(objA);
            q qVar = (q) this.f17726c;
            String lowerCase = qVar.getMediaAspectRatio().name().toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            str = qVar.getMediaAspectRatio() != ui.b.f91276a ? lowerCase : null;
            Integer num4 = new Integer(3);
            List<ui.a> listD = qVar.d();
            ArrayList arrayList2 = new ArrayList();
            for (ui.a aVar : listD) {
                Intrinsics.g(aVar, "<this>");
                int i12 = b8.f15784a[aVar.ordinal()];
                String str2 = i12 != 1 ? i12 != 2 ? null : "6" : "3";
                if (str2 != null) {
                    arrayList2.add(str2);
                }
            }
            listA = qVar.a();
            bool = Boolean.TRUE;
            boolValueOf = Boolean.valueOf(qVar.j());
            ui.c cVarB = qVar.b();
            num = cVarB != null ? new Integer(cVarB.a()) : null;
            Boolean boolValueOf2 = qVar.b() != null ? Boolean.valueOf(qVar.f()) : null;
            i0 i0VarC = qVar.c();
            Boolean boolValueOf3 = Boolean.valueOf(qVar.i());
            Integer num5 = new Integer(qVar.e().f78249a);
            pv1Var.f8390a = this;
            pv1Var.f8391b = num4;
            pv1Var.f8392c = arrayList2;
            pv1Var.f8393d = num;
            pv1Var.f8394e = boolValueOf;
            pv1Var.f8395f = str;
            pv1Var.f8396g = bool;
            pv1Var.f8397h = listA;
            pv1Var.f8398i = boolValueOf2;
            pv1Var.f8399j = num5;
            pv1Var.f8400k = boolValueOf3;
            pv1Var.f8401l = i0VarC;
            pv1Var.o = 1;
            objA = a(pv1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            bool2 = boolValueOf2;
            arrayList = arrayList2;
            pVar = this;
            num2 = num5;
            bool3 = boolValueOf3;
            num3 = num4;
            i0Var = i0VarC;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i0 i0Var2 = pv1Var.f8401l;
            Boolean bool4 = pv1Var.f8400k;
            Integer num6 = pv1Var.f8399j;
            Boolean bool5 = pv1Var.f8398i;
            listA = pv1Var.f8397h;
            bool = pv1Var.f8396g;
            str = pv1Var.f8395f;
            boolValueOf = pv1Var.f8394e;
            num = pv1Var.f8393d;
            ArrayList arrayList3 = pv1Var.f8392c;
            Integer num7 = pv1Var.f8391b;
            pVar = pv1Var.f8390a;
            ResultKt.b(objA);
            bool2 = bool5;
            arrayList = arrayList3;
            bool3 = bool4;
            num2 = num6;
            num3 = num7;
            i0Var = i0Var2;
        }
        Boolean bool6 = (Boolean) objA;
        Integer num8 = new Integer(pVar.f17724a);
        return new xu0(new nv1(num3, arrayList, listA, bool, str, boolValueOf, num, bool2, i0Var, bool3, num2, bool6, num8.intValue() > 1 ? num8 : null));
    }

    public void e(o9.z1 z1Var, Executor executor) {
        executor.execute(new b80.a(6, this, z1Var));
    }

    public boolean f() {
        return this.f17724a < ((List) this.f17727d).size() || !((ArrayList) this.f17729f).isEmpty();
    }

    public p(x80.a aVar, v6 routeDatabase, x80.i iVar) {
        List listJ;
        Intrinsics.g(routeDatabase, "routeDatabase");
        this.f17725b = aVar;
        this.f17726c = routeDatabase;
        EmptyList emptyList = EmptyList.f71733a;
        this.f17727d = emptyList;
        this.f17728e = emptyList;
        this.f17729f = new ArrayList();
        w url = aVar.f95393h;
        Intrinsics.g(url, "url");
        URI uriL = url.l();
        if (uriL.getHost() == null) {
            listJ = y80.c.j(Proxy.NO_PROXY);
        } else {
            List<Proxy> proxiesOrNull = aVar.f95392g.select(uriL);
            List<Proxy> list = proxiesOrNull;
            if (list != null && !list.isEmpty()) {
                Intrinsics.f(proxiesOrNull, "proxiesOrNull");
                listJ = y80.c.v(proxiesOrNull);
            } else {
                listJ = y80.c.j(Proxy.NO_PROXY);
            }
        }
        this.f17727d = listJ;
        this.f17724a = 0;
    }

    @Override // b.x2
    public cw0 a() {
        return cw0.NATIVE_AD;
    }

    public p(t1 t1Var, fa.q qVar, fa.d dVar, fa.p[] pVarArr, x xVar) {
        this.f17725b = xVar;
        this.f17726c = t1Var;
        this.f17727d = qVar;
        this.f17728e = dVar;
        this.f17729f = pVarArr;
    }

    public p(fa.p pVar, Executor executor, t1 t1Var, fa.q qVar, int i5, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ya.p pVar2) {
        this.f17726c = pVar;
        this.f17725b = executor;
        this.f17727d = t1Var;
        this.f17728e = qVar;
        this.f17724a = i5;
        this.f17729f = pVar2;
    }

    public void d(boolean z11) {
        int i5;
        final int i11;
        p pVar = this;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ya.p pVar2 = new ya.p();
        ArrayList arrayList3 = new ArrayList();
        synchronized (((fa.q) pVar.f17727d)) {
            try {
                arrayList.addAll(((fa.q) pVar.f17727d).f54465b);
                arrayList2.addAll(((fa.q) pVar.f17727d).f54466c);
                ya.p pVarC = ((fa.q) pVar.f17727d).c();
                int i12 = pVarC.f97194b;
                pVar2.g(i12);
                System.arraycopy(pVarC.f97193a, 0, pVar2.f97193a, pVar2.f97194b, i12);
                pVar2.f97194b += i12;
                ((fa.q) pVar.f17727d).f54468e.forEach(new fa.f(arrayList3, 0));
                if (z11) {
                    ((fa.q) pVar.f17727d).f54471h++;
                }
                pVar.f17724a = ((fa.q) pVar.f17727d).f54471h;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        fa.p[] pVarArr = (fa.p[]) pVar.f17729f;
        int length = pVarArr.length;
        int i13 = 0;
        while (i13 < length) {
            fa.p pVar3 = pVarArr[i13];
            x xVar = (x) pVar.f17725b;
            t1 t1Var = (t1) pVar.f17726c;
            p pVar4 = new p(pVar3, xVar, t1Var, (fa.q) pVar.f17727d, pVar.f17724a, arrayList, arrayList2, arrayList3, pVar2);
            r rVarT = pVar3.t(pVar2);
            final ArrayList arrayList4 = new ArrayList();
            final ArrayList arrayList5 = new ArrayList();
            ArrayList arrayList6 = new ArrayList();
            ArrayList arrayList7 = new ArrayList();
            x7.f.x(rVarT, arrayList, arrayList4, arrayList5);
            x7.f.x(rVarT, arrayList2, arrayList6, arrayList7);
            int i14 = t1Var.f80136e.f80269b;
            fa.p[] pVarArr2 = pVarArr;
            Collections.sort(arrayList4, new h0(2));
            Collections.sort(arrayList5, new h0(2));
            pVar4.e(new bb.a(17), xVar);
            pVar4.e(new z0(pVar4, 7), xVar);
            int size = arrayList4.size();
            final int i15 = 0;
            while (true) {
                if (i15 >= size) {
                    break;
                }
                int i16 = i15 + 6;
                int i17 = size;
                final int i18 = i16 > size ? size - i15 : 6;
                pVar4.e(new o9.z1() { // from class: fa.h
                    @Override // o9.z1
                    public final void c(p pVar5) {
                        int i19 = i18;
                        int i21 = i15;
                        pVar5.K(arrayList4.subList(i21, i19 + i21), false);
                    }
                }, xVar);
                size = i17;
                i15 = i16;
            }
            int i19 = 0;
            for (int size2 = arrayList6.size(); i19 < size2; size2 = size2) {
                pVar4.e(new z0((ga.e) arrayList6.get(i19), 9), xVar);
                i19++;
            }
            arrayList3.forEach(new fa.f(pVar4, 1));
            aa.h hVar = new aa.h();
            fa.g gVar = new fa.g(hVar, 0);
            int size3 = arrayList5.size();
            final int i21 = 0;
            while (i21 < size3) {
                int i22 = i21 + 6;
                if (i22 <= size3) {
                    i5 = size3;
                    i11 = 6;
                } else {
                    i5 = size3;
                    i11 = size3 - i21;
                }
                ArrayList arrayList8 = arrayList;
                pVar4.e(new o9.z1() { // from class: fa.h
                    @Override // o9.z1
                    public final void c(p pVar5) {
                        int i192 = i11;
                        int i212 = i21;
                        pVar5.K(arrayList5.subList(i212, i192 + i212), false);
                    }
                }, gVar);
                i21 = i22;
                arrayList = arrayList8;
                size3 = i5;
            }
            ArrayList arrayList9 = arrayList;
            int size4 = arrayList7.size();
            for (int i23 = 0; i23 < size4; i23++) {
                pVar4.e(new z0((ga.e) arrayList7.get(i23), 9), gVar);
            }
            pVar4.e(new z0(rVarT, 8), gVar);
            gVar.execute(new ae.m(pVar4, 5));
            pVar4.e(new bm.o(1, rVarT, hVar), xVar);
            i13++;
            pVar = this;
            pVarArr = pVarArr2;
            arrayList = arrayList9;
        }
    }
}
