package defpackage;

import android.animation.ValueAnimator;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.animation.AnimationUtils;
import android.view.inputmethod.InputMethodManager;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.SearchView$SearchAutoComplete;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.lyft.kronos.internal.ntp.NTPSyncException;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import com.medium.android.graphql.fragment.ParagraphData;
import j$.util.Objects;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jn implements Runnable {
    public final /* synthetic */ int a;
    public Object b;

    public jn(qif qifVar, ad adVar) {
        this.a = 22;
        Objects.requireNonNull(qifVar);
        this.b = adVar;
    }

    private final void a() {
        Object obj;
        synchronized (((g57) this.b).a) {
            obj = ((g57) this.b).f;
            ((g57) this.b).f = g57.k;
        }
        ((g57) this.b).j(obj);
    }

    private final void b() {
        ufd ufdVarB;
        long jNanoTime;
        ufd ufdVarB2;
        cgd cgdVar = (cgd) this.b;
        synchronized (cgdVar) {
            cgdVar.g++;
            ufdVarB = cgdVar.b();
        }
        if (ufdVarB == null) {
            return;
        }
        Thread threadCurrentThread = Thread.currentThread();
        String name = threadCurrentThread.getName();
        while (true) {
            try {
                threadCurrentThread.setName(ufdVarB.a);
                Logger logger = ((cgd) this.b).b;
                bgd bgdVar = ufdVarB.c;
                bgdVar.getClass();
                boolean zIsLoggable = logger.isLoggable(Level.FINE);
                if (zIsLoggable) {
                    jNanoTime = System.nanoTime();
                    kp7.n(logger, ufdVarB, bgdVar, "starting");
                } else {
                    jNanoTime = -1;
                }
                try {
                    long jA = ufdVarB.a();
                    if (zIsLoggable) {
                        kp7.n(logger, ufdVarB, bgdVar, "finished run in " + kp7.m(System.nanoTime() - jNanoTime));
                    }
                    cgd cgdVar2 = (cgd) this.b;
                    synchronized (cgdVar2) {
                        cgdVar2.a(ufdVarB, jA, true);
                        ufdVarB2 = cgdVar2.b();
                    }
                    if (ufdVarB2 == null) {
                        return;
                    } else {
                        ufdVarB = ufdVarB2;
                    }
                } catch (Throwable th) {
                    if (zIsLoggable) {
                        kp7.n(logger, ufdVarB, bgdVar, "failed a run in " + kp7.m(System.nanoTime() - jNanoTime));
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                try {
                    cgd cgdVar3 = (cgd) this.b;
                    synchronized (cgdVar3) {
                        cgdVar3.a(ufdVarB, -1L, false);
                        if (!(th2 instanceof InterruptedException)) {
                            throw th2;
                        }
                        Thread.currentThread().interrupt();
                        return;
                    }
                } finally {
                    threadCurrentThread.setName(name);
                }
            }
        }
    }

    private final void c() {
        zwe zweVar = (zwe) this.b;
        synchronized (zweVar.a) {
            try {
                if (zweVar.b()) {
                    Log.e("WakeLock", String.valueOf(zweVar.j).concat(" ** IS FORCE-RELEASED ON TIMEOUT **"));
                    zweVar.e();
                    if (zweVar.b()) {
                        zweVar.c = 1;
                        zweVar.f();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // java.lang.Runnable
    public final void run() {
        int actionMasked;
        Iterator it2;
        ljc ljcVar;
        Throwable th;
        h6 h6Var;
        x0g x0gVar;
        mzf mzfVar;
        boolean z = true;
        char c = 1;
        switch (this.a) {
            case 0:
                mn mnVar = (mn) this.b;
                mnVar.removeCallbacks(this);
                MotionEvent motionEvent = mnVar.L0;
                if (motionEvent == null || (actionMasked = motionEvent.getActionMasked()) == 10 || actionMasked == 1) {
                    return;
                }
                mnVar.J(motionEvent, (actionMasked == 7 || actionMasked == 9) ? 7 : 2, mnVar.M0, false);
                return;
            case 1:
                a37 a37Var = (a37) this.b;
                ym3 ym3Var = a37Var.c;
                hh0 hh0Var = a37Var.a;
                if (a37Var.n) {
                    if (a37Var.l) {
                        a37Var.l = false;
                        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
                        hh0Var.e = jCurrentAnimationTimeMillis;
                        hh0Var.g = -1L;
                        hh0Var.f = jCurrentAnimationTimeMillis;
                        hh0Var.h = 0.5f;
                    }
                    if ((hh0Var.g > 0 && AnimationUtils.currentAnimationTimeMillis() > hh0Var.g + ((long) hh0Var.i)) || !a37Var.e()) {
                        a37Var.n = false;
                        return;
                    }
                    if (a37Var.m) {
                        a37Var.m = false;
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                        ym3Var.onTouchEvent(motionEventObtain);
                        motionEventObtain.recycle();
                    }
                    if (hh0Var.f == 0) {
                        ygf.i("Cannot compute scroll delta before calling start()");
                        return;
                    }
                    long jCurrentAnimationTimeMillis2 = AnimationUtils.currentAnimationTimeMillis();
                    float fA = hh0Var.a(jCurrentAnimationTimeMillis2);
                    long j = jCurrentAnimationTimeMillis2 - hh0Var.f;
                    hh0Var.f = jCurrentAnimationTimeMillis2;
                    a37Var.p.scrollListBy((int) (j * ((fA * 4.0f) + ((-4.0f) * fA * fA)) * hh0Var.d));
                    WeakHashMap weakHashMap = ute.a;
                    ym3Var.postOnAnimation(this);
                    return;
                }
                return;
            case 2:
                wv0 wv0Var = (wv0) this.b;
                wv0Var.c = false;
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) wv0Var.e;
                cue cueVar = bottomSheetBehavior.Q;
                if (cueVar != null && cueVar.f()) {
                    wv0Var.c(wv0Var.b);
                    return;
                } else {
                    if (bottomSheetBehavior.P == 2) {
                        bottomSheetBehavior.M(wv0Var.b);
                        return;
                    }
                    return;
                }
            case 3:
                fb3 fb3Var = (fb3) this.b;
                fb3Var.p0.onDismiss(fb3Var.x0);
                return;
            case 4:
                aw awVar = (aw) this.b;
                awVar.a(true);
                awVar.invalidateSelf();
                return;
            case 5:
                ym3 ym3Var2 = (ym3) this.b;
                ym3Var2.l = null;
                ym3Var2.drawableStateChanged();
                return;
            case 6:
                y94 y94Var = (y94) this.b;
                ValueAnimator valueAnimator = y94Var.z;
                int i = y94Var.A;
                if (i == 1) {
                    valueAnimator.cancel();
                } else if (i != 2) {
                    return;
                }
                y94Var.A = 3;
                valueAnimator.setFloatValues(((Float) valueAnimator.getAnimatedValue()).floatValue(), 0.0f);
                valueAnimator.setDuration(500L);
                valueAnimator.start();
                return;
            case 7:
                j15 j15Var = (j15) this.b;
                if (j15Var.J != null) {
                    j15Var.f();
                    return;
                }
                return;
            case 8:
                ((f25) this.b).y(true);
                return;
            case 9:
                na6 na6Var = (na6) this.b;
                na6Var.B = na6Var.E;
                na6Var.E = null;
                na6Var.f0(new ha6(na6Var, new fa6(na6Var, c == true ? 1 : 0), 0), "fireOpenConnection");
                return;
            case 10:
                a();
                return;
            case 11:
                ParagraphEditTextLayout paragraphEditTextLayout = (ParagraphEditTextLayout) this.b;
                l09 l09Var = paragraphEditTextLayout.b;
                if (l09Var == null) {
                    g76.g0("paragraphContext");
                    throw null;
                }
                ParagraphData paragraphDataE = n19.e(paragraphEditTextLayout.getFreshModel().a);
                if (!paragraphDataE.equals(l09Var.b())) {
                    ArrayList arrayList = new ArrayList(l09Var.a);
                    arrayList.set(l09Var.d, paragraphDataE);
                    l09Var = new l09(bu1.m1(arrayList), l09Var.b, l09Var.c, l09Var.d, l09Var.e, l09Var.f, l09Var.g);
                }
                paragraphEditTextLayout.e(l09Var);
                return;
            case 12:
                SearchView$SearchAutoComplete searchView$SearchAutoComplete = (SearchView$SearchAutoComplete) this.b;
                if (searchView$SearchAutoComplete.f) {
                    ((InputMethodManager) searchView$SearchAutoComplete.getContext().getSystemService("input_method")).showSoftInput(searchView$SearchAutoComplete, 0);
                    searchView$SearchAutoComplete.f = false;
                    return;
                }
                return;
            case 13:
                ljc ljcVar2 = (ljc) this.b;
                ljcVar2.a();
                for (Iterator it3 = ljcVar2.g.iterator(); it3.hasNext(); it3 = it2) {
                    String str = (String) it3.next();
                    long j2 = ljcVar2.k;
                    olb olbVar = ljcVar2.f;
                    AtomicLong atomicLong = ljcVar2.b;
                    AtomicReference atomicReference = ljcVar2.a;
                    jjc jjcVar = jjc.SYNCING;
                    if (((jjc) atomicReference.getAndSet(jjcVar)) != jjcVar) {
                        long jElapsedRealtime = SystemClock.elapsedRealtime();
                        str.getClass();
                        try {
                            try {
                                ijc ijcVarV = ljcVar2.d.v(str, Long.valueOf(ljcVar2.h));
                                it2 = it3;
                                try {
                                    if ((SystemClock.elapsedRealtime() - ijcVarV.b) + ijcVarV.a + ijcVarV.c >= 0) {
                                        try {
                                            long jElapsedRealtime2 = SystemClock.elapsedRealtime() - jElapsedRealtime;
                                            if (jElapsedRealtime2 <= j2) {
                                                ljcVar2.e.h0(ijcVarV);
                                                return;
                                            }
                                            throw new NTPSyncException("Ignoring response from " + str + " because the network latency (" + jElapsedRealtime2 + " ms) is longer than the required value (" + j2 + " ms");
                                        } catch (Throwable th2) {
                                            th = th2;
                                            ljcVar = ljcVar2;
                                        }
                                    } else {
                                        try {
                                            StringBuilder sb = new StringBuilder("Invalid time ");
                                            ljcVar = ljcVar2;
                                            try {
                                                sb.append((SystemClock.elapsedRealtime() - ijcVarV.b) + ijcVarV.a + ijcVarV.c);
                                                sb.append(" received from ");
                                                sb.append(str);
                                                throw new NTPSyncException(sb.toString());
                                            } catch (Throwable th3) {
                                                th = th3;
                                            }
                                        } catch (Throwable th4) {
                                            th = th4;
                                            ljcVar = ljcVar2;
                                        }
                                    }
                                } catch (Throwable th5) {
                                    th = th5;
                                }
                            } catch (Throwable th6) {
                                th = th6;
                                it2 = it3;
                            }
                        } catch (Throwable th7) {
                            th = th7;
                            it2 = it3;
                        }
                        ljcVar = ljcVar2;
                        th = th;
                        try {
                            str.getClass();
                            f49.K((f66) olbVar.b, d66.ERROR, e66.MAINTAINER, new hm0(str, 16), th, false, 48);
                        } finally {
                            atomicReference.set(jjc.IDLE);
                            atomicLong.set(SystemClock.elapsedRealtime());
                        }
                    } else {
                        it2 = it3;
                        ljcVar = ljcVar2;
                    }
                    ljcVar2 = ljcVar;
                }
                return;
            case 14:
                ((StaggeredGridLayoutManager) this.b).E0();
                return;
            case 15:
                b();
                return;
            case 16:
                ActionMenuView actionMenuView = ((Toolbar) this.b).a;
                if (actionMenuView == null || (h6Var = actionMenuView.t) == null) {
                    return;
                }
                h6Var.l();
                return;
            case 17:
                ((cue) this.b).m(0);
                return;
            case 18:
                fve fveVar = (fve) this.b;
                fveVar.setScrollState(0);
                fveVar.o();
                return;
            case 19:
                ((uif) this.b).b();
                return;
            case 20:
                wd5 wd5Var = ((uif) ((qlb) this.b).a).f;
                wd5Var.c(wd5Var.getClass().getName().concat(" disconnecting because it was signed out."));
                return;
            case 21:
                ((bjf) this.b).l.d(new h42(4, null, null));
                return;
            case 22:
                throw null;
            case 23:
                c();
                return;
            case 24:
                if (((wfd) this.b).c(new IOException("TIMEOUT"))) {
                    Log.w("Rpc", "No response");
                    return;
                }
                return;
            case 25:
                h1g h1gVar = (h1g) this.b;
                if (h1gVar == null || (x0gVar = h1gVar.h) == null) {
                    return;
                }
                this.b = null;
                if (x0gVar.isDone()) {
                    Object obj = h1gVar.a;
                    if (obj == null) {
                        if (x0gVar.isDone()) {
                            if (vzf.g.O(h1gVar, null, h1g.h(x0gVar))) {
                                h1g.j(h1gVar);
                                return;
                            }
                            return;
                        }
                        lzf lzfVar = new lzf(h1gVar, x0gVar);
                        if (vzf.g.O(h1gVar, null, lzfVar)) {
                            try {
                                x0gVar.b(lzfVar, j0g.zza);
                                return;
                            } catch (Throwable th8) {
                                try {
                                    mzfVar = new mzf(th8);
                                    break;
                                } catch (Error | Exception unused) {
                                    mzfVar = mzf.b;
                                }
                                vzf.g.O(h1gVar, lzfVar, mzfVar);
                                return;
                            }
                        }
                        obj = h1gVar.a;
                    }
                    if (obj instanceof kzf) {
                        x0gVar.cancel(((kzf) obj).a);
                        return;
                    }
                    return;
                }
                try {
                    ScheduledFuture scheduledFuture = h1gVar.i;
                    h1gVar.i = null;
                    String str2 = "Timed out";
                    if (scheduledFuture != null) {
                        try {
                            long jAbs = Math.abs(scheduledFuture.getDelay(TimeUnit.MILLISECONDS));
                            if (jAbs > 10) {
                                str2 = "Timed out (timeout delayed by " + jAbs + " ms after scheduled time)";
                            }
                        } catch (Throwable th9) {
                            if (vzf.g.O(h1gVar, null, new mzf(new a1g(str2)))) {
                                h1g.j(h1gVar);
                            }
                            throw th9;
                        }
                    }
                    if (vzf.g.O(h1gVar, null, new mzf(new a1g(str2 + ": " + x0gVar.toString())))) {
                        h1g.j(h1gVar);
                    }
                    return;
                } finally {
                    x0gVar.cancel(true);
                }
            default:
                l6g l6gVar = (l6g) this.b;
                synchronized (l6gVar.c) {
                    ((kq8) l6gVar.d).a();
                    break;
                }
                return;
        }
    }

    public /* synthetic */ jn(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public jn(bjf bjfVar) {
        this.a = 21;
        Objects.requireNonNull(bjfVar);
        this.b = bjfVar;
    }
}
