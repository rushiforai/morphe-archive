package m;

import a5.a1;
import a5.i1;
import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.IBinder;
import android.os.Messenger;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import c0.i2;
import com.google.android.gms.cloudmessaging.zzd;
import com.google.android.gms.measurement.api.AppMeasurementSdk;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.tesladirect.ChangeLogDialog;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.regex.Matcher;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import l1.a2;
import l1.g4;
import p1.e1;
import p1.k2;
import p1.s2;
import p10.j2;
import p10.l2;
import t70.g2;
import t70.y0;

/* loaded from: classes2.dex */
public final class w implements androidx.appcompat.view.a, o3.d, fi.h, tk.l, jf.f, q1.k0, x8.j, fi.e, ke.e, x80.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75377a;

    /* renamed from: b, reason: collision with root package name */
    public Object f75378b;

    /* renamed from: c, reason: collision with root package name */
    public Object f75379c;

    public /* synthetic */ w(int i5, Object obj, Object obj2) {
        this.f75377a = i5;
        this.f75379c = obj;
        this.f75378b = obj2;
    }

    public void A(sd.n nVar) {
        this.f75379c = nVar;
    }

    public void B() {
        this.f75378b = sd.b0.f87132a;
    }

    public void C(sd.k0 k0Var) {
        this.f75379c = k0Var;
    }

    public void D(sd.l0 l0Var) {
        this.f75378b = l0Var;
    }

    public void E() {
        g2 g2Var = (g2) this.f75378b;
        if (g2Var != null) {
            g2Var.c(null);
        }
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        this.f75379c = new c0.n(c0.f.f18784i, Float.valueOf(0.0f), null, 60);
    }

    public void F(float f11, y3.c cVar, t70.j0 j0Var) {
        if (f11 <= cVar.mo102toPx0680j_4(n0.q0.f77462a)) {
            return;
        }
        z1.f fVarL = o2.f.l();
        Continuation continuation = null;
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            float fFloatValue = ((Number) ((s2) ((c0.n) this.f75379c).f18878b).getValue()).floatValue();
            g2 g2Var = (g2) this.f75378b;
            if (g2Var != null) {
                g2Var.c(null);
            }
            c0.n nVar = (c0.n) this.f75379c;
            if (nVar.f18882f) {
                this.f75379c = c0.f.e(nVar, fFloatValue - f11, 0.0f, 30);
            } else {
                FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
                this.f75379c = new c0.n(c0.f.f18784i, Float.valueOf(-f11), null, 60);
            }
            this.f75378b = t70.m0.t(j0Var, null, null, new mx.e0(this, continuation, 3), 3);
            Unit unit = Unit.f71706a;
            o2.f.w(fVarL, fVarQ, function1E);
        } catch (Throwable th2) {
            o2.f.w(fVarL, fVarQ, function1E);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00a4 A[PHI: r8
      0x00a4: PHI (r8v5 java.lang.Long) = (r8v3 java.lang.Long), (r8v8 java.lang.Long) binds: [B:26:0x00b1, B:23:0x00a2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00a9  */
    /* JADX WARN: Type inference failed for: r0v5, types: [kotlin.Result$Failure] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public long G(String str) {
        Map mapA;
        long jLongValue;
        String str2 = (String) ((o00.d) this.f75378b).invoke();
        boolean zU0 = r70.k.U0(str2);
        Map map = b70.h.f17594a;
        if (!zU0) {
            try {
                int i5 = Result.f71687b;
                mapA = (Map) w20.f.f93675a.decodeFromString(BuiltinSerializersKt.MapSerializer(BuiltinSerializersKt.serializer(StringCompanionObject.f71868a), BuiltinSerializersKt.serializer(LongCompanionObject.f71857a)), str2);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                mapA = ResultKt.a(th2);
            }
            if (!(mapA instanceof Result.Failure)) {
                map = mapA;
            }
            Map map2 = map;
            Map linkedHashMap = new LinkedHashMap(b70.k.d0(map2.size()));
            for (Map.Entry entry : map2.entrySet()) {
                String upperCase = ((String) entry.getKey()).toUpperCase(Locale.ROOT);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                linkedHashMap.put(upperCase, entry.getValue());
            }
            map = linkedHashMap;
        }
        long jLongValue2 = ((Number) ((o00.d) this.f75379c).invoke()).longValue();
        if (jLongValue2 < 1) {
            jLongValue2 = 1;
        }
        if (str != null) {
            Object upperCase2 = str.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase2, "toUpperCase(...)");
            Long l9 = (Long) map.get(upperCase2);
            if (l9 != null) {
                jLongValue = l9.longValue();
            } else {
                l9 = (Long) map.get("DEFAULT");
                if (l9 == null) {
                    jLongValue = jLongValue2;
                }
            }
        }
        return jLongValue < jLongValue2 ? jLongValue2 : jLongValue;
    }

    @Override // androidx.appcompat.view.a
    public boolean I(androidx.appcompat.view.b bVar, Menu menu) {
        ViewGroup viewGroup = ((f0) this.f75379c).A;
        WeakHashMap weakHashMap = a1.f250a;
        a5.q0.c(viewGroup);
        return ((androidx.appcompat.view.a) this.f75378b).I(bVar, menu);
    }

    @Override // tk.m
    public /* bridge */ /* synthetic */ Object a() {
        tk.k kVar = (tk.k) this.f75379c;
        return new ok.b((ok.h) ((tk.k) this.f75378b).a(), (ok.l) kVar.a());
    }

    @Override // x8.j
    public void b(x8.r rVar) {
        ((AppSearchResultsView) this.f75378b).H.put((Uri) this.f75379c, rVar.f95367a);
    }

    @Override // o3.d
    public int c(int i5) {
        CharSequence charSequence = (CharSequence) this.f75378b;
        do {
            i5 = ((fk.l) this.f75379c).s(i5);
            if (i5 == -1 || i5 == charSequence.length()) {
                return -1;
            }
        } while (Character.isWhitespace(charSequence.charAt(i5)));
        return i5;
    }

    @Override // o3.d
    public int d(int i5) {
        do {
            i5 = ((fk.l) this.f75379c).v(i5);
            if (i5 == -1) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.f75378b).charAt(i5)));
        return i5;
    }

    @Override // o3.d
    public int e(int i5) {
        do {
            i5 = ((fk.l) this.f75379c).s(i5);
            if (i5 == -1) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.f75378b).charAt(i5 - 1)));
        return i5;
    }

    @Override // o3.d
    public int f(int i5) {
        do {
            i5 = ((fk.l) this.f75379c).v(i5);
            if (i5 == -1 || i5 == 0) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.f75378b).charAt(i5 - 1)));
        return i5;
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, m.n] */
    @Override // androidx.appcompat.view.a
    public void g(androidx.appcompat.view.b bVar) {
        ((androidx.appcompat.view.a) this.f75378b).g(bVar);
        f0 f0Var = (f0) this.f75379c;
        if (f0Var.f75240w != null) {
            f0Var.f75231l.getDecorView().removeCallbacks(f0Var.f75241x);
        }
        if (f0Var.f75239v != null) {
            i1 i1Var = f0Var.f75242y;
            if (i1Var != null) {
                i1Var.b();
            }
            i1 i1VarA = a1.a(f0Var.f75239v);
            i1VarA.a(0.0f);
            f0Var.f75242y = i1VarA;
            i1VarA.d(new v(this, 2));
        }
        ?? r02 = f0Var.n;
        if (r02 != 0) {
            r02.onSupportActionModeFinished(f0Var.f75238u);
        }
        f0Var.f75238u = null;
        ViewGroup viewGroup = f0Var.A;
        WeakHashMap weakHashMap = a1.f250a;
        a5.q0.c(viewGroup);
        f0Var.Z();
    }

    @Override // jf.f
    public List h(long j11) {
        jf.b bVar;
        int iE = wf.v.e((long[]) this.f75379c, j11, false);
        return (iE == -1 || (bVar = ((jf.b[]) this.f75378b)[iE]) == jf.b.f69504r) ? Collections.EMPTY_LIST : Collections.singletonList(bVar);
    }

    @Override // q1.k0
    public List i(Integer num) {
        List listI = ((q1.k0) this.f75378b).i(null);
        k2 k2Var = (k2) this.f75379c;
        int i5 = k2Var.f81484v;
        if (i5 < 0) {
            return listI;
        }
        return b70.g.t1(listI, a2.b.b(k2Var, num, i5, Integer.valueOf(k2Var.D(k2Var.f81466b, i5))));
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0125 A[EDGE_INSN: B:68:0x0125->B:52:0x0125 BREAK  A[LOOP:1: B:38:0x00ea->B:51:0x0114], SYNTHETIC] */
    @Override // ke.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ke.d j(ke.k kVar, long j11) {
        long position = kVar.getPosition();
        int iMin = (int) Math.min(20000L, kVar.getLength() - position);
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f75379c;
        aVar.U(iMin);
        kVar.b(0, iMin, (byte[]) aVar.f31986d);
        int i5 = -1;
        int i11 = -1;
        long j12 = -9223372036854775807L;
        while (aVar.g() >= 4) {
            if (ne.a.a(aVar.f31984b, (byte[]) aVar.f31986d) != 442) {
                aVar.Z(1);
            } else {
                aVar.Z(4);
                long jC = ue.w.c(aVar);
                if (jC != -9223372036854775807L) {
                    long jB = ((wf.t) this.f75378b).b(jC);
                    if (jB > j11) {
                        return j12 == -9223372036854775807L ? new ke.d(-1, jB, position) : new ke.d(0, -9223372036854775807L, position + i11);
                    }
                    if (jB + 100000 > j11) {
                        return new ke.d(0, -9223372036854775807L, position + aVar.f31984b);
                    }
                    j12 = jB;
                    i11 = aVar.f31984b;
                }
                int i12 = aVar.f31985c;
                if (aVar.g() < 10) {
                    aVar.Y(i12);
                } else {
                    aVar.Z(9);
                    int iN = aVar.N() & 7;
                    if (aVar.g() < iN) {
                        aVar.Y(i12);
                    } else {
                        aVar.Z(iN);
                        if (aVar.g() < 4) {
                            aVar.Y(i12);
                        } else {
                            if (ne.a.a(aVar.f31984b, (byte[]) aVar.f31986d) == 443) {
                                aVar.Z(4);
                                int iS = aVar.S();
                                if (aVar.g() >= iS) {
                                    aVar.Z(iS);
                                    while (true) {
                                        if (aVar.g() >= 4) {
                                            break;
                                        }
                                        int iA = ne.a.a(aVar.f31984b, (byte[]) aVar.f31986d);
                                        if (iA == 442 || iA == 441 || (iA >>> 8) != 1) {
                                            break;
                                        }
                                        aVar.Z(4);
                                        if (aVar.g() < 2) {
                                            aVar.Y(i12);
                                            break;
                                        }
                                        aVar.Y(Math.min(aVar.f31985c, aVar.f31984b + aVar.S()));
                                    }
                                } else {
                                    aVar.Y(i12);
                                }
                            } else {
                                while (true) {
                                    if (aVar.g() >= 4) {
                                    }
                                    aVar.Y(Math.min(aVar.f31985c, aVar.f31984b + aVar.S()));
                                }
                            }
                        }
                    }
                }
                i5 = aVar.f31984b;
            }
        }
        return j12 != -9223372036854775807L ? new ke.d(-2, j12, position + i5) : ke.d.f71385d;
    }

    @Override // androidx.appcompat.view.a
    public boolean k(androidx.appcompat.view.b bVar, Menu menu) {
        return ((androidx.appcompat.view.a) this.f75378b).k(bVar, menu);
    }

    @Override // ke.e
    public void l() {
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f75379c;
        byte[] bArr = wf.v.f94381f;
        aVar.getClass();
        aVar.V(bArr.length, bArr);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object m(ContinuationImpl continuationImpl) throws Throwable {
        j2 j2Var;
        if (continuationImpl instanceof j2) {
            j2Var = (j2) continuationImpl;
            int i5 = j2Var.f81801v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j2Var.f81801v = i5 - Integer.MIN_VALUE;
            } else {
                j2Var = new j2(this, continuationImpl);
            }
        }
        Object objY = j2Var.f81799t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j2Var.f81801v;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objY);
            p10.s sVar = (p10.s) this.f75378b;
            j2Var.f81801v = 1;
            a80.e eVar = y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new g4(sVar, null, 24), j2Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        Iterable iterable = (Iterable) objY;
        if ((iterable instanceof Collection) && ((Collection) iterable).isEmpty()) {
            z11 = false;
        } else {
            Iterator it = iterable.iterator();
            while (it.hasNext()) {
                if (Intrinsics.b(((p10.k) it.next()).f81804c, "onboarding_bonus")) {
                    break;
                }
            }
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }

    public sd.p n() {
        return new sd.p((sd.b0) this.f75378b, (sd.n) this.f75379c);
    }

    public sd.z o() {
        return new sd.z((sd.l0) this.f75378b, (sd.k0) this.f75379c);
    }

    @Override // fi.h
    public void onCanceled() {
        try {
            ((oh.h) this.f75378b).b((rg.i) this.f75379c, true, new fi.j());
        } catch (RemoteException unused) {
        }
    }

    @Override // fi.e
    public void onComplete(Task task) {
        switch (this.f75377a) {
            case 12:
                ((Map) ((og.i) this.f75379c).f80413c).remove((fi.j) this.f75378b);
                return;
            case 17:
                tk.b bVar = (tk.b) this.f75378b;
                fi.j jVar = (fi.j) this.f75379c;
                synchronized (bVar.f89405f) {
                    bVar.f89404e.remove(jVar);
                }
                return;
            default:
                t70.m mVar = (t70.m) this.f75378b;
                if (task.q()) {
                    mVar.i(b70.g.E1(((FindAutocompletePredictionsResponse) task.m()).getAutocompletePredictions(), 10), null);
                    return;
                }
                Exception excL = ((Task) this.f75379c).l();
                if (excL == null) {
                    excL = new RuntimeException("FetchPlace failed");
                }
                int i5 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(excL));
                return;
        }
    }

    @Override // x80.j
    public void onFailure(x80.i iVar, IOException iOException) {
        iOException.printStackTrace();
        ((z30.a) this.f75379c).f98193b.finish();
    }

    @Override // x80.j
    public void onResponse(x80.i iVar, x80.m0 m0Var) {
        int iLastIndexOf;
        Matcher matcher;
        ChangeLogDialog changeLogDialog = ((z30.a) this.f75379c).f98193b;
        if (m0Var.c()) {
            String strB = m0Var.f95558f.b("Content-Disposition");
            if (strB == null) {
                strB = "attachment;filename=\"Nova Launcher.apk\"";
            }
            try {
                matcher = ChangeLogDialog.f46512w.matcher(strB);
            } catch (IllegalStateException unused) {
            }
            String strGroup = matcher.find() ? matcher.group(1) : null;
            if (strGroup != null && (iLastIndexOf = strGroup.lastIndexOf(47) + 1) > 0) {
                strGroup = strGroup.substring(iLastIndexOf);
            }
            if (TextUtils.isEmpty(strGroup)) {
                strGroup = "NovaLauncher.apk";
            }
            DownloadManager downloadManager = (DownloadManager) changeLogDialog.getSystemService("download");
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse((String) this.f75378b));
            request.setMimeType("application/vnd.android.package-archive");
            request.setVisibleInDownloadsUi(true);
            request.setNotificationVisibility(1);
            request.setDescription("Nova Launcher APK");
            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, strGroup);
            downloadManager.enqueue(request);
        }
        changeLogDialog.finish();
    }

    @Override // jf.f
    public long p(int i5) {
        long[] jArr = (long[]) this.f75379c;
        wf.a.e(i5 >= 0);
        wf.a.e(i5 < jArr.length);
        return jArr[i5];
    }

    public void q(long j11, com.google.android.gms.internal.consent_sdk.a aVar) {
        if (aVar.g() < 9) {
            return;
        }
        int iA = aVar.A();
        int iA2 = aVar.A();
        int iN = aVar.N();
        if (iA == 434 && iA2 == 1195456820 && iN == 3) {
            io.sentry.config.a.C(j11, aVar, (ke.v[]) this.f75379c);
        }
    }

    @Override // jf.f
    public int r() {
        return ((long[]) this.f75379c).length;
    }

    public void s(ke.l lVar, ue.d0 d0Var) {
        ke.v[] vVarArr = (ke.v[]) this.f75379c;
        for (int i5 = 0; i5 < vVarArr.length; i5++) {
            d0Var.a();
            d0Var.b();
            ke.v vVarS = lVar.s(d0Var.f90858d, 3);
            fe.k0 k0Var = (fe.k0) ((List) this.f75378b).get(i5);
            String str = k0Var.f54883l;
            wf.a.d("Invalid closed caption mime type provided: " + str, "application/cea-608".equals(str) || "application/cea-708".equals(str));
            fe.j0 j0Var = new fe.j0();
            d0Var.b();
            j0Var.f54846a = d0Var.f90859e;
            j0Var.f54856k = str;
            j0Var.f54849d = k0Var.f54875d;
            j0Var.f54848c = k0Var.f54874c;
            j0Var.C = k0Var.D;
            j0Var.f54858m = k0Var.n;
            vVarS.a(new fe.k0(j0Var));
            vVarArr[i5] = vVarS;
        }
    }

    public float t() {
        return ((Number) ((s2) ((c0.n) this.f75379c).f18878b).getValue()).floatValue();
    }

    @Override // androidx.appcompat.view.a
    public boolean u(androidx.appcompat.view.b bVar, MenuItem menuItem) {
        return ((androidx.appcompat.view.a) this.f75378b).u(bVar, menuItem);
    }

    public synchronized Map v() {
        try {
            if (((Map) this.f75379c) == null) {
                this.f75379c = Collections.unmodifiableMap(new HashMap((HashMap) this.f75378b));
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return (Map) this.f75379c;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object w(ContinuationImpl continuationImpl) throws Throwable {
        p10.k2 k2Var;
        w wVar;
        long j11;
        if (continuationImpl instanceof p10.k2) {
            k2Var = (p10.k2) continuationImpl;
            int i5 = k2Var.f81813x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k2Var.f81813x = i5 - Integer.MIN_VALUE;
            } else {
                k2Var = new p10.k2(this, continuationImpl);
            }
        }
        Object objZ = k2Var.f81811v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k2Var.f81813x;
        if (i11 == 0) {
            ResultKt.b(objZ);
            k2Var.f81809t = this;
            k2Var.f81813x = 1;
            objZ = z(k2Var);
            if (objZ != coroutineSingletons) {
                wVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = k2Var.f81810u;
            ResultKt.b(objZ);
            return new Long(j11);
        }
        wVar = k2Var.f81809t;
        ResultKt.b(objZ);
        long jLongValue = ((Number) objZ).longValue();
        if (jLongValue <= 0) {
            return new Long(0L);
        }
        p10.s sVar = (p10.s) wVar.f75378b;
        k2Var.f81809t = null;
        k2Var.f81810u = jLongValue;
        k2Var.f81813x = 2;
        if (sVar.a(jLongValue, "onboarding_bonus", k2Var) != coroutineSingletons) {
            j11 = jLongValue;
            return new Long(j11);
        }
        return coroutineSingletons;
    }

    public boolean x() {
        return !(((Number) ((s2) ((c0.n) this.f75379c).f18878b).getValue()).floatValue() == 0.0f);
    }

    public void y(Map map) {
        ((sp.m0) this.f75379c).f87624i = map;
        ((CountDownLatch) this.f75378b).countDown();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object z(ContinuationImpl continuationImpl) throws Throwable {
        l2 l2Var;
        w wVar;
        if (continuationImpl instanceof l2) {
            l2Var = (l2) continuationImpl;
            int i5 = l2Var.f81832w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l2Var.f81832w = i5 - Integer.MIN_VALUE;
            } else {
                l2Var = new l2(this, continuationImpl);
            }
        }
        Object objM = l2Var.f81830u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l2Var.f81832w;
        if (i11 == 0) {
            ResultKt.b(objM);
            l2Var.f81829t = this;
            l2Var.f81832w = 1;
            objM = m(l2Var);
            if (objM == coroutineSingletons) {
                return coroutineSingletons;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            wVar = l2Var.f81829t;
            ResultKt.b(objM);
        }
        long j11 = 0;
        if (!((Boolean) objM).booleanValue()) {
            long jLongValue = ((Number) ((o00.d) wVar.f75379c).invoke()).longValue();
            if (jLongValue >= 0) {
                j11 = jLongValue;
            }
        }
        return new Long(j11);
    }

    public /* synthetic */ w(int i5, boolean z11) {
        this.f75377a = i5;
    }

    public /* synthetic */ w(Object obj, Object obj2, boolean z11, int i5) {
        this.f75377a = i5;
        this.f75378b = obj;
        this.f75379c = obj2;
    }

    @Override // jf.f
    public int a(long j11) {
        long[] jArr = (long[]) this.f75379c;
        int iB = wf.v.b(jArr, j11, false);
        if (iB < jArr.length) {
            return iB;
        }
        return -1;
    }

    public w(Context context) {
        this.f75377a = 24;
        this.f75378b = context.getSharedPreferences("odt_storage", 0);
        this.f75379c = new a2(9);
    }

    public w(IBinder iBinder) throws RemoteException {
        this.f75377a = 3;
        String interfaceDescriptor = iBinder.getInterfaceDescriptor();
        if (Objects.equals(interfaceDescriptor, "android.os.IMessenger")) {
            this.f75378b = new Messenger(iBinder);
            this.f75379c = null;
        } else if (Objects.equals(interfaceDescriptor, "com.google.android.gms.iid.IMessengerCompat")) {
            this.f75379c = new zzd(iBinder);
            this.f75378b = null;
        } else {
            Log.w("MessengerIpcClient", "Invalid interface descriptor: ".concat(String.valueOf(interfaceDescriptor)));
            throw new RemoteException();
        }
    }

    public w(AppMeasurementSdk appMeasurementSdk, yl.b bVar) {
        this.f75377a = 29;
        this.f75379c = bVar;
        appMeasurementSdk.registerOnMeasurementEventListener(new zl.b(this));
        this.f75378b = new HashSet();
    }

    public w(Function0 dismissKeyboard, e1 isKeyboardVisible) {
        this.f75377a = 13;
        Intrinsics.g(dismissKeyboard, "dismissKeyboard");
        Intrinsics.g(isKeyboardVisible, "isKeyboardVisible");
        this.f75378b = dismissKeyboard;
        this.f75379c = isKeyboardVisible;
    }

    public w(p10.s sVar) {
        this.f75377a = 8;
        o00.d dVar = new o00.d(18);
        this.f75378b = sVar;
        this.f75379c = dVar;
    }

    public w(uv.g gVar, tv.c cVar) {
        this.f75377a = 20;
        uv.f fVar = new uv.f(cVar);
        this.f75378b = gVar;
        this.f75379c = fVar;
    }

    public w(List list) {
        this.f75377a = 19;
        this.f75378b = list;
        this.f75379c = new ke.v[list.size()];
    }

    public w(int i5) {
        this.f75377a = i5;
        switch (i5) {
            case 6:
                o00.d dVar = new o00.d(11);
                o00.d dVar2 = new o00.d(12);
                this.f75378b = dVar;
                this.f75379c = dVar2;
                break;
            case 21:
                this.f75378b = new HashMap();
                break;
            default:
                FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
                i2 i2Var = c0.f.f18784i;
                Float fValueOf = Float.valueOf(0.0f);
                this.f75379c = new c0.n(i2Var, fValueOf, (c0.s) i2Var.f18832a.invoke(fValueOf), Long.MIN_VALUE, Long.MIN_VALUE, false);
                break;
        }
    }

    public w(wf.t tVar) {
        this.f75377a = 18;
        this.f75378b = tVar;
        this.f75379c = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
    }
}
