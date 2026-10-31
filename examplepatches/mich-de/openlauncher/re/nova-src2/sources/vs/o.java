package vs;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.NoLinkAccountFoundException;
import com.stripe.android.link.model.LinkAccount;
import es.f0;
import es.t;
import fs.h0;
import fs.l0;
import fs.n0;
import fs.q0;
import fs.y;
import ft.x;
import h6.f1;
import h6.g1;
import h6.u0;
import iw.p;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kw.c1;
import kw.o0;
import kw.o1;
import kw.p0;
import kw.t2;
import kw.z1;
import pu.s;
import rs.b0;
import t70.m0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class o extends f1 {

    /* renamed from: q, reason: collision with root package name */
    public static final long f92986q;

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ int f92987r = 0;

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f92988a;

    /* renamed from: b, reason: collision with root package name */
    public final gs.b f92989b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f92990c;

    /* renamed from: d, reason: collision with root package name */
    public final h0 f92991d;

    /* renamed from: e, reason: collision with root package name */
    public final f0 f92992e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f92993f;

    /* renamed from: g, reason: collision with root package name */
    public final Function1 f92994g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkLaunchMode f92995h;

    /* renamed from: i, reason: collision with root package name */
    public final Function1 f92996i;

    /* renamed from: j, reason: collision with root package name */
    public final s f92997j;

    /* renamed from: k, reason: collision with root package name */
    public final t2 f92998k;

    /* renamed from: l, reason: collision with root package name */
    public final o1 f92999l;

    /* renamed from: m, reason: collision with root package name */
    public final t2 f93000m;
    public final i2 n;
    public final w70.o1 o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f93001p;

    static {
        Duration.Companion companion = Duration.f72038b;
        f92986q = DurationKt.g(1, DurationUnit.f72046e);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00e7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public o(LinkConfiguration configuration, gs.b linkEventsReporter, xq.c logger, h0 linkAccountManager, u0 u0Var, f0 dismissalCoordinator, Function1 navigateAndClearStack, Function1 moveToWeb, LinkLaunchMode linkLaunchMode, Function1 dismissWithResult, s sVar) {
        boolean z11;
        String str;
        String str2;
        String str3;
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(linkEventsReporter, "linkEventsReporter");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(dismissalCoordinator, "dismissalCoordinator");
        Intrinsics.g(navigateAndClearStack, "navigateAndClearStack");
        Intrinsics.g(moveToWeb, "moveToWeb");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        this.f92988a = configuration;
        this.f92989b = linkEventsReporter;
        this.f92990c = logger;
        this.f92991d = linkAccountManager;
        this.f92992e = dismissalCoordinator;
        this.f92993f = navigateAndClearStack;
        this.f92994g = moveToWeb;
        this.f92995h = linkLaunchMode;
        this.f92996i = dismissWithResult;
        this.f92997j = sVar;
        Boolean bool = (Boolean) u0Var.a("use_link_configuration_customer_info");
        int i5 = 1;
        p pVar = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        LinkConfiguration.CustomerInfo customerInfo = bool != null ? bool.booleanValue() : true ? configuration.f42900f : null;
        Pattern pattern = p0.f72544f;
        int i11 = 0;
        int i12 = 4;
        this.f92998k = new t2(new p0(false, 1), customerInfo != null ? customerInfo.f42922b : null, pVar, i12);
        String str4 = customerInfo != null ? customerInfo.f42923c : null;
        this.f92999l = o0.a(str4 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str4, 28, customerInfo != null ? customerInfo.f42924d : null, false, false);
        this.f93000m = new t2(new c1(), customerInfo != null ? customerInfo.f42921a : null, objArr4 == true ? 1 : 0, i12);
        g gVar = (customerInfo == null || (str3 = customerInfo.f42922b) == null || r70.k.U0(str3)) ? g.f92957a : g.f92959c;
        if (customerInfo != null) {
            boolean zA = f.a(configuration);
            String str5 = customerInfo.f42922b;
            z11 = (str5 == null || r70.k.U0(str5) || (str = customerInfo.f42923c) == null || r70.k.U0(str) || (zA && ((str2 = customerInfo.f42921a) == null || r70.k.U0(str2)))) ? false : true;
        }
        i2 i2VarC = u1.c(new e(configuration.f42896b, z11, f.a(configuration), configuration.f42916x, gVar, false, null, null));
        this.n = i2VarC;
        this.o = new w70.o1(i2VarC);
        m0.t(g1.f(this), null, null, new h(this, objArr3 == true ? 1 : 0, i11), 3);
        m0.t(g1.f(this), null, null, new h(this, objArr2 == true ? 1 : 0, i5), 3);
        m0.t(g1.f(this), null, null, new h(this, objArr == true ? 1 : 0, 2), 3);
        linkEventsReporter.a(gs.e.f57782a, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0078, code lost:
    
        if (r8.g(r9, r10, r6) == r0) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(o oVar, String str, ContinuationImpl continuationImpl) {
        j jVar;
        Object objK;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f92970w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f92970w = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(oVar, continuationImpl);
            }
        }
        j jVar2 = jVar;
        Object obj = jVar2.f92968u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar2.f92970w;
        if (i11 == 0) {
            ResultKt.b(obj);
            oVar.k(g.f92958b);
            h0 h0Var = oVar.f92991d;
            x xVar = x.f56068b;
            String strB = oVar.f92988a.b();
            jVar2.f92967t = oVar;
            jVar2.f92970w = 1;
            objK = ((y) h0Var).k(str, xVar, true, strB, jVar2);
            if (objK != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        oVar = jVar2.f92967t;
        ResultKt.b(obj);
        objK = ((Result) obj).f71688a;
        oVar.k(g.f92957a);
        q0 q0VarR = vh.a.R(objK);
        c0.d dVar = new c0.d(oVar, null, 3);
        jVar2.f92967t = null;
        jVar2.f92970w = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(o oVar, ContinuationImpl continuationImpl) throws Throwable {
        k kVar;
        f0 f0Var;
        Throwable th2;
        boolean z11;
        Object obj;
        o oVar2;
        q0 q0VarR;
        o1 o1Var = oVar.f92999l;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f92976y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f92976y = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(oVar, continuationImpl);
            }
        }
        k kVar2 = kVar;
        Object obj2 = kVar2.f92974w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar2.f92976y;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = kVar2.f92973v;
            f0Var = kVar2.f92972u;
            oVar2 = kVar2.f92971t;
            try {
                ResultKt.b(obj2);
                obj = ((Result) obj2).f71688a;
                f0Var.f52946a = z11;
                q0VarR = vh.a.R(obj);
                if (!(q0VarR instanceof fs.m0)) {
                    oVar2.f92994g.invoke(((fs.m0) q0VarR).f55805a);
                } else if (q0VarR instanceof n0) {
                    Throwable th3 = ((n0) q0VarR).f55810a;
                    j(oVar2, th3);
                    oVar2.f92989b.e(th3);
                } else if (q0VarR instanceof fs.p0) {
                    oVar2.h(((fs.p0) q0VarR).f55818a);
                    oVar2.f92989b.d();
                } else if (q0VarR.equals(fs.o0.f55815a)) {
                    j(oVar2, new NoLinkAccountFoundException());
                    oVar2.f92989b.e(new NoLinkAccountFoundException());
                } else {
                    if (!(q0VarR instanceof l0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    oVar2.getClass();
                    oVar2.k(g.f92957a);
                    oVar2.i(((l0) q0VarR).f55801a, zg.a.G(2132020021));
                }
                return Unit.f71706a;
            } catch (Throwable th4) {
                th2 = th4;
                f0Var.f52946a = z11;
                throw th2;
            }
        }
        ResultKt.b(obj2);
        f0 f0Var2 = oVar.f92992e;
        boolean z12 = f0Var2.f52946a;
        f0Var2.f52946a = false;
        try {
            h0 h0Var = oVar.f92991d;
            String str = (String) oVar.f92998k.n.f93973a.getValue();
            String phoneNumber = (String) o1Var.f72524f.f93973a.getValue();
            Intrinsics.g(phoneNumber, "phoneNumber");
            String strE = ((z1) o1Var.f72529k.f91586b.invoke()).e(phoneNumber);
            String strV = o1Var.v();
            String str2 = (String) oVar.f93000m.n.f93973a.getValue();
            b0 b0Var = b0.f86157d;
            kVar2.f92971t = oVar;
            kVar2.f92972u = f0Var2;
            kVar2.f92973v = z12;
            kVar2.f92976y = 1;
            Object objU = ((y) h0Var).u(str, strE, strV, "PHONE_NUMBER", str2, b0Var, kVar2);
            if (objU == coroutineSingletons) {
                return coroutineSingletons;
            }
            f0Var = f0Var2;
            obj = objU;
            oVar2 = oVar;
            z11 = z12;
            f0Var.f52946a = z11;
            q0VarR = vh.a.R(obj);
            if (!(q0VarR instanceof fs.m0)) {
            }
            return Unit.f71706a;
        } catch (Throwable th5) {
            f0Var = f0Var2;
            th2 = th5;
            z11 = z12;
            f0Var.f52946a = z11;
            throw th2;
        }
    }

    public static /* synthetic */ void j(o oVar, Throwable th2) {
        oVar.i(th2, th2 != null ? p50.i.w(th2) : null);
    }

    public final Object g(q0 q0Var, Function1 function1, ContinuationImpl continuationImpl) {
        if (q0Var instanceof fs.m0) {
            this.f92994g.invoke(((fs.m0) q0Var).f55805a);
        } else if (q0Var instanceof n0) {
            k(g.f92959c);
            j(this, ((n0) q0Var).f55810a);
        } else if (q0Var instanceof fs.p0) {
            h(((fs.p0) q0Var).f55818a);
            this.f92989b.d();
        } else {
            if (q0Var.equals(fs.o0.f55815a)) {
                Object objInvoke = function1.invoke(continuationImpl);
                return objInvoke == CoroutineSingletons.f71806a ? objInvoke : Unit.f71706a;
            }
            if (!(q0Var instanceof l0)) {
                throw new NoWhenBranchMatchedException();
            }
            k(g.f92957a);
            i(((l0) q0Var).f55801a, zg.a.G(2132020021));
        }
        return Unit.f71706a;
    }

    public final void h(LinkAccount linkAccount) {
        Object obj = linkAccount.f43019k ? t.f53007d : linkAccount.f43018j ? es.y.f53012d : es.x.f53011d;
        if ((this.f92995h instanceof LinkLaunchMode.Authentication) && !Intrinsics.b(obj, es.x.f53011d)) {
            this.f92996i.invoke(new LinkActivityResult.Completed(new LinkAccountUpdate.Value(linkAccount, null), null, null, null, 12));
        } else if (Intrinsics.b(obj, es.x.f53011d)) {
            this.f92997j.invoke();
        } else {
            this.f92993f.invoke(obj);
        }
    }

    public final void i(Throwable th2, ResolvableString resolvableString) {
        if (th2 != null) {
            this.f92990c.b("SignUpViewModel Error: ", th2);
        }
        while (true) {
            i2 i2Var = this.n;
            Object value = i2Var.getValue();
            e it = (e) value;
            Intrinsics.g(it, "it");
            ResolvableString resolvableString2 = resolvableString;
            if (i2Var.i(value, e.a(it, false, null, false, resolvableString2, null, 191))) {
                return;
            } else {
                resolvableString = resolvableString2;
            }
        }
    }

    public final void k(g gVar) {
        while (true) {
            i2 i2Var = this.n;
            Object value = i2Var.getValue();
            e old = (e) value;
            Intrinsics.g(old, "old");
            g gVar2 = gVar;
            if (i2Var.i(value, e.a(old, false, gVar2, false, null, null, 239))) {
                return;
            } else {
                gVar = gVar2;
            }
        }
    }
}
