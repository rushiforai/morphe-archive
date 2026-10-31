package o9;

import android.animation.ValueAnimator;
import android.content.SharedPreferences;
import android.graphics.SurfaceTexture;
import android.location.Location;
import android.os.CancellationSignal;
import android.os.Trace;
import android.util.Log;
import android.view.Surface;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import com.android.launcher3.CellLayout;
import com.android.launcher3.Workspace;
import com.android.launcher3.views.FloatingIconView;
import com.android.launcher3.views.FloatingSurfaceView;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.search.AppSearchFloatingView;
import io.branch.search.internal.C3160g4;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.concurrent.RejectedExecutionException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final /* synthetic */ class d4 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79811a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f79812b;

    public /* synthetic */ d4(Object obj, int i5) {
        this.f79811a = i5;
        this.f79812b = obj;
    }

    private final void a() {
        we.e eVar = (we.e) this.f79812b;
        synchronized (eVar.f94226a) {
            try {
                if (eVar.f94237l) {
                    return;
                }
                long j11 = eVar.f94236k - 1;
                eVar.f94236k = j11;
                if (j11 > 0) {
                    return;
                }
                if (j11 >= 0) {
                    eVar.a();
                    return;
                }
                IllegalStateException illegalStateException = new IllegalStateException();
                synchronized (eVar.f94226a) {
                    eVar.f94238m = illegalStateException;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r1v18, types: [java.lang.Object, kotlin.Lazy] */
    @Override // java.lang.Runnable
    public final void run() {
        View viewFindFocus;
        switch (this.f79811a) {
            case 0:
                ((Workspace) ((fz.i0) this.f79812b).f56262e).T0();
                return;
            case 1:
                g2.s.c((g2.s) this.f79812b);
                return;
            case 2:
                ((n0.w) this.f79812b).invoke();
                return;
            case 3:
                AppSearchFloatingView appSearchFloatingView = (AppSearchFloatingView) this.f79812b;
                r10.g gVar = AppSearchFloatingView.f46165m;
                appSearchFloatingView.Y();
                return;
            case 4:
                r3.c0 c0Var = (r3.c0) this.f79812b;
                i50.c cVar = c0Var.f85406b;
                c0Var.n = null;
                r1.e eVar = c0Var.f85417m;
                View view = c0Var.f85405a;
                if (!view.isFocused() && (viewFindFocus = view.getRootView().findFocus()) != null && viewFindFocus.onCheckIsTextEditor()) {
                    eVar.g();
                    return;
                }
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                Object[] objArr = eVar.f85077a;
                int i5 = eVar.f85079c;
                for (int i11 = 0; i11 < i5; i11++) {
                    r3.b0 b0Var = (r3.b0) objArr[i11];
                    int iOrdinal = b0Var.ordinal();
                    if (iOrdinal == 0) {
                        Boolean bool = Boolean.TRUE;
                        objectRef.f71863a = bool;
                        objectRef2.f71863a = bool;
                    } else if (iOrdinal == 1) {
                        Boolean bool2 = Boolean.FALSE;
                        objectRef.f71863a = bool2;
                        objectRef2.f71863a = bool2;
                    } else {
                        if (iOrdinal != 2 && iOrdinal != 3) {
                            throw new NoWhenBranchMatchedException();
                        }
                        if (!Intrinsics.b(objectRef.f71863a, Boolean.FALSE)) {
                            objectRef2.f71863a = Boolean.valueOf(b0Var == r3.b0.f85398c);
                        }
                    }
                }
                eVar.g();
                if (Intrinsics.b(objectRef.f71863a, Boolean.TRUE)) {
                    ((InputMethodManager) cVar.f61380c.getValue()).restartInput((View) cVar.f61379b);
                }
                Boolean bool3 = (Boolean) objectRef2.f71863a;
                if (bool3 != null) {
                    if (bool3.booleanValue()) {
                        ((a5.e0) ((v6) cVar.f61381d).f33136b).b();
                    } else {
                        ((a5.e0) ((v6) cVar.f61381d).f33136b).a();
                    }
                }
                if (Intrinsics.b(objectRef.f71863a, Boolean.FALSE)) {
                    ((InputMethodManager) cVar.f61380c.getValue()).restartInput((View) cVar.f61379b);
                    return;
                }
                return;
            case 5:
                ((s90.n0) this.f79812b).f86989h++;
                return;
            case 6:
                s90.r0 r0Var = (s90.r0) this.f79812b;
                p90.a.a("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnFallbackExecutor  onFailed running callback");
                try {
                    r0Var.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th2) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            case 7:
                s90.x0 x0Var = (s90.x0) this.f79812b;
                try {
                    x0Var.f87058d.f86871u.f(r1.f86870t, x0Var.a());
                    return;
                } catch (RuntimeException e3) {
                    Log.i("a1", "Error while trying to log CronetTrafficInfo: ", e3);
                    return;
                }
            case 8:
                s90.z0 z0Var = (s90.z0) this.f79812b;
                synchronized (z0Var.f87082c) {
                    try {
                        if (z0Var.f87083d) {
                            return;
                        }
                        Runnable runnable = (Runnable) z0Var.f87082c.pollFirst();
                        z0Var.f87083d = runnable != null;
                        while (runnable != null) {
                            try {
                                runnable.run();
                                synchronized (z0Var.f87082c) {
                                    runnable = (Runnable) z0Var.f87082c.pollFirst();
                                    z0Var.f87083d = runnable != null;
                                }
                            } catch (Throwable th4) {
                                synchronized (z0Var.f87082c) {
                                    z0Var.f87083d = false;
                                    try {
                                        z0Var.f87080a.execute(z0Var.f87081b);
                                    } catch (RejectedExecutionException unused) {
                                    }
                                    throw th4;
                                }
                            }
                        }
                        return;
                    } finally {
                    }
                }
            case 9:
                bn.s0 s0Var = (bn.s0) this.f79812b;
                synchronized (((ArrayDeque) s0Var.f18282e)) {
                    SharedPreferences.Editor editorEdit = ((SharedPreferences) s0Var.f18279b).edit();
                    String str = (String) s0Var.f18280c;
                    StringBuilder sb2 = new StringBuilder();
                    Iterator it = ((ArrayDeque) s0Var.f18282e).iterator();
                    while (it.hasNext()) {
                        sb2.append((String) it.next());
                        sb2.append((String) s0Var.f18281d);
                    }
                    editorEdit.putString(str, sb2.toString()).apply();
                }
                return;
            case 10:
                tm.z zVar = (tm.z) this.f79812b;
                Log.w("FirebaseMessaging", "Service took too long to process intent: " + zVar.f89539a.getAction() + " finishing.");
                zVar.f89540b.c(null);
                return;
            case 11:
                u4.a aVar = (u4.a) this.f79812b;
                aVar.f90551f = null;
                aVar.onLocationChanged((Location) null);
                return;
            case 12:
                ((uf.d) this.f79812b).f(false);
                return;
            case 13:
                ((uf.m) this.f79812b).m();
                return;
            case 14:
                a();
                return;
            case 15:
                x9.b bVar = (x9.b) this.f79812b;
                n1 n1Var = bVar.f95639e;
                if (n1Var != null) {
                    sa.b bVar2 = n1Var.f80013n0;
                    if (bVar2.f87088d != 0) {
                        bVar2.f87088d = 0;
                        bVar2.a();
                    }
                    bVar.f95639e.P.setOnDragListener(null);
                    return;
                }
                return;
            case 16:
                ((ValueAnimator) this.f79812b).start();
                return;
            case 17:
                ((x9.t) this.f79812b).d();
                return;
            case 18:
                y9.y yVar = (y9.y) this.f79812b;
                CellLayout cellLayout = yVar.f96987p;
                if (cellLayout != null) {
                    cellLayout.f20910p.remove(yVar);
                }
                yVar.f96987p = null;
                yVar.f96988q = false;
                yVar.i();
                return;
            case 19:
                ya.m mVar = (ya.m) this.f79812b;
                mVar.f97157b.M.h(l2.f79974m);
                mVar.f97156a.d(mVar.f97158c);
                return;
            case 20:
                yf.k kVar = (yf.k) this.f79812b;
                Surface surface = kVar.f97300h;
                if (surface != null) {
                    Iterator it2 = kVar.f97293a.iterator();
                    while (it2.hasNext()) {
                        ((fe.x) it2.next()).f55061a.l0(null);
                    }
                }
                SurfaceTexture surfaceTexture = kVar.f97299g;
                if (surfaceTexture != null) {
                    surfaceTexture.release();
                }
                if (surface != null) {
                    surface.release();
                }
                kVar.f97299g = null;
                kVar.f97300h = null;
                return;
            case 21:
                ((yi.d) this.f79812b).d(0);
                return;
            case 22:
                ((C3160g4) this.f79812b).b();
                return;
            case 23:
                FloatingIconView floatingIconView = (FloatingIconView) this.f79812b;
                CancellationSignal cancellationSignal = floatingIconView.f21263b;
                if (cancellationSignal != null) {
                    cancellationSignal.cancel();
                    floatingIconView.f21263b = null;
                }
                s90.r0 r0Var2 = floatingIconView.f21262a;
                if (r0Var2 != null) {
                    r0Var2.run();
                    floatingIconView.f21262a = null;
                    return;
                }
                return;
            default:
                FloatingSurfaceView floatingSurfaceView = (FloatingSurfaceView) this.f79812b;
                FloatingSurfaceView floatingSurfaceView2 = FloatingSurfaceView.f21275l;
                floatingSurfaceView.W();
                return;
        }
    }
}
