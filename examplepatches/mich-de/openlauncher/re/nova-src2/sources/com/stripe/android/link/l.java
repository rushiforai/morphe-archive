package com.stripe.android.link;

import androidx.lifecycle.DefaultLifecycleObserver;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.ConsumerSessionRefresh;
import com.stripe.android.model.LinkAuthIntent;
import es.i0;
import es.k0;
import fs.g0;
import fs.h0;
import h6.f1;
import h6.g1;
import h6.u0;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.builders.ListBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mt.j0;
import mt.n0;
import t70.m0;
import t70.t0;
import w70.i2;
import w70.n1;
import w70.o1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class l extends f1 implements DefaultLifecycleObserver {

    /* renamed from: a, reason: collision with root package name */
    public final ks.f f42986a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f42987b;

    /* renamed from: c, reason: collision with root package name */
    public final g0 f42988c;

    /* renamed from: d, reason: collision with root package name */
    public final ru.d f42989d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkConfiguration f42990e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentMethodMetadata f42991f;

    /* renamed from: g, reason: collision with root package name */
    public final hs.b f42992g;

    /* renamed from: h, reason: collision with root package name */
    public final u0 f42993h;

    /* renamed from: i, reason: collision with root package name */
    public final es.o f42994i;

    /* renamed from: j, reason: collision with root package name */
    public final rw.e f42995j;

    /* renamed from: k, reason: collision with root package name */
    public final LinkLaunchMode f42996k;

    /* renamed from: l, reason: collision with root package name */
    public final pu.o f42997l;

    /* renamed from: m, reason: collision with root package name */
    public final ys.h f42998m;
    public final n0 n;
    public final is.j o;

    /* renamed from: p, reason: collision with root package name */
    public final i2 f42999p;

    /* renamed from: q, reason: collision with root package name */
    public final o1 f43000q;

    /* renamed from: r, reason: collision with root package name */
    public final t1 f43001r;

    /* renamed from: s, reason: collision with root package name */
    public final n1 f43002s;

    /* renamed from: t, reason: collision with root package name */
    public final n1 f43003t;

    /* renamed from: u, reason: collision with root package name */
    public final i2 f43004u;

    /* renamed from: v, reason: collision with root package name */
    public final i2 f43005v;

    /* renamed from: w, reason: collision with root package name */
    public bu.l f43006w;

    public l(ks.f activityRetainedComponent, j0 confirmationHandlerFactory, is.h linkConfirmationHandlerFactory, h0 linkAccountManager, g0 linkAccountHolder, ru.d eventReporter, LinkConfiguration linkConfiguration, PaymentMethodMetadata paymentMethodMetadata, hs.b linkAttestationCheck, u0 savedStateHandle, es.o linkExpressMode, rw.e navigationManager, LinkLaunchMode linkLaunchMode, pu.o autocompleteLauncher, ys.h addPaymentMethodOptionsFactory) {
        Intrinsics.g(activityRetainedComponent, "activityRetainedComponent");
        Intrinsics.g(confirmationHandlerFactory, "confirmationHandlerFactory");
        Intrinsics.g(linkConfirmationHandlerFactory, "linkConfirmationHandlerFactory");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(linkAccountHolder, "linkAccountHolder");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(linkConfiguration, "linkConfiguration");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(linkAttestationCheck, "linkAttestationCheck");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(linkExpressMode, "linkExpressMode");
        Intrinsics.g(navigationManager, "navigationManager");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(autocompleteLauncher, "autocompleteLauncher");
        Intrinsics.g(addPaymentMethodOptionsFactory, "addPaymentMethodOptionsFactory");
        this.f42986a = activityRetainedComponent;
        this.f42987b = linkAccountManager;
        this.f42988c = linkAccountHolder;
        this.f42989d = eventReporter;
        this.f42990e = linkConfiguration;
        this.f42991f = paymentMethodMetadata;
        this.f42992g = linkAttestationCheck;
        this.f42993h = savedStateHandle;
        this.f42994i = linkExpressMode;
        this.f42995j = navigationManager;
        this.f42996k = linkLaunchMode;
        this.f42997l = autocompleteLauncher;
        this.f42998m = addPaymentMethodOptionsFactory;
        n0 n0VarA = confirmationHandlerFactory.a(g1.f(this));
        this.n = n0VarA;
        this.o = linkConfirmationHandlerFactory.a(n0VarA);
        i2 i2VarC = u1.c(new ps.m(true, false, null, false));
        this.f42999p = i2VarC;
        this.f43000q = new o1(i2VarC);
        t1 t1VarB = u1.b(1, 1, null, 4);
        this.f43001r = t1VarB;
        this.f43002s = new n1(t1VarB);
        this.f43003t = navigationManager.f86456b;
        i2 i2VarC2 = u1.c(i0.f52959a);
        this.f43004u = i2VarC2;
        this.f43005v = i2VarC2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:58:0x00dc, code lost:
    
        if (r0 == r7) goto L59;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(l lVar, LinkPaymentMethod linkPaymentMethod, ContinuationImpl continuationImpl) {
        es.h hVar;
        Object objA;
        LinkActivityResult completed;
        LinkActivityResult canceled;
        String f42946c;
        is.j jVar = lVar.o;
        if (continuationImpl instanceof es.h) {
            hVar = (es.h) continuationImpl;
            int i5 = hVar.f52953w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f52953w = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new es.h(lVar, continuationImpl);
            }
        }
        es.h hVar2 = hVar;
        Object objA2 = hVar2.f52951u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar2.f52953w;
        try {
            if (i11 == 0) {
                ResultKt.b(objA2);
                int i12 = Result.f71687b;
                ConsumerPaymentDetails.PaymentDetails f42941a = linkPaymentMethod.getF42941a();
                if (!(f42941a instanceof ConsumerPaymentDetails.BankAccount)) {
                    if (f42941a instanceof ConsumerPaymentDetails.Card) {
                        ConsumerPaymentDetails.Card card = (ConsumerPaymentDetails.Card) f42941a;
                        boolean z11 = !card.f43296m.a() || ((f42946c = linkPaymentMethod.getF42946c()) != null && f42946c.length() > 0);
                        if (card.i() || !z11) {
                            throw new IllegalArgumentException("LinkPaymentMethod must be ready for confirmation");
                        }
                    } else if (!(f42941a instanceof ConsumerPaymentDetails.Passthrough)) {
                        throw new NoWhenBranchMatchedException();
                    }
                }
                LinkAccount linkAccountH = lVar.h();
                if (linkAccountH == null) {
                    throw new IllegalArgumentException("LinkAccount must not be null for confirmation");
                }
                if (linkPaymentMethod instanceof LinkPaymentMethod.ConsumerPaymentDetails) {
                    ConsumerPaymentDetails.PaymentDetails paymentDetails = ((LinkPaymentMethod.ConsumerPaymentDetails) linkPaymentMethod).f42942b;
                    String str = ((LinkPaymentMethod.ConsumerPaymentDetails) linkPaymentMethod).f42943c;
                    String str2 = ((LinkPaymentMethod.ConsumerPaymentDetails) linkPaymentMethod).f42944d;
                    hVar2.f52950t = lVar;
                    hVar2.f52953w = 1;
                    jVar.getClass();
                    objA2 = jVar.a(new com.instabridge.mobilesdk.internal.ui.screens.t(jVar, paymentDetails, linkAccountH, str, str2, 9), hVar2);
                    if (objA2 == coroutineSingletons) {
                    }
                    objA = (is.o) objA2;
                } else {
                    if (!(linkPaymentMethod instanceof LinkPaymentMethod.LinkPaymentDetails)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    LinkPaymentDetails linkPaymentDetails = ((LinkPaymentMethod.LinkPaymentDetails) linkPaymentMethod).f42945b;
                    String str3 = ((LinkPaymentMethod.LinkPaymentDetails) linkPaymentMethod).f42946c;
                    String str4 = ((LinkPaymentMethod.LinkPaymentDetails) linkPaymentMethod).f42947d;
                    hVar2.f52950t = lVar;
                    hVar2.f52953w = 2;
                    jVar.getClass();
                    objA2 = jVar.a(new com.instabridge.mobilesdk.internal.ui.screens.t(jVar, linkPaymentDetails, linkAccountH, str3, str4, 8), hVar2);
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                lVar = hVar2.f52950t;
                ResultKt.b(objA2);
                objA = (is.o) objA2;
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                lVar = hVar2.f52950t;
                ResultKt.b(objA2);
                objA = (is.o) objA2;
            }
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        boolean z12 = objA instanceof Result.Failure;
        LinkAccountUpdate.None none = LinkAccountUpdate.None.f42863a;
        if (!z12) {
            is.o oVar = (is.o) objA;
            if (Intrinsics.b(oVar, is.l.f68048a)) {
                canceled = new LinkActivityResult.Canceled(g.f42980a, none);
            } else {
                if (oVar instanceof is.m) {
                    completed = new LinkActivityResult.Failed(new IllegalStateException("Failed to confirm Link payment: " + ((is.m) oVar).f68049a), none);
                } else {
                    if (!Intrinsics.b(oVar, is.n.f68050a)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    completed = new LinkActivityResult.Completed(new LinkAccountUpdate.Value(null, d.f42970b), null, null, null, 14);
                }
                canceled = completed;
            }
            lVar.g(canceled);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            lVar.g(new LinkActivityResult.Failed(thA, none));
        }
        return objA;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0087, code lost:
    
        if (m(r10, true, null, r0, 6) == r1) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00ab, code lost:
    
        if (m(r10, true, null, r0, 6) == r1) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x00c8, code lost:
    
        if (r10.i(r0) == r1) goto L57;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(l lVar, ContinuationImpl continuationImpl) throws Throwable {
        es.k kVar;
        if (continuationImpl instanceof es.k) {
            kVar = (es.k) continuationImpl;
            int i5 = kVar.f52967w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f52967w = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new es.k(lVar, continuationImpl);
            }
        }
        Object objY = kVar.f52965u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f52967w;
        hs.f fVar = hs.f.f60050a;
        if (i11 == 0) {
            ResultKt.b(objY);
            hs.b bVar = lVar.f42992g;
            kVar.f52964t = lVar;
            kVar.f52967w = 1;
            objY = !bVar.f60041a.a() ? fVar : m0.y(bVar.f60046f, new hs.a(bVar, null), kVar);
            if (objY != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(objY);
                return Unit.f71706a;
            }
            if (i11 == 3) {
                ResultKt.b(objY);
                return Unit.f71706a;
            }
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            return Unit.f71706a;
        }
        lVar = kVar.f52964t;
        ResultKt.b(objY);
        hs.g gVar = (hs.g) objY;
        if (gVar instanceof hs.d) {
            int iOrdinal = lVar.f42994i.ordinal();
            if (iOrdinal == 0 || iOrdinal == 1) {
                lVar.j(((hs.d) gVar).f60048a);
                return Unit.f71706a;
            }
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            kVar.f52964t = null;
            kVar.f52967w = 2;
        } else if (Intrinsics.b(gVar, fVar)) {
            kVar.f52964t = null;
            kVar.f52967w = 3;
        } else {
            if (!(gVar instanceof hs.e) && !(gVar instanceof hs.c)) {
                throw new NoWhenBranchMatchedException();
            }
            kVar.f52964t = null;
            kVar.f52967w = 4;
        }
        return coroutineSingletons;
    }

    public static void k(l lVar, es.z screen, boolean z11) {
        lVar.getClass();
        Intrinsics.g(screen, "screen");
        rw.e eVar = lVar.f42995j;
        String route = screen.a();
        rw.g gVar = z11 ? rw.g.f86458a : null;
        eVar.getClass();
        Intrinsics.g(route, "route");
        eVar.f86455a.c(new rw.c(route, gVar, false));
    }

    public static /* synthetic */ Object m(l lVar, boolean z11, ConsumerSessionRefresh consumerSessionRefresh, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 2) != 0) {
            consumerSessionRefresh = null;
        }
        return lVar.l(z11, consumerSessionRefresh, (i5 & 4) == 0, continuationImpl);
    }

    public final void g(LinkActivityResult linkActivityResult) {
        m0.t(g1.f(this), null, null, new c4.k(this, linkActivityResult, null, 17), 3);
    }

    public final LinkAccount h() {
        return ((LinkAccountUpdate.Value) ((fs.y) this.f42987b).f55853a.f55777b.f93973a.getValue()).f42864a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0066, code lost:
    
        if (m(r2, true, null, r0, 6) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(ContinuationImpl continuationImpl) {
        es.i iVar;
        l lVar;
        if (continuationImpl instanceof es.i) {
            iVar = (es.i) continuationImpl;
            int i5 = iVar.f52958w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f52958w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new es.i(this, continuationImpl);
            }
        }
        Object obj = iVar.f52956u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f52958w;
        if (i11 == 0) {
            ResultKt.b(obj);
            iVar.f52955t = this;
            iVar.f52958w = 1;
            if (((fs.y) this.f42987b).i(iVar) != coroutineSingletons) {
                lVar = this;
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
        lVar = iVar.f52955t;
        ResultKt.b(obj);
        ((Result) obj).getClass();
        lVar.f42988c.a(new LinkAccountUpdate.Value(null, d.f42969a));
        iVar.f52955t = null;
        iVar.f52958w = 2;
    }

    public final void j(Throwable error) throws Throwable {
        Intrinsics.g(error, "error");
        LinkLaunchMode linkLaunchMode = this.f42996k;
        boolean z11 = linkLaunchMode instanceof LinkLaunchMode.Authentication;
        LinkAccountUpdate.None none = LinkAccountUpdate.None.f42863a;
        if (z11) {
            g(new LinkActivityResult.Failed(error, none));
            return;
        }
        if (linkLaunchMode instanceof LinkLaunchMode.Authorization) {
            g(new LinkActivityResult.Failed(new IllegalStateException("Authorization mode is not supported in web"), none));
            return;
        }
        if (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) {
            g(new LinkActivityResult.Completed(none, null, null, null, 8));
            return;
        }
        if (!(linkLaunchMode instanceof LinkLaunchMode.Confirmation) && !Intrinsics.b(linkLaunchMode, LinkLaunchMode.Full.f42930a)) {
            throw new NoWhenBranchMatchedException();
        }
        bu.l lVar = this.f43006w;
        if (lVar != null) {
            k(this, es.r.f53005d, true);
            lVar.invoke(this.f42990e, this.f42991f);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x0288  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x02b9  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x02cc  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0111 A[PHI: r1
      0x0111: PHI (r1v67 ??) = (r1v56 ??), (r1v66 ??), (r1v70 ??) binds: [B:94:0x01ca, B:63:0x0130, B:56:0x010c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01c3  */
    /* JADX WARN: Type inference failed for: r1v12, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r1v56 */
    /* JADX WARN: Type inference failed for: r1v57 */
    /* JADX WARN: Type inference failed for: r1v66, types: [es.h0] */
    /* JADX WARN: Type inference failed for: r1v67 */
    /* JADX WARN: Type inference failed for: r1v70, types: [es.j0] */
    /* JADX WARN: Type inference failed for: r1v83 */
    /* JADX WARN: Type inference failed for: r4v6, types: [es.h0] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object l(boolean z11, ConsumerSessionRefresh consumerSessionRefresh, boolean z12, ContinuationImpl continuationImpl) {
        es.l lVar;
        ConsumerSessionRefresh consumerSessionRefresh2;
        boolean z13;
        boolean z14;
        l lVar2;
        Object h0Var;
        Object obj;
        boolean z15;
        l lVar3;
        es.z zVar;
        ?? h0Var2;
        if (continuationImpl instanceof es.l) {
            lVar = (es.l) continuationImpl;
            int i5 = lVar.f52974z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f52974z = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new es.l(this, continuationImpl);
            }
        }
        Object objO = lVar.f52972x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f52974z;
        if (i11 == 0) {
            ResultKt.b(objO);
            cw.u0 u0Var = ((fs.y) this.f42987b).f55865m;
            lVar.f52968t = this;
            consumerSessionRefresh2 = consumerSessionRefresh;
            lVar.f52969u = consumerSessionRefresh2;
            z13 = z11;
            lVar.f52970v = z13;
            z14 = z12;
            lVar.f52971w = z14;
            lVar.f52974z = 1;
            objO = u1.o(u0Var, lVar);
            if (objO != coroutineSingletons) {
                lVar2 = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z15 = lVar.f52970v;
            obj = (k0) lVar.f52969u;
            lVar3 = lVar.f52968t;
            ResultKt.b(objO);
            lVar2 = lVar3;
            z14 = z15;
            if (z14 && (obj instanceof es.h0)) {
                k(lVar2, ((es.h0) obj).f52954a, true);
            } else {
                lVar2.f43004u.j(obj);
            }
            return Unit.f71706a;
        }
        boolean z16 = lVar.f52971w;
        z13 = lVar.f52970v;
        ConsumerSessionRefresh consumerSessionRefresh3 = (ConsumerSessionRefresh) lVar.f52969u;
        lVar2 = lVar.f52968t;
        ResultKt.b(objO);
        z14 = z16;
        consumerSessionRefresh2 = consumerSessionRefresh3;
        ls.f fVar = (ls.f) objO;
        LinkAccount linkAccountH = lVar2.h();
        es.o oVar = lVar2.f42994i;
        LinkLaunchMode linkLaunchMode = lVar2.f42996k;
        boolean z17 = linkLaunchMode instanceof LinkLaunchMode.Authorization;
        boolean z18 = lVar2.f42990e.f42916x;
        boolean z19 = linkLaunchMode instanceof LinkLaunchMode.Authentication;
        LinkLaunchMode.Authentication authentication = z19 ? (LinkLaunchMode.Authentication) linkLaunchMode : null;
        boolean z21 = false;
        if (authentication != null && authentication.f42927a) {
            z21 = true;
        }
        boolean z22 = fVar instanceof ls.a;
        if (z22 || Intrinsics.b(fVar, ls.c.f75089a)) {
            if (!z18 || z21 || z17) {
                ls.a aVar = z22 ? (ls.a) fVar : null;
                noLinkAccountFoundException = aVar != null ? aVar.f75087a : null;
                if (noLinkAccountFoundException == null) {
                    noLinkAccountFoundException = new NoLinkAccountFoundException();
                }
                lVar2.g(new LinkActivityResult.Failed(noLinkAccountFoundException, LinkAccountUpdate.None.f42863a));
                return Unit.f71706a;
            }
            h0Var = new es.h0(es.u.f53008d);
        } else if (fVar instanceof ls.b) {
            h0Var = (linkAccountH == null || oVar == es.o.f52992a) ? new es.h0(es.x.f53011d) : new es.j0(linkAccountH);
        } else {
            if (!Intrinsics.b(fVar, ls.d.f75090a)) {
                if (!(fVar instanceof ls.e)) {
                    throw new NoWhenBranchMatchedException();
                }
                ls.e eVar = (ls.e) fVar;
                ConsentPresentation consentPresentation = eVar.f75092b;
                Intrinsics.d(linkAccountH);
                h0 h0Var3 = lVar2.f42987b;
                if (!z19) {
                    if (z17) {
                        if (consumerSessionRefresh2 != null) {
                            LinkAuthIntent linkAuthIntent = consumerSessionRefresh2.f43350b;
                            ft.b0 b0Var = linkAuthIntent != null ? linkAuthIntent.f43504a : null;
                            int i12 = b0Var == null ? -1 : es.g.f52947a[b0Var.ordinal()];
                            if (i12 != -1) {
                                if (i12 == 1) {
                                    lVar2.g(new LinkActivityResult.Completed(fs.j0.a(h0Var3), null, null, Boolean.TRUE, 6));
                                } else if (i12 == 2) {
                                    lVar2.g(new LinkActivityResult.Completed(fs.j0.a(h0Var3), null, null, Boolean.FALSE, 6));
                                } else if (i12 == 3 || i12 == 4) {
                                    lVar2.g(new LinkActivityResult.Failed(new IllegalStateException(b.c0.k("Unexpected LAI status when account is verified: ", b0Var.name())), fs.j0.a(h0Var3)));
                                } else {
                                    if (i12 != 5) {
                                        throw new NoWhenBranchMatchedException();
                                    }
                                    if (consentPresentation instanceof ConsentPresentation.FullScreen) {
                                    }
                                }
                                h0Var2 = 0;
                                if (h0Var2 != 0) {
                                }
                            } else if (consentPresentation instanceof ConsentPresentation.FullScreen) {
                                lVar2.g(new LinkActivityResult.Completed(fs.j0.a(h0Var3), null, null, null, 14));
                                h0Var2 = 0;
                                if (h0Var2 != 0) {
                                    noLinkAccountFoundException = h0Var2;
                                }
                            } else {
                                h0Var2 = new es.h0(es.s.f53006d);
                                if (h0Var2 != 0) {
                                }
                            }
                        } else if (consentPresentation instanceof ConsentPresentation.FullScreen) {
                            h0Var2 = new es.h0(es.s.f53006d);
                            noLinkAccountFoundException = h0Var2;
                        } else {
                            lVar2.g(new LinkActivityResult.Completed(fs.j0.a(h0Var3), null, null, null, 14));
                        }
                    } else {
                        if (!(linkLaunchMode instanceof LinkLaunchMode.Confirmation) && !Intrinsics.b(linkLaunchMode, LinkLaunchMode.Full.f42930a) && !(linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        if (linkAccountH.f43019k && linkLaunchMode.B0() == null) {
                            nx.l lVar4 = lVar2.f42998m.f97479a;
                            LinkConfiguration configuration = (LinkConfiguration) ((s40.h) lVar4.f78644a).get();
                            LinkLaunchMode linkLaunchMode2 = (LinkLaunchMode) ((s40.h) lVar4.f78645b).get();
                            Intrinsics.g(configuration, "configuration");
                            mu.b bVar = configuration.f42907m;
                            Intrinsics.g(linkLaunchMode2, "linkLaunchMode");
                            Set setA = ls.g.a(configuration.f42895a, linkAccountH);
                            LinkLaunchMode.PaymentMethodSelection paymentMethodSelection = linkLaunchMode2 instanceof LinkLaunchMode.PaymentMethodSelection ? (LinkLaunchMode.PaymentMethodSelection) linkLaunchMode2 : null;
                            es.q qVar = paymentMethodSelection != null ? paymentMethodSelection.f42932b : null;
                            ListBuilder listBuilderW = ul.b.w();
                            if (linkAccountH.f43010b != null && bVar != null && setA.contains("bank_account") && (qVar == null || qVar == es.q.f53003b)) {
                                listBuilderW.add(new ys.d(bVar));
                            }
                            if (setA.contains("card") && (qVar == null || qVar == es.q.f53002a)) {
                                listBuilderW.add(ys.e.f97449c);
                            }
                            ListBuilder listBuilderM = ul.b.m(listBuilderW);
                            zVar = (listBuilderM.getF71724c() > 1 ? ys.e.f97449c : (ys.f) b70.g.Y0(listBuilderM)) instanceof ys.d ? es.y.f53012d : es.t.f53007d;
                        } else {
                            zVar = es.y.f53012d;
                        }
                        noLinkAccountFoundException = new es.h0(zVar);
                    }
                    if (noLinkAccountFoundException == null) {
                    }
                } else if (eVar.f75091a) {
                    lVar2.g(new LinkActivityResult.Completed(fs.j0.a(h0Var3), null, null, null, 14));
                    if (noLinkAccountFoundException == null) {
                        return Unit.f71706a;
                    }
                    obj = noLinkAccountFoundException;
                    if ((obj instanceof es.h0) && z13) {
                        lVar.f52968t = lVar2;
                        lVar.f52969u = obj;
                        lVar.f52970v = z14;
                        lVar.f52974z = 2;
                        if (t0.b(650L, lVar) != coroutineSingletons) {
                            z15 = z14;
                            lVar3 = lVar2;
                            lVar2 = lVar3;
                            z14 = z15;
                        }
                        return coroutineSingletons;
                    }
                } else {
                    h0Var2 = new es.j0(linkAccountH);
                    noLinkAccountFoundException = h0Var2;
                    if (noLinkAccountFoundException == null) {
                    }
                }
                if (z14) {
                    lVar2.f43004u.j(obj);
                }
                return Unit.f71706a;
            }
            h0Var = (linkAccountH == null || oVar == es.o.f52992a) ? new es.h0(es.x.f53011d) : new es.j0(linkAccountH);
        }
        obj = h0Var;
        if (obj instanceof es.h0) {
            lVar.f52968t = lVar2;
            lVar.f52969u = obj;
            lVar.f52970v = z14;
            lVar.f52974z = 2;
            if (t0.b(650L, lVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (z14) {
        }
        return Unit.f71706a;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onCreate(h6.a0 owner) {
        Intrinsics.g(owner, "owner");
        super.onCreate(owner);
        m0.t(g1.f(this), null, null, new k(this, null), 3);
    }
}
