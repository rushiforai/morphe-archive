package ab;

import a5.a1;
import ai.a2;
import ai.b1;
import ai.b2;
import ai.b3;
import ai.c2;
import ai.e2;
import ai.g2;
import ai.j4;
import ai.k1;
import ai.k3;
import ai.m0;
import ai.m1;
import ai.n3;
import ai.o3;
import ai.p3;
import ai.p4;
import ai.r4;
import ai.s3;
import ai.t1;
import ai.t2;
import ai.w0;
import ai.w1;
import ai.x0;
import ai.x1;
import ai.x3;
import ai.y0;
import ai.z0;
import ai.z1;
import android.app.Service;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.appwidget.AppWidgetHostView;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import b.kc;
import cl.l1;
import com.amplitude.android.TrackingOptions;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.google.android.gms.appset.AppSetIdInfo;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.internal.measurement.f7;
import com.google.android.gms.internal.measurement.r6;
import com.google.android.gms.internal.measurement.s6;
import com.google.android.gms.internal.measurement.u6;
import com.google.android.gms.internal.measurement.z4;
import com.google.android.gms.internal.measurement.zzdb;
import com.google.android.gms.measurement.internal.AppMeasurementDynamiteService;
import com.google.android.gms.measurement.internal.zzah;
import com.google.android.gms.measurement.internal.zzoh;
import com.google.android.gms.measurement.internal.zzr;
import com.google.android.gms.tasks.RuntimeExecutionException;
import com.google.android.gms.tasks.Task;
import com.google.android.material.behavior.SwipeDismissBehavior;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.y2;
import io.sentry.android.core.NetworkBreadcrumbsIntegration;
import io.sentry.android.core.p0;
import io.sentry.g3;
import io.sentry.w3;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import k30.k0;
import k30.l0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;
import ps.o0;

