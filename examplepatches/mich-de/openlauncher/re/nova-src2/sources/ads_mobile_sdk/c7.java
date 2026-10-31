package ads_mobile_sdk;

import android.content.Context;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import b.c0;
import b.d0;
import b.h8;
import b.n;
import b.p9;
import b.t2;
import b.x2;
import b.x8;
import cl.m0;
import cl.t0;
import cl.v;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.IllegalFormatException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import oi.h;
import org.json.JSONException;
import org.json.JSONObject;
import t70.k0;
import t70.p0;

/* loaded from: classes.dex */
public final class c7 implements x2, t0 {

    /* renamed from: b, reason: collision with root package name */
    public static final Object f1692b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static c7 f1693c;

    /* renamed from: a, reason: collision with root package name */
    public Object f1694a;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f1695d;

    public /* synthetic */ c7(Object obj, int i5) {
        this.f1695d = i5;
        this.f1694a = obj;
    }

    @Override // b.x2
    public cw0 a() {
        switch (this.f1695d) {
            case 5:
                return cw0.ICON_AD;
            case 10:
                return cw0.MEMORY;
            case 12:
                return cw0.INSPECTOR_SIGNAL;
            case 15:
                return cw0.AD_SPAM;
            default:
                return cw0.AD_TYPE;
        }
    }

    public void b(String str, Object... objArr) {
        if (Log.isLoggable("PlayCore", 5)) {
            Log.w("PlayCore", a((String) this.f1694a, str, objArr));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:67:0x0125  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object d(Continuation continuation) {
        ja1 ja1Var;
        ListenableFuture listenableFutureA;
        String strA;
        v vVar;
        switch (this.f1695d) {
            case 5:
                return new xu0(new d31((h) this.f1694a));
            case 10:
                Runtime runtime = Runtime.getRuntime();
                return new xu0(new hp1(runtime.freeMemory(), runtime.maxMemory(), ((xj) this.f1694a).f11732a.f8726c, runtime.totalMemory()));
            case 12:
                if (continuation instanceof ja1) {
                    ja1Var = (ja1) continuation;
                    int i5 = ja1Var.f5197c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        ja1Var.f5197c = i5 - Integer.MIN_VALUE;
                    } else {
                        ja1Var = new ja1(this, (ContinuationImpl) continuation);
                    }
                }
                Object objS = ja1Var.f5195a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = ja1Var.f5197c;
                if (i11 == 0) {
                    ResultKt.b(objS);
                    w81 w81Var = (w81) this.f1694a;
                    ja1Var.f5197c = 1;
                    objS = w81Var.s(ja1Var);
                    if (objS == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objS);
                }
                return new xu0(objS);
            case 15:
                k8 k8Var = (k8) this.f1694a;
                c7 c7VarB = k8Var.b();
                Context contextC = k8Var.c();
                f7 f7Var = (f7) c7VarB.f1694a;
                boolean z11 = f7Var.f3219j && System.currentTimeMillis() - f7Var.f3218i <= f7Var.f3220k;
                vi3 vi3Var = f7Var.f3213d;
                sh3 sh3Var = new sh3(yk0.EVENT_ID_SIGNAL_QUERY, vi3Var.f10793b, vi3Var.f10792a);
                if (f7Var.f3221l) {
                    f61 f61Var = f7Var.f3210a;
                    synchronized (f61Var) {
                        vVar = f61Var.f3209e;
                        vVar.getClass();
                    }
                    listenableFutureA = w0.c(vVar);
                } else {
                    listenableFutureA = f7Var.f3210a.a();
                }
                cl.u uVarF = w0.f(listenableFutureA, new b.g9(2, f7Var, contextC), m0.f20038a);
                try {
                    try {
                        try {
                            try {
                                sh3Var.b();
                                strA = (String) uVarF.get(z11 ? f7Var.f3217h : f7Var.f3215f, TimeUnit.MILLISECONDS);
                                sh3Var.a();
                                f7Var.f3214e.a();
                            } catch (Throwable th2) {
                                sh3Var.a(th2);
                                throw th2;
                            }
                        } catch (ExecutionException e3) {
                            e = e3;
                            Throwable cause = e.getCause();
                            if (cause != null) {
                                e = cause;
                            }
                            sh3Var.a(e);
                            strA = Integer.toString(3);
                            sh3Var.a();
                            f7Var.f3214e.a();
                        }
                    } catch (InterruptedException e11) {
                        Thread.currentThread().interrupt();
                        sh3Var.a(e11);
                        strA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        sh3Var.a();
                        f7Var.f3214e.a();
                    } catch (TimeoutException unused) {
                        if (f7Var.f3221l) {
                            uVarF.cancel(false);
                        }
                        strA = f7Var.a(z11);
                        sh3Var.a();
                        f7Var.f3214e.a();
                    }
                    Intrinsics.f(strA, "getQuerySignals(...)");
                    return new xu0(new m8(strA));
                } catch (Throwable th3) {
                    sh3Var.a();
                    f7Var.f3214e.a();
                    throw th3;
                }
            default:
                Set set = (Set) this.f1694a;
                ArrayList arrayList = new ArrayList(b70.c.u0(set, 10));
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    arrayList.add(((qw2) it.next()).f8869a);
                }
                return new xu0(new v8(arrayList));
        }
    }

