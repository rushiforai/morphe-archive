package ae;

import ab.b0;
import ab.e0;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Trace;
import android.util.ArrayMap;
import android.util.AtomicFile;
import android.util.SparseBooleanArray;
import android.view.animation.AccelerateInterpolator;
import androidx.compose.ui.node.Owner;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.lifecycle.ProcessLifecycleOwner;
import androidx.work.CoroutineWorker;
import b90.p;
import c3.j0;
import com.android.launcher3.DropTargetBar;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.measurement.v6;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.Stats;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;
import cv.y;
import fz.d0;
import h6.s;
import java.io.DataInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import mx.i0;
import o9.c2;
import o9.n1;
import o9.s1;
import o9.t1;
import q9.q;
import t70.m0;
import x7.u;
import xk.n0;
import ya.x;
import z.c0;

/* loaded from: classes.dex */
public final /* synthetic */ class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12778a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f12779b;

    public /* synthetic */ m(Object obj, int i5) {
        this.f12778a = i5;
        this.f12779b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:148:0x031a  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws SecurityException, IllegalArgumentException {
        AndroidComposeView androidComposeView;
        AndroidComposeView androidComposeView2;
        int i5 = 3;
        Continuation continuation = null;
        int i11 = 1;
        int i12 = 0;
        switch (this.f12778a) {
            case 0:
                x7.h hVar = (x7.h) this.f12779b;
                ((be.k) ((ce.b) hVar.f95140e)).f(new i(hVar, i5));
                return;
            case 1:
                AndroidComposeView.sendHoverExitEvent$lambda$10((AndroidComposeView) this.f12779b);
                return;
            case 2:
                j0 j0Var = (j0) this.f12779b;
                Trace.beginSection("measureAndLayout");
                try {
                    Owner.measureAndLayout$default(j0Var.f19328d, false, 1, null);
                    Unit unit = Unit.f71706a;
                    Trace.endSection();
                    Trace.beginSection("checkForSemanticsChanges");
                    try {
                        j0Var.n();
                        Trace.endSection();
                        j0Var.M = false;
                        return;
                    } finally {
                    }
                } finally {
                }
            case 3:
                com.moloco.sdk.acm.eventprocessing.m.b((com.moloco.sdk.acm.eventprocessing.m) this.f12779b);
                return;
            case 4:
                d2.d dVar = (d2.d) this.f12779b;
                boolean zF = dVar.f();
                AndroidComposeView androidComposeView3 = dVar.f48854a;
                if (zF) {
                    Trace.beginSection("ContentCapture:changeChecker");
                    try {
                        Owner.measureAndLayout$default(androidComposeView3, false, 1, null);
                        c0 c0Var = dVar.f48865l;
                        int[] iArr = c0Var.f97795b;
                        long[] jArr = c0Var.f97794a;
                        int length = jArr.length - 2;
                        if (length >= 0) {
                            int i13 = 0;
                            while (true) {
                                long j11 = jArr[i13];
                                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                    int i14 = 8 - ((~(i13 - length)) >>> 31);
                                    int i15 = i12;
                                    while (i15 < i14) {
                                        if ((255 & j11) < 128) {
                                            int i16 = iArr[(i13 << 3) + i15];
                                            if (dVar.e().a(i16)) {
                                                androidComposeView2 = androidComposeView3;
                                            } else {
                                                androidComposeView2 = androidComposeView3;
                                                dVar.f48857d.add(new d2.e(i16, dVar.f48864k, d2.f.f48872b, null));
                                                dVar.f48861h.j(Unit.f71706a);
                                            }
                                        }
                                        j11 >>= 8;
                                        i15++;
                                        androidComposeView3 = androidComposeView2;
                                    }
                                    androidComposeView = androidComposeView3;
                                    if (i14 == 8) {
                                    }
                                } else {
                                    androidComposeView = androidComposeView3;
                                }
                                if (i13 != length) {
                                    i13++;
                                    androidComposeView3 = androidComposeView;
                                    i12 = 0;
                                }
                            }
                        } else {
                            androidComposeView = androidComposeView3;
                        }
                        Trace.beginSection("ContentCapture:sendAppearEvents");
                        dVar.h(androidComposeView.getSemanticsOwner().a(), dVar.f48866m);
                        Unit unit2 = Unit.f71706a;
                        Trace.endSection();
                        dVar.b(dVar.e());
                        dVar.l();
                        dVar.n = false;
                        return;
                    } catch (Throwable th2) {
                        throw th2;
                    } finally {
                    }
                }
                return;
            case 5:
                p pVar = (p) this.f12779b;
                x xVar = ya.j.f97149d;
                xVar.b(0);
                fa.x xVar2 = (fa.x) fa.x.f54523e.h(((t1) pVar.f17727d).f80132a);
                int i17 = xVar2.f54526c & (-3);
                xVar2.f54526c = i17;
                if (i17 != 0) {
                    return;
                }
                xVar.a(new m(xVar2, 6));
                return;
            case 6:
                fa.x xVar3 = (fa.x) this.f12779b;
                n1 n1Var = (n1) ((o9.k) ((WeakReference) n1.C0.f71629a).get());
                if (n1Var == null) {
                    return;
                }
                xVar3.a();
                if (xVar3.f54527d.isEmpty()) {
                    return;
                }
                List list = (List) xVar3.f54527d.stream().map(new b0(xVar3, i11)).collect(Collectors.toList());
                if (!list.isEmpty()) {
                    c2 c2Var = n1Var.f80001b0;
                    for (fa.p pVar2 : c2Var.f()) {
                        pVar2.L();
                    }
                    c2Var.c(new fa.b(list, i12));
                }
                xVar3.f54527d.clear();
                v6 v6Var = xVar3.f54524a;
                Context context = xVar3.f54525b;
                v6Var.getClass();
                new AtomicFile(context.getFileStreamPath((String) v6Var.f33136b)).delete();
                return;
            case 7:
                ((vm.c) this.f12779b).getClass();
                return;
            case 8:
                ProcessLifecycleOwner processLifecycleOwner = (ProcessLifecycleOwner) this.f12779b;
                h6.c0 c0Var2 = processLifecycleOwner.f14729b;
                processLifecycleOwner.f14728a = true;
                c0Var2.f(s.ON_PAUSE);
                if (processLifecycleOwner.f14728a) {
                    c0Var2.f(s.ON_STOP);
                    return;
                }
                return;
            case 9:
                WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) this.f12779b;
                int i18 = WorkspacePageIndicator.n;
                workspacePageIndicator.d(0);
                return;
            case 10:
                try {
                    ((u) this.f12779b).j();
                    return;
                } catch (Exception unused) {
                    return;
                }
            case 11:
                NovaAppDrawerSearchBar novaAppDrawerSearchBar = (NovaAppDrawerSearchBar) this.f12779b;
                AllAppsContainerView allAppsContainerView = novaAppDrawerSearchBar.f45805q;
                if (allAppsContainerView == null) {
                    Intrinsics.m("mAppsView");
                    throw null;
                }
                allAppsContainerView.u(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                m0.t(novaAppDrawerSearchBar.f45804p, null, null, new y(novaAppDrawerSearchBar, continuation, 25), 3);
                return;
            case 12:
                PredictionRowView predictionRowView = (PredictionRowView) this.f12779b;
                lz.e eVar = PredictionRowView.B;
                predictionRowView.m();
                return;
            case 13:
                if (((i0) this.f12779b).f77118a.get() != 0) {
                    return;
                }
                mc0.d.f76206a.n("No activities, exiting", new Object[0]);
                System.exit(0);
                throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
            case 14:
                Stats stats = (Stats) this.f12779b;
                synchronized (stats.f45678e) {
                    stats.f45677d = n0.c();
                    stats.f45676c = new HashMap(100);
                    try {
                        try {
                            DataInputStream dataInputStream = new DataInputStream(stats.f45674a.openFileInput("stats.log"));
                            try {
                                if (dataInputStream.readInt() == 2) {
                                    int i19 = dataInputStream.readInt();
                                    long jCurrentTimeMillis = System.currentTimeMillis();
                                    while (i12 < i19) {
                                        String utf = dataInputStream.readUTF();
                                        int i21 = dataInputStream.readInt();
                                        long jMin = Math.min(dataInputStream.readLong(), jCurrentTimeMillis);
                                        ComponentKey componentKeyA = e0.a(stats.f45674a, utf);
                                        if (componentKeyA != null && 604800000 + jMin >= jCurrentTimeMillis) {
                                            stats.f45677d.b(i21, componentKeyA);
                                            stats.f45676c.put(componentKeyA, Long.valueOf(jMin));
                                        }
                                        i12++;
                                    }
                                }
                                dataInputStream.close();
                                stats.f45675b = true;
                            } finally {
                            }
                        } catch (Throwable th3) {
                            stats.f45675b = true;
                            stats.f45678e.notifyAll();
                            throw th3;
                        }
                    } catch (FileNotFoundException unused2) {
                        stats.f45675b = true;
                    } catch (IOException unused3) {
                        stats.f45675b = true;
                    }
                    stats.f45678e.notifyAll();
                }
                return;
            case 15:
                CoroutineWorker.b((CoroutineWorker) this.f12779b);
                return;
            case 16:
                DropTargetBar dropTargetBar = (DropTargetBar) this.f12779b;
                AccelerateInterpolator accelerateInterpolator = DropTargetBar.f20949g;
                s9.a.a(dropTargetBar);
                return;
            case 17:
                ((AnimatorSet) this.f12779b).start();
                return;
            case 18:
                ya.n0 n0Var = (ya.n0) this.f12779b;
                n0Var.f97178e = true;
                Workspace workspace = n0Var.f97176c;
                if (workspace != null) {
                    workspace.post(n0Var);
                    return;
                }
                return;
            case 19:
                ja.c cVar = (ja.c) this.f12779b;
                if (Build.VERSION.SDK_INT < 29) {
                    cVar.f69280d.unregisterSessionCallback(cVar);
                    return;
                } else {
                    cVar.f69281e.unregisterPackageInstallerSessionCallback(cVar);
                    return;
                }
            case 20:
                d0 d0Var = (d0) this.f12779b;
                d0Var.H();
                new ArrayMap();
                new SparseBooleanArray();
                HashMap map = new HashMap();
                d0Var.f559e.removeCallbacksAndMessages(ba.h.f17757f);
                for (PackageInfo packageInfo : d0Var.f557c.getInstalledPackages(UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                    map.put(packageInfo.packageName, packageInfo);
                }
                d0Var.f561g.f17739a.close();
                return;
            case 21:
                ((c2) this.f12779b).d();
                return;
            case 22:
                ((ja.g) this.f12779b).close();
                return;
            case 23:
                ((aa.e0) this.f12779b).close();
                return;
            case 24:
                ((s1) this.f12779b).b();
                return;
            case 25:
                ((fa.p) this.f12779b).F();
                return;
            case 26:
                try {
                    ox.u.c((Context) this.f12779b);
                    return;
                } catch (Throwable th4) {
                    mc0.d.f76206a.f(th4, "NovaAds: Ad SDK initialization failed", new Object[0]);
                    ox.u.f81113b.X(Boolean.FALSE);
                    return;
                }
            case 27:
                try {
                    return;
                } catch (Exception unused4) {
                    return;
                }
            case 28:
                AllAppsContainerView allAppsContainerView2 = (AllAppsContainerView) this.f12779b;
                ca.c cVar2 = AllAppsContainerView.U;
                if (allAppsContainerView2.g() != null) {
                    allAppsContainerView2.g().a();
                    return;
                }
                return;
            default:
                ((q) this.f12779b).a();
                return;
        }
    }
}