/* loaded from: classes2.dex */
public final class z implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f777a;

    /* renamed from: b, reason: collision with root package name */
    public Object f778b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f779c;

    public /* synthetic */ z(int i5, Object obj, Object obj2) {
        this.f777a = i5;
        this.f779c = obj;
        this.f778b = obj2;
    }

    private final void a() {
        p3 p3Var = ((o3) this.f779c).f13208c;
        p3Var.f13230d = null;
        if (((ConnectionResult) this.f778b).f31779g != 7777) {
            p3Var.S();
            return;
        }
        if (p3Var.f13233g == null) {
            p3Var.f13233g = Executors.newScheduledThreadPool(1);
        }
        p3Var.f13233g.schedule(new ai.h(this, 3), ((Long) ai.x.Z.a(null)).longValue(), TimeUnit.MILLISECONDS);
    }

    private final void b() {
        j4 j4Var = (j4) this.f778b;
        j4Var.V();
        Runnable runnable = (Runnable) this.f779c;
        j4Var.c().D();
        if (j4Var.f13052p == null) {
            j4Var.f13052p = new ArrayList();
        }
        j4Var.f13052p.add(runnable);
        j4Var.q();
    }

    private final void c() {
        try {
            p();
        } catch (Error e3) {
            synchronized (((l1) this.f779c).f20034b) {
                ((l1) this.f779c).f20035c = 1;
                throw e3;
            }
        }
    }

    private final void d() {
        Continuation continuationB = IntrinsicsKt.b((eb0.u) this.f778b);
        int i5 = Result.f71687b;
        continuationB.resumeWith(ResultKt.a((Throwable) this.f779c));
    }

    private final void e() {
        r5.d dVar = ((SwipeDismissBehavior) this.f779c).f34075a;
        if (dVar == null || !dVar.f()) {
            return;
        }
        View view = (View) this.f778b;
        WeakHashMap weakHashMap = a1.f250a;
        view.postOnAnimation(this);
    }

    private final void f() {
        d9.j jVar = (d9.j) this.f778b;
        jVar.f49068i.requestFocus();
        InputMethodManager inputMethodManager = (InputMethodManager) ((d9.f) this.f779c).f49036a.getSystemService("input_method");
        if (inputMethodManager != null) {
            inputMethodManager.showSoftInput(jVar.f49068i, 1);
        }
    }

    private final void g() {
        fi.o oVar = (fi.o) this.f779c;
        Task task = (Task) this.f778b;
        if (task.o()) {
            oVar.f55151c.w();
            return;
        }
        try {
            oVar.f55151c.t(oVar.f55150b.then(task));
        } catch (RuntimeExecutionException e3) {
            if (!(e3.getCause() instanceof Exception)) {
                oVar.f55151c.v(e3);
            } else {
                oVar.f55151c.v((Exception) e3.getCause());
            }
        } catch (Exception e11) {
            oVar.f55151c.v(e11);
        }
    }

    private final void h() {
        fi.t tVar = (fi.t) this.f778b;
        try {
            tVar.t(((Callable) this.f779c).call());
        } catch (Exception e3) {
            tVar.v(e3);
        } catch (Throwable th2) {
            tVar.v(new RuntimeException(th2));
        }
    }

    private final void i() throws hh.c {
        hh.d dVar = (hh.d) this.f778b;
        fi.j jVar = (fi.j) this.f779c;
        fi.t tVar = jVar.f55135a;
        Context context = (Context) dVar.f59858b;
        String string = hh.d.a(context).getString(TrackingOptions.AMP_TRACKING_OPTION_APP_SET_ID, null);
        long j11 = hh.d.a(context).getLong("app_set_id_last_used_time", -1L);
        long j12 = j11 != -1 ? j11 + 33696000000L : -1L;
        if (string == null || System.currentTimeMillis() > j12) {
            string = UUID.randomUUID().toString();
            try {
                if (!context.getSharedPreferences("app_set_id_storage", 0).edit().putString(TrackingOptions.AMP_TRACKING_OPTION_APP_SET_ID, string).commit()) {
                    String strValueOf = String.valueOf(context.getPackageName());
                    Log.e("AppSet", strValueOf.length() != 0 ? "Failed to store app set ID generated for App ".concat(strValueOf) : new String("Failed to store app set ID generated for App "));
                    throw new hh.c("Failed to store the app set ID.");
                }
                hh.d.b(context);
                if (!context.getSharedPreferences("app_set_id_storage", 0).edit().putLong("app_set_id_creation_time", System.currentTimeMillis()).commit()) {
                    String strValueOf2 = String.valueOf(context.getPackageName());
                    Log.e("AppSet", strValueOf2.length() != 0 ? "Failed to store app set ID creation time for App ".concat(strValueOf2) : new String("Failed to store app set ID creation time for App "));
                    throw new hh.c("Failed to store the app set ID creation time.");
                }
            } catch (hh.c e3) {
                tVar.v(e3);
                return;
            }
        } else {
            try {
                hh.d.b(context);
            } catch (hh.c e11) {
                tVar.v(e11);
                return;
            }
        }
        jVar.a(new AppSetIdInfo(string, 1));
    }

    private final void j() {
        if (((NetworkBreadcrumbsIntegration) this.f779c).f66796e) {
            return;
        }
        synchronized (((NetworkBreadcrumbsIntegration) this.f779c).f66795d) {
            try {
                ((NetworkBreadcrumbsIntegration) this.f779c).f66798g = new p0(((NetworkBreadcrumbsIntegration) this.f779c).f66793b, ((w3) this.f778b).getDateProvider());
                NetworkBreadcrumbsIntegration networkBreadcrumbsIntegration = (NetworkBreadcrumbsIntegration) this.f779c;
                if (io.sentry.android.core.internal.util.b.e(networkBreadcrumbsIntegration.f66792a, networkBreadcrumbsIntegration.f66794c, networkBreadcrumbsIntegration.f66793b, networkBreadcrumbsIntegration.f66798g)) {
                    ((NetworkBreadcrumbsIntegration) this.f779c).f66794c.g(g3.DEBUG, "NetworkBreadcrumbsIntegration installed.", new Object[0]);
                    lb0.b.o("NetworkBreadcrumbs");
                } else {
                    ((NetworkBreadcrumbsIntegration) this.f779c).f66794c.g(g3.DEBUG, "NetworkBreadcrumbsIntegration not installed.", new Object[0]);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void k() throws InterruptedException {
        try {
            ((jb.b) this.f779c).f69379b.put((jb.i) this.f778b);
        } catch (InterruptedException unused) {
            Thread.currentThread().interrupt();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0163  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void l() {
        k30.d dVar;
        Drawable drawableMutate;
        k30.u uVar;
        k30.s sVar;
        String strD;
        String str;
        k0 k0Var;
        k30.d dVar2;
        String strH;
        k30.u uVar2;
        l10.a0 a0Var = (l10.a0) this.f778b;
        SimpleDateFormat simpleDateFormat = a0Var.f74397q;
        String str2 = a0Var.f74388f;
        a0Var.removeCallbacks(this);
        k30.x xVar = a0Var.f74389g;
        y2.f51877a.getClass();
        l0 l0Var = (l0) y2.D1().l();
        Context context = (Context) this.f779c;
        int iM = bh.g.M(context, 24);
        boolean zA = xVar.a();
        k30.d dVar3 = xVar.f71087e;
        float f11 = xVar.f71083a;
        k30.u uVar3 = xVar.f71085c;
        k0 k0Var2 = xVar.f71092j;
        if (zA) {
            a0Var.f74390h = ic.b.J(xVar);
            dVar = dVar3;
            k0Var = (k0Var2 == null || k0Var2.f71006b - System.currentTimeMillis() <= -60000) ? null : k0Var2;
            if (k0Var2 == null || (uVar2 = k0Var2.f71005a) == null) {
                uVar2 = uVar3;
            }
            if (k0Var2 == null || (sVar = k0Var2.f71008d) == null) {
                sVar = xVar.f71086d;
            }
            Intrinsics.d(str2);
            strD = l0Var.d(str2, f11);
            k30.u uVar4 = uVar2;
            Intrinsics.d(str2);
            StringBuilder sb2 = new StringBuilder(l0Var.d(str2, f11));
            sb2.append(l0Var.name().charAt(0));
            sb2.append(' ');
            sb2.append(lx.d.h(uVar3.name()));
            if (k0Var != null) {
                sb2.append('\n');
                sb2.append(lx.d.h(k0Var.f71005a.name()));
                sb2.append(" at ");
                simpleDateFormat.applyPattern(DateFormat.is24HourFormat(a0Var.getContext()) ? "H:mm" : "h:mm");
                sb2.append(simpleDateFormat.format(new Date(k0Var.f71006b)));
            } else {
                sb2.append(" — ");
                sb2.append(xVar.f71088f);
                sb2.append('\n');
            }
            sb2.append('\n');
            boolean zIs24HourFormat = DateFormat.is24HourFormat(a0Var.getContext());
            SimpleDateFormat simpleDateFormat2 = a0Var.f74398r;
            simpleDateFormat2.applyPattern(zIs24HourFormat ? "H:mm" : "h:mm a");
            sb2.append("Updated: " + simpleDateFormat2.format(new Date(xVar.f71090h)));
            str = sb2;
            uVar = uVar4;
            drawableMutate = null;
        } else {
            dVar = dVar3;
            drawableMutate = null;
            a0Var.f74390h = null;
            uVar = k30.u.f71064d;
            sVar = k30.s.f71058b;
            if (context.checkSelfPermission("android.permission.ACCESS_FINE_LOCATION") != 0) {
                Drawable drawable = context.getDrawable(2131231505);
                Intrinsics.d(drawable);
                drawable.setBounds(0, 0, iM, iM);
                drawable.setTint(a0Var.f74400t);
                SpannableStringBuilder spannableStringBuilderValueOf = SpannableStringBuilder.valueOf("1 ");
                spannableStringBuilderValueOf.setSpan(new g20.f(drawable, 1), 0, 1, 0);
                strD = spannableStringBuilderValueOf;
            } else {
                strD = "! ";
            }
            str = "Could not load weather data";
            k0Var = null;
        }
        if (a0Var.f74393k == uVar) {
            k30.x xVar2 = a0Var.f74394l;
            if (xVar2.f71086d == sVar) {
                dVar2 = dVar;
                if (xVar2.f71087e == dVar2) {
                    drawableMutate = a0Var.f74392j;
                }
            } else {
                dVar2 = dVar;
            }
        }
        if (drawableMutate == null) {
            Drawable drawable2 = a0Var.f74391i.getDrawable(uVar.b(sVar, dVar2));
            Intrinsics.d(drawable2);
            drawableMutate = drawable2.mutate();
            a0Var.f74392j = drawableMutate;
            if (drawableMutate instanceof AnimatedVectorDrawable) {
                ((AnimatedVectorDrawable) drawableMutate).start();
            }
            a0Var.f74394l = xVar;
            a0Var.f74393k = uVar;
        }
        if (a0Var.f74401u) {
            drawableMutate.setTint(a0Var.getCurrentTextColor());
        }
        drawableMutate.setBounds(0, 0, iM, iM);
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        spannableStringBuilder.append((CharSequence) strD);
        spannableStringBuilder.append((CharSequence) " #icon#");
        if (k0Var != null) {
            long j11 = k0Var.f71006b;
            int iB = MathKt.b((j11 - new Date().getTime()) / 60000.0f);
            if (iB > 0) {
                if (iB >= 46) {
                    simpleDateFormat.applyPattern(DateFormat.is24HourFormat(a0Var.getContext()) ? "H:mm" : "h:mm");
                    strH = b.c0.k(" at ", simpleDateFormat.format(new Date(j11)));
                } else {
                    strH = b.c0.h(iB, " in ");
                }
                spannableStringBuilder.append((CharSequence) strH);
                a0Var.postDelayed(this, 30000L);
            }
        }
        int iS0 = r70.k.S0(spannableStringBuilder, "#icon#", 0, false, 6);
        spannableStringBuilder.setSpan(new g20.f(drawableMutate, 1), iS0, iS0 + 6, 33);
        a0Var.setText(spannableStringBuilder);
        a0Var.setTooltipText(str);
    }

    private final void m() {
        io.sentry.android.core.b0 b0VarN;
        lc.b bVar = (lc.b) this.f779c;
        if (bVar.a()) {
            try {
                b0VarN = o0.n(new JSONObject(bVar.f74838j.version()));
            } catch (Exception e3) {
                nc.a.a(nc.c.ONE_DT_GENERAL_ERROR, e3);
                rc.a.b("%s: resolveIgniteServiceVersion : unable to resolve version : %s", "IgniteAuthenticationComponent", e3.toString());
            }
        } else {
            b0VarN = new io.sentry.android.core.b0(false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        bVar.f74837i = b0VarN;
        uc.b.f90790b.post((y) this.f778b);
    }

    private final void n() {
        mh.c cVar = (mh.c) this.f778b;
        View view = (View) this.f779c;
        Log.i("HsdpLoadingPanel", "hideLoading");
        try {
            if (view.getParent() != null) {
                ((WindowManager) cVar.f76324c).removeView(view);
            }
        } catch (RuntimeException e3) {
            Log.e("HsdpLoadingPanel", "Error removing view from WindowManager", e3);
        }
        cVar.f76325d = null;
    }

    private final void o() {
        mk.o oVar = (mk.o) this.f778b;
        Runnable runnable = (Runnable) this.f779c;
        if (((IInterface) oVar.f76470k) != null || oVar.f76460a) {
            if (!oVar.f76460a) {
                runnable.run();
                return;
            }
            if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                Log.i("ServiceConnMgrImpl", "Waiting to bind to the service.");
            }
            ArrayList arrayList = (ArrayList) oVar.f76464e;
            synchronized (arrayList) {
                arrayList.add(runnable);
            }
            return;
        }
        if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
            Log.i("ServiceConnMgrImpl", "Initiate binding to the service.");
        }
        ArrayList arrayList2 = (ArrayList) oVar.f76464e;
        synchronized (arrayList2) {
            arrayList2.add(runnable);
        }
        kk.l lVar = new kk.l(oVar, 1);
        oVar.f76469j = lVar;
        oVar.f76460a = true;
        if (((Context) oVar.f76462c).bindService((Intent) oVar.f76466g, lVar, 65)) {
            return;
        }
        if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
            Log.i("ServiceConnMgrImpl", "Failed to bind to the service.");
        }
        oVar.f76460a = false;
        ArrayList arrayList3 = (ArrayList) oVar.f76464e;
        synchronized (arrayList3) {
            arrayList3.clear();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
    
        if (r1 == false) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004c, code lost:
    
        r1 = r1 | java.lang.Thread.interrupted();
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x004e, code lost:
    
        ((java.lang.Runnable) r10.f778b).run();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x005a, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005c, code lost:
    
        r3 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x005d, code lost:
    
        cl.l1.f20032f.log(java.util.logging.Level.SEVERE, "Exception while executing runnable " + ((java.lang.Runnable) r10.f778b), (java.lang.Throwable) r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007a, code lost:
    
        r10.f778b = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007c, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:?, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:47:0x003c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void p() {
        Runnable runnable;
        boolean z11 = false;
        boolean zInterrupted = false;
        while (true) {
            try {
                synchronized (((l1) this.f779c).f20034b) {
                    if (z11) {
                        runnable = (Runnable) ((l1) this.f779c).f20034b.poll();
                        this.f778b = runnable;
                        if (runnable != null) {
                        }
                    } else {
                        l1 l1Var = (l1) this.f779c;
                        if (l1Var.f20035c != 4) {
                            l1Var.f20036d++;
                            l1Var.f20035c = 4;
                            z11 = true;
                            runnable = (Runnable) ((l1) this.f779c).f20034b.poll();
                            this.f778b = runnable;
                            if (runnable != null) {
                                ((l1) this.f779c).f20035c = 1;
                            }
                        }
                    }
                }
                if (!zInterrupted) {
                    return;
                }
            } finally {
                if (zInterrupted) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(21:171|(1:173)(27:175|461|176|177|(1:180)(23:182|(1:184)|480|185|(7:187|(1:189)(1:191)|482|192|465|193|194)|199|(2:201|(2:203|(2:205|(2:207|(2:209|(2:211|(1:213)(1:214))(1:215))(1:216))(1:217))(1:218))(1:219))(1:220)|221|478|222|(1:224)(1:225)|226|(1:228)(1:229)|230|(1:232)|236|(1:238)(7:240|(0)(1:243)|(3:476|245|(1:247)(1:248))|(2:254|(1:256)(4:257|(3:260|(1:493)(1:494)|258)|492|263))(1:263)|(1:265)(1:266)|267|(30:269|(1:271)(1:272)|273|(1:275)|276|(1:278)(1:279)|280|(2:282|(2:287|(1:289))(1:(3:286|287|(0))(1:290)))(0)|291|(20:296|(1:298)|299|(1:315)(1:316)|317|(1:319)|320|(2:325|(1:330))(1:324)|331|(3:335|(1:337)|338)|339|(1:341)|342|(1:346)|347|(3:349|(7:351|(1:353)(1:354)|355|(1:357)|358|(4:362|(1:364)|365|(1:367))|368)(1:370)|369)(10:371|(2:373|(2:386|387)(3:376|(5:378|(1:380)(1:381)|382|(1:384)|385)(0)|387))(1:388)|389|(1:391)|392|469|393|394|398|(5:400|(1:402)(1:403)|(1:407)|(1:409)|410))|411|(3:413|(1:415)(1:416)|(5:418|(1:420)|421|(1:423)|424))|425|426)(1:295)|300|(1:(1:311)(19:310|299|(0)(0)|317|(0)|320|(3:322|325|(1:330))(0)|331|(4:333|335|(0)|338)(0)|339|(0)|342|(2:344|346)|347|(0)(0)|411|(0)|425|426))(1:313)|312|(0)(0)|317|(0)|320|(0)(0)|331|(0)(0)|339|(0)|342|(0)|347|(0)(0)|411|(0)|425|426)(2:427|428))|239|(0)|(0)(0)|(0)(0)|267|(0)(0))|181|480|185|(0)(0)|199|(0)(0)|221|478|222|(0)(0)|226|(0)(0)|230|(0)|236|(0)(0)|239|(0)|(0)(0)|(0)(0)|267|(0)(0))|174|199|(0)(0)|221|478|222|(0)(0)|226|(0)(0)|230|(0)|236|(0)(0)|239|(0)|(0)(0)|(0)(0)|267|(0)(0)) */
    /* JADX WARN: Can't wrap try/catch for region: R(27:175|461|176|177|(1:180)(23:182|(1:184)|480|185|(7:187|(1:189)(1:191)|482|192|465|193|194)|199|(2:201|(2:203|(2:205|(2:207|(2:209|(2:211|(1:213)(1:214))(1:215))(1:216))(1:217))(1:218))(1:219))(1:220)|221|478|222|(1:224)(1:225)|226|(1:228)(1:229)|230|(1:232)|236|(1:238)(7:240|(0)(1:243)|(3:476|245|(1:247)(1:248))|(2:254|(1:256)(4:257|(3:260|(1:493)(1:494)|258)|492|263))(1:263)|(1:265)(1:266)|267|(30:269|(1:271)(1:272)|273|(1:275)|276|(1:278)(1:279)|280|(2:282|(2:287|(1:289))(1:(3:286|287|(0))(1:290)))(0)|291|(20:296|(1:298)|299|(1:315)(1:316)|317|(1:319)|320|(2:325|(1:330))(1:324)|331|(3:335|(1:337)|338)|339|(1:341)|342|(1:346)|347|(3:349|(7:351|(1:353)(1:354)|355|(1:357)|358|(4:362|(1:364)|365|(1:367))|368)(1:370)|369)(10:371|(2:373|(2:386|387)(3:376|(5:378|(1:380)(1:381)|382|(1:384)|385)(0)|387))(1:388)|389|(1:391)|392|469|393|394|398|(5:400|(1:402)(1:403)|(1:407)|(1:409)|410))|411|(3:413|(1:415)(1:416)|(5:418|(1:420)|421|(1:423)|424))|425|426)(1:295)|300|(1:(1:311)(19:310|299|(0)(0)|317|(0)|320|(3:322|325|(1:330))(0)|331|(4:333|335|(0)|338)(0)|339|(0)|342|(2:344|346)|347|(0)(0)|411|(0)|425|426))(1:313)|312|(0)(0)|317|(0)|320|(0)(0)|331|(0)(0)|339|(0)|342|(0)|347|(0)(0)|411|(0)|425|426)(2:427|428))|239|(0)|(0)(0)|(0)(0)|267|(0)(0))|181|480|185|(0)(0)|199|(0)(0)|221|478|222|(0)(0)|226|(0)(0)|230|(0)|236|(0)(0)|239|(0)|(0)(0)|(0)(0)|267|(0)(0)) */
    /* JADX WARN: Code restructure failed: missing block: B:197:0x050d, code lost:
    
        r15 = r23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:234:0x05da, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x05db, code lost:
    
        ai.m1.l(r9);
        r9.f13190f.c(ai.o0.L(r2), "Fetching Google App Id failed with exception. appId", r0);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0308  */
    /* JADX WARN: Removed duplicated region for block: B:187:0x04ed A[Catch: NameNotFoundException -> 0x050d, TryCatch #10 {NameNotFoundException -> 0x050d, blocks: (B:185:0x04e2, B:187:0x04ed, B:189:0x04f9), top: B:480:0x04e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:201:0x053a  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x05a4  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x05b8  */
    /* JADX WARN: Removed duplicated region for block: B:225:0x05b9 A[Catch: IllegalStateException -> 0x05da, TryCatch #9 {IllegalStateException -> 0x05da, blocks: (B:222:0x05b0, B:226:0x05bf, B:230:0x05c7, B:232:0x05cb, B:225:0x05b9), top: B:478:0x05b0 }] */
    /* JADX WARN: Removed duplicated region for block: B:228:0x05c5 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:229:0x05c6  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x05cb A[Catch: IllegalStateException -> 0x05da, TRY_LEAVE, TryCatch #9 {IllegalStateException -> 0x05da, blocks: (B:222:0x05b0, B:226:0x05bf, B:230:0x05c7, B:232:0x05cb, B:225:0x05b9), top: B:478:0x05b0 }] */
    /* JADX WARN: Removed duplicated region for block: B:238:0x05fd  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x060b  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x0642  */
    /* JADX WARN: Removed duplicated region for block: B:263:0x0671  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0675  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x067c  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x0699  */
    /* JADX WARN: Removed duplicated region for block: B:285:0x076c  */
    /* JADX WARN: Removed duplicated region for block: B:289:0x07a1  */
    /* JADX WARN: Removed duplicated region for block: B:315:0x0841  */
    /* JADX WARN: Removed duplicated region for block: B:316:0x0849  */
    /* JADX WARN: Removed duplicated region for block: B:319:0x0872  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x0882  */
    /* JADX WARN: Removed duplicated region for block: B:325:0x08a1  */
    /* JADX WARN: Removed duplicated region for block: B:333:0x08cc  */
    /* JADX WARN: Removed duplicated region for block: B:335:0x08d2  */
    /* JADX WARN: Removed duplicated region for block: B:337:0x08f0  */
    /* JADX WARN: Removed duplicated region for block: B:341:0x091d  */
    /* JADX WARN: Removed duplicated region for block: B:344:0x0937  */
    /* JADX WARN: Removed duplicated region for block: B:349:0x0950  */
    /* JADX WARN: Removed duplicated region for block: B:371:0x09be  */
    /* JADX WARN: Removed duplicated region for block: B:386:0x0a66  */
    /* JADX WARN: Removed duplicated region for block: B:413:0x0b2c  */
    /* JADX WARN: Removed duplicated region for block: B:427:0x0b97  */
    /* JADX WARN: Removed duplicated region for block: B:471:0x0315 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:476:0x061c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v68, types: [ai.s2] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        String str;
        String str2;
        PackageManager packageManager;
        String string;
        String str3;
        int i5;
        String str4;
        PackageInfo packageInfo;
        int iG;
        List<String> listAsList;
        Bundle bundleP;
        Integer numValueOf;
        ai.y2 y2Var;
        m0 m0Var;
        p4 p4Var;
        y0 y0Var;
        m1 m1Var;
        a2 a2Var;
        boolean z11;
        m1 m1Var2;
        x1 x1VarT;
        x1 x1VarT2;
        Boolean boolQ;
        w0 w0Var;
        b1 b1Var;
        p4 p4Var2;
        m1 m1Var3;
        y0 y0Var2;
        ai.o0 o0Var;
        m0 m0Var2;
        boolean z12;
        String strB;
        Bundle bundle;
        Long lValueOf;
        IInterface iInterface;
        switch (this.f777a) {
            case 0:
                a0 a0Var = (a0) this.f779c;
                s sVar = a0Var.f679f;
                NovaLauncher novaLauncher = a0Var.f676c;
                int i11 = a0Var.f680g;
                if (i11 == -1) {
                    return;
                }
                AppWidgetHostView appWidgetHostViewA = novaLauncher.S.a(novaLauncher, i11, (LauncherAppWidgetProviderInfo) this.f778b);
                sVar.f761t = appWidgetHostViewA;
                a0Var.f680g = -1;
                appWidgetHostViewA.setVisibility(4);
                int[] iArrH0 = novaLauncher.O.H0(sVar);
                za.h hVar = new za.h(iArrH0[0], iArrH0[1]);
                hVar.f98432c = 0;
                hVar.f98431b = 0;
                hVar.f98433d = true;
                appWidgetHostViewA.setLayoutParams(hVar);
                novaLauncher.P.addView(appWidgetHostViewA);
                a0Var.f678e.setTag(sVar);
                return;
            case 1:
                w1 w1Var = (w1) this.f778b;
                w1Var.a();
                if (kc.b()) {
                    w1Var.c().M(this);
                    return;
                }
                ai.m mVar = (ai.m) this.f779c;
                boolean z13 = mVar.f13128c != 0;
                mVar.f13128c = 0L;
                if (z13) {
                    mVar.a();
                    return;
                }
                return;
            case 2:
                ai.a1 a1Var = (ai.a1) this.f779c;
                m1 m1Var4 = ((b1) a1Var.f12830c).f12853b;
                k1 k1Var = m1Var4.f13139g;
                m1.l(k1Var);
                k1Var.D();
                Bundle bundle2 = new Bundle();
                bundle2.putString("package_name", (String) a1Var.f12829b);
                try {
                    s6 s6Var = (s6) ((u6) this.f778b);
                    Parcel parcelX = s6Var.X();
                    r6.b(parcelX, bundle2);
                    Parcel parcelW = s6Var.W(parcelX, 1);
                    Bundle bundle3 = (Bundle) r6.a(parcelW, Bundle.CREATOR);
                    parcelW.recycle();
                    if (bundle3 == null) {
                        ai.o0 o0Var2 = m1Var4.f13138f;
                        m1.l(o0Var2);
                        o0Var2.f13190f.a("Install Referrer Service returned a null response");
                    }
                } catch (Exception e3) {
                    ai.o0 o0Var3 = m1Var4.f13138f;
                    m1.l(o0Var3);
                    o0Var3.f13190f.b(e3.getMessage(), "Exception occurred while retrieving the Install Referrer");
                }
                k1 k1Var2 = m1Var4.f13139g;
                m1.l(k1Var2);
                k1Var2.D();
                throw new IllegalStateException("Unexpected call on client side");
            case 3:
                m1 m1Var5 = (m1) this.f779c;
                e2 e2Var = (e2) this.f778b;
                String string2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                k1 k1Var3 = m1Var5.f13139g;
                ai.o0 o0Var4 = m1Var5.f13138f;
                z0 z0Var = m1Var5.f13137e;
                p4 p4Var3 = m1Var5.f13141i;
                m1.l(k1Var3);
                k1Var3.D();
                ai.e eVar = m1Var5.f13136d;
                ((m1) eVar.f13368a).getClass();
                ai.o oVar = new ai.o(m1Var5);
                oVar.G();
                m1Var5.f13149s = oVar;
                zzdb zzdbVar = e2Var.f12905d;
                long j11 = zzdbVar == null ? 0L : zzdbVar.f33303f;
                if (zzdbVar != null && (bundle = zzdbVar.f33306i) != null) {
                    string2 = bundle.getString("runtime_google_app_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
                ai.f0 f0Var = new ai.f0(m1Var5, e2Var.f12904c, j11, string2);
                f0Var.F();
                m1Var5.f13150t = f0Var;
                ai.h0 h0Var = new ai.h0(m1Var5);
                h0Var.F();
                m1Var5.f13147q = h0Var;
                p3 p3Var = new p3(m1Var5);
                p3Var.F();
                m1Var5.f13148r = p3Var;
                boolean z14 = p4Var3.f13377b;
                m1 m1Var6 = (m1) p4Var3.f13368a;
                if (z14) {
                    throw new IllegalStateException("Can't initialize twice");
                }
                p4Var3.D();
                SecureRandom secureRandom = new SecureRandom();
                long jNextLong = secureRandom.nextLong();
                if (jNextLong == 0) {
                    jNextLong = secureRandom.nextLong();
                    if (jNextLong == 0) {
                        ai.o0 o0Var5 = ((m1) p4Var3.f13368a).f13138f;
                        m1.l(o0Var5);
                        o0Var5.f13193i.a("Utils falling back to Random for random id");
                    }
                }
                p4Var3.f13240d.set(jNextLong);
                m1Var6.C.incrementAndGet();
                p4Var3.f13377b = true;
                if (z0Var.f13377b) {
                    throw new IllegalStateException("Can't initialize twice");
                }
                SharedPreferences sharedPreferences = ((m1) z0Var.f13368a).f13133a.getSharedPreferences("com.google.android.gms.measurement.prefs", 0);
                z0Var.f13486c = sharedPreferences;
                boolean z15 = sharedPreferences.getBoolean("has_been_opened", false);
                z0Var.f13499r = z15;
                if (!z15) {
                    SharedPreferences.Editor editorEdit = z0Var.f13486c.edit();
                    editorEdit.putBoolean("has_been_opened", true);
                    editorEdit.apply();
                }
                z0Var.f13488e = new x0(z0Var, Math.max(0L, ((Long) ai.x.f13409d.a(null)).longValue()));
                ((m1) z0Var.f13368a).C.incrementAndGet();
                z0Var.f13377b = true;
                ai.f0 f0Var2 = m1Var5.f13150t;
                if (f0Var2.f13484b) {
                    throw new IllegalStateException("Can't initialize twice");
                }
                String str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                m1 m1Var7 = (m1) f0Var2.f13368a;
                ai.o0 o0Var6 = m1Var7.f13138f;
                ai.o0 o0Var7 = m1Var7.f13138f;
                m1.l(o0Var6);
                o0Var6.n.c(Long.valueOf(f0Var2.f12936j), "sdkVersion bundled with app, dynamiteVersion", Long.valueOf(f0Var2.f12935i));
                Context context = m1Var7.f13133a;
                String packageName = context.getPackageName();
                PackageManager packageManager2 = context.getPackageManager();
                String installerPackageName = "unknown";
                if (packageManager2 == null) {
                    m1.l(o0Var7);
                    str = "Can't initialize twice";
                    str2 = "Unknown";
                    o0Var7.f13190f.b(ai.o0.L(packageName), "PackageManager is null, app identity information might be inaccurate. appId");
                } else {
                    str = "Can't initialize twice";
                    str2 = "Unknown";
                    try {
                        installerPackageName = packageManager2.getInstallerPackageName(packageName);
                    } catch (IllegalArgumentException unused) {
                        m1.l(o0Var7);
                        o0Var7.f13190f.b(ai.o0.L(packageName), "Error retrieving app installer package name. appId");
                    }
                    String str6 = installerPackageName;
                    if (str6 == null) {
                        str6 = "manual_install";
                    } else {
                        if ("com.android.vending".equals(str6)) {
                            installerPackageName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        packageInfo = packageManager2.getPackageInfo(context.getPackageName(), 0);
                        if (packageInfo == null) {
                            CharSequence applicationLabel = packageManager2.getApplicationLabel(packageInfo.applicationInfo);
                            string = !TextUtils.isEmpty(applicationLabel) ? applicationLabel.toString() : str2;
                            try {
                                str4 = packageInfo.versionName;
                                try {
                                    i5 = packageInfo.versionCode;
                                    packageManager = packageManager2;
                                    str3 = installerPackageName;
                                } catch (PackageManager.NameNotFoundException unused2) {
                                    str2 = str4;
                                    String str7 = string;
                                    m1.l(o0Var7);
                                    packageManager = packageManager2;
                                    o0Var7.f13190f.c(ai.o0.L(packageName), "Error retrieving package info. appId, appName", str7);
                                    string = str7;
                                    str3 = installerPackageName;
                                    i5 = Integer.MIN_VALUE;
                                    str4 = str2;
                                    f0Var2.f12929c = packageName;
                                    f0Var2.f12932f = str3;
                                    f0Var2.f12930d = str4;
                                    f0Var2.f12931e = i5;
                                    f0Var2.f12933g = string;
                                    f0Var2.f12934h = 0L;
                                    iG = m1Var7.g();
                                    if (iG != 0) {
                                    }
                                    f0Var2.o = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                    strB = f0Var2.f12939m;
                                    if (!TextUtils.isEmpty(strB)) {
                                    }
                                    if (TextUtils.isEmpty(strB)) {
                                    }
                                    f0Var2.o = str5;
                                    if (iG == 0) {
                                    }
                                    listAsList = null;
                                    f0Var2.f12937k = null;
                                    ai.e eVar2 = m1Var7.f13136d;
                                    m1 m1Var8 = (m1) eVar2.f13368a;
                                    sg.w.e("analytics.safelisted_events");
                                    bundleP = eVar2.P();
                                    if (bundleP == null) {
                                    }
                                    numValueOf = null;
                                    if (numValueOf != null) {
                                    }
                                    if (listAsList == null) {
                                    }
                                    if (packageManager != null) {
                                    }
                                    ((m1) f0Var2.f13368a).C.incrementAndGet();
                                    f0Var2.f13484b = true;
                                    y2Var = new ai.y2(m1Var5);
                                    y2Var.F();
                                    m1Var5.f13151u = y2Var;
                                    if (y2Var.f13484b) {
                                    }
                                }
                            } catch (PackageManager.NameNotFoundException unused3) {
                            }
                        }
                        f0Var2.f12929c = packageName;
                        f0Var2.f12932f = str3;
                        f0Var2.f12930d = str4;
                        f0Var2.f12931e = i5;
                        f0Var2.f12933g = string;
                        f0Var2.f12934h = 0L;
                        iG = m1Var7.g();
                        if (iG != 0) {
                            m1.l(o0Var7);
                            o0Var7.n.a("App measurement collection enabled");
                        } else if (iG == 1) {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement deactivated via the manifest");
                        } else if (iG == 3) {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement disabled by setAnalyticsCollectionEnabled(false)");
                        } else if (iG == 4) {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement disabled via the manifest");
                        } else if (iG == 6) {
                            m1.l(o0Var7);
                            o0Var7.f13195k.a("App measurement deactivated via resources. This method is being deprecated. Please refer to https://firebase.google.com/support/guides/disable-analytics");
                        } else if (iG == 7) {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement disabled via the global data collection setting");
                        } else if (iG != 8) {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement disabled");
                            m1.l(o0Var7);
                            o0Var7.f13191g.a("Invalid scion state in identity");
                        } else {
                            m1.l(o0Var7);
                            o0Var7.f13196l.a("App measurement disabled due to denied storage consent");
                        }
                        f0Var2.o = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        strB = f0Var2.f12939m;
                        if (!TextUtils.isEmpty(strB)) {
                            strB = b2.b(context, m1Var7.f13146p);
                        }
                        if (TextUtils.isEmpty(strB)) {
                            str5 = strB;
                        }
                        f0Var2.o = str5;
                        if (iG == 0) {
                            m1.l(o0Var7);
                            o0Var7.n.c(f0Var2.f12929c, "App measurement enabled for app package, google app id", f0Var2.o);
                        }
                        listAsList = null;
                        f0Var2.f12937k = null;
                        ai.e eVar22 = m1Var7.f13136d;
                        m1 m1Var82 = (m1) eVar22.f13368a;
                        sg.w.e("analytics.safelisted_events");
                        bundleP = eVar22.P();
                        if (bundleP == null) {
                            if (bundleP.containsKey("analytics.safelisted_events")) {
                                numValueOf = Integer.valueOf(bundleP.getInt("analytics.safelisted_events"));
                            }
                            if (numValueOf != null) {
                                try {
                                    String[] stringArray = m1Var82.f13133a.getResources().getStringArray(numValueOf.intValue());
                                    if (stringArray != null) {
                                        listAsList = Arrays.asList(stringArray);
                                    }
                                } catch (Resources.NotFoundException e11) {
                                    ai.o0 o0Var8 = m1Var82.f13138f;
                                    m1.l(o0Var8);
                                    o0Var8.f13190f.b(e11, "Failed to load string array from metadata: resource not found");
                                }
                            }
                            if (listAsList == null) {
                                f0Var2.f12937k = listAsList;
                            } else if (listAsList.isEmpty()) {
                                m1.l(o0Var7);
                                o0Var7.f13195k.a("Safelisted event list is empty. Ignoring");
                            } else {
                                for (String str8 : listAsList) {
                                    p4 p4Var4 = m1Var7.f13141i;
                                    m1.j(p4Var4);
                                    if (!p4Var4.H0("safelisted event", str8)) {
                                    }
                                }
                                f0Var2.f12937k = listAsList;
                            }
                            if (packageManager != null) {
                                f0Var2.n = zg.a.M(context) ? 1 : 0;
                            } else {
                                f0Var2.n = 0;
                            }
                            ((m1) f0Var2.f13368a).C.incrementAndGet();
                            f0Var2.f13484b = true;
                            y2Var = new ai.y2(m1Var5);
                            y2Var.F();
                            m1Var5.f13151u = y2Var;
                            if (y2Var.f13484b) {
                                throw new IllegalStateException(str);
                            }
                            y2Var.f13482c = (JobScheduler) ((m1) y2Var.f13368a).f13133a.getSystemService("jobscheduler");
                            ((m1) y2Var.f13368a).C.incrementAndGet();
                            y2Var.f13484b = true;
                            m1.l(o0Var4);
                            m0 m0Var3 = o0Var4.f13197m;
                            m0 m0Var4 = o0Var4.f13196l;
                            m0 m0Var5 = o0Var4.n;
                            m0 m0Var6 = o0Var4.f13190f;
                            eVar.J();
                            m0Var4.b(161000L, "App measurement initialized, version");
                            m1.l(o0Var4);
                            m0Var4.a("To enable debug logging run: adb shell setprop log.tag.FA VERBOSE");
                            String strJ = f0Var.J();
                            if (p4Var3.i0(strJ, eVar.f12897c)) {
                                m1.l(o0Var4);
                                m0Var4.a("Faster debug mode event logging enabled. To disable, run:\n  adb shell setprop debug.firebase.analytics.app .none.");
                            } else {
                                m1.l(o0Var4);
                                m0Var4.a("To enable faster debug mode event logging run:\n  adb shell setprop debug.firebase.analytics.app ".concat(String.valueOf(strJ)));
                            }
                            m1.l(o0Var4);
                            m0Var3.a("Debug-level message logging enabled");
                            int i12 = m1Var5.A;
                            AtomicInteger atomicInteger = m1Var5.C;
                            if (i12 != atomicInteger.get()) {
                                m1.l(o0Var4);
                                m0Var6.c(Integer.valueOf(m1Var5.A), "Not all components initialized", Integer.valueOf(atomicInteger.get()));
                            }
                            m1Var5.f13152v = true;
                            long j12 = m1Var5.D;
                            z1 z1Var = z1.ANALYTICS_STORAGE;
                            final t2 t2Var = m1Var5.f13145m;
                            k1 k1Var4 = m1Var5.f13139g;
                            m1.l(k1Var4);
                            k1Var4.D();
                            m1.i(m1Var5.f13151u);
                            int I = m1Var5.f13151u.I();
                            z4.a();
                            boolean zO = eVar.O(null, ai.x.P0);
                            boolean z16 = I == 2;
                            if (zO) {
                                p4Var3.D();
                                if (p4Var3.a0() == 1) {
                                    p4Var3.D();
                                    IntentFilter intentFilter = new IntentFilter();
                                    intentFilter.addAction("com.google.android.gms.measurement.TRIGGERS_AVAILABLE");
                                    intentFilter.addAction("com.google.android.gms.measurement.BATCHES_AVAILABLE");
                                    z12 = z16;
                                    m0Var = m0Var6;
                                    p4Var = p4Var3;
                                    o4.a.c(m1Var6.f13133a, new r4(m1Var6), intentFilter, null, 2);
                                    ai.o0 o0Var9 = m1Var6.f13138f;
                                    m1.l(o0Var9);
                                    o0Var9.f13197m.a("Registered app receiver");
                                    if (z12) {
                                        m1.i(m1Var5.f13151u);
                                        m1Var5.f13151u.H(((Long) ai.x.C.a(null)).longValue());
                                    }
                                } else if (z16) {
                                    z16 = true;
                                    p4Var3.D();
                                    IntentFilter intentFilter2 = new IntentFilter();
                                    intentFilter2.addAction("com.google.android.gms.measurement.TRIGGERS_AVAILABLE");
                                    intentFilter2.addAction("com.google.android.gms.measurement.BATCHES_AVAILABLE");
                                    z12 = z16;
                                    m0Var = m0Var6;
                                    p4Var = p4Var3;
                                    o4.a.c(m1Var6.f13133a, new r4(m1Var6), intentFilter2, null, 2);
                                    ai.o0 o0Var92 = m1Var6.f13138f;
                                    m1.l(o0Var92);
                                    o0Var92.f13197m.a("Registered app receiver");
                                    if (z12) {
                                    }
                                } else {
                                    m0Var = m0Var6;
                                    p4Var = p4Var3;
                                }
                            }
                            y0 y0Var3 = z0Var.f13490g;
                            a2 a2VarK = z0Var.K();
                            int i13 = a2VarK.f12833b;
                            x1 x1VarT3 = eVar.T("google_analytics_default_allow_ad_storage", false);
                            x1 x1VarT4 = eVar.T("google_analytics_default_allow_analytics_storage", false);
                            x1 x1Var = x1.UNINITIALIZED;
                            if (x1VarT3 != x1Var || x1VarT4 != x1Var) {
                                y0Var = y0Var3;
                                m1Var = m1Var5;
                                if (a2.l(-10, z0Var.H().getInt("consent_source", 100))) {
                                    EnumMap enumMap = new EnumMap(z1.class);
                                    enumMap.put((EnumMap) z1.AD_STORAGE, (z1) x1VarT3);
                                    enumMap.put((EnumMap) z1Var, (z1) x1VarT4);
                                    a2Var = new a2(enumMap, -10);
                                }
                                z11 = false;
                                if (a2Var != null) {
                                    m1.k(t2Var);
                                    t2Var.Z(a2Var, true);
                                } else {
                                    a2Var = a2VarK;
                                }
                                m1.k(t2Var);
                                m1Var2 = (m1) t2Var.f13368a;
                                t2Var.d0(a2Var);
                                z0Var.D();
                                int i14 = ai.n.b(z0Var.H().getString("dma_consent_settings", null)).f13166a;
                                x1VarT = eVar.T("google_analytics_default_allow_ad_personalization_signals", true);
                                if (x1VarT != x1Var) {
                                    m1.l(o0Var4);
                                    m0Var5.b(x1VarT, "Default ad personalization consent from Manifest");
                                }
                                x1VarT2 = eVar.T("google_analytics_default_allow_ad_user_data", true);
                                if (x1VarT2 != x1Var && a2.l(-10, i14)) {
                                    m1.k(t2Var);
                                    EnumMap enumMap2 = new EnumMap(z1.class);
                                    enumMap2.put((EnumMap) z1.AD_USER_DATA, (z1) x1VarT2);
                                    t2Var.Y(new ai.n(enumMap2, -10, (Boolean) null, (String) null), true);
                                } else if (!TextUtils.isEmpty(m1Var.q().K()) && (i14 == 0 || i14 == 30)) {
                                    m1.k(t2Var);
                                    t2Var.Y(new ai.n((Boolean) null, -10, (Boolean) null, (String) null), true);
                                }
                                boolQ = eVar.Q("google_analytics_tcf_data_enabled");
                                if (boolQ == null || boolQ.booleanValue()) {
                                    m1.l(o0Var4);
                                    m0Var3.a("TCF client enabled.");
                                    m1.k(t2Var);
                                    t2Var.D();
                                    ai.o0 o0Var10 = m1Var2.f13138f;
                                    m1.l(o0Var10);
                                    o0Var10.f13197m.a("Register tcfPrefChangeListener.");
                                    if (t2Var.f13352t == null) {
                                        t2Var.f13353u = new g2(t2Var, m1Var2, 2);
                                        t2Var.f13352t = new SharedPreferences.OnSharedPreferenceChangeListener() { // from class: ai.s2
                                            @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
                                            public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences2, String str9) {
                                                t2 t2Var2 = t2Var;
                                                t2Var2.getClass();
                                                if (Objects.equals(str9, "IABTCF_TCString") || Objects.equals(str9, "IABTCF_gdprApplies") || Objects.equals(str9, "IABTCF_EnableAdvertiserConsentMode")) {
                                                    o0 o0Var11 = ((m1) t2Var2.f13368a).f13138f;
                                                    m1.l(o0Var11);
                                                    o0Var11.n.a("IABTCF_TCString change picked up in listener.");
                                                    g2 g2Var = t2Var2.f13353u;
                                                    sg.w.h(g2Var);
                                                    g2Var.b(500L);
                                                }
                                            }
                                        };
                                    }
                                    z0 z0Var2 = m1Var2.f13137e;
                                    m1.j(z0Var2);
                                    z0Var2.I().registerOnSharedPreferenceChangeListener(t2Var.f13352t);
                                    m1.k(t2Var);
                                    t2Var.J();
                                }
                                w0Var = z0Var.f13489f;
                                if (w0Var.f() == 0) {
                                    m1.l(o0Var4);
                                    m0Var5.b(Long.valueOf(j12), "Persisting first open");
                                    w0Var.g(j12);
                                }
                                m1.k(t2Var);
                                b1Var = t2Var.f13349q;
                                if (b1Var.e() && b1Var.d()) {
                                    z0 z0Var3 = b1Var.f12853b.f13137e;
                                    m1.j(z0Var3);
                                    z0Var3.f13504w.S(null);
                                }
                                if (m1Var.h()) {
                                    p4Var2 = p4Var;
                                    m1Var3 = m1Var;
                                    if (TextUtils.isEmpty(m1Var3.q().K())) {
                                        y0Var2 = y0Var;
                                    } else {
                                        String strK = m1Var3.q().K();
                                        z0Var.D();
                                        String string3 = z0Var.H().getString("gmp_app_id", null);
                                        boolean zIsEmpty = TextUtils.isEmpty(strK);
                                        boolean zIsEmpty2 = TextUtils.isEmpty(string3);
                                        if (zIsEmpty || zIsEmpty2) {
                                            y0Var2 = y0Var;
                                            String strK2 = m1Var3.q().K();
                                            z0Var.D();
                                            SharedPreferences.Editor editorEdit2 = z0Var.H().edit();
                                            editorEdit2.putString("gmp_app_id", strK2);
                                            editorEdit2.apply();
                                        } else {
                                            sg.w.h(strK);
                                            if (!strK.equals(string3)) {
                                                m1.l(o0Var4);
                                                m0Var4.a("Rechecking which service to use due to a GMP App Id change");
                                                z0Var.D();
                                                z0Var.D();
                                                Boolean boolValueOf = z0Var.H().contains("measurement_enabled") ? Boolean.valueOf(z0Var.H().getBoolean("measurement_enabled", true)) : null;
                                                SharedPreferences.Editor editorEdit3 = z0Var.H().edit();
                                                editorEdit3.clear();
                                                editorEdit3.apply();
                                                if (boolValueOf != null) {
                                                    z0Var.D();
                                                    SharedPreferences.Editor editorEdit4 = z0Var.H().edit();
                                                    editorEdit4.putBoolean("measurement_enabled", boolValueOf.booleanValue());
                                                    editorEdit4.apply();
                                                }
                                                m1Var3.n().H();
                                                m1Var3.f13148r.L();
                                                m1Var3.f13148r.J();
                                                w0Var.g(j12);
                                                y0Var2 = y0Var;
                                                y0Var2.S(null);
                                            }
                                            String strK22 = m1Var3.q().K();
                                            z0Var.D();
                                            SharedPreferences.Editor editorEdit22 = z0Var.H().edit();
                                            editorEdit22.putString("gmp_app_id", strK22);
                                            editorEdit22.apply();
                                        }
                                    }
                                    if (!z0Var.K().i(z1Var)) {
                                        y0Var2.S(null);
                                    }
                                    m1.k(t2Var);
                                    t2Var.f13341g.set(y0Var2.R());
                                    try {
                                        m1Var6.f13133a.getClassLoader().loadClass("com.google.firebase.remoteconfig.FirebaseRemoteConfig");
                                    } catch (ClassNotFoundException unused4) {
                                        y0 y0Var4 = z0Var.f13503v;
                                        if (!TextUtils.isEmpty(y0Var4.R())) {
                                            m1.l(o0Var4);
                                            o0Var = o0Var4;
                                            o0Var.f13193i.a("Remote config removed with active feature rollouts");
                                            y0Var4.S(null);
                                        }
                                    }
                                    o0Var = o0Var4;
                                    if (!TextUtils.isEmpty(m1Var3.q().K())) {
                                        boolean zF = m1Var3.f();
                                        SharedPreferences sharedPreferences2 = z0Var.f13486c;
                                        if (!(sharedPreferences2 == null ? z11 : sharedPreferences2.contains("deferred_analytics_collection")) && !eVar.R()) {
                                            z0Var.L(!zF);
                                        }
                                        if (zF) {
                                            m1.k(t2Var);
                                            t2Var.P();
                                        }
                                        x3 x3Var = m1Var3.f13140h;
                                        m1.k(x3Var);
                                        x3Var.f13470e.K();
                                        m1Var3.o().H(new AtomicReference());
                                        m1Var3.o().I(z0Var.f13506y.J0());
                                    }
                                } else {
                                    if (m1Var.f()) {
                                        p4Var2 = p4Var;
                                        if (p4Var2.g0("android.permission.INTERNET")) {
                                            m0Var2 = m0Var;
                                        } else {
                                            m1.l(o0Var4);
                                            m0Var2 = m0Var;
                                            m0Var2.a("App is missing INTERNET permission");
                                        }
                                        if (!p4Var2.g0("android.permission.ACCESS_NETWORK_STATE")) {
                                            m1.l(o0Var4);
                                            m0Var2.a("App is missing ACCESS_NETWORK_STATE permission");
                                        }
                                        m1Var3 = m1Var;
                                        Context context2 = m1Var3.f13133a;
                                        if (!zg.b.a(context2).d() && !eVar.G()) {
                                            if (!p4.y0(context2)) {
                                                m1.l(o0Var4);
                                                m0Var2.a("AppMeasurementReceiver not registered/enabled");
                                            }
                                            if (!p4.Y(context2)) {
                                                m1.l(o0Var4);
                                                m0Var2.a("AppMeasurementService not registered/enabled");
                                            }
                                        }
                                        m1.l(o0Var4);
                                        m0Var2.a("Uploading is not possible. App measurement disabled");
                                    } else {
                                        p4Var2 = p4Var;
                                        m1Var3 = m1Var;
                                    }
                                    o0Var = o0Var4;
                                }
                                z4.a();
                                if (eVar.O(null, ai.x.P0)) {
                                    p4Var2.D();
                                    if (p4Var2.a0() == 1 ? true : z11) {
                                        long jIntValue = ((Integer) ai.x.f13450w0.a(null)).intValue();
                                        long jNextInt = new Random().nextInt(5000);
                                        m1Var3.f13143k.getClass();
                                        long jMax = Math.max(500L, ((jIntValue * 1000) + jNextInt) - SystemClock.elapsedRealtime());
                                        if (jMax > 500) {
                                            m1.l(o0Var);
                                            m0Var5.b(Long.valueOf(jMax), "Waiting to fetch trigger URIs until some time after boot. Delay in millis");
                                        }
                                        m1.k(t2Var);
                                        t2Var.D();
                                        if (t2Var.f13346l == null) {
                                            t2Var.f13346l = new g2(t2Var, m1Var2, 0);
                                        }
                                        t2Var.f13346l.b(jMax);
                                    }
                                }
                                z0Var.o.d(true);
                                return;
                            }
                            y0Var = y0Var3;
                            m1Var = m1Var5;
                            if (TextUtils.isEmpty(m1Var.q().K())) {
                                z11 = false;
                            } else {
                                if (i13 != 0 && i13 != 30 && i13 != 10 && i13 != 40) {
                                    a2Var = null;
                                    z11 = false;
                                    if (a2Var != null) {
                                    }
                                    m1.k(t2Var);
                                    m1Var2 = (m1) t2Var.f13368a;
                                    t2Var.d0(a2Var);
                                    z0Var.D();
                                    int i142 = ai.n.b(z0Var.H().getString("dma_consent_settings", null)).f13166a;
                                    x1VarT = eVar.T("google_analytics_default_allow_ad_personalization_signals", true);
                                    if (x1VarT != x1Var) {
                                    }
                                    x1VarT2 = eVar.T("google_analytics_default_allow_ad_user_data", true);
                                    if (x1VarT2 != x1Var) {
                                        if (!TextUtils.isEmpty(m1Var.q().K())) {
                                            m1.k(t2Var);
                                            t2Var.Y(new ai.n((Boolean) null, -10, (Boolean) null, (String) null), true);
                                        }
                                    }
                                    boolQ = eVar.Q("google_analytics_tcf_data_enabled");
                                    if (boolQ == null) {
                                        m1.l(o0Var4);
                                        m0Var3.a("TCF client enabled.");
                                        m1.k(t2Var);
                                        t2Var.D();
                                        ai.o0 o0Var102 = m1Var2.f13138f;
                                        m1.l(o0Var102);
                                        o0Var102.f13197m.a("Register tcfPrefChangeListener.");
                                        if (t2Var.f13352t == null) {
                                        }
                                        z0 z0Var22 = m1Var2.f13137e;
                                        m1.j(z0Var22);
                                        z0Var22.I().registerOnSharedPreferenceChangeListener(t2Var.f13352t);
                                        m1.k(t2Var);
                                        t2Var.J();
                                    }
                                    w0Var = z0Var.f13489f;
                                    if (w0Var.f() == 0) {
                                    }
                                    m1.k(t2Var);
                                    b1Var = t2Var.f13349q;
                                    if (b1Var.e()) {
                                        z0 z0Var32 = b1Var.f12853b.f13137e;
                                        m1.j(z0Var32);
                                        z0Var32.f13504w.S(null);
                                    }
                                    if (m1Var.h()) {
                                    }
                                    z4.a();
                                    if (eVar.O(null, ai.x.P0)) {
                                    }
                                    z0Var.o.d(true);
                                    return;
                                }
                                m1.k(t2Var);
                                z11 = false;
                                t2Var.Z(new a2(-10), false);
                            }
                            a2Var = null;
                            if (a2Var != null) {
                            }
                            m1.k(t2Var);
                            m1Var2 = (m1) t2Var.f13368a;
                            t2Var.d0(a2Var);
                            z0Var.D();
                            int i1422 = ai.n.b(z0Var.H().getString("dma_consent_settings", null)).f13166a;
                            x1VarT = eVar.T("google_analytics_default_allow_ad_personalization_signals", true);
                            if (x1VarT != x1Var) {
                            }
                            x1VarT2 = eVar.T("google_analytics_default_allow_ad_user_data", true);
                            if (x1VarT2 != x1Var) {
                            }
                            boolQ = eVar.Q("google_analytics_tcf_data_enabled");
                            if (boolQ == null) {
                            }
                            w0Var = z0Var.f13489f;
                            if (w0Var.f() == 0) {
                            }
                            m1.k(t2Var);
                            b1Var = t2Var.f13349q;
                            if (b1Var.e()) {
                            }
                            if (m1Var.h()) {
                            }
                            z4.a();
                            if (eVar.O(null, ai.x.P0)) {
                            }
                            z0Var.o.d(true);
                            return;
                        }
                        ai.o0 o0Var11 = m1Var82.f13138f;
                        m1.l(o0Var11);
                        o0Var11.f13190f.a("Failed to load metadata: Metadata bundle is null");
                        numValueOf = null;
                        if (numValueOf != null) {
                        }
                        if (listAsList == null) {
                        }
                        if (packageManager != null) {
                        }
                        ((m1) f0Var2.f13368a).C.incrementAndGet();
                        f0Var2.f13484b = true;
                        y2Var = new ai.y2(m1Var5);
                        y2Var.F();
                        m1Var5.f13151u = y2Var;
                        if (y2Var.f13484b) {
                        }
                    }
                    installerPackageName = str6;
                    packageInfo = packageManager2.getPackageInfo(context.getPackageName(), 0);
                    if (packageInfo == null) {
                    }
                    f0Var2.f12929c = packageName;
                    f0Var2.f12932f = str3;
                    f0Var2.f12930d = str4;
                    f0Var2.f12931e = i5;
                    f0Var2.f12933g = string;
                    f0Var2.f12934h = 0L;
                    iG = m1Var7.g();
                    if (iG != 0) {
                    }
                    f0Var2.o = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    strB = f0Var2.f12939m;
                    if (!TextUtils.isEmpty(strB)) {
                    }
                    if (TextUtils.isEmpty(strB)) {
                    }
                    f0Var2.o = str5;
                    if (iG == 0) {
                    }
                    listAsList = null;
                    f0Var2.f12937k = null;
                    ai.e eVar222 = m1Var7.f13136d;
                    m1 m1Var822 = (m1) eVar222.f13368a;
                    sg.w.e("analytics.safelisted_events");
                    bundleP = eVar222.P();
                    if (bundleP == null) {
                    }
                    numValueOf = null;
                    if (numValueOf != null) {
                    }
                    if (listAsList == null) {
                    }
                    if (packageManager != null) {
                    }
                    ((m1) f0Var2.f13368a).C.incrementAndGet();
                    f0Var2.f13484b = true;
                    y2Var = new ai.y2(m1Var5);
                    y2Var.F();
                    m1Var5.f13151u = y2Var;
                    if (y2Var.f13484b) {
                    }
                }
                packageManager = packageManager2;
                str3 = installerPackageName;
                i5 = Integer.MIN_VALUE;
                string = str2;
                str4 = string;
                f0Var2.f12929c = packageName;
                f0Var2.f12932f = str3;
                f0Var2.f12930d = str4;
                f0Var2.f12931e = i5;
                f0Var2.f12933g = string;
                f0Var2.f12934h = 0L;
                iG = m1Var7.g();
                if (iG != 0) {
                }
                f0Var2.o = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                strB = f0Var2.f12939m;
                if (!TextUtils.isEmpty(strB)) {
                }
                if (TextUtils.isEmpty(strB)) {
                }
                f0Var2.o = str5;
                if (iG == 0) {
                }
                listAsList = null;
                f0Var2.f12937k = null;
                ai.e eVar2222 = m1Var7.f13136d;
                m1 m1Var8222 = (m1) eVar2222.f13368a;
                sg.w.e("analytics.safelisted_events");
                bundleP = eVar2222.P();
                if (bundleP == null) {
                }
                numValueOf = null;
                if (numValueOf != null) {
                }
                if (listAsList == null) {
                }
                if (packageManager != null) {
                }
                ((m1) f0Var2.f13368a).C.incrementAndGet();
                f0Var2.f13484b = true;
                y2Var = new ai.y2(m1Var5);
                y2Var.F();
                m1Var5.f13151u = y2Var;
                if (y2Var.f13484b) {
                }
                break;
            case 4:
                j4 j4Var = ((t1) this.f779c).f13334a;
                j4Var.V();
                zzah zzahVar = (zzah) this.f778b;
                if (zzahVar.f33759h.zza() == null) {
                    j4Var.getClass();
                    String str9 = zzahVar.f33757f;
                    sg.w.h(str9);
                    zzr zzrVarQ = j4Var.Q(str9);
                    if (zzrVarQ != null) {
                        j4Var.a0(zzahVar, zzrVarQ);
                        return;
                    }
                    return;
                }
                j4Var.getClass();
                String str10 = zzahVar.f33757f;
                sg.w.h(str10);
                zzr zzrVarQ2 = j4Var.Q(str10);
                if (zzrVarQ2 != null) {
                    j4Var.Z(zzahVar, zzrVarQ2);
                    return;
                }
                return;
            case 5:
                f7 f7Var = (f7) this.f778b;
                t2 t2Var2 = (t2) this.f779c;
                m1 m1Var9 = (m1) t2Var2.f13368a;
                m1 m1Var10 = (m1) t2Var2.f13368a;
                x3 x3Var2 = m1Var9.f13140h;
                m1.k(x3Var2);
                m1 m1Var11 = (m1) x3Var2.f13368a;
                z0 z0Var4 = m1Var11.f13137e;
                m1.j(z0Var4);
                if (z0Var4.K().i(z1.ANALYTICS_STORAGE)) {
                    m1.j(z0Var4);
                    w0 w0Var2 = z0Var4.f13498q;
                    m1Var11.f13143k.getClass();
                    if (!z0Var4.M(System.currentTimeMillis()) && w0Var2.f() != 0) {
                        lValueOf = Long.valueOf(w0Var2.f());
                    }
                    if (lValueOf == null) {
                        p4 p4Var5 = m1Var10.f13141i;
                        m1.j(p4Var5);
                        p4Var5.r0(f7Var, lValueOf.longValue());
                        return;
                    } else {
                        try {
                            f7Var.G(null);
                            return;
                        } catch (RemoteException e12) {
                            ai.o0 o0Var12 = m1Var10.f13138f;
                            m1.l(o0Var12);
                            o0Var12.f13190f.b(e12, "getSessionId failed with exception");
                            return;
                        }
                    }
                }
                ai.o0 o0Var13 = m1Var11.f13138f;
                m1.l(o0Var13);
                o0Var13.f13195k.a("Analytics storage consent denied; will not get session id");
                lValueOf = null;
                if (lValueOf == null) {
                }
                break;
            case 6:
                ((t2) this.f779c).U((Boolean) this.f778b, true);
                return;
            case 7:
                t2 t2Var3 = (t2) this.f779c;
                m1 m1Var12 = (m1) t2Var3.f13368a;
                z0 z0Var5 = m1Var12.f13137e;
                ai.o0 o0Var14 = m1Var12.f13138f;
                m1.j(z0Var5);
                z0Var5.D();
                z0Var5.D();
                ai.n nVarB = ai.n.b(z0Var5.H().getString("dma_consent_settings", null));
                ai.n nVar = (ai.n) this.f778b;
                int i15 = nVar.f13166a;
                if (!a2.l(i15, nVarB.f13166a)) {
                    m1.l(o0Var14);
                    o0Var14.f13196l.b(Integer.valueOf(i15), "Lower precedence consent source ignored, proposed source");
                    return;
                }
                SharedPreferences.Editor editorEdit5 = z0Var5.H().edit();
                editorEdit5.putString("dma_consent_settings", nVar.f13167b);
                editorEdit5.apply();
                m1.l(o0Var14);
                o0Var14.n.b(nVar, "Setting DMA consent(FE)");
                m1 m1Var13 = (m1) t2Var3.f13368a;
                if (m1Var13.o().N()) {
                    p3 p3VarO = m1Var13.o();
                    p3VarO.D();
                    p3VarO.E();
                    p3VarO.R(new n3(p3VarO, 1));
                    return;
                }
                p3 p3VarO2 = m1Var13.o();
                p3VarO2.D();
                p3VarO2.E();
                if (p3VarO2.M()) {
                    p3VarO2.R(new k3(p3VarO2, p3VarO2.T(false)));
                    return;
                }
                return;
            case 8:
                t2 t2Var4 = ((AppMeasurementDynamiteService) this.f779c).f33752a.f13145m;
                m1.k(t2Var4);
                c10.a aVar = (c10.a) this.f778b;
                t2Var4.D();
                t2Var4.E();
                c2 c2Var = t2Var4.f13338d;
                if (aVar != c2Var) {
                    sg.w.j("EventInterceptor already set.", c2Var == null);
                }
                t2Var4.f13338d = aVar;
                return;
            case 9:
                t2 t2Var5 = (t2) this.f778b;
                t2Var5.D();
                if (Build.VERSION.SDK_INT < 30) {
                    return;
                }
                List<zzoh> list = (List) this.f779c;
                z0 z0Var6 = ((m1) t2Var5.f13368a).f13137e;
                m1.j(z0Var6);
                SparseArray sparseArrayJ = z0Var6.J();
                for (zzoh zzohVar : list) {
                    int i16 = zzohVar.f33775h;
                    if (!sparseArrayJ.contains(i16) || ((Long) sparseArrayJ.get(i16)).longValue() < zzohVar.f33774g) {
                        t2Var5.b0().add(zzohVar);
                    }
                }
                t2Var5.c0();
                return;
            case 10:
                m1 m1Var14 = (m1) ((t2) this.f778b).f13368a;
                ai.f0 f0VarQ = m1Var14.q();
                String str11 = (String) this.f779c;
                String str12 = f0VarQ.f12942r;
                boolean z17 = false;
                if (str12 != null && !str12.equals(str11)) {
                    z17 = true;
                }
                f0VarQ.f12942r = str11;
                if (z17) {
                    m1Var14.q().I();
                    return;
                }
                return;
            case 11:
                p3 p3Var2 = (p3) this.f779c;
                ai.a0 a0Var2 = p3Var2.f13230d;
                m1 m1Var15 = (m1) p3Var2.f13368a;
                if (a0Var2 == null) {
                    ai.o0 o0Var15 = m1Var15.f13138f;
                    m1.l(o0Var15);
                    o0Var15.f13190f.a("Failed to send current screen to service");
                    return;
                }
                try {
                    b3 b3Var = (b3) this.f778b;
                    if (b3Var == null) {
                        a0Var2.t(0L, null, null, m1Var15.f13133a.getPackageName());
                    } else {
                        a0Var2.t(b3Var.f12869c, b3Var.f12867a, b3Var.f12868b, m1Var15.f13133a.getPackageName());
                    }
                    p3Var2.Q();
                    return;
                } catch (RemoteException e13) {
                    ai.o0 o0Var16 = ((m1) p3Var2.f13368a).f13138f;
                    m1.l(o0Var16);
                    o0Var16.f13190f.b(e13, "Failed to send current screen to the service");
                    return;
                }
            case 12:
                ((o3) this.f779c).f13208c.O((ComponentName) this.f778b);
                return;
            case 13:
                a();
                return;
            case 14:
                b();
                return;
            case 15:
                ((s3) ((Service) ((a5.d) this.f778b).f267b)).b((JobParameters) this.f779c);
                return;
            case 16:
                c();
                return;
            case 17:
                d();
                return;
            case 18:
                e();
                return;
            case 19:
                f();
                return;
            case 20:
                g();
                return;
            case 21:
                h();
                return;
            case 22:
                i();
                return;
            case 23:
                j();
                return;
            case 24:
                k();
                return;
            case 25:
                l();
                return;
            case 26:
                m();
                return;
            case 27:
                n();
                return;
            case 28:
                o();
                return;
            default:
                kk.l lVar = (kk.l) this.f778b;
                mk.o oVar2 = (mk.o) lVar.f71542b;
                oVar2.f76470k = (IInterface) ((mk.m) oVar2.f76467h).a((IBinder) this.f779c);
                Log.i("ServiceConnMgrImpl", "notifyOnConnected");
                Iterator it = ((CopyOnWriteArrayList) oVar2.f76465f).iterator();
                while (it.hasNext()) {
                    ((mk.f) it.next()).getClass();
                    Log.i("HsdpClientImpl", "HSDP bound service connected");
                }
                if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                    Log.i("ServiceConnMgrImpl", "linkToDeath");
                }
                try {
                    iInterface = (IInterface) oVar2.f76470k;
                } catch (RemoteException e14) {
                    Log.e("ServiceConnMgrImpl", "linkToDeath failed", e14);
                }
                if (iInterface == null) {
                    throw null;
                }
                iInterface.asBinder().linkToDeath((kk.i) oVar2.f76468i, 0);
                mk.o oVar3 = (mk.o) lVar.f71542b;
                oVar3.f76460a = false;
                synchronized (((ArrayList) oVar3.f76464e)) {
                    try {
                        Iterator it2 = ((ArrayList) oVar3.f76464e).iterator();
                        while (it2.hasNext()) {
                            ((Runnable) it2.next()).run();
                        }
                        ((ArrayList) oVar3.f76464e).clear();
                    } finally {
                    }
                }
                return;
        }
    }

    public String toString() {
        switch (this.f777a) {
            case 16:
                Runnable runnable = (Runnable) this.f778b;
                if (runnable != null) {
                    return "SequentialExecutorWorker{running=" + runnable + "}";
                }
                StringBuilder sb2 = new StringBuilder("SequentialExecutorWorker{state=");
                int i5 = ((l1) this.f779c).f20035c;
                sb2.append(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? AbstractJsonLexerKt.NULL : "RUNNING" : "QUEUED" : "QUEUING" : "IDLE");
                sb2.append("}");
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public /* synthetic */ z(Object obj, Object obj2, boolean z11, int i5) {
        this.f777a = i5;
        this.f778b = obj;
        this.f779c = obj2;
    }

    public z(a5.d dVar, j4 j4Var, Runnable runnable) {
        this.f777a = 14;
        this.f778b = j4Var;
        this.f779c = runnable;
    }

    public z(ai.a1 a1Var, u6 u6Var, ai.a1 a1Var2) {
        this.f777a = 2;
        this.f778b = u6Var;
        this.f779c = a1Var;
    }

    public z(t2 t2Var, f7 f7Var) {
        this.f777a = 5;
        this.f778b = f7Var;
        Objects.requireNonNull(t2Var);
        this.f779c = t2Var;
    }

    public z(p3 p3Var, b3 b3Var) {
        this.f777a = 11;
        this.f778b = b3Var;
        Objects.requireNonNull(p3Var);
        this.f779c = p3Var;
    }

    public z(l1 l1Var) {
        this.f777a = 16;
        this.f779c = l1Var;
    }

    public z(SwipeDismissBehavior swipeDismissBehavior, View view, boolean z11) {
        this.f777a = 18;
        this.f779c = swipeDismissBehavior;
        this.f778b = view;
    }
}
