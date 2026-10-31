package com.stripe.android.link.ui.inline;

import b70.g;
import b70.n;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.StripeIntent;
import e00.z4;
import fl.l;
import fs.h0;
import fs.y;
import ft.x;
import h6.f1;
import h6.g1;
import java.util.Set;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.builders.ListBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kw.c1;
import kw.o0;
import kw.o1;
import kw.p0;
import kw.t2;
import p10.c0;
import ps.v;
import qx.z0;
import r70.k;
import rs.a0;
import rs.b0;
import rs.d;
import rs.e;
import rs.j;
import rs.z;
import t70.m0;
import vs.f;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class a extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f43031a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkConfiguration f43032b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f43033c;

    /* renamed from: d, reason: collision with root package name */
    public final gs.b f43034d;

    /* renamed from: e, reason: collision with root package name */
    public final xq.c f43035e;

    /* renamed from: f, reason: collision with root package name */
    public final long f43036f;

    /* renamed from: g, reason: collision with root package name */
    public final j f43037g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f43038h;

    /* renamed from: i, reason: collision with root package name */
    public final i2 f43039i;

    /* renamed from: j, reason: collision with root package name */
    public final String f43040j;

    /* renamed from: k, reason: collision with root package name */
    public final String f43041k;

    /* renamed from: l, reason: collision with root package name */
    public final t2 f43042l;

    /* renamed from: m, reason: collision with root package name */
    public final o1 f43043m;
    public final t2 n;
    public final l o;

    /* renamed from: p, reason: collision with root package name */
    public final uw.c f43044p;

    /* renamed from: q, reason: collision with root package name */
    public final uw.c f43045q;

    /* renamed from: r, reason: collision with root package name */
    public final uw.c f43046r;

    /* renamed from: s, reason: collision with root package name */
    public final i2 f43047s;

    /* renamed from: t, reason: collision with root package name */
    public final w70.o1 f43048t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f43049u;

    public a(UserInput userInput, a0 signupMode, Boolean bool, LinkConfiguration config, h0 linkAccountManager, gs.b linkEventsReporter, xq.c logger) {
        String str;
        String str2;
        String str3;
        String str4;
        Set setN1;
        a0 a0Var;
        boolean z11;
        String str5;
        String str6;
        String str7;
        String str8;
        Intrinsics.g(signupMode, "signupMode");
        Intrinsics.g(config, "config");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(linkEventsReporter, "linkEventsReporter");
        Intrinsics.g(logger, "logger");
        StripeIntent stripeIntent = config.f42895a;
        boolean z12 = config.f42913u;
        boolean z13 = config.D;
        boolean z14 = config.C;
        LinkConfiguration.CustomerInfo customerInfo = config.f42900f;
        this.f43031a = signupMode;
        this.f43032b = config;
        this.f43033c = linkAccountManager;
        this.f43034d = linkEventsReporter;
        this.f43035e = logger;
        this.f43036f = 1000L;
        boolean z15 = userInput != null;
        if (userInput != null) {
            if (userInput instanceof UserInput.SignUp) {
                str8 = ((UserInput.SignUp) userInput).f43025a;
            } else {
                if (!(userInput instanceof UserInput.SignIn)) {
                    throw new NoWhenBranchMatchedException();
                }
                str8 = ((UserInput.SignIn) userInput).f43024a;
            }
            str = str8;
        } else {
            str = null;
        }
        if (userInput != null) {
            if (userInput instanceof UserInput.SignUp) {
                str7 = ((UserInput.SignUp) userInput).f43026b;
            } else {
                if (!(userInput instanceof UserInput.SignIn)) {
                    throw new NoWhenBranchMatchedException();
                }
                str7 = null;
            }
            str2 = str7;
        } else {
            str2 = null;
        }
        if (userInput != null) {
            if (userInput instanceof UserInput.SignUp) {
                str6 = ((UserInput.SignUp) userInput).f43028d;
            } else {
                if (!(userInput instanceof UserInput.SignIn)) {
                    throw new NoWhenBranchMatchedException();
                }
                str6 = null;
            }
            str3 = str6;
        } else {
            str3 = null;
        }
        if (userInput != null) {
            if (userInput instanceof UserInput.SignUp) {
                str5 = ((UserInput.SignUp) userInput).f43027c;
            } else {
                if (!(userInput instanceof UserInput.SignIn)) {
                    throw new NoWhenBranchMatchedException();
                }
                str5 = null;
            }
            str4 = str5;
        } else {
            str4 = null;
        }
        boolean zBooleanValue = z14 ? bool != null ? bool.booleanValue() : z13 : z15;
        boolean z16 = bool != null;
        a0 a0Var2 = a0.f86150b;
        boolean z17 = signupMode == a0Var2;
        ListBuilder listBuilderW = ul.b.w();
        boolean z18 = z17;
        String str9 = customerInfo.f42922b;
        boolean z19 = str9 == null || k.U0(str9);
        if (z18 && !z19) {
            listBuilderW.add(z.f86332b);
            listBuilderW.add(z.f86331a);
        } else if (z18) {
            listBuilderW.add(z.f86331a);
            listBuilderW.add(z.f86332b);
        } else {
            listBuilderW.add(z.f86331a);
            listBuilderW.add(z.f86332b);
        }
        if (f.a(config)) {
            listBuilderW.add(z.f86333c);
        }
        ListBuilder listBuilderM = ul.b.m(listBuilderW);
        int iOrdinal = signupMode.ordinal();
        if (iOrdinal == 0) {
            setN1 = g.N1(listBuilderM);
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            setN1 = n.Z(g.N1(listBuilderM), g.W0(listBuilderM));
        }
        boolean z21 = z12 && Intrinsics.b(stripeIntent.getF43541i(), "US") && signupMode == a0.f86149a;
        vs.g gVar = (z21 && (str == null || k.U0(str) || str2 == null || k.U0(str2))) ? vs.g.f92959c : vs.g.f92957a;
        String str10 = config.f42896b;
        if (zBooleanValue || z21) {
            a0Var = a0Var2;
            z11 = true;
        } else {
            a0Var = a0Var2;
            z11 = false;
        }
        a0 a0Var3 = a0Var;
        Set set = setN1;
        j jVar = new j(null, str10, signupMode, listBuilderM, set, z12 && Intrinsics.b(stripeIntent.getF43541i(), "US") && signupMode == a0.f86149a, z14 && str9 != null && !k.U0(str9) && signupMode == a0.f86149a, false, z11, false, gVar, z16);
        this.f43037g = jVar;
        i2 i2VarC = u1.c(jVar);
        this.f43038h = i2VarC;
        this.f43039i = i2VarC;
        boolean z22 = signupMode == a0Var3;
        z zVar = z.f86331a;
        String str11 = set.contains(zVar) ? str9 : null;
        this.f43040j = str11;
        String str12 = customerInfo.f42923c;
        z zVar2 = z.f86332b;
        str12 = set.contains(zVar2) ? str12 : null;
        str12 = str12 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str12;
        this.f43041k = str12;
        String str13 = customerInfo.f42921a;
        z zVar3 = z.f86333c;
        String str14 = set.contains(zVar3) ? str13 : null;
        Pattern pattern = p0.f72544f;
        int i5 = 1;
        t2 t2Var = new t2(new p0(g.W0(listBuilderM) == zVar && z22, 1), str != null ? str : str11, null, 4);
        this.f43042l = t2Var;
        o1 o1VarA = o0.a(str2 != null ? str2 : str12, 20, str4 == null ? customerInfo.f42924d : str4, g.W0(listBuilderM) == zVar2 && z22, false);
        this.f43043m = o1VarA;
        t2 t2Var2 = new t2(new c1(), str3 != null ? str3 : str14, null, 4);
        this.n = t2Var2;
        this.o = new l((ResolvableString) null, kotlin.collections.c.v0(new Object[]{t2Var, o1VarA, listBuilderM.contains(zVar3) ? t2Var2 : null}));
        this.f43044p = v.u(t2Var.f72655x, new z0(23));
        this.f43045q = v.u(o1VarA.f72531m, new z0(24));
        this.f43046r = v.u(t2Var2.f72655x, new z0(25));
        i2 i2VarC2 = u1.c(null);
        this.f43047s = i2VarC2;
        this.f43048t = new w70.o1(i2VarC2);
        this.f43049u = z14 ? bool != null ? bool.booleanValue() : z13 : z15;
        Continuation continuation = null;
        m0.t(g1.f(this), null, null, new rs.f(this, continuation, 0), 3);
        m0.t(g1.f(this), null, null, new rs.f(this, continuation, i5), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(a aVar, String str, ContinuationImpl continuationImpl) {
        d dVar;
        Object objK;
        String str2;
        Object value;
        boolean z11;
        Object value2;
        Object value3;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f86173x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f86173x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(aVar, continuationImpl);
            }
        }
        d dVar2 = dVar;
        Object obj = dVar2.f86171v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar2.f86173x;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar.f43047s.j(null);
            h0 h0Var = aVar.f43033c;
            x xVar = x.f56068b;
            dVar2.f86169t = aVar;
            dVar2.f86170u = str;
            dVar2.f86173x = 1;
            objK = ((y) h0Var).k(str, xVar, false, null, dVar2);
            if (objK == coroutineSingletons) {
                return coroutineSingletons;
            }
            str2 = str;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str2 = dVar2.f86170u;
            aVar = dVar2.f86169t;
            ResultKt.b(obj);
            objK = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objK);
        if (thA != null) {
            i2 i2Var = aVar.f43038h;
            do {
                value = i2Var.getValue();
                z11 = thA instanceof APIConnectionException;
            } while (!i2Var.i(value, j.a((j) value, null, false, z11, vs.g.f92957a, 2559)));
            if (!z11) {
                ResolvableString resolvableStringI = p6.p0.i(thA);
                aVar.f43035e.b("Error: ", thA);
                i2 i2Var2 = aVar.f43047s;
                i2Var2.getClass();
                i2Var2.k(null, resolvableStringI);
            }
        } else if (((LinkAccount) objK) != null) {
            i2 i2Var3 = aVar.f43038h;
            do {
                value3 = i2Var3.getValue();
            } while (!i2Var3.i(value3, j.a((j) value3, new UserInput.SignIn(str2), false, false, vs.g.f92957a, 2558)));
        } else {
            i2 i2Var4 = aVar.f43038h;
            do {
                value2 = i2Var4.getValue();
            } while (!i2Var4.i(value2, j.a((j) value2, null, false, false, vs.g.f92959c, 2559)));
            gs.b bVar = aVar.f43034d;
            c0.d0(bVar.f57763f, ir.b.f67997c);
            bVar.a(gs.d.o, null);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(a aVar, ContinuationImpl continuationImpl) {
        e eVar;
        Object value;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f86177w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f86177w = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(aVar, continuationImpl);
            }
        }
        Object obj = eVar.f86175u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f86177w;
        if (i11 == 0) {
            ResultKt.b(obj);
            uw.c cVar = aVar.f43045q;
            z4 z4Var = new z4(2, null, 19);
            eVar.f86174t = aVar;
            eVar.f86177w = 1;
            if (u1.p(cVar, z4Var, eVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = eVar.f86174t;
            ResultKt.b(obj);
        }
        i2 i2Var = aVar.f43038h;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, j.a((j) value, null, false, false, vs.g.f92959c, 3071)));
        return Unit.f71706a;
    }

    public final UserInput.SignUp g(String str, String str2, String str3, boolean z11) {
        b0 b0Var;
        j jVar = this.f43037g;
        a0 a0Var = jVar.f86188c;
        boolean z12 = jVar.f86192g;
        boolean z13 = z12 || str2 != null;
        if (str == null || !z13 || a0Var == null) {
            return null;
        }
        boolean z14 = (jVar.f86189d.contains(z.f86333c) && (str3 == null || k.U0(str3))) ? false : true;
        String strV = this.f43043m.v();
        boolean z15 = this.f43040j != null;
        boolean zU0 = k.U0(this.f43041k);
        boolean z16 = jVar.f86191f;
        boolean z17 = this.f43032b.D;
        int iOrdinal = a0Var.ordinal();
        if (iOrdinal == 0) {
            b0Var = z12 ? (!z17 || z11) ? b0.f86162i : b0.f86163j : z16 ? (!z15 || zU0) ? (z15 || !zU0) ? b0.f86160g : b0.f86161h : b0.f86159f : (!z15 || zU0) ? z15 ? b0.f86155b : b0.f86154a : b0.f86156c;
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            if (z15) {
                b0Var = b0.f86158e;
            } else {
                if (z15) {
                    throw new NoWhenBranchMatchedException();
                }
                b0Var = b0.f86157d;
            }
        }
        UserInput.SignUp signUp = new UserInput.SignUp(str, str2, strV, str3, b0Var, "PHONE_NUMBER");
        if (z14) {
            return signUp;
        }
        return null;
    }
}
