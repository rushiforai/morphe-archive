package tx;

import android.content.Context;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Build;
import com.amplitude.android.Amplitude;
import com.google.android.gms.internal.measurement.ge;
import com.instabridge.ai.auth.AiAccessDecision;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.auth.ConsentStatus;
import com.instabridge.ai.billing.BillingManager;
import com.instabridge.ai.bubble.BubbleStore;
import com.instabridge.ai.chat.data.ConversationSuggestionStore;
import com.instabridge.ai.context.AppInstallListener;
import com.instabridge.ai.proactive.AiEngagementTracker;
import com.instabridge.ai.proactive.AiInsightStore;
import com.instabridge.ai.proactive.AiProactiveManager;
import com.instabridge.ai.prompts.PersonalizedPromptStore;
import com.instabridge.ai.tools.IntentToolDiscovery;
import com.instabridge.mobilesdk.MobileSdk;
import com.teslacoilsw.launcher.NovaLauncher;
import e00.j5;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d1 {

    /* renamed from: a, reason: collision with root package name */
    public static final d1 f89690a = new d1();

    /* renamed from: b, reason: collision with root package name */
    public static final Set f89691b = kotlin.collections.c.f1(new String[]{"ai_chat_message_sent", "chat_message_sent"});

    /* renamed from: c, reason: collision with root package name */
    public static final y70.d f89692c;

    /* renamed from: d, reason: collision with root package name */
    public static final c80.d f89693d;

    /* renamed from: e, reason: collision with root package name */
    public static volatile long f89694e;

    /* renamed from: f, reason: collision with root package name */
    public static volatile long f89695f;

    /* renamed from: g, reason: collision with root package name */
    public static volatile boolean f89696g;

    static {
        t70.i2 i2VarD = t70.m0.d();
        a80.e eVar = t70.y0.f88884a;
        f89692c = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, y70.o.f96819a.f90673f));
        f89693d = new c80.d();
    }

    public static void d() {
        f89694e = 0L;
        p2 p2Var = k2.f89842d;
        p2Var.f89944b = 0L;
        p2Var.f89945c = false;
    }

    public static void e() {
        if (f89696g) {
            return;
        }
        WeakReference weakReference = i1.f89802a;
        NovaLauncher novaLauncher = weakReference != null ? (NovaLauncher) weakReference.get() : null;
        if (novaLauncher == null) {
            return;
        }
        ArrayList arrayListB = i2.b(novaLauncher);
        if (!arrayListB.isEmpty()) {
            Iterator it = arrayListB.iterator();
            while (it.hasNext()) {
                if (j10.m.f68633f.contains((String) it.next())) {
                    break;
                }
            }
        }
        if (arrayListB.isEmpty()) {
            return;
        }
        f89696g = true;
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("NOVA_AI");
        bVar.h("Requesting missing permissions: " + arrayListB, new Object[0]);
        n4.b.g(novaLauncher, (String[]) arrayListB.toArray(new String[0]), 1001);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String h() {
        Object objA;
        if (!fo.d.j()) {
            return null;
        }
        try {
            int i5 = Result.f71687b;
            String personId = fo.d.a().getPersonId();
            if (personId != null) {
                boolean zU0 = r70.k.U0(personId);
                objA = personId;
                if (zU0) {
                    objA = null;
                }
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        return (String) (objA instanceof Result.Failure ? null : objA);
    }

    public static void i() {
        if (p.b() && fo.d.j()) {
            a80.e eVar = t70.y0.f88884a;
            t70.m0.t(f89692c, a80.d.f488c, null, new b10.r0(2, null, 19), 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x02df A[Catch: all -> 0x0066, TryCatch #3 {all -> 0x0066, blocks: (B:14:0x0029, B:18:0x0031, B:20:0x0053, B:23:0x0069, B:25:0x007c, B:26:0x008a, B:30:0x00c5, B:40:0x0103, B:44:0x012d, B:53:0x0149, B:55:0x0155, B:59:0x018b, B:67:0x01a2, B:69:0x01ae, B:71:0x01bc, B:73:0x01c0, B:77:0x01ee, B:85:0x0205, B:87:0x0211, B:92:0x024a, B:93:0x02a5, B:94:0x02bb, B:103:0x02df, B:108:0x02ee, B:122:0x0354, B:124:0x0366, B:126:0x0372, B:127:0x037d, B:129:0x0384, B:131:0x0399, B:132:0x03a1, B:109:0x0300, B:117:0x0329, B:121:0x0336, B:115:0x031f, B:101:0x02d5, B:91:0x0241, B:33:0x00da, B:36:0x00eb, B:39:0x00f2, B:10:0x001d, B:88:0x021b), top: B:147:0x001d, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x02eb  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0300 A[Catch: all -> 0x0066, TRY_LEAVE, TryCatch #3 {all -> 0x0066, blocks: (B:14:0x0029, B:18:0x0031, B:20:0x0053, B:23:0x0069, B:25:0x007c, B:26:0x008a, B:30:0x00c5, B:40:0x0103, B:44:0x012d, B:53:0x0149, B:55:0x0155, B:59:0x018b, B:67:0x01a2, B:69:0x01ae, B:71:0x01bc, B:73:0x01c0, B:77:0x01ee, B:85:0x0205, B:87:0x0211, B:92:0x024a, B:93:0x02a5, B:94:0x02bb, B:103:0x02df, B:108:0x02ee, B:122:0x0354, B:124:0x0366, B:126:0x0372, B:127:0x037d, B:129:0x0384, B:131:0x0399, B:132:0x03a1, B:109:0x0300, B:117:0x0329, B:121:0x0336, B:115:0x031f, B:101:0x02d5, B:91:0x0241, B:33:0x00da, B:36:0x00eb, B:39:0x00f2, B:10:0x001d, B:88:0x021b), top: B:147:0x001d, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0329 A[Catch: all -> 0x0066, TryCatch #3 {all -> 0x0066, blocks: (B:14:0x0029, B:18:0x0031, B:20:0x0053, B:23:0x0069, B:25:0x007c, B:26:0x008a, B:30:0x00c5, B:40:0x0103, B:44:0x012d, B:53:0x0149, B:55:0x0155, B:59:0x018b, B:67:0x01a2, B:69:0x01ae, B:71:0x01bc, B:73:0x01c0, B:77:0x01ee, B:85:0x0205, B:87:0x0211, B:92:0x024a, B:93:0x02a5, B:94:0x02bb, B:103:0x02df, B:108:0x02ee, B:122:0x0354, B:124:0x0366, B:126:0x0372, B:127:0x037d, B:129:0x0384, B:131:0x0399, B:132:0x03a1, B:109:0x0300, B:117:0x0329, B:121:0x0336, B:115:0x031f, B:101:0x02d5, B:91:0x0241, B:33:0x00da, B:36:0x00eb, B:39:0x00f2, B:10:0x001d, B:88:0x021b), top: B:147:0x001d, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0335  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0027 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0029 A[Catch: all -> 0x0066, TRY_ENTER, TRY_LEAVE, TryCatch #3 {all -> 0x0066, blocks: (B:14:0x0029, B:18:0x0031, B:20:0x0053, B:23:0x0069, B:25:0x007c, B:26:0x008a, B:30:0x00c5, B:40:0x0103, B:44:0x012d, B:53:0x0149, B:55:0x0155, B:59:0x018b, B:67:0x01a2, B:69:0x01ae, B:71:0x01bc, B:73:0x01c0, B:77:0x01ee, B:85:0x0205, B:87:0x0211, B:92:0x024a, B:93:0x02a5, B:94:0x02bb, B:103:0x02df, B:108:0x02ee, B:122:0x0354, B:124:0x0366, B:126:0x0372, B:127:0x037d, B:129:0x0384, B:131:0x0399, B:132:0x03a1, B:109:0x0300, B:117:0x0329, B:121:0x0336, B:115:0x031f, B:101:0x02d5, B:91:0x0241, B:33:0x00da, B:36:0x00eb, B:39:0x00f2, B:10:0x001d, B:88:0x021b), top: B:147:0x001d, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void a(Context context) {
        boolean zD;
        boolean zD2;
        Context contextE;
        boolean zD3;
        Context contextE2;
        Context contextE3;
        try {
            Context context2 = mx.g0.f77088a;
            contextE3 = mx.g0.e();
        } catch (Throwable unused) {
        }
        if (!q0.c(contextE3)) {
            if (!cy.d0.x(contextE3)) {
                try {
                    zy.c cVar = zy.c.f98823a;
                    zD = zy.c.d("nova_ai_enabled", true);
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (zD) {
                return;
            }
            if (fo.d.j()) {
                return;
            }
            Context applicationContext = context.getApplicationContext();
            int i5 = 9;
            fo.d.f55485y = new n00.d(applicationContext, i5);
            fo.d.i(applicationContext, new e00.s0(applicationContext, 5));
            fo.d.f55475m = r.f89973d;
            k2 k2Var = k2.f89839a;
            if (k2.d()) {
                fo.d.f55479s = new h10.k1(2, k2Var, k2.class, "onSignInRequested", "onSignInRequested(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V", 0, 19);
            }
            q0.f(context);
            p.c(context);
            vx.t tVar = vx.t.f93370a;
            vx.t.c(applicationContext);
            Continuation continuation = null;
            if (ps.k.r()) {
                y70.d dVar = f89692c;
                a80.e eVar = t70.y0.f88884a;
                t70.m0.t(dVar, a80.d.f488c, null, new cy.t(applicationContext, continuation, i5), 2);
            }
            wm.c cVarA = ((wm.g) ul.g.c().b(wm.g.class)).a();
            lo.b bVarG = fo.d.g();
            bVarG.f75072b.put("left_swipe", new lo.a("left_swipe", lo.c.f75076b, 68, 0L, null));
            int iB = (int) cVarA.b("ai_surface_left_swipe_min_score");
            Integer numValueOf = Integer.valueOf(iB);
            if (iB <= 0) {
                numValueOf = null;
            }
            int i11 = 6;
            bVarG.f75073c.put("left_swipe", new lo.d(6, (Long) null, numValueOf));
            if (cy.d0.x(context) && !context.getSharedPreferences("nova_ai_surfaces", 0).getBoolean("left_swipe_disabled_by_user", false) && !bVarG.b("left_swipe")) {
                bVarG.c("left_swipe", true);
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("NOVA_AI");
                bVar.b("Reconcile: SDK surface left_swipe was disabled for Plus user; re-enabled", new Object[0]);
            }
            lo.c cVar2 = lo.c.f75075a;
            bVarG.f75072b.put("app_drawer", new lo.a("app_drawer", cVar2, 72, 7200000L, null));
            int iB2 = (int) cVarA.b("ai_surface_app_drawer_min_score");
            Integer numValueOf2 = Integer.valueOf(iB2);
            if (iB2 <= 0) {
                numValueOf2 = null;
            }
            long jB = cVarA.b("ai_surface_app_drawer_max_frequency_hours");
            Long lValueOf = Long.valueOf(jB);
            if (!(jB > 0)) {
                lValueOf = null;
            }
            int i12 = 4;
            bVarG.f75073c.put("app_drawer", new lo.d(4, lValueOf != null ? Long.valueOf(lValueOf.longValue() * 3600000) : null, numValueOf2));
            bVarG.f75072b.put("home_chip", new lo.a("home_chip", cVar2, 78, 14400000L, 7));
            int iB3 = (int) cVarA.b("ai_surface_home_chip_min_score");
            Integer numValueOf3 = Integer.valueOf(iB3);
            if (iB3 <= 0) {
                numValueOf3 = null;
            }
            long jB2 = cVarA.b("ai_surface_home_chip_max_frequency_hours");
            Long lValueOf2 = Long.valueOf(jB2);
            if (!(jB2 > 0)) {
                lValueOf2 = null;
            }
            bVarG.f75073c.put("home_chip", new lo.d(numValueOf3, lValueOf2 != null ? Long.valueOf(lValueOf2.longValue() * 3600000) : null, cVarA.c("ai_surface_home_chip_enabled").equals("false") ? Boolean.FALSE : null));
            bVarG.f75072b.put("notification", new lo.a("notification", lo.c.f75077c, 85, 86400000L, 7));
            int iB4 = (int) cVarA.b("ai_surface_notification_min_score");
            Integer numValueOf4 = Integer.valueOf(iB4);
            if (iB4 <= 0) {
                numValueOf4 = null;
            }
            long jB3 = cVarA.b("ai_surface_notification_max_frequency_hours");
            Long lValueOf3 = Long.valueOf(jB3);
            if (!(jB3 > 0)) {
                lValueOf3 = null;
            }
            bVarG.f75073c.put("notification", new lo.d(4, lValueOf3 != null ? Long.valueOf(lValueOf3.longValue() * 3600000) : null, numValueOf4));
            try {
                tz.k kVar = new tz.k(applicationContext, f89692c);
                e10.y2.f51877a.getClass();
                tz.u uVar = ((tz.g) e10.y2.b(applicationContext).l()).f90112a;
                tz.o oVar = kVar.f90137c;
                tz.c.Companion.getClass();
                uVar.f(oVar, -16777216);
            } catch (Throwable th3) {
                mc0.d.f76206a.p(th3, "Failed to derive Nova bubble accent; falling back to hardcoded orange", new Object[0]);
            }
            y70.d dVar2 = fo.d.f55463a;
            fo.d.o = vx.t.f93370a;
            fo.d.f55476p = q3.f89964a;
            fo.d.f55477q = h4.f89785a;
            int i13 = 15;
            IntentToolDiscovery.INSTANCE.setShortcutProvider(new rl.g(i13));
            fo.d.f55481u = new j5(2, continuation, 19);
            fo.d.f55482v = v0.f90030a;
            fo.d.f55483w = new sx.d(i11);
            fo.d.f55480t = new r();
            fo.d.f55484x = new pu.h(applicationContext, continuation, i13);
            fo.d.f55478r = new r();
            fo.d.a().setOnCategoryConsentChanged(new t00.s(i12));
            AppInstallListener.INSTANCE.setOnAppInstalled(new t00.s(5));
            try {
                p7.s.c(applicationContext).b("personalized_prompt_refresh");
                Intrinsics.d(p7.s.c(applicationContext).b("personalized_prompt_refresh_unlock"));
            } catch (Exception unused2) {
            }
            if (p.b()) {
                try {
                    Context context3 = mx.g0.f77088a;
                    contextE = mx.g0.e();
                } catch (Throwable unused3) {
                }
                if (!q0.c(contextE)) {
                    if (!cy.d0.x(contextE)) {
                        zy.c cVar3 = zy.c.f98823a;
                        zD2 = zy.c.d("nova_ai_enabled", true);
                    }
                    if (!zD2) {
                        zy.c cVar4 = zy.c.f98823a;
                        boolean z11 = zy.c.d("nova_ai_bubbles_enabled", true);
                        if (z11) {
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r("NOVA_AI");
                            bVar2.b("ensureInitialized: calling startProactiveBubbles (hasFullAccess, bubblesEnabled)", new Object[0]);
                            fo.d.l(applicationContext);
                        } else {
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r("NOVA_AI");
                            o oVarA = p.a();
                            try {
                                Context context4 = mx.g0.f77088a;
                                contextE2 = mx.g0.e();
                            } catch (Throwable unused4) {
                            }
                            if (!q0.c(contextE2)) {
                                if (!cy.d0.x(contextE2)) {
                                    zy.c cVar5 = zy.c.f98823a;
                                    zD3 = zy.c.d("nova_ai_enabled", true);
                                }
                                if (!zD3) {
                                    zy.c cVar6 = zy.c.f98823a;
                                    boolean z12 = zy.c.d("nova_ai_bubbles_enabled", true);
                                    bVar3.b("ensureInitialized: skipping startProactiveBubbles (access=" + oVarA + ", bubbles=" + z12 + ")", new Object[0]);
                                }
                            }
                            zD3 = true;
                            if (!zD3) {
                            }
                        }
                    }
                }
                zD2 = true;
                if (!zD2) {
                }
            }
            SharedPreferences sharedPreferences = applicationContext.getSharedPreferences("nova_ai_surfaces", 0);
            long j11 = sharedPreferences.getLong("home_chip_dismissed_ms", 0L);
            if (j11 > 0 && System.currentTimeMillis() - j11 > 604800000) {
                sharedPreferences.edit().remove("home_chip_dismissed_ms").apply();
            }
            t4.a(applicationContext);
            if (!t4.f90018c) {
                t4.f90018c = true;
                ge geVar = new ge(2);
                IntentFilter intentFilter = new IntentFilter("android.intent.action.WALLPAPER_CHANGED");
                if (Build.VERSION.SDK_INT >= 33) {
                    applicationContext.getApplicationContext().registerReceiver(geVar, intentFilter, 4);
                } else {
                    applicationContext.getApplicationContext().registerReceiver(geVar, intentFilter);
                }
            }
            return;
        }
        zD = true;
        if (zD) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0071, code lost:
    
        if (r8.saveAppVisibleCategoryConsent((java.util.Map) r9, true, r0) != r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Context context, ContinuationImpl continuationImpl) {
        z0 z0Var;
        if (continuationImpl instanceof z0) {
            z0Var = (z0) continuationImpl;
            int i5 = z0Var.f90085w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z0Var.f90085w = i5 - Integer.MIN_VALUE;
            } else {
                z0Var = new z0(this, continuationImpl);
            }
        }
        Object objE = z0Var.f90083u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = z0Var.f90085w;
        if (i11 == 0) {
            ResultKt.b(objE);
            k2 k2Var = k2.f89839a;
            z0Var.f90082t = context;
            z0Var.f90085w = 1;
            if (k2.c(context, "consent_save", z0Var) != obj) {
            }
            return obj;
        }
        if (i11 == 1) {
            context = z0Var.f90082t;
            ResultKt.b(objE);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objE);
                return Unit.f71706a;
            }
            ResultKt.b(objE);
            AiAuthManager aiAuthManagerA = fo.d.a();
            z0Var.f90085w = 3;
        }
        String str = fo.d.c().f55436a;
        r rVar = r.f89974e;
        z0Var.f90082t = null;
        z0Var.f90085w = 2;
        objE = rVar.e(context, str, z0Var);
        if (objE != obj) {
            AiAuthManager aiAuthManagerA2 = fo.d.a();
            z0Var.f90085w = 3;
        }
        return obj;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(29:0|2|(2:4|(1:6)(1:7))(0)|8|(1:67)|(1:(1:11)(2:17|18))(8:19|(2:21|(1:23))|52|64|53|(1:58)(2:59|(1:61))|62|63)|66|25|(1:27)|28|(1:30)|31|(1:33)|34|(1:36)|37|(1:39)|40|(1:44)|45|(1:49)|50|52|64|53|(0)(0)|62|63|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x018a, code lost:
    
        r10 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x018b, code lost:
    
        r0 = mc0.d.f76206a;
        r0.r("NOVA_AI");
        r0.p(r10, "signedInUserId during sign-out", new java.lang.Object[0]);
        r10 = null;
     */
    /* JADX WARN: Removed duplicated region for block: B:58:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        a1 a1Var;
        Long lSignedInUserId;
        AiEngagementTracker engagementTracker;
        AiInsightStore insightStore;
        if (continuationImpl instanceof a1) {
            a1Var = (a1) continuationImpl;
            int i5 = a1Var.f89648v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a1Var.f89648v = i5 - Integer.MIN_VALUE;
            } else {
                a1Var = new a1(this, continuationImpl);
            }
        }
        Object obj = a1Var.f89646t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a1Var.f89648v;
        try {
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e11, "logout during sign-out", new Object[0]);
        }
        if (i11 == 0) {
            ResultKt.b(obj);
            f89694e = 0L;
            Context context = mx.g0.f77088a;
            mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).edit().remove("instabridge_user_id").remove("instabridge_token").apply();
            mx.g0.e().getSharedPreferences("nova_ai_sdk_login", 0).edit().clear().apply();
            cy.d0.h(mx.g0.e(), "google_session_cleared");
            mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).edit().clear().apply();
            ps.k.f82914b = Boolean.FALSE;
            ps.k.f82915c = null;
            ps.k.f82916d = null;
            ps.k.f82917e = true;
            w70.i2 i2Var = p.f89933a;
            p.c(mx.g0.e());
            g2.f89757b.j(null);
            g2.f89759d = false;
            w70.i2 i2Var2 = q0.f89956a;
            mx.g0.e().getApplicationContext().getApplicationContext().getSharedPreferences("nova_ai_entitlement", 0).edit().clear().apply();
            w70.i2 i2Var3 = q0.f89956a;
            p0 p0Var = new p0();
            i2Var3.getClass();
            i2Var3.k(null, p0Var);
            q0.f89957b.j(q0.j((p0) i2Var3.getValue()));
            if (fo.d.j()) {
                AiAuthManager aiAuthManagerA = fo.d.a();
                a1Var.f89648v = 1;
                if (aiAuthManagerA.logout(a1Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            yx.b.f97678a.f();
            lSignedInUserId = MobileSdk.INSTANCE.signedInUserId();
            if (lSignedInUserId == null) {
                yx.b bVar2 = yx.b.f97678a;
                yx.b.c(lSignedInUserId.toString());
            } else {
                yx.b bVar3 = yx.b.f97678a;
                yx.b.f97683f = null;
                yx.b.f97684g.clear();
                Amplitude amplitude = yx.b.f97679b;
                if (amplitude != null) {
                    amplitude.reset();
                }
            }
            p6.f.f82160a = false;
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        AiAuthManager aiAuthManager = fo.d.f55466d;
        if (aiAuthManager != null) {
            aiAuthManager.clearSession();
        }
        ConversationSuggestionStore.INSTANCE.clearAll();
        BubbleStore bubbleStore = fo.d.f55471i;
        if (bubbleStore != null) {
            bubbleStore.clear();
        }
        PersonalizedPromptStore personalizedPromptStore = fo.d.f55472j;
        if (personalizedPromptStore != null) {
            personalizedPromptStore.clear();
        }
        BillingManager billingManager = fo.d.f55473k;
        if (billingManager != null) {
            billingManager.destroy();
        }
        fo.d.f55473k = null;
        AiProactiveManager aiProactiveManager = fo.d.f55474l;
        if (aiProactiveManager != null) {
            aiProactiveManager.destroy();
        }
        AiProactiveManager aiProactiveManager2 = fo.d.f55474l;
        if (aiProactiveManager2 != null && (insightStore = aiProactiveManager2.getInsightStore()) != null) {
            insightStore.clear();
        }
        AiProactiveManager aiProactiveManager3 = fo.d.f55474l;
        if (aiProactiveManager3 != null && (engagementTracker = aiProactiveManager3.getEngagementTracker()) != null) {
            engagementTracker.clear();
        }
        fo.d.f55474l = null;
        fo.d.f55464b = null;
        fo.d.f55465c = null;
        fo.d.f55466d = null;
        fo.d.f55467e = null;
        fo.d.f55468f = null;
        fo.d.f55469g = null;
        fo.d.f55470h = null;
        fo.d.f55471i = null;
        fo.d.f55472j = null;
        AppInstallListener appInstallListener = AppInstallListener.INSTANCE;
        appInstallListener.setOnAppInstalled(null);
        appInstallListener.setOnAppUninstalled(null);
        IntentToolDiscovery.INSTANCE.setShortcutProvider(null);
        fo.d.f55478r = null;
        fo.d.f55479s = null;
        fo.d.f55480t = go.b.f57749a;
        yx.b.f97678a.f();
        lSignedInUserId = MobileSdk.INSTANCE.signedInUserId();
        if (lSignedInUserId == null) {
        }
        p6.f.f82160a = false;
        return Unit.f71706a;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(13:163|164|165|(8:212|167|(6:169|(0)(1:172)|(4:174|(1:176)|(1:179)|194)|177|(0)(0)|194)|171|(0)|177|(0)|194)(1:180)|181|226|182|(6:184|(0)(1:187)|(4:189|(1:191)|193|194)|192|193|194)|186|(0)|192|193|194) */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x0493, code lost:
    
        if (tx.q0.h(r0, r19, r7) == r9) goto L196;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0219, code lost:
    
        if (t70.m0.y(a80.d.f488c, new c0.b1(r10, "cooldown_missing_sdk_session", null, 25), r7) == r9) goto L196;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02cb  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0308 A[Catch: all -> 0x0092, TryCatch #14 {all -> 0x0092, blocks: (B:150:0x0399, B:28:0x0089, B:118:0x02cd, B:125:0x02e7, B:127:0x0308, B:129:0x0318, B:136:0x0338, B:138:0x033e, B:143:0x0373, B:144:0x0381, B:132:0x031d, B:124:0x02d5, B:35:0x00a5), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0315  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x031c  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x031d A[Catch: all -> 0x0092, TryCatch #14 {all -> 0x0092, blocks: (B:150:0x0399, B:28:0x0089, B:118:0x02cd, B:125:0x02e7, B:127:0x0308, B:129:0x0318, B:136:0x0338, B:138:0x033e, B:143:0x0373, B:144:0x0381, B:132:0x031d, B:124:0x02d5, B:35:0x00a5), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0335  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0337  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x033e A[Catch: all -> 0x0092, TryCatch #14 {all -> 0x0092, blocks: (B:150:0x0399, B:28:0x0089, B:118:0x02cd, B:125:0x02e7, B:127:0x0308, B:129:0x0318, B:136:0x0338, B:138:0x033e, B:143:0x0373, B:144:0x0381, B:132:0x031d, B:124:0x02d5, B:35:0x00a5), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:141:0x036d  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x0394  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03a9 A[Catch: all -> 0x0073, TRY_ENTER, TryCatch #15 {all -> 0x0073, blocks: (B:21:0x0068, B:153:0x03a9, B:155:0x03b5, B:156:0x03b8, B:157:0x03bf, B:160:0x03da, B:38:0x00b6, B:95:0x0236, B:101:0x024f, B:103:0x025a, B:104:0x0278), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:159:0x03d9  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x03da A[Catch: all -> 0x0073, TRY_LEAVE, TryCatch #15 {all -> 0x0073, blocks: (B:21:0x0068, B:153:0x03a9, B:155:0x03b5, B:156:0x03b8, B:157:0x03bf, B:160:0x03da, B:38:0x00b6, B:95:0x0236, B:101:0x024f, B:103:0x025a, B:104:0x0278), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:163:0x03e0  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0411 A[Catch: all -> 0x004c, TryCatch #8 {all -> 0x004c, blocks: (B:13:0x0047, B:197:0x0496, B:18:0x0055, B:164:0x03e2, B:174:0x0411, B:179:0x041e, B:194:0x0483, B:181:0x0431, B:189:0x0458, B:193:0x0462, B:187:0x044f, B:172:0x0406, B:114:0x02b6, B:107:0x0283, B:92:0x0222), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:179:0x041e A[Catch: all -> 0x004c, TryCatch #8 {all -> 0x004c, blocks: (B:13:0x0047, B:197:0x0496, B:18:0x0055, B:164:0x03e2, B:174:0x0411, B:179:0x041e, B:194:0x0483, B:181:0x0431, B:189:0x0458, B:193:0x0462, B:187:0x044f, B:172:0x0406, B:114:0x02b6, B:107:0x0283, B:92:0x0222), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:180:0x042f  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0446 A[Catch: all -> 0x044f, TRY_LEAVE, TryCatch #10 {all -> 0x044f, blocks: (B:182:0x043a, B:184:0x0446), top: B:226:0x043a }] */
    /* JADX WARN: Removed duplicated region for block: B:189:0x0458 A[Catch: all -> 0x004c, TryCatch #8 {all -> 0x004c, blocks: (B:13:0x0047, B:197:0x0496, B:18:0x0055, B:164:0x03e2, B:174:0x0411, B:179:0x041e, B:194:0x0483, B:181:0x0431, B:189:0x0458, B:193:0x0462, B:187:0x044f, B:172:0x0406, B:114:0x02b6, B:107:0x0283, B:92:0x0222), top: B:223:0x0038 }] */
    /* JADX WARN: Removed duplicated region for block: B:212:0x03ee A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0109 A[Catch: all -> 0x0114, TRY_LEAVE, TryCatch #16 {all -> 0x0114, blocks: (B:47:0x00fd, B:49:0x0109), top: B:235:0x00fd }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x011f A[Catch: all -> 0x0128, TRY_LEAVE, TryCatch #4 {all -> 0x0128, blocks: (B:54:0x011f, B:59:0x012c, B:61:0x0165, B:64:0x017b, B:74:0x01a1, B:80:0x01df, B:83:0x01e6, B:85:0x01ee, B:86:0x01fb, B:79:0x01d9, B:110:0x028c, B:52:0x0114, B:76:0x01c9), top: B:216:0x0114, inners: #18 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x012c A[Catch: all -> 0x0128, TRY_ENTER, TryCatch #4 {all -> 0x0128, blocks: (B:54:0x011f, B:59:0x012c, B:61:0x0165, B:64:0x017b, B:74:0x01a1, B:80:0x01df, B:83:0x01e6, B:85:0x01ee, B:86:0x01fb, B:79:0x01d9, B:110:0x028c, B:52:0x0114, B:76:0x01c9), top: B:216:0x0114, inners: #18 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0023  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x024c  */
    /* JADX WARN: Type inference failed for: r0v35, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r1v0, types: [tx.d1] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v21 */
    /* JADX WARN: Type inference failed for: r3v22, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r3v24, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r5v10, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v8, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(Context context, boolean z11, boolean z12, ContinuationImpl continuationImpl) throws Throwable {
        b1 b1Var;
        Context context2;
        boolean z13;
        c80.d dVar;
        boolean z14;
        boolean z15;
        boolean zD;
        String str;
        String str2;
        long jCurrentTimeMillis;
        boolean z16;
        c80.d dVar2;
        Context context3;
        Object objA;
        Object obj;
        long j11;
        Object obj2;
        Object obj3;
        ConsentStatus consentSnapshot;
        Context contextE;
        int size;
        c80.a aVar;
        boolean z17;
        AiAccessDecision aiAccessDecision;
        ?? r52;
        String personId;
        ConsentStatus consentStatus;
        String strConcat;
        String string;
        boolean z18;
        String str3;
        String str4;
        Context context4;
        r rVar;
        ?? r32;
        Object objY;
        c80.a aVar2;
        Context context5;
        boolean zD2;
        boolean z19;
        String str5;
        boolean z21;
        Context contextE2;
        boolean z22;
        boolean zD3;
        Context contextE3;
        ?? r12 = f89690a;
        String str6 = "resolveConsentAndSync: pool urgent (";
        if (continuationImpl instanceof b1) {
            b1Var = (b1) continuationImpl;
            int i5 = b1Var.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b1Var.A = i5 - Integer.MIN_VALUE;
            } else {
                b1Var = new b1(this, continuationImpl);
            }
        }
        Object objResolveConsent = b1Var.f89662y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        try {
            try {
                try {
                    switch (b1Var.A) {
                        case 0:
                            ResultKt.b(objResolveConsent);
                            c80.d dVar3 = f89693d;
                            context2 = context;
                            b1Var.f89657t = context2;
                            b1Var.f89658u = dVar3;
                            z13 = z11;
                            b1Var.f89659v = z13;
                            b1Var.f89660w = z12;
                            b1Var.A = 1;
                            if (dVar3.e(b1Var) != coroutineSingletons) {
                                dVar = dVar3;
                                z14 = z12;
                                try {
                                    Context context6 = mx.g0.f77088a;
                                    contextE = mx.g0.e();
                                } catch (Throwable unused) {
                                }
                                if (!q0.c(contextE)) {
                                    if (!cy.d0.x(contextE)) {
                                        try {
                                            zy.c cVar = zy.c.f98823a;
                                            z15 = z13;
                                            zD = zy.c.d("nova_ai_enabled", true);
                                        } catch (Throwable th2) {
                                            th = th2;
                                            r12 = dVar;
                                            ((c80.d) r12).g(null);
                                            throw th;
                                        }
                                    }
                                    if (!zD) {
                                        Unit unit = Unit.f71706a;
                                        dVar.g(null);
                                        return unit;
                                    }
                                    ps.k.f82914b = Boolean.valueOf(ps.k.j());
                                    ps.k.f82915c = ps.k.n();
                                    Context context7 = mx.g0.f77088a;
                                    str = "Consent resolve completed but access=";
                                    str2 = "nova_ai_enabled";
                                    ps.k.f82916d = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_display_name", null);
                                    ps.k.f82917e = true;
                                    r12.a(context2);
                                    if (!fo.d.j()) {
                                        mc0.b bVar = mc0.d.f76206a;
                                        bVar.r("NOVA_AI");
                                        bVar.n("resolveConsentAndSync: SDK not initialized, aborting", new Object[0]);
                                        Unit unit2 = Unit.f71706a;
                                        dVar.g(null);
                                        return unit2;
                                    }
                                    jCurrentTimeMillis = System.currentTimeMillis();
                                    long j12 = jCurrentTimeMillis - f89694e;
                                    if (!z15 && j12 < 30000) {
                                        try {
                                            consentSnapshot = fo.d.a().getConsentSnapshot();
                                        } catch (Throwable unused2) {
                                        }
                                        boolean zB = consentSnapshot != null ? Intrinsics.b(consentSnapshot.getGlobalEnabled(), Boolean.TRUE) : false;
                                        mc0.b bVar2 = mc0.d.f76206a;
                                        bVar2.r("NOVA_AI");
                                        bVar2.h("resolveConsentAndSync: COOLDOWN (" + (j12 / 1000) + "s since last) consent=" + zB, new Object[0]);
                                        if (!zB) {
                                            obj3 = dVar;
                                            Unit unit3 = Unit.f71706a;
                                            ((c80.d) obj3).g(null);
                                            return unit3;
                                        }
                                        try {
                                            int i11 = Result.f71687b;
                                            objA = Boolean.valueOf(fo.d.h().isRegistered());
                                        } catch (Throwable th3) {
                                            int i12 = Result.f71687b;
                                            objA = ResultKt.a(th3);
                                        }
                                        Object obj4 = Boolean.FALSE;
                                        if (objA instanceof Result.Failure) {
                                            objA = obj4;
                                        }
                                        if (!((Boolean) objA).booleanValue()) {
                                            mc0.b bVar3 = mc0.d.f76206a;
                                            bVar3.r("NOVA_AI");
                                            bVar3.b("resolveConsentAndSync: registering tools during cooldown", new Object[0]);
                                            try {
                                                vx.t tVar = vx.t.f93370a;
                                                b1Var.f89657t = dVar;
                                                b1Var.f89658u = null;
                                                b1Var.f89661x = jCurrentTimeMillis;
                                                b1Var.A = 2;
                                                a80.e eVar = t70.y0.f88884a;
                                                break;
                                            } catch (Exception e3) {
                                                e = e3;
                                                j11 = jCurrentTimeMillis;
                                                obj2 = dVar;
                                                mc0.b bVar4 = mc0.d.f76206a;
                                                bVar4.r("NOVA_AI");
                                                bVar4.p(e, "tool registration during cooldown", new Object[0]);
                                                obj = obj2;
                                                jCurrentTimeMillis = j11;
                                                size = ((List) fo.d.f().getInsightPool().getValue()).size();
                                                if (size >= 0) {
                                                }
                                                obj3 = obj;
                                                Unit unit32 = Unit.f71706a;
                                                ((c80.d) obj3).g(null);
                                                return unit32;
                                            }
                                        }
                                        obj = dVar;
                                        try {
                                            size = ((List) fo.d.f().getInsightPool().getValue()).size();
                                        } catch (Exception unused3) {
                                            size = -1;
                                        }
                                        if (size >= 0 && size < 2 && jCurrentTimeMillis - f89695f >= 60000) {
                                            mc0.b bVar5 = mc0.d.f76206a;
                                            bVar5.r("NOVA_AI");
                                            bVar5.b("resolveConsentAndSync: pool urgent (" + size + ") during cooldown — requesting top-up insight", new Object[0]);
                                            f89695f = jCurrentTimeMillis;
                                            try {
                                                fo.d.f().requestInsight(true);
                                            } catch (Exception unused4) {
                                            }
                                        }
                                        obj3 = obj;
                                        Unit unit322 = Unit.f71706a;
                                        ((c80.d) obj3).g(null);
                                        return unit322;
                                    }
                                    f89694e = jCurrentTimeMillis;
                                    mc0.b bVar6 = mc0.d.f76206a;
                                    bVar6.r("NOVA_AI");
                                    bVar6.h("resolveConsentAndSync: STARTING (force=%s)", Boolean.valueOf(z15));
                                    k2 k2Var = k2.f89839a;
                                    b1Var.f89657t = context2;
                                    b1Var.f89658u = dVar;
                                    b1Var.f89659v = z14;
                                    b1Var.A = 3;
                                    if (k2.c(context2, "resolve_consent", b1Var) != coroutineSingletons) {
                                        z16 = z14;
                                        dVar2 = dVar;
                                        context3 = context2;
                                        try {
                                            AiAuthManager aiAuthManagerA = fo.d.a();
                                            b1Var.f89657t = context3;
                                            b1Var.f89658u = dVar2;
                                            b1Var.f89659v = z16;
                                            b1Var.A = 4;
                                            objResolveConsent = aiAuthManagerA.resolveConsent(b1Var);
                                        } catch (Exception e11) {
                                            e = e11;
                                            aVar = dVar2;
                                            z17 = z16;
                                            mc0.b bVar7 = mc0.d.f76206a;
                                            bVar7.r("NOVA_AI");
                                            bVar7.f(e, "resolveConsent threw", new Object[0]);
                                            f89694e = 0L;
                                            aiAccessDecision = null;
                                            r52 = aVar;
                                            ConsentStatus consentSnapshot2 = fo.d.a().getConsentSnapshot();
                                            boolean needsCategoryConsentPrompt = fo.d.a().getNeedsCategoryConsentPrompt();
                                            mc0.b bVar8 = mc0.d.f76206a;
                                            bVar8.r("NOVA_AI");
                                            personId = fo.d.a().getPersonId();
                                            if (personId != null) {
                                            }
                                            string = ps.k.f82915c;
                                            if (string == null) {
                                            }
                                            Boolean boolValueOf = Boolean.valueOf(string != null);
                                            if (consentStatus != null) {
                                            }
                                            str4 = "NULL";
                                            bVar8.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf, str4, Boolean.valueOf(z18));
                                            p.c(context3);
                                            try {
                                                rVar = r.f89974e;
                                                b1Var.f89657t = context3;
                                                b1Var.f89658u = r52;
                                                b1Var.f89659v = z17;
                                                b1Var.A = 5;
                                                if (rVar.c(context3, b1Var) != coroutineSingletons) {
                                                }
                                            } catch (Exception e12) {
                                                e = e12;
                                                context4 = context3;
                                                str6 = r52;
                                                mc0.b bVar9 = mc0.d.f76206a;
                                                bVar9.r("NOVA_AI");
                                                bVar9.p(e, "Korea location enforce failed", new Object[0]);
                                                r32 = str6;
                                                if (z17) {
                                                }
                                                try {
                                                    fo.d.f().onConsentResolved();
                                                } catch (Exception unused5) {
                                                }
                                                b1Var.f89657t = context4;
                                                b1Var.f89658u = r32;
                                                b1Var.A = 6;
                                                objY = t70.m0.y(t70.c2.f88780b, new b10.r0(2, null, 18), b1Var);
                                                if (objY == CoroutineSingletons.f71806a) {
                                                }
                                                if (objY != coroutineSingletons) {
                                                }
                                                return coroutineSingletons;
                                            }
                                            return coroutineSingletons;
                                        }
                                        if (objResolveConsent != coroutineSingletons) {
                                            aVar = dVar2;
                                            z17 = z16;
                                            try {
                                                aiAccessDecision = (AiAccessDecision) objResolveConsent;
                                                r52 = aVar;
                                            } catch (Exception e13) {
                                                e = e13;
                                                mc0.b bVar72 = mc0.d.f76206a;
                                                bVar72.r("NOVA_AI");
                                                bVar72.f(e, "resolveConsent threw", new Object[0]);
                                                f89694e = 0L;
                                                aiAccessDecision = null;
                                                r52 = aVar;
                                                ConsentStatus consentSnapshot22 = fo.d.a().getConsentSnapshot();
                                                boolean needsCategoryConsentPrompt2 = fo.d.a().getNeedsCategoryConsentPrompt();
                                                mc0.b bVar82 = mc0.d.f76206a;
                                                bVar82.r("NOVA_AI");
                                                personId = fo.d.a().getPersonId();
                                                if (personId != null) {
                                                }
                                                string = ps.k.f82915c;
                                                if (string == null) {
                                                }
                                                Boolean boolValueOf2 = Boolean.valueOf(string != null);
                                                if (consentStatus != null) {
                                                }
                                                str4 = "NULL";
                                                bVar82.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf2, str4, Boolean.valueOf(z18));
                                                p.c(context3);
                                                rVar = r.f89974e;
                                                b1Var.f89657t = context3;
                                                b1Var.f89658u = r52;
                                                b1Var.f89659v = z17;
                                                b1Var.A = 5;
                                                if (rVar.c(context3, b1Var) != coroutineSingletons) {
                                                }
                                                return coroutineSingletons;
                                            }
                                            ConsentStatus consentSnapshot222 = fo.d.a().getConsentSnapshot();
                                            boolean needsCategoryConsentPrompt22 = fo.d.a().getNeedsCategoryConsentPrompt();
                                            mc0.b bVar822 = mc0.d.f76206a;
                                            bVar822.r("NOVA_AI");
                                            personId = fo.d.a().getPersonId();
                                            if (personId != null) {
                                                consentStatus = consentSnapshot222;
                                                strConcat = r70.l.G1(8, personId).concat("...");
                                            } else {
                                                consentStatus = consentSnapshot222;
                                                strConcat = null;
                                            }
                                            string = ps.k.f82915c;
                                            if (string == null) {
                                                Context context8 = mx.g0.f77088a;
                                                string = mx.g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_email", null);
                                            }
                                            Boolean boolValueOf22 = Boolean.valueOf(string != null);
                                            if (consentStatus != null) {
                                                z18 = needsCategoryConsentPrompt22;
                                                str3 = "resolve_consent";
                                                str4 = "global=" + consentStatus.getGlobalEnabled() + ", asked=" + consentStatus.getAsked() + ", types=" + consentStatus.getTypes();
                                                if (str4 == null) {
                                                }
                                                bVar822.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf22, str4, Boolean.valueOf(z18));
                                                p.c(context3);
                                                rVar = r.f89974e;
                                                b1Var.f89657t = context3;
                                                b1Var.f89658u = r52;
                                                b1Var.f89659v = z17;
                                                b1Var.A = 5;
                                                if (rVar.c(context3, b1Var) != coroutineSingletons) {
                                                    r32 = r52;
                                                    context4 = context3;
                                                    if (z17 && fo.d.a().getAiAccessDecision() == AiAccessDecision.Allowed) {
                                                        e();
                                                    }
                                                    fo.d.f().onConsentResolved();
                                                    b1Var.f89657t = context4;
                                                    b1Var.f89658u = r32;
                                                    b1Var.A = 6;
                                                    objY = t70.m0.y(t70.c2.f88780b, new b10.r0(2, null, 18), b1Var);
                                                    if (objY == CoroutineSingletons.f71806a) {
                                                        objY = Unit.f71706a;
                                                    }
                                                    if (objY != coroutineSingletons) {
                                                        aVar2 = r32;
                                                        context5 = context4;
                                                        Context applicationContext = context5.getApplicationContext();
                                                        if (p.b()) {
                                                            str5 = str2;
                                                        } else {
                                                            try {
                                                                Context context9 = mx.g0.f77088a;
                                                                contextE2 = mx.g0.e();
                                                            } catch (Throwable unused6) {
                                                            }
                                                            if (!q0.c(contextE2)) {
                                                                if (!cy.d0.x(contextE2)) {
                                                                    zy.c cVar2 = zy.c.f98823a;
                                                                    str5 = str2;
                                                                    z19 = true;
                                                                    zD2 = zy.c.d(str5, true);
                                                                }
                                                                if (zD2) {
                                                                    zy.c cVar3 = zy.c.f98823a;
                                                                    z21 = zy.c.d("nova_ai_bubbles_enabled", z19);
                                                                    if (z21) {
                                                                        mc0.b bVar10 = mc0.d.f76206a;
                                                                        bVar10.r("NOVA_AI");
                                                                        bVar10.b("Consent resolved — ensuring proactive bubbles started", new Object[0]);
                                                                        fo.d.l(applicationContext);
                                                                    }
                                                                    w70.i2 i2Var = q0.f89956a;
                                                                    b1Var.f89657t = aVar2;
                                                                    b1Var.f89658u = null;
                                                                    b1Var.A = 7;
                                                                    break;
                                                                }
                                                                if (z21) {
                                                                }
                                                                w70.i2 i2Var2 = q0.f89956a;
                                                                b1Var.f89657t = aVar2;
                                                                b1Var.f89658u = null;
                                                                b1Var.A = 7;
                                                            }
                                                            str5 = str2;
                                                            z19 = true;
                                                            zD2 = true;
                                                            if (zD2) {
                                                            }
                                                            if (z21) {
                                                            }
                                                            w70.i2 i2Var22 = q0.f89956a;
                                                            b1Var.f89657t = aVar2;
                                                            b1Var.f89658u = null;
                                                            b1Var.A = 7;
                                                        }
                                                        mc0.b bVar11 = mc0.d.f76206a;
                                                        bVar11.r("NOVA_AI");
                                                        o oVarA = p.a();
                                                        Context context10 = mx.g0.f77088a;
                                                        contextE3 = mx.g0.e();
                                                        if (!q0.c(contextE3)) {
                                                            if (!cy.d0.x(contextE3)) {
                                                                zy.c cVar4 = zy.c.f98823a;
                                                                z22 = true;
                                                                zD3 = zy.c.d(str5, true);
                                                            }
                                                            if (zD3) {
                                                                zy.c cVar5 = zy.c.f98823a;
                                                                if (zy.c.d("nova_ai_bubbles_enabled", z22)) {
                                                                }
                                                                bVar11.b(str + oVarA + ", bubbles=" + z22 + " — not starting proactive bubbles", new Object[0]);
                                                                w70.i2 i2Var222 = q0.f89956a;
                                                                b1Var.f89657t = aVar2;
                                                                b1Var.f89658u = null;
                                                                b1Var.A = 7;
                                                            }
                                                            z22 = false;
                                                            bVar11.b(str + oVarA + ", bubbles=" + z22 + " — not starting proactive bubbles", new Object[0]);
                                                            w70.i2 i2Var2222 = q0.f89956a;
                                                            b1Var.f89657t = aVar2;
                                                            b1Var.f89658u = null;
                                                            b1Var.A = 7;
                                                        }
                                                        zD3 = true;
                                                        z22 = true;
                                                        if (zD3) {
                                                        }
                                                        z22 = false;
                                                        bVar11.b(str + oVarA + ", bubbles=" + z22 + " — not starting proactive bubbles", new Object[0]);
                                                        w70.i2 i2Var22222 = q0.f89956a;
                                                        b1Var.f89657t = aVar2;
                                                        b1Var.f89658u = null;
                                                        b1Var.A = 7;
                                                    }
                                                }
                                            } else {
                                                z18 = needsCategoryConsentPrompt22;
                                                str3 = "resolve_consent";
                                            }
                                            str4 = "NULL";
                                            bVar822.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf22, str4, Boolean.valueOf(z18));
                                            p.c(context3);
                                            rVar = r.f89974e;
                                            b1Var.f89657t = context3;
                                            b1Var.f89658u = r52;
                                            b1Var.f89659v = z17;
                                            b1Var.A = 5;
                                            if (rVar.c(context3, b1Var) != coroutineSingletons) {
                                            }
                                        }
                                    }
                                }
                                z15 = z13;
                                zD = true;
                                if (!zD) {
                                }
                            }
                            return coroutineSingletons;
                        case 1:
                            boolean z23 = b1Var.f89660w;
                            z13 = b1Var.f89659v;
                            ?? r02 = b1Var.f89658u;
                            Context context11 = (Context) b1Var.f89657t;
                            ResultKt.b(objResolveConsent);
                            context2 = context11;
                            z14 = z23;
                            dVar = r02;
                            Context context62 = mx.g0.f77088a;
                            contextE = mx.g0.e();
                            if (!q0.c(contextE)) {
                            }
                            z15 = z13;
                            zD = true;
                            if (!zD) {
                            }
                            break;
                        case 2:
                            jCurrentTimeMillis = b1Var.f89661x;
                            obj = (c80.a) b1Var.f89657t;
                            try {
                                ResultKt.b(objResolveConsent);
                            } catch (Exception e14) {
                                e = e14;
                                obj2 = obj;
                                j11 = jCurrentTimeMillis;
                                mc0.b bVar42 = mc0.d.f76206a;
                                bVar42.r("NOVA_AI");
                                bVar42.p(e, "tool registration during cooldown", new Object[0]);
                                obj = obj2;
                                jCurrentTimeMillis = j11;
                                size = ((List) fo.d.f().getInsightPool().getValue()).size();
                                if (size >= 0) {
                                }
                                obj3 = obj;
                                Unit unit3222 = Unit.f71706a;
                                ((c80.d) obj3).g(null);
                                return unit3222;
                            }
                            size = ((List) fo.d.f().getInsightPool().getValue()).size();
                            if (size >= 0) {
                                mc0.b bVar52 = mc0.d.f76206a;
                                bVar52.r("NOVA_AI");
                                bVar52.b("resolveConsentAndSync: pool urgent (" + size + ") during cooldown — requesting top-up insight", new Object[0]);
                                f89695f = jCurrentTimeMillis;
                                fo.d.f().requestInsight(true);
                                break;
                            }
                            obj3 = obj;
                            Unit unit32222 = Unit.f71706a;
                            ((c80.d) obj3).g(null);
                            return unit32222;
                        case 3:
                            boolean z24 = b1Var.f89659v;
                            ?? r53 = b1Var.f89658u;
                            context3 = (Context) b1Var.f89657t;
                            ResultKt.b(objResolveConsent);
                            str = "Consent resolve completed but access=";
                            str2 = "nova_ai_enabled";
                            z16 = z24;
                            dVar2 = r53;
                            AiAuthManager aiAuthManagerA2 = fo.d.a();
                            b1Var.f89657t = context3;
                            b1Var.f89658u = dVar2;
                            b1Var.f89659v = z16;
                            b1Var.A = 4;
                            objResolveConsent = aiAuthManagerA2.resolveConsent(b1Var);
                            if (objResolveConsent != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        case 4:
                            z17 = b1Var.f89659v;
                            aVar = b1Var.f89658u;
                            context3 = (Context) b1Var.f89657t;
                            try {
                                ResultKt.b(objResolveConsent);
                                str = "Consent resolve completed but access=";
                                str2 = "nova_ai_enabled";
                                aVar = aVar;
                                aiAccessDecision = (AiAccessDecision) objResolveConsent;
                                r52 = aVar;
                            } catch (Exception e15) {
                                e = e15;
                                str = "Consent resolve completed but access=";
                                str2 = "nova_ai_enabled";
                                mc0.b bVar722 = mc0.d.f76206a;
                                bVar722.r("NOVA_AI");
                                bVar722.f(e, "resolveConsent threw", new Object[0]);
                                f89694e = 0L;
                                aiAccessDecision = null;
                                r52 = aVar;
                                ConsentStatus consentSnapshot2222 = fo.d.a().getConsentSnapshot();
                                boolean needsCategoryConsentPrompt222 = fo.d.a().getNeedsCategoryConsentPrompt();
                                mc0.b bVar8222 = mc0.d.f76206a;
                                bVar8222.r("NOVA_AI");
                                personId = fo.d.a().getPersonId();
                                if (personId != null) {
                                }
                                string = ps.k.f82915c;
                                if (string == null) {
                                }
                                Boolean boolValueOf222 = Boolean.valueOf(string != null);
                                if (consentStatus != null) {
                                }
                                str4 = "NULL";
                                bVar8222.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf222, str4, Boolean.valueOf(z18));
                                p.c(context3);
                                rVar = r.f89974e;
                                b1Var.f89657t = context3;
                                b1Var.f89658u = r52;
                                b1Var.f89659v = z17;
                                b1Var.A = 5;
                                if (rVar.c(context3, b1Var) != coroutineSingletons) {
                                }
                                return coroutineSingletons;
                            }
                            ConsentStatus consentSnapshot22222 = fo.d.a().getConsentSnapshot();
                            boolean needsCategoryConsentPrompt2222 = fo.d.a().getNeedsCategoryConsentPrompt();
                            mc0.b bVar82222 = mc0.d.f76206a;
                            bVar82222.r("NOVA_AI");
                            personId = fo.d.a().getPersonId();
                            if (personId != null) {
                            }
                            string = ps.k.f82915c;
                            if (string == null) {
                            }
                            Boolean boolValueOf2222 = Boolean.valueOf(string != null);
                            if (consentStatus != null) {
                            }
                            str4 = "NULL";
                            bVar82222.b("consent state after resolve: decision=%s, personId=%s, hasEmail=%s, snapshot=%s, needsPrompt=%s", aiAccessDecision, strConcat, boolValueOf2222, str4, Boolean.valueOf(z18));
                            p.c(context3);
                            rVar = r.f89974e;
                            b1Var.f89657t = context3;
                            b1Var.f89658u = r52;
                            b1Var.f89659v = z17;
                            b1Var.A = 5;
                            if (rVar.c(context3, b1Var) != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        case 5:
                            z17 = b1Var.f89659v;
                            r32 = b1Var.f89658u;
                            context4 = (Context) b1Var.f89657t;
                            try {
                                ResultKt.b(objResolveConsent);
                                str = "Consent resolve completed but access=";
                                str3 = "resolve_consent";
                                str2 = "nova_ai_enabled";
                            } catch (Exception e16) {
                                e = e16;
                                str = "Consent resolve completed but access=";
                                str6 = r32;
                                str3 = "resolve_consent";
                                str2 = "nova_ai_enabled";
                                mc0.b bVar92 = mc0.d.f76206a;
                                bVar92.r("NOVA_AI");
                                bVar92.p(e, "Korea location enforce failed", new Object[0]);
                                r32 = str6;
                                if (z17) {
                                }
                                fo.d.f().onConsentResolved();
                                b1Var.f89657t = context4;
                                b1Var.f89658u = r32;
                                b1Var.A = 6;
                                objY = t70.m0.y(t70.c2.f88780b, new b10.r0(2, null, 18), b1Var);
                                if (objY == CoroutineSingletons.f71806a) {
                                }
                                if (objY != coroutineSingletons) {
                                }
                                return coroutineSingletons;
                            }
                            if (z17) {
                                e();
                                break;
                            }
                            fo.d.f().onConsentResolved();
                            b1Var.f89657t = context4;
                            b1Var.f89658u = r32;
                            b1Var.A = 6;
                            objY = t70.m0.y(t70.c2.f88780b, new b10.r0(2, null, 18), b1Var);
                            if (objY == CoroutineSingletons.f71806a) {
                            }
                            if (objY != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        case 6:
                            aVar2 = b1Var.f89658u;
                            context5 = (Context) b1Var.f89657t;
                            ResultKt.b(objResolveConsent);
                            str = "Consent resolve completed but access=";
                            str3 = "resolve_consent";
                            str2 = "nova_ai_enabled";
                            Context applicationContext2 = context5.getApplicationContext();
                            if (p.b()) {
                            }
                            mc0.b bVar112 = mc0.d.f76206a;
                            bVar112.r("NOVA_AI");
                            o oVarA2 = p.a();
                            Context context102 = mx.g0.f77088a;
                            contextE3 = mx.g0.e();
                            if (!q0.c(contextE3)) {
                            }
                            zD3 = true;
                            z22 = true;
                            if (zD3) {
                            }
                            z22 = false;
                            bVar112.b(str + oVarA2 + ", bubbles=" + z22 + " — not starting proactive bubbles", new Object[0]);
                            w70.i2 i2Var222222 = q0.f89956a;
                            b1Var.f89657t = aVar2;
                            b1Var.f89658u = null;
                            b1Var.A = 7;
                            break;
                        case 7:
                            aVar2 = (c80.a) b1Var.f89657t;
                            ResultKt.b(objResolveConsent);
                            Unit unit4 = Unit.f71706a;
                            ((c80.d) aVar2).g(null);
                            return unit4;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                } catch (Throwable th4) {
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
                r12 = str6;
            }
        } catch (Throwable th6) {
            th = th6;
            r12 = "global=";
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0067, code lost:
    
        if (r8 == r1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x007b, code lost:
    
        if (r8 != r1) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007d, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(Context context, ContinuationImpl continuationImpl) {
        c1 c1Var;
        a2 a2Var;
        if (continuationImpl instanceof c1) {
            c1Var = (c1) continuationImpl;
            int i5 = c1Var.f89679w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c1Var.f89679w = i5 - Integer.MIN_VALUE;
            } else {
                c1Var = new c1(this, continuationImpl);
            }
        }
        Object objC = c1Var.f89677u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c1Var.f89679w;
        String strConcat = null;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                a(context.getApplicationContext());
                if (!fo.d.j()) {
                    return new x0("sdk_not_initialized");
                }
                k2 k2Var = k2.f89839a;
                if (k2.d()) {
                    c1Var.f89679w = 1;
                    objC = k2.c(context, "sdk_auth_token", c1Var);
                } else {
                    a2Var = null;
                    AiAuthManager aiAuthManagerA = fo.d.a();
                    c1Var.f89676t = a2Var;
                    c1Var.f89679w = 2;
                    objC = aiAuthManagerA.getToken(c1Var);
                }
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    a2Var = c1Var.f89676t;
                    ResultKt.b(objC);
                    String str = (String) objC;
                    if (str != null) {
                        return new w0(str);
                    }
                    if (a2Var != null && !a2Var.equals(o1.f89923b) && !(a2Var instanceof s1)) {
                        strConcat = "sdk_login_".concat(a2Var.f89649a);
                    } else if (a2Var == null) {
                        p3 p3Var = p3.f89946a;
                        strConcat = p3.f89948c;
                    }
                    if (strConcat == null) {
                        strConcat = "no_sdk_token";
                    }
                    return new x0(strConcat);
                }
                ResultKt.b(objC);
            }
            a2Var = (a2) objC;
            AiAuthManager aiAuthManagerA2 = fo.d.a();
            c1Var.f89676t = a2Var;
            c1Var.f89679w = 2;
            objC = aiAuthManagerA2.getToken(c1Var);
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e11, "sdkAuthToken: getToken failed", new Object[0]);
            return new x0(r.f89970a.d(e11));
        }
    }
}
