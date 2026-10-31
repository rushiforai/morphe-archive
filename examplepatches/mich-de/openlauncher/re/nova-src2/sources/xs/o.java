package xs;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.link.model.LinkAuthIntentInfo;
import com.stripe.android.link.ui.verification.VerificationViewState;
import com.stripe.android.ui.core.elements.OTPSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import e20.i0;
import es.l0;
import fs.g0;
import fs.h0;
import fs.j0;
import fs.y;
import h6.f1;
import java.util.Iterator;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kw.d1;
import kw.g1;
import kw.z0;
import p6.p0;
import t70.m0;
import w70.i2;
import w70.m1;
import w70.o1;
import w70.u1;
import w70.y1;

/* loaded from: classes4.dex */
public final class o extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkAccount f96286a;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f96287b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f96288c;

    /* renamed from: d, reason: collision with root package name */
    public final gs.b f96289d;

    /* renamed from: e, reason: collision with root package name */
    public final xq.c f96290e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkLaunchMode f96291f;

    /* renamed from: g, reason: collision with root package name */
    public final l0 f96292g;

    /* renamed from: h, reason: collision with root package name */
    public final ww.g0 f96293h;

    /* renamed from: i, reason: collision with root package name */
    public final Function0 f96294i;

    /* renamed from: j, reason: collision with root package name */
    public final Function0 f96295j;

    /* renamed from: k, reason: collision with root package name */
    public final Function1 f96296k;

    /* renamed from: l, reason: collision with root package name */
    public final i2 f96297l;

    /* renamed from: m, reason: collision with root package name */
    public final i2 f96298m;
    public final g1 n;
    public final o1 o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f96299p;

    public o(LinkAccount linkAccount, g0 linkAccountHolder, h0 linkAccountManager, gs.b linkEventsReporter, xq.c logger, LinkLaunchMode linkLaunchMode, l0 webLinkAuthChannel, boolean z11, ww.g0 g0Var, Function0 onChangeEmailRequested, Function0 onDismissClicked, Function1 dismissWithResult) {
        Intrinsics.g(linkAccount, "linkAccount");
        Intrinsics.g(linkAccountHolder, "linkAccountHolder");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(linkEventsReporter, "linkEventsReporter");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(webLinkAuthChannel, "webLinkAuthChannel");
        Intrinsics.g(onChangeEmailRequested, "onChangeEmailRequested");
        Intrinsics.g(onDismissClicked, "onDismissClicked");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        this.f96286a = linkAccount;
        this.f96287b = linkAccountHolder;
        this.f96288c = linkAccountManager;
        this.f96289d = linkEventsReporter;
        this.f96290e = logger;
        this.f96291f = linkLaunchMode;
        this.f96292g = webLinkAuthChannel;
        this.f96293h = g0Var;
        this.f96294i = onChangeEmailRequested;
        this.f96295j = onDismissClicked;
        this.f96296k = dismissWithResult;
        boolean z12 = linkAccount.f43021m != null;
        String str = linkAccount.f43014f;
        String str2 = linkAccount.f43016h;
        boolean z13 = !z11 || (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection);
        LinkAuthIntentInfo linkAuthIntentInfo = linkAccount.f43012d;
        Continuation continuation = null;
        ConsentPresentation consentPresentation = linkAuthIntentInfo != null ? linkAuthIntentInfo.f43023b : null;
        ConsentPresentation.Inline inline = consentPresentation instanceof ConsentPresentation.Inline ? (ConsentPresentation.Inline) consentPresentation : null;
        i2 i2VarC = u1.c(new VerificationViewState(false, true, null, false, false, str, str2, z11, z13, null, inline != null ? inline.f43008a : null, z12));
        this.f96297l = i2VarC;
        this.f96298m = i2VarC;
        OTPSpec.INSTANCE.getClass();
        IdentifierSpec.Companion.getClass();
        g1 g1Var = new g1(z0.a("otp"), new d1());
        this.n = g1Var;
        this.o = u1.z(new i0((uw.c) g1Var.e(), 2), h6.g1.f(this), y1.f94087b, null);
        if (((VerificationViewState) i2VarC.getValue()).f43061l) {
            m0.t(h6.g1.f(this), null, null, new n(this, null), 3);
        } else if (!Intrinsics.b(linkAccount.f43020l, ls.d.f75090a)) {
            j(false);
        }
        m0.t(h6.g1.f(this), null, null, new k(this, continuation, 1), 3);
        m0.t(h6.g1.f(this), null, null, new k(this, continuation, 2), 3);
    }

    public final void e() {
        i2 i2Var;
        Object value;
        VerificationViewState it;
        do {
            i2Var = this.f96297l;
            value = i2Var.getValue();
            it = (VerificationViewState) value;
            Intrinsics.g(it, "it");
        } while (!i2Var.i(value, VerificationViewState.a(it, false, null, false, false, 4091)));
    }

    public final void f() {
        i2 i2Var;
        Object value;
        VerificationViewState it;
        do {
            i2Var = this.f96297l;
            value = i2Var.getValue();
            it = (VerificationViewState) value;
            Intrinsics.g(it, "it");
        } while (!i2Var.i(value, VerificationViewState.a(it, false, null, false, false, 4079)));
    }

    public final void g() {
        i2 i2Var;
        Object value;
        VerificationViewState it;
        do {
            i2Var = this.f96297l;
            value = i2Var.getValue();
            it = (VerificationViewState) value;
            Intrinsics.g(it, "it");
        } while (!i2Var.i(value, VerificationViewState.a(it, false, null, false, false, 4093)));
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(String str, Continuation continuation) {
        l lVar;
        i2 i2Var;
        Object value;
        VerificationViewState it;
        Object objA;
        o oVar;
        Object value2;
        VerificationViewState it2;
        Object value3;
        VerificationViewState it3;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i5 = lVar.f96280w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f96280w = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuation);
            }
        }
        Object obj = lVar.f96278u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f96280w;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            do {
                i2Var = this.f96297l;
                value = i2Var.getValue();
                it = (VerificationViewState) value;
                Intrinsics.g(it, "it");
            } while (!i2Var.i(value, VerificationViewState.a(it, true, null, false, false, 4090)));
            boolean z12 = this.f96299p;
            Boolean boolValueOf = Boolean.valueOf(z12);
            if (!z12) {
                boolValueOf = null;
            }
            lVar.f96277t = this;
            lVar.f96280w = 1;
            objA = ((y) this.f96288c).a(str, boolValueOf, lVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            oVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            oVar = lVar.f96277t;
            ResultKt.b(obj);
            objA = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objA);
        if (thA == null) {
            LinkAccount linkAccount = (LinkAccount) objA;
            i2 i2Var2 = oVar.f96297l;
            h0 h0Var = oVar.f96288c;
            Function1 function1 = oVar.f96296k;
            do {
                value3 = i2Var2.getValue();
                it3 = (VerificationViewState) value3;
                Intrinsics.g(it3, "it");
            } while (!i2Var2.i(value3, VerificationViewState.a(it3, false, null, false, false, 4094)));
            LinkLaunchMode linkLaunchMode = oVar.f96291f;
            boolean z13 = linkLaunchMode instanceof LinkLaunchMode.Authentication;
            if (linkLaunchMode instanceof LinkLaunchMode.Authorization) {
                LinkAuthIntentInfo linkAuthIntentInfo = linkAccount.f43012d;
                if ((linkAuthIntentInfo != null ? linkAuthIntentInfo.f43023b : null) != null) {
                    if (!((linkAuthIntentInfo != null ? linkAuthIntentInfo.f43023b : null) instanceof ConsentPresentation.Inline)) {
                    }
                }
                if (!z13) {
                }
            } else {
                z11 = false;
                if (!z13) {
                    function1.invoke(new LinkActivityResult.Completed(j0.a(h0Var), null, null, null, 14));
                } else if (z11) {
                    function1.invoke(new LinkActivityResult.Completed(j0.a(h0Var), null, null, Boolean.TRUE, 6));
                } else {
                    oVar.f96293h.invoke(null);
                }
            }
        } else {
            Iterator it4 = oVar.n.f72380b.f72348b.iterator();
            while (it4.hasNext()) {
                i2 i2Var3 = (i2) ((m1) it4.next());
                i2Var3.getClass();
                i2Var3.k(null, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            ResolvableString resolvableStringI = p0.i(thA);
            oVar.f96290e.b("VerificationViewModel Error: ", thA);
            i2 i2Var4 = oVar.f96297l;
            do {
                value2 = i2Var4.getValue();
                it2 = (VerificationViewState) value2;
                Intrinsics.g(it2, "it");
            } while (!i2Var4.i(value2, VerificationViewState.a(it2, false, resolvableStringI, false, false, 4090)));
        }
        return Unit.f71706a;
    }

    public final void i() {
        i2 i2Var;
        Object value;
        VerificationViewState it;
        gs.b bVar = this.f96289d;
        bVar.getClass();
        bVar.a(new gs.f(), b70.k.e0(new Pair("verification_type", "SMS")));
        do {
            i2Var = this.f96297l;
            value = i2Var.getValue();
            it = (VerificationViewState) value;
            Intrinsics.g(it, "it");
        } while (!i2Var.i(value, VerificationViewState.a(it, false, null, true, false, 4087)));
        j(true);
    }

    public final void j(boolean z11) {
        i2 i2Var;
        Object value;
        VerificationViewState it;
        do {
            i2Var = this.f96297l;
            value = i2Var.getValue();
            it = (VerificationViewState) value;
            Intrinsics.g(it, "it");
        } while (!i2Var.i(value, VerificationViewState.a(it, false, null, false, false, 4091)));
        m0.t(h6.g1.f(this), null, null, new m(this, z11, null), 3);
    }
}
