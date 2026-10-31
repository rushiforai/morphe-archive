package o7;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import androidx.appcompat.widget.SearchView$SearchAutoComplete;
import androidx.appcompat.widget.Toolbar;
import androidx.biometric.FingerprintDialogFragment;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceFragmentCompat;
import androidx.recyclerview.widget.RecyclerView;
import androidx.work.Worker;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.bytedance.sdk.openadsdk.core.syc.dj.sya;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.tesladirect.ChangeLogDialog;
import com.vungle.ads.internal.protos.Sdk;
import gf.l0;
import gf.s0;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import kl.q0;
import o9.l2;
import o9.n1;
import org.json.JSONException;
import org.json.JSONObject;
import r.g1;
import s90.a1;
import s90.o0;
import s90.p0;
import sp.k0;
import sp.m0;
import sp.r0;

/* loaded from: classes2.dex */
public final class g0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79667a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f79668b;

    public /* synthetic */ g0(Object obj, int i5) {
        this.f79667a = i5;
        this.f79668b = obj;
    }

    public static g0 d(ViewGroup viewGroup) {
        if (ps.f.i(viewGroup.getContext())) {
            return new g0(viewGroup, 6);
        }
        return null;
    }

    public void a(String str) {
        ViewGroup viewGroup = (ViewGroup) this.f79668b;
        viewGroup.setContentDescription(str);
        viewGroup.removeCallbacks(this);
        viewGroup.postDelayed(this, 200L);
    }

    public void b() {
        ((ViewGroup) this.f79668b).removeCallbacks(this);
    }

    public void c() {
        b();
        Context context = ((ViewGroup) this.f79668b).getContext();
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(context);
        novaLauncher.P.announceForAccessibility(novaLauncher.getText(2132018077));
    }

    /* JADX WARN: Removed duplicated region for block: B:148:0x03c4 A[Catch: all -> 0x03dd, TryCatch #18 {all -> 0x03dd, blocks: (B:145:0x0395, B:146:0x03c1, B:148:0x03c4, B:150:0x03d7, B:153:0x03e0, B:154:0x03e5, B:156:0x0401, B:158:0x040e, B:159:0x0417, B:161:0x0434, B:163:0x0439, B:167:0x0455, B:188:0x04aa, B:185:0x04a1, B:192:0x04b4, B:193:0x04b9, B:144:0x0390, B:141:0x0384, B:187:0x04a5, B:164:0x0447, B:170:0x0466, B:181:0x049b), top: B:300:0x0384, inners: #10, #11, #14, #19 }] */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0401 A[Catch: all -> 0x03dd, TryCatch #18 {all -> 0x03dd, blocks: (B:145:0x0395, B:146:0x03c1, B:148:0x03c4, B:150:0x03d7, B:153:0x03e0, B:154:0x03e5, B:156:0x0401, B:158:0x040e, B:159:0x0417, B:161:0x0434, B:163:0x0439, B:167:0x0455, B:188:0x04aa, B:185:0x04a1, B:192:0x04b4, B:193:0x04b9, B:144:0x0390, B:141:0x0384, B:187:0x04a5, B:164:0x0447, B:170:0x0466, B:181:0x049b), top: B:300:0x0384, inners: #10, #11, #14, #19 }] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        String[] strArr;
        int i5;
        Semaphore semaphore;
        AtomicInteger atomicInteger;
        int length;
        int i11;
        int i12;
        String[] strArr2;
        AtomicInteger atomicInteger2;
        boolean zA;
        int i13 = 1;
        switch (this.f79667a) {
            case 0:
                Worker worker = (Worker) this.f79668b;
                try {
                    worker.f15318f.j(worker.b());
                    return;
                } catch (Throwable th2) {
                    worker.f15318f.k(th2);
                    return;
                }
            case 1:
                if (o80.i.f()) {
                    return;
                }
                o80.i.d(((o80.d) this.f79668b).f79720a, null);
                return;
            case 2:
                ((n1) this.f79668b).M.g(l2.f79974m);
                return;
            case 3:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) this.f79668b;
                launcherWallpaperPickerActivity.h0(0, 0);
                launcherWallpaperPickerActivity.setResult(-1);
                launcherWallpaperPickerActivity.finish();
                return;
            case 4:
                ((LauncherWallpaperPickerActivity) ((c10.a) this.f79668b).f19149c).f20978w.setVisibility(4);
                return;
            case 5:
                if (((fi.j) this.f79668b).b(new IOException("TIMEOUT"))) {
                    Log.w("Rpc", "No response");
                    return;
                }
                return;
            case 6:
                ((ViewGroup) this.f79668b).sendAccessibilityEvent(4);
                return;
            case 7:
                pb0.a aVar = (pb0.a) this.f79668b;
                ConcurrentLinkedQueue concurrentLinkedQueue = aVar.f82497c;
                if (concurrentLinkedQueue.isEmpty()) {
                    return;
                }
                long jNanoTime = System.nanoTime();
                Iterator it = concurrentLinkedQueue.iterator();
                while (it.hasNext()) {
                    pb0.c cVar = (pb0.c) it.next();
                    if (cVar.f82505i > jNanoTime) {
                        return;
                    }
                    if (concurrentLinkedQueue.remove(cVar)) {
                        aVar.f82498d.d(cVar);
                    }
                }
                return;
            case 8:
                g1 g1Var = (g1) this.f79668b;
                g1Var.f84720l = null;
                g1Var.drawableStateChanged();
                return;
            case 9:
                SearchView$SearchAutoComplete searchView$SearchAutoComplete = (SearchView$SearchAutoComplete) this.f79668b;
                if (searchView$SearchAutoComplete.f13774f) {
                    ((InputMethodManager) searchView$SearchAutoComplete.getContext().getSystemService("input_method")).showSoftInput(searchView$SearchAutoComplete, 0);
                    searchView$SearchAutoComplete.f13774f = false;
                    return;
                }
                return;
            case 10:
                ((Toolbar) this.f79668b).C();
                return;
            case 11:
                ((r5.d) this.f79668b).n(0);
                return;
            case 12:
                RecyclerView recyclerView = ((PreferenceFragment) this.f79668b).f14799c;
                recyclerView.focusableViewAvailable(recyclerView);
                return;
            case 13:
                RecyclerView recyclerView2 = ((PreferenceFragmentCompat) this.f79668b).f14806c;
                recyclerView2.focusableViewAvailable(recyclerView2);
                return;
            case 14:
                ((rg.p) this.f79668b).a();
                return;
            case 15:
                rg.p pVar = (rg.p) ((q.c) this.f79668b).f83189b;
                ((sg.e) pVar.f85904b).disconnect(pVar.f85904b.getClass().getName().concat(" disconnecting because it was signed out."));
                return;
            case 16:
                ((rg.x) this.f79668b).f85940h.j(new ConnectionResult(4, null, null));
                return;
            case 17:
                a1 a1Var = (a1) this.f79668b;
                a1Var.f86865m = a1Var.f86866p;
                a1Var.f86866p = null;
                a1Var.d("fireOpenConnection", new o0(a1Var, new p0(a1Var, i13), 2));
                return;
            case 18:
                try {
                    m0 m0Var = (m0) this.f79668b;
                    if (m0Var != null && m0Var.f87619d == null) {
                        int i14 = sp.d.f87572b;
                    } else {
                        int i15 = sp.d.f87572b;
                    }
                    return;
                } catch (Throwable th3) {
                    int i16 = sp.d.f87572b;
                    r0.c(th3);
                    return;
                }
            case 19:
                try {
                    ai.r0 r0Var = (ai.r0) this.f79668b;
                    ((sp.n) ((g0) r0Var.f13274g).f79668b).f87637h.remove(r0Var.f13271d);
                    ai.r0 r0Var2 = (ai.r0) this.f79668b;
                    sp.o oVar = ((sp.n) ((g0) r0Var2.f13274g).f79668b).f87638i;
                    String str = r0Var2.f13271d;
                    synchronized (oVar) {
                        int i17 = sp.o.f87641c;
                        oVar.f87642a.a(str);
                    }
                    ((AtomicInteger) ((ai.r0) this.f79668b).f13273f).incrementAndGet();
                } finally {
                    try {
                        return;
                    } finally {
                    }
                }
                return;
            case 20:
                sp.n nVar = (sp.n) this.f79668b;
                try {
                    try {
                        nVar.f87631b.acquire();
                        nVar.f87630a.acquire();
                    } finally {
                        sp.n nVar2 = sp.n.f87629j;
                        r0.c(th);
                        nVar.f87633d = nVar.f87638i.a();
                        nVar.f87630a.release();
                        sp.n nVar3 = sp.n.f87629j;
                        nVar.f87637h.size();
                        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
                        strArr = (String[]) nVar.f87637h.keySet().toArray(new String[0]);
                        LinkedList linkedList = new LinkedList();
                        while (i5 < strArr.length) {
                        }
                        String[] strArr3 = (String[]) linkedList.toArray(new String[0]);
                        semaphore = new Semaphore(0, true);
                        atomicInteger = new AtomicInteger(0);
                        AtomicInteger atomicInteger3 = new AtomicInteger(0);
                        length = strArr3.length;
                        i11 = 0;
                        while (i11 < length) {
                        }
                        AtomicInteger atomicInteger4 = atomicInteger3;
                        semaphore.tryAcquire(atomicInteger4.get(), 60L, TimeUnit.SECONDS);
                        i12 = atomicInteger4.get();
                        int i18 = atomicInteger.get();
                        if (i12 != 0) {
                            try {
                                long jO = r0.f87657d.o();
                                try {
                                    SharedPreferences.Editor editorEdit = nVar.f87632c.getSharedPreferences("batch_send_id", 0).edit();
                                    editorEdit.putLong("pref-admon-last-flush-timestmap", jO);
                                    editorEdit.commit();
                                } catch (Throwable th4) {
                                    r0.c(th4);
                                }
                            } catch (Throwable th5) {
                                r0.c(th5);
                            }
                        }
                        nVar.f87631b.release();
                        return;
                    }
                    nVar.f87633d = nVar.f87638i.a();
                    nVar.f87630a.release();
                    sp.n nVar32 = sp.n.f87629j;
                    nVar.f87637h.size();
                    ExecutorService executorServiceNewSingleThreadExecutor2 = Executors.newSingleThreadExecutor();
                    strArr = (String[]) nVar.f87637h.keySet().toArray(new String[0]);
                    LinkedList linkedList2 = new LinkedList();
                    for (i5 = 0; i5 < strArr.length; i5++) {
                        if (new JSONObject(strArr[i5]).getLong("send_id") < nVar.f87633d) {
                            linkedList2.add(strArr[i5]);
                        }
                    }
                    String[] strArr32 = (String[]) linkedList2.toArray(new String[0]);
                    semaphore = new Semaphore(0, true);
                    atomicInteger = new AtomicInteger(0);
                    AtomicInteger atomicInteger32 = new AtomicInteger(0);
                    length = strArr32.length;
                    i11 = 0;
                    while (i11 < length) {
                        String str2 = strArr32[i11];
                        sp.l lVar = (sp.l) nVar.f87637h.get(str2);
                        if (lVar == null) {
                            sp.n nVar4 = sp.n.f87629j;
                            strArr2 = strArr32;
                            atomicInteger2 = atomicInteger32;
                        } else {
                            atomicInteger32.incrementAndGet();
                            strArr2 = strArr32;
                            atomicInteger2 = atomicInteger32;
                            long j11 = nVar.f87632c.getSharedPreferences("batch_send_id", 0).getLong("pref-admon-last-flush-timestmap", 0L);
                            lVar.put("tsls", String.valueOf(j11 > 0 ? r0.f87657d.o() - j11 : 0L));
                            sp.n nVar5 = sp.n.f87629j;
                            lVar.toString();
                            try {
                                Executors.newSingleThreadExecutor().execute(new ai.r0(this, lVar, str2, executorServiceNewSingleThreadExecutor2, atomicInteger, semaphore));
                            } catch (Throwable th6) {
                                sp.n nVar6 = sp.n.f87629j;
                                r0.c(th6);
                                semaphore.release();
                            }
                        }
                        i11++;
                        strArr32 = strArr2;
                        atomicInteger32 = atomicInteger2;
                    }
                    AtomicInteger atomicInteger42 = atomicInteger32;
                    try {
                        semaphore.tryAcquire(atomicInteger42.get(), 60L, TimeUnit.SECONDS);
                        i12 = atomicInteger42.get();
                        int i182 = atomicInteger.get();
                        if (i12 != 0 && i182 == i12) {
                            long jO2 = r0.f87657d.o();
                            SharedPreferences.Editor editorEdit2 = nVar.f87632c.getSharedPreferences("batch_send_id", 0).edit();
                            editorEdit2.putLong("pref-admon-last-flush-timestmap", jO2);
                            editorEdit2.commit();
                        }
                    } finally {
                        try {
                        } catch (Throwable th7) {
                        }
                    }
                    nVar.f87631b.release();
                } catch (Throwable th8) {
                    try {
                    } finally {
                        nVar.f87630a.release();
                    }
                }
                return;
            case 21:
                ai.j jVar = (ai.j) this.f79668b;
                sp.k kVar = new sp.k(jVar.f13021c);
                m0 m0Var2 = m0.f87615q;
                int i19 = sp.c.f87570a;
                long j12 = m0Var2.f87620e.f87602c;
                sp.c cVar2 = new sp.c();
                cVar2.put("n", (String) jVar.f13020b);
                String string = (String) jVar.f13022d;
                try {
                    if (r0.l(string)) {
                        string = new JSONObject().put("is_revenue_event", false).toString();
                    } else {
                        JSONObject jSONObject = new JSONObject(string);
                        String str3 = sp.r.f87652c;
                        if (jSONObject.has(str3)) {
                            Object objOpt = jSONObject.opt(str3);
                            if (objOpt instanceof Boolean) {
                                s60.b bVar = new s60.b();
                                bVar.put("limit_data_sharing", (Boolean) objOpt);
                                cVar2.put("data_sharing_options", new JSONObject(bVar).toString());
                            } else if (objOpt != null && objOpt != JSONObject.NULL) {
                                int i21 = sp.k.f87599b;
                            }
                            jSONObject.remove(str3);
                            string = jSONObject.toString();
                        }
                        if (!jSONObject.optBoolean("is_revenue_event", false)) {
                            jSONObject.put("is_revenue_event", false);
                            string = jSONObject.toString();
                        }
                    }
                    cVar2.put("e", string);
                } catch (JSONException e3) {
                    m0.a("e15");
                    int i22 = sp.k.f87599b;
                    r0.c(e3);
                } catch (Throwable th9) {
                    m0.a("e120");
                    int i23 = sp.k.f87599b;
                    r0.c(th9);
                }
                cVar2.put("t", String.valueOf((r3 - j12) * 0.001d));
                cVar2.put("s", String.valueOf(j12));
                k0 k0Var = m0Var2.f87620e;
                long j13 = k0Var.f87604e + 1;
                k0Var.f87604e = j13;
                cVar2.put("seq", String.valueOf(j13));
                cVar2.put("a", m0Var2.f87619d.f86132a);
                cVar2.e(m0Var2, false);
                cVar2.put("av", m0Var2.f87621f.f87672j);
                cVar2.put("sdk", m0Var2.f87621f.f87679s);
                cVar2.put("custom_user_id", m0Var2.f87621f.D);
                kVar.putAll(cVar2);
                if (!kVar.f() || sp.n.b() == null) {
                    m0.f87615q.f87617b.a(kVar);
                    return;
                }
                sp.n nVarB = sp.n.b();
                nVarB.getClass();
                sp.n nVar7 = sp.n.f87629j;
                sp.h0 h0Var = sp.p.b().f87645a;
                boolean zE = h0Var != null ? h0Var.e() : sp.h0.a().e();
                sp.h0 h0Var2 = sp.p.b().f87645a;
                boolean zD = h0Var2 != null ? h0Var2.d() : sp.h0.a().d();
                if (zE && zD && kVar.f()) {
                    try {
                        sp.l lVarD = sp.l.d(kVar.h());
                        nVarB.f87635f.getClass();
                        m0.f87615q.f87617b.a(lVarD);
                    } catch (Throwable unused) {
                    }
                }
                try {
                    Executors.newSingleThreadExecutor().execute(new sp.m(nVarB, kVar, zE, zD));
                    return;
                } catch (Throwable th10) {
                    r0.c(th10);
                    return;
                }
            case 22:
                m0.f87615q.f87617b.a((sp.f) this.f79668b);
                return;
            case 23:
                WeakReference weakReference = (WeakReference) this.f79668b;
                if (weakReference.get() != null) {
                    ((v.d) weakReference.get()).getClass();
                    return;
                }
                return;
            case 24:
                FingerprintDialogFragment fingerprintDialogFragment = (FingerprintDialogFragment) this.f79668b;
                Context context = fingerprintDialogFragment.getContext();
                if (context == null) {
                    Log.w("FingerprintFragment", "Not resetting the dialog. Context is null.");
                    return;
                } else {
                    fingerprintDialogFragment.f13843c.f(1);
                    fingerprintDialogFragment.f13843c.e(context.getString(2132017876));
                    return;
                }
            case 25:
                l0 l0Var = (l0) ((vf.a0) this.f79668b);
                for (s0 s0Var : l0Var.f57557r) {
                    s0Var.l(true);
                    je.f fVar = s0Var.f57623h;
                    if (fVar != null) {
                        fVar.t(s0Var.f57620e);
                        s0Var.f57623h = null;
                        s0Var.f57622g = null;
                    }
                }
                fl.l lVar2 = l0Var.f57552k;
                ke.j jVar2 = (ke.j) lVar2.f55374b;
                if (jVar2 != null) {
                    jVar2.release();
                    lVar2.f55374b = null;
                }
                lVar2.f55375c = null;
                return;
            case 26:
                sya syaVar = (sya) this.f79668b;
                if (((wb.d) syaVar).f94144jc == null) {
                    return;
                }
                long jPmi = syaVar.pmi();
                if (jPmi > 0 && syaVar.lt() && ((wb.d) syaVar).f94150uh != Long.MIN_VALUE) {
                    try {
                        if (((wb.d) syaVar).f94150uh == jPmi) {
                            if (!((wb.d) syaVar).wie && ((wb.d) syaVar).htf >= 400) {
                                syaVar.i(Sdk.SDKError.Reason.DOH_FETCH_FAILED_VALUE);
                                ((wb.d) syaVar).wie = true;
                            }
                            ((wb.d) syaVar).htf += ((wb.d) syaVar).aeu;
                        } else {
                            if (((wb.d) syaVar).wie) {
                                ((wb.d) syaVar).pmi += ((wb.d) syaVar).htf;
                                syaVar.i(702);
                                long unused2 = ((wb.d) syaVar).pmi;
                                int unused3 = ((wb.d) syaVar).f94151ul;
                            }
                            ((wb.d) syaVar).htf = 0L;
                            ((wb.d) syaVar).wie = false;
                        }
                    } catch (Throwable th11) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th11, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7Q==", "Sfsj", 160);
                        th11.getMessage();
                    }
                }
                if (syaVar.wie() > 0) {
                    if (((wb.d) syaVar).f94150uh != jPmi) {
                        wb.d.ycx(syaVar, jPmi, syaVar.wie());
                    }
                    ((wb.d) syaVar).f94150uh = jPmi;
                }
                if (syaVar.zb()) {
                    wb.d.ycx(syaVar, syaVar.wie(), syaVar.wie());
                    return;
                } else {
                    if (((wb.d) syaVar).f94141dy != null) {
                        ((wb.d) syaVar).f94141dy.postDelayed(this, ((wb.d) syaVar).aeu);
                        return;
                    }
                    return;
                }
            case 27:
                xm.l lVar3 = (xm.l) this.f79668b;
                synchronized (lVar3) {
                    zA = lVar3.a();
                    if (zA) {
                        synchronized (lVar3) {
                            lVar3.f96147b = true;
                        }
                    }
                }
                if (zA) {
                    xm.m mVarH = lVar3.f96159p.h();
                    lVar3.o.getClass();
                    if (new Date(System.currentTimeMillis()).before(mVarH.f96163c)) {
                        lVar3.h();
                        return;
                    }
                    om.d dVar = (om.d) lVar3.f96155j;
                    fi.t tVarE = dVar.e();
                    fi.t tVarC = dVar.c();
                    Task taskK = Tasks.f(tVarE, tVarC).k(lVar3.f96152g, new be.f(13, lVar3, tVarE, tVarC));
                    Tasks.f(taskK).i(lVar3.f96152g, new q10.d(12, lVar3, taskK));
                    return;
                }
                return;
            case 28:
                ChangeLogDialog changeLogDialog = (ChangeLogDialog) this.f79668b;
                if (changeLogDialog.f46518u) {
                    return;
                }
                changeLogDialog.f46517t.f92370l.setVisibility(0);
                return;
            default:
                og.i iVar = (og.i) this.f79668b;
                ChangeLogDialog changeLogDialog2 = (ChangeLogDialog) iVar.f80413c;
                changeLogDialog2.f46517t.f92365g.setText(changeLogDialog2.getString(2132018093, "Unknown"));
                ((ChangeLogDialog) iVar.f80413c).f46517t.f92362d.setText(2132017620);
                ChangeLogDialog changeLogDialog3 = (ChangeLogDialog) iVar.f80413c;
                changeLogDialog3.f46518u = false;
                changeLogDialog3.f46517t.f92370l.setVisibility(8);
                return;
        }
    }

    public g0(v.d dVar) {
        this.f79667a = 23;
        this.f79668b = new WeakReference(dVar);
    }
}