    @Override // cl.t0
    public void onFailure(Throwable th2) {
    }

    @Override // cl.t0
    public void onSuccess(Object obj) {
        n nVar = (n) obj;
        qm1 qm1Var = (qm1) ((ga3) this.f1694a).f3749c;
        synchronized (qm1Var.n) {
            p9 p9Var = qm1Var.f8742q;
            String strB = nVar.b();
            p9Var.b();
            ((s7) p9Var.f1095b).b(strB);
        }
    }

    public c7(jx1 nativeAssetsLoader) {
        this.f1695d = 20;
        Intrinsics.g(nativeAssetsLoader, "nativeAssetsLoader");
        this.f1694a = nativeAssetsLoader;
    }

    public void b(int i5, x8 x8Var, Object obj) {
        g gVar = (g) obj;
        yu yuVar = (yu) this.f1694a;
        yuVar.g(i5, 2);
        yuVar.m(gVar.a(x8Var));
        x8Var.a((Object) gVar, this);
    }

    public c7(k8 adSpamClient) {
        this.f1695d = 15;
        Intrinsics.g(adSpamClient, "adSpamClient");
        this.f1694a = adSpamClient;
    }

    public void a(String str, b.m5 m5Var) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.f1694a;
        if (m5Var == null) {
            throw new NullPointerException("provider");
        }
        linkedHashMap.put(str, m5Var);
    }

    public c7(w81 inspectorManager) {
        this.f1695d = 12;
        Intrinsics.g(inspectorManager, "inspectorManager");
        this.f1694a = inspectorManager;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:42:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c7 c7Var, com.google.gson.r rVar, ContinuationImpl continuationImpl) {
        qx1 qx1Var;
        com.google.gson.r rVarX;
        Object objA;
        String str;
        if (continuationImpl instanceof qx1) {
            qx1Var = (qx1) continuationImpl;
            int i5 = qx1Var.f8878d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qx1Var.f8878d = i5 - Integer.MIN_VALUE;
            } else {
                qx1Var = new qx1(c7Var, continuationImpl);
            }
        }
        Object obj = qx1Var.f8876b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qx1Var.f8878d;
        if (i11 == 0) {
            ResultKt.b(obj);
            String strA = d62.a(rVar, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            if (strA.length() != 0) {
                String strA2 = d62.a(rVar, TTConst.TRACK_TYPE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (strA2.equals("string")) {
                    return new o70(strA, d62.a(rVar, "string_value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                }
                if (strA2.equals("image")) {
                    jx1 jx1Var = (jx1) c7Var.f1694a;
                    qx1Var.f8875a = strA;
                    qx1Var.f8878d = 1;
                    jx1Var.getClass();
                    if (rVar != null) {
                        try {
                            rVarX = rVar.x("image_value");
                        } catch (Exception unused) {
                        }
                        objA = jx1Var.a(rVarX, jx1Var.f5432a.i(), qx1Var);
                        if (objA != coroutineSingletons) {
                        }
                    } else {
                        rVarX = null;
                        objA = jx1Var.a(rVarX, jx1Var.f5432a.i(), qx1Var);
                        if (objA != coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        obj = objA;
                        str = strA;
                    }
                }
            }
            return null;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        str = qx1Var.f8875a;
        ResultKt.b(obj);
        wf1 wf1Var = (wf1) obj;
        if (wf1Var != null) {
            return new n70(str, wf1Var);
        }
        return null;
    }

    public c7(xj appState) {
        this.f1695d = 10;
        Intrinsics.g(appState, "appState");
        this.f1694a = appState;
    }

    public c7(Set requestTypes) {
        this.f1695d = 21;
        Intrinsics.g(requestTypes, "requestTypes");
        this.f1694a = requestTypes;
    }

    public c7(h iconRequest) {
        this.f1695d = 5;
        Intrinsics.g(iconRequest, "iconRequest");
        this.f1694a = iconRequest;
    }

    public c7(r80 r80Var) {
        this.f1695d = 0;
        this.f1694a = r80Var.a();
    }

    public c7(HashMap map) {
        this.f1695d = 11;
        this.f1694a = a80.m.o(map);
    }

    public c7(String str) {
        this.f1695d = 16;
        this.f1694a = c0.E("UID: [" + Process.myUid() + "]  PID: [" + Process.myPid() + "] ", str);
    }

    public void a(hi2 hi2Var) {
        tl2 tl2Var = (tl2) this.f1694a;
        c7 c7Var = tl2.f9987c;
        c7Var.a("prewarm(%s)", tl2Var.f9990b);
        k33 k33Var = tl2Var.f9989a;
        if (k33Var == null) {
            Object[] objArr = {"Play Store not found."};
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", a((String) c7Var.f1694a, "error: %s", objArr));
                return;
            }
            return;
        }
        fi.j jVar = new fi.j();
        k33Var.b(new e33(k33Var, jVar, jVar, new rl2(tl2Var, jVar, hi2Var, jVar)));
    }

    public c7(int i5, byte b11) {
        this.f1695d = i5;
        switch (i5) {
            case 4:
                this.f1694a = new AtomicReference(null);
                break;
            case 9:
                break;
            case 17:
                this.f1694a = new ArrayDeque();
                break;
            default:
                byte[] bArr = rb1.f9048a;
                this.f1694a = zt0.f12651a;
                break;
        }
    }

    public c7(yu yuVar) {
        this.f1695d = 23;
        rb1.a(yuVar, "output");
        this.f1694a = yuVar;
        yuVar.f12284a = this;
    }

    public JSONObject a(View view) throws JSONException {
        JSONObject jSONObjectA = c72.a(0, 0, 0, 0);
        try {
            jSONObjectA.put("noOutputDevice", t2.a(xv.a() != 1 ? 2 : t2.f15991h) == 0);
            return jSONObjectA;
        } catch (JSONException e3) {
            Log.e("OMIDLIB", "Error with setting output device status", e3);
            return jSONObjectA;
        }
    }

    public c7(int i5) {
        this.f1695d = 6;
        this.f1694a = d0.k(i5);
    }

    public void a(int i5) {
        fb1 fb1Var = (fb1) this.f1694a;
        t70.m0.t(fb1Var.f3282c, null, null, new bb1(fb1Var, i5, null), 3);
    }

    public static String a(String str, String str2, Object... objArr) {
        if (objArr.length > 0) {
            try {
                str2 = String.format(Locale.US, str2, objArr);
            } catch (IllegalFormatException e3) {
                Log.e("PlayCore", "Unable to format " + str2, e3);
                str2 = str2 + " [" + TextUtils.join(", ", objArr) + "]";
            }
        }
        return b.u4.m(str, " : ", str2);
    }

    public void a(String str, Object... objArr) {
        if (Log.isLoggable("PlayCore", 4)) {
            Log.i("PlayCore", a((String) this.f1694a, str, objArr));
        }
    }

    public Object a(String str) {
        Object obj;
        synchronized (this) {
            obj = this.f1694a;
            if (obj == null) {
                throw new IllegalStateException(str.toString());
            }
        }
        return obj;
    }

    public void a(Object t6) {
        Intrinsics.g(t6, "t");
        synchronized (this) {
            this.f1694a = t6;
            Unit unit = Unit.f71706a;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x005e, code lost:
    
        if (r9 == r1) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0085, code lost:
    
        if (r9 == r1) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0087, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x0085 -> B:33:0x0088). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(com.google.gson.r rVar, String str, ContinuationImpl continuationImpl) {
        rx1 rx1Var;
        Collection arrayList;
        Iterator it;
        if (continuationImpl instanceof rx1) {
            rx1Var = (rx1) continuationImpl;
            int i5 = rx1Var.f9348e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rx1Var.f9348e = i5 - Integer.MIN_VALUE;
            } else {
                rx1Var = new rx1(this, continuationImpl);
            }
        }
        Object objD = rx1Var.f9346c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rx1Var.f9348e;
        if (i11 == 0) {
            ResultKt.b(objD);
            com.google.gson.m mVarE = d62.e(rVar, str);
            if (mVarE == null) {
                return EmptyList.f71733a;
            }
            if (mVarE.f34793a.isEmpty()) {
                return EmptyList.f71733a;
            }
            af afVar = new af(mVarE, this, (Continuation) null, 4);
            rx1Var.f9348e = 1;
            objD = k0.d(afVar, rx1Var);
        } else if (i11 == 1) {
            ResultKt.b(objD);
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = rx1Var.f9345b;
            arrayList = rx1Var.f9344a;
            ResultKt.b(objD);
            h8 h8Var = (h8) objD;
            if (h8Var != null) {
                arrayList.add(h8Var);
            }
            if (!it.hasNext()) {
                p0 p0Var = (p0) it.next();
                rx1Var.f9344a = arrayList;
                rx1Var.f9345b = it;
                rx1Var.f9348e = 2;
                objD = p0Var.l(rx1Var);
            } else {
                return (List) arrayList;
            }
        }
        arrayList = new ArrayList();
        it = ((List) objD).iterator();
        if (!it.hasNext()) {
        }
    }

    public void a(sq sqVar) {
        ArrayDeque arrayDeque = (ArrayDeque) this.f1694a;
        if (sqVar.b()) {
            int iBinarySearch = Arrays.binarySearch(pz2.f8427i, sqVar.size());
            if (iBinarySearch < 0) {
                iBinarySearch = (-(iBinarySearch + 1)) - 1;
            }
            int iC = pz2.c(iBinarySearch + 1);
            if (!arrayDeque.isEmpty() && ((sq) arrayDeque.peek()).size() < iC) {
                int iC2 = pz2.c(iBinarySearch);
                sq pz2Var = (sq) arrayDeque.pop();
                while (!arrayDeque.isEmpty() && ((sq) arrayDeque.peek()).size() < iC2) {
                    pz2Var = new pz2((sq) arrayDeque.pop(), pz2Var);
                }
                pz2 pz2Var2 = new pz2(pz2Var, sqVar);
                while (!arrayDeque.isEmpty()) {
                    int iBinarySearch2 = Arrays.binarySearch(pz2.f8427i, pz2Var2.f8428d);
                    if (iBinarySearch2 < 0) {
                        iBinarySearch2 = (-(iBinarySearch2 + 1)) - 1;
                    }
                    if (((sq) arrayDeque.peek()).size() >= pz2.c(iBinarySearch2 + 1)) {
                        break;
                    } else {
                        pz2Var2 = new pz2((sq) arrayDeque.pop(), pz2Var2);
                    }
                }
                arrayDeque.push(pz2Var2);
                return;
            }
            arrayDeque.push(sqVar);
            return;
        }
        if (sqVar instanceof pz2) {
            pz2 pz2Var3 = (pz2) sqVar;
            a(pz2Var3.f8429e);
            a(pz2Var3.f8430f);
            return;
        }
        throw new IllegalArgumentException("Has a new type of ByteString been created? Found ".concat(String.valueOf(sqVar.getClass())));
    }
}
