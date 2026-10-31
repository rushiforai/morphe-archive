package fs;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentDetails;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.NoLinkAccountFoundException;
import com.stripe.android.link.account.AlreadyLoggedInLinkException;
import com.stripe.android.link.model.ConsentPresentation;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.link.model.LinkAuthIntentInfo;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConsentUi;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.ConsumerPaymentDetailsUpdateParams;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.ConsumerSessionLookup;
import com.stripe.android.model.ConsumerSessionRefresh;
import com.stripe.android.model.ConsumerSessionSignup;
import com.stripe.android.model.ConsumerShippingAddresses;
import com.stripe.android.model.DisplayablePaymentDetails;
import com.stripe.android.model.LinkAccountSession;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.SharePaymentDetails;
import com.stripe.android.model.StripeIntent;
import cw.u0;
import ft.w0;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.y0;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class y implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f55853a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkConfiguration f55854b;

    /* renamed from: c, reason: collision with root package name */
    public final ms.z f55855c;

    /* renamed from: d, reason: collision with root package name */
    public final gs.b f55856d;

    /* renamed from: e, reason: collision with root package name */
    public final iu.f f55857e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkLaunchMode f55858f;

    /* renamed from: g, reason: collision with root package name */
    public final k0 f55859g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f55860h;

    /* renamed from: i, reason: collision with root package name */
    public final o1 f55861i;

    /* renamed from: j, reason: collision with root package name */
    public ConsumerShippingAddresses f55862j;

    /* renamed from: k, reason: collision with root package name */
    public final i2 f55863k;

    /* renamed from: l, reason: collision with root package name */
    public final o1 f55864l;

    /* renamed from: m, reason: collision with root package name */
    public final u0 f55865m;

    public y(g0 linkAccountHolder, LinkConfiguration config, ms.z linkRepository, gs.b linkEventsReporter, iu.f errorReporter, LinkLaunchMode linkLaunchMode, k0 linkAuth) {
        Intrinsics.g(linkAccountHolder, "linkAccountHolder");
        Intrinsics.g(config, "config");
        Intrinsics.g(linkRepository, "linkRepository");
        Intrinsics.g(linkEventsReporter, "linkEventsReporter");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(linkAuth, "linkAuth");
        this.f55853a = linkAccountHolder;
        this.f55854b = config;
        this.f55855c = linkRepository;
        this.f55856d = linkEventsReporter;
        this.f55857e = errorReporter;
        this.f55858f = linkLaunchMode;
        this.f55859g = linkAuth;
        i2 i2VarC = u1.c(null);
        this.f55860h = i2VarC;
        this.f55861i = new o1(i2VarC);
        i2 i2VarC2 = u1.c(null);
        this.f55863k = i2VarC2;
        this.f55864l = new o1(i2VarC2);
        this.f55865m = new u0(3, linkAccountHolder.f55777b, this);
    }

    public static /* synthetic */ Object p(y yVar, ConsumerSession consumerSession, String str, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 2) != 0) {
            str = null;
        }
        return yVar.o(consumerSession, str, null, null, continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x009a, code lost:
    
        if (r9 == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Boolean bool, ContinuationImpl continuationImpl) {
        a aVar;
        Object objC;
        y yVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f55726w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f55726w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object objP = aVar.f55724u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f55726w;
        if (i11 == 0) {
            ResultKt.b(objP);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new NoLinkAccountFoundException());
            }
            String str2 = linkAccount.f43015g;
            aVar.f55723t = this;
            aVar.f55726w = 1;
            objC = ((ms.x) this.f55855c).c(str, str2, bool, aVar);
            if (objC != coroutineSingletons) {
                yVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
            LinkAccount linkAccount2 = (LinkAccount) objP;
            int i13 = Result.f71687b;
            return linkAccount2;
        }
        yVar = aVar.f55723t;
        ResultKt.b(objP);
        objC = ((Result) objP).f71688a;
        int i14 = Result.f71687b;
        boolean z11 = objC instanceof Result.Failure;
        if (!z11) {
            yVar.f55856d.a(gs.d.f57777q, null);
        }
        if (Result.a(objC) != null) {
            yVar.f55856d.a(gs.d.f57778r, null);
        }
        if (z11) {
            return objC;
        }
        aVar.f55723t = null;
        aVar.f55726w = 2;
        objP = p(yVar, (ConsumerSession) objC, null, aVar, 14);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ContinuationImpl continuationImpl) {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f55732v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f55732v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        b bVar2 = bVar;
        Object obj = bVar2.f55730t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f55732v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
        if (linkAccount == null) {
            t2.c.L(this.f55857e, iu.e.f68098m, null, null, 6);
            int i12 = Result.f71687b;
            return ResultKt.a(new IllegalStateException("A non-null Link account is needed to create payment details"));
        }
        String str2 = linkAccount.f43016h;
        String str3 = linkAccount.f43015g;
        ClientAttributionMetadata clientAttributionMetadata = this.f55854b.I;
        bVar2.f55732v = 1;
        Object objE = ((ms.x) this.f55855c).e(str, str2, str3, clientAttributionMetadata, bVar2);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(PaymentMethodCreateParams paymentMethodCreateParams, ContinuationImpl continuationImpl) {
        c cVar;
        Object objF;
        y yVar;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f55743w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f55743w = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        c cVar2 = cVar;
        Object obj = cVar2.f55741u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar2.f55743w;
        if (i11 == 0) {
            ResultKt.b(obj);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                t2.c.L(this.f55857e, iu.e.f68097l, null, null, 6);
                int i12 = Result.f71687b;
                return ResultKt.a(new IllegalStateException("A non-null Link account is needed to create payment details"));
            }
            String str = linkAccount.f43016h;
            LinkConfiguration linkConfiguration = this.f55854b;
            StripeIntent stripeIntent = linkConfiguration.f42895a;
            String str2 = linkAccount.f43015g;
            ClientAttributionMetadata clientAttributionMetadata = linkConfiguration.I;
            cVar2.f55740t = this;
            cVar2.f55743w = 1;
            objF = ((ms.x) this.f55855c).f(paymentMethodCreateParams, str, str2, clientAttributionMetadata, cVar2);
            if (objF == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = cVar2.f55740t;
            ResultKt.b(obj);
            objF = ((Result) obj).f71688a;
        }
        int i13 = Result.f71687b;
        if (!(objF instanceof Result.Failure)) {
            t2.c.L(yVar.f55857e, iu.d.f68078e, null, null, 6);
        }
        return objF;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) {
        d dVar;
        Object objG;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f55753v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f55753v = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f55751t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f55753v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                int i12 = Result.f71687b;
                LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
                if (linkAccount == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                ms.z zVar = this.f55855c;
                String str = linkAccount.f43015g;
                LinkConfiguration linkConfiguration = this.f55854b;
                StripeIntent stripeIntent = linkConfiguration.f42895a;
                ft.d0 d0Var = linkConfiguration.f42912t;
                dVar.f55753v = 1;
                objG = ((ms.x) zVar).g(str, stripeIntent, d0Var, dVar);
                if (objG == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objG = ((Result) obj).f71688a;
            }
            ResultKt.b(objG);
            LinkAccountSession linkAccountSession = (LinkAccountSession) objG;
            int i13 = Result.f71687b;
            return linkAccountSession;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(String str, ContinuationImpl continuationImpl) {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f55759v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f55759v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f55757t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f55759v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
        if (linkAccount == null) {
            int i12 = Result.f71687b;
            return ResultKt.a(new NoLinkAccountFoundException());
        }
        String str2 = linkAccount.f43015g;
        eVar.f55759v = 1;
        Object objH = ((ms.x) this.f55855c).h(str, str2, eVar);
        return objH == coroutineSingletons ? coroutineSingletons : objH;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(LinkAccount linkAccount, boolean z11, ContinuationImpl continuationImpl) {
        f fVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f55765v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f55765v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object objJ = fVar.f55763t;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = fVar.f55765v;
        if (i11 == 0) {
            ResultKt.b(objJ);
            String str = this.f55854b.f42900f.f42922b;
            if (str == null || !z11) {
                str = null;
            }
            fVar.f55765v = 1;
            objJ = j(linkAccount, str, fVar);
            if (objJ == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objJ);
        }
        Result result = (Result) objJ;
        if (result != null) {
            Object aVar = result.f71688a;
            if (!(aVar instanceof Result.Failure)) {
                int i12 = Result.f71687b;
                LinkAccount linkAccount2 = (LinkAccount) aVar;
                aVar = linkAccount2 != null ? linkAccount2.f43020l : null;
            }
            Throwable thA = Result.a(aVar);
            if (thA != null) {
                aVar = new ls.a(thA);
            }
            ls.f fVar2 = (ls.f) aVar;
            if (fVar2 != null) {
                return fVar2;
            }
        }
        return ls.c.f75089a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(Set set, ContinuationImpl continuationImpl) {
        g gVar;
        Object objI;
        y yVar;
        com.stripe.android.link.a aVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f55775w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f55775w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f55773u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f55775w;
        if (i11 == 0) {
            ResultKt.b(obj);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new NoLinkAccountFoundException());
            }
            String str = linkAccount.f43015g;
            gVar.f55772t = this;
            gVar.f55775w = 1;
            objI = ((ms.x) this.f55855c).i(set, str, gVar);
            if (objI == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = gVar.f55772t;
            ResultKt.b(obj);
            objI = ((Result) obj).f71688a;
        }
        int i13 = Result.f71687b;
        if (!(objI instanceof Result.Failure)) {
            ConsumerPaymentDetails response = (ConsumerPaymentDetails) objI;
            i2 i2Var = yVar.f55860h;
            com.stripe.android.link.a aVar2 = (com.stripe.android.link.a) i2Var.getValue();
            if (aVar2 != null) {
                Intrinsics.g(response, "response");
                ArrayList arrayList = aVar2.f42962a;
                int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj2 : arrayList) {
                    linkedHashMap.put(((LinkPaymentMethod.ConsumerPaymentDetails) obj2).f42942b.getF43297c(), obj2);
                }
                List<ConsumerPaymentDetails.PaymentDetails> list = response.f43270a;
                ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
                for (ConsumerPaymentDetails.PaymentDetails paymentDetails : list) {
                    LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails = (LinkPaymentMethod.ConsumerPaymentDetails) linkedHashMap.get(paymentDetails.getF43297c());
                    arrayList2.add(consumerPaymentDetails != null ? LinkPaymentMethod.ConsumerPaymentDetails.e(consumerPaymentDetails, paymentDetails, null, 6) : new LinkPaymentMethod.ConsumerPaymentDetails(paymentDetails, null, null));
                }
                aVar = new com.stripe.android.link.a(arrayList2);
            } else {
                Intrinsics.g(response, "response");
                List list2 = response.f43270a;
                ArrayList arrayList3 = new ArrayList(b70.c.u0(list2, 10));
                Iterator it = list2.iterator();
                while (it.hasNext()) {
                    arrayList3.add(new LinkPaymentMethod.ConsumerPaymentDetails((ConsumerPaymentDetails.PaymentDetails) it.next(), null, null));
                }
                aVar = new com.stripe.android.link.a(arrayList3);
            }
            i2Var.getClass();
            i2Var.k(null, aVar);
        }
        return objI;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(ContinuationImpl continuationImpl) {
        h hVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f55780v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f55780v = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f55778t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f55780v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
        if (linkAccount == null) {
            int i12 = Result.f71687b;
            return ResultKt.a(new NoLinkAccountFoundException());
        }
        String str = linkAccount.f43015g;
        hVar.f55780v = 1;
        Object objJ = ((ms.x) this.f55855c).j(str, hVar);
        return objJ == coroutineSingletons ? coroutineSingletons : objJ;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0091 A[Catch: all -> 0x009d, TryCatch #3 {all -> 0x009d, blocks: (B:39:0x008c, B:41:0x0091, B:44:0x009f, B:46:0x00a5, B:47:0x00c2, B:38:0x0086, B:28:0x0064), top: B:57:0x0064 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a5 A[Catch: all -> 0x009d, TryCatch #3 {all -> 0x009d, blocks: (B:39:0x008c, B:41:0x0091, B:44:0x009f, B:46:0x00a5, B:47:0x00c2, B:38:0x0086, B:28:0x0064), top: B:57:0x0064 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(ContinuationImpl continuationImpl) {
        i iVar;
        Object objA;
        y yVar;
        Object objK;
        Object objA2;
        Throwable thA;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f55784w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f55784w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f55782u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f55784w;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                objA = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            } catch (Throwable th2) {
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            if (objA instanceof Result.Failure) {
                return objA;
            }
            try {
                LinkAccount linkAccount = (LinkAccount) objA;
                try {
                    ms.z zVar = this.f55855c;
                    String str = linkAccount.f43015g;
                    String str2 = linkAccount.f43010b;
                    iVar.f55781t = this;
                    iVar.f55784w = 1;
                    objK = ((ms.x) zVar).k(str, str2, iVar);
                    if (objK == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    yVar = this;
                } catch (Throwable th3) {
                    th = th3;
                    yVar = this;
                    int i14 = Result.f71687b;
                    objA2 = ResultKt.a(th);
                    if (!(objA2 instanceof Result.Failure)) {
                    }
                    thA = Result.a(objA2);
                    if (thA != null) {
                    }
                    ResultKt.b(objA2);
                    return (ConsumerSession) objA2;
                }
            } catch (Throwable th4) {
                int i15 = Result.f71687b;
                return ResultKt.a(th4);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = iVar.f55781t;
            try {
                ResultKt.b(obj);
                objK = ((Result) obj).f71688a;
            } catch (Throwable th5) {
                th = th5;
                int i142 = Result.f71687b;
                objA2 = ResultKt.a(th);
                if (!(objA2 instanceof Result.Failure)) {
                }
                thA = Result.a(objA2);
                if (thA != null) {
                }
                ResultKt.b(objA2);
                return (ConsumerSession) objA2;
            }
        }
        ResultKt.b(objK);
        objA2 = (ConsumerSession) objK;
        int i16 = Result.f71687b;
        if (!(objA2 instanceof Result.Failure)) {
            t2.c.L(yVar.f55857e, iu.d.f68079f, null, null, 6);
        }
        thA = Result.a(objA2);
        if (thA != null) {
            iu.f fVar = yVar.f55857e;
            iu.c cVar = iu.c.f68061l;
            int i17 = StripeException.f42562e;
            t2.c.L(fVar, cVar, p6.u.i(thA), null, 4);
            String msg = "Failed to log out of Link: " + thA;
            Intrinsics.g(msg, "msg");
        }
        ResultKt.b(objA2);
        return (ConsumerSession) objA2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x0089, code lost:
    
        if (r8 == r0) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00b2, code lost:
    
        if (r8 == r0) goto L55;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable j(LinkAccount linkAccount, String str, ContinuationImpl continuationImpl) {
        j jVar;
        Object objK;
        Object obj;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f55790v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f55790v = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        j jVar2 = jVar;
        Object obj2 = jVar2.f55788t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar2.f55790v;
        if (i11 != 0) {
            if (i11 == 1) {
                ResultKt.b(obj2);
                objK = ((Result) obj2).f71688a;
                return new Result(objK);
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj2);
            obj = ((Result) obj2).f71688a;
            return new Result(obj);
        }
        ResultKt.b(obj2);
        LinkConfiguration linkConfiguration = this.f55854b;
        LinkLaunchMode linkLaunchMode = this.f55858f;
        if (linkLaunchMode == null || (linkLaunchMode instanceof LinkLaunchMode.Authentication) || (linkLaunchMode instanceof LinkLaunchMode.Confirmation) || linkLaunchMode.equals(LinkLaunchMode.Full.f42930a) || (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection)) {
            if (linkAccount != null) {
                return new Result(linkAccount);
            }
            if (str == null) {
                return null;
            }
            ft.x xVar = ft.x.f56069c;
            String strB = linkConfiguration.b();
            jVar2.f55790v = 1;
            objK = k(str, xVar, true, strB, jVar2);
        } else {
            if (!(linkLaunchMode instanceof LinkLaunchMode.Authorization)) {
                throw new NoWhenBranchMatchedException();
            }
            String str2 = ((LinkLaunchMode.Authorization) linkLaunchMode).f42928a;
            if (linkAccount != null) {
                LinkAuthIntentInfo linkAuthIntentInfo = linkAccount.f43012d;
                Object obj3 = linkAccount;
                if (!Intrinsics.b(linkAuthIntentInfo != null ? linkAuthIntentInfo.f43022a : null, str2)) {
                    obj3 = null;
                }
                if (obj3 != null) {
                    int i12 = Result.f71687b;
                    obj = obj3;
                }
                return new Result(obj);
            }
            String strB2 = linkConfiguration.b();
            jVar2.f55790v = 2;
            Object objL = l(str2, strB2, jVar2);
            obj = objL;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x008d, code lost:
    
        if (r1 == r2) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(String str, ft.x xVar, boolean z11, String str2, ContinuationImpl continuationImpl) {
        k kVar;
        Object obj;
        boolean z12;
        y yVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f55795x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f55795x = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        k kVar2 = kVar;
        Object objQ = kVar2.f55793v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar2.f55795x;
        if (i11 == 0) {
            ResultKt.b(objQ);
            String str3 = this.f55854b.f42911s;
            w0[] w0VarArr = w0.f56067a;
            List listP = z11 ? ul.b.P("SMS") : null;
            kVar2.f55791t = this;
            kVar2.f55792u = z11;
            kVar2.f55795x = 1;
            Object objB = ((f0) this.f55859g).b(str, xVar, null, str2, str3, listP, kVar2);
            if (objB != coroutineSingletons) {
                obj = objB;
                z12 = z11;
                yVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQ);
            LinkAccount linkAccount = (LinkAccount) objQ;
            int i12 = Result.f71687b;
            return linkAccount;
        }
        z12 = kVar2.f55792u;
        yVar = kVar2.f55791t;
        ResultKt.b(objQ);
        obj = ((Result) objQ).f71688a;
        Throwable thA = Result.a(obj);
        if (thA != null) {
            yVar.f55856d.b(thA);
        }
        if (obj instanceof Result.Failure) {
            return obj;
        }
        kVar2.f55791t = null;
        kVar2.f55795x = 2;
        objQ = yVar.q((ConsumerSessionLookup) obj, z12, null, kVar2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0083, code lost:
    
        if (r14 == r0) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object l(String str, String str2, ContinuationImpl continuationImpl) {
        l lVar;
        Object objB;
        y yVar;
        String str3;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f55800x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f55800x = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuationImpl);
            }
        }
        l lVar2 = lVar;
        Object objQ = lVar2.f55798v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar2.f55800x;
        if (i11 == 0) {
            ResultKt.b(objQ);
            String str4 = this.f55854b.f42911s;
            w0[] w0VarArr = w0.f56067a;
            List listP = ul.b.P("SMS");
            lVar2.f55796t = this;
            lVar2.f55797u = str;
            lVar2.f55800x = 1;
            objB = ((f0) this.f55859g).b(null, null, str, str2, str4, listP, lVar2);
            if (objB != coroutineSingletons) {
                yVar = this;
                str3 = str;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQ);
            LinkAccount linkAccount = (LinkAccount) objQ;
            int i12 = Result.f71687b;
            return linkAccount;
        }
        str3 = lVar2.f55797u;
        yVar = lVar2.f55796t;
        ResultKt.b(objQ);
        objB = ((Result) objQ).f71688a;
        Throwable thA = Result.a(objB);
        if (thA != null) {
            yVar.f55856d.b(thA);
        }
        if (objB instanceof Result.Failure) {
            return objB;
        }
        lVar2.f55796t = null;
        lVar2.f55797u = null;
        lVar2.f55800x = 2;
        objQ = yVar.q((ConsumerSessionLookup) objB, true, str3, lVar2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m(boolean z11, ContinuationImpl continuationImpl) {
        m mVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f55804v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f55804v = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object obj = mVar.f55802t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f55804v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
        if (linkAccount == null) {
            int i12 = Result.f71687b;
            return ResultKt.a(new NoLinkAccountFoundException());
        }
        String str = linkAccount.f43015g;
        mVar.f55804v = 1;
        Object objP = ((ms.x) this.f55855c).p(str, mVar, z11);
        return objP == coroutineSingletons ? coroutineSingletons : objP;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object n(ContinuationImpl continuationImpl) {
        n nVar;
        Object objE;
        y yVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f55809w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f55809w = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object obj = nVar.f55807u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f55809w;
        if (i11 == 0) {
            ResultKt.b(obj);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new NoLinkAccountFoundException());
            }
            String str = linkAccount.f43015g;
            w0[] w0VarArr = w0.f56067a;
            List listP = ul.b.P("SMS");
            nVar.f55806t = this;
            nVar.f55809w = 1;
            objE = ((f0) this.f55859g).e(str, listP, nVar);
            if (objE != coroutineSingletons) {
                yVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Object obj2 = nVar.f55806t;
            ResultKt.b(obj);
            return obj2;
        }
        yVar = (y) nVar.f55806t;
        ResultKt.b(obj);
        objE = ((Result) obj).f71688a;
        Throwable thA = Result.a(objE);
        if (thA != null) {
            gs.b bVar = yVar.f55856d;
            bVar.getClass();
            bVar.a(gs.d.f57765c, MapsKt.m0(a80.m.n("error_message", p6.j.m(thA)), iu.a.a(thA)));
        }
        if (!(objE instanceof Result.Failure)) {
            ConsumerSession consumerSession = ((ConsumerSessionRefresh) objE).f43349a;
            nVar.f55806t = objE;
            nVar.f55809w = 2;
            if (p(yVar, consumerSession, null, nVar, 14) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(ConsumerSession consumerSession, String str, DisplayablePaymentDetails displayablePaymentDetails, LinkAuthIntentInfo linkAuthIntentInfo, ContinuationImpl continuationImpl) {
        o oVar;
        LinkAuthIntentInfo linkAuthIntentInfo2;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f55814w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f55814w = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object obj = oVar.f55812u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f55814w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            LinkAccount linkAccount = oVar.f55811t;
            ResultKt.b(obj);
            return linkAccount;
        }
        ResultKt.b(obj);
        LinkAccount linkAccount2 = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
        boolean zB = Intrinsics.b(linkAccount2 != null ? linkAccount2.f43016h : null, consumerSession.f43317b);
        LinkAccount linkAccount3 = new LinkAccount(consumerSession, (str == null && (linkAccount2 == null || (str = linkAccount2.f43010b) == null || !zB)) ? null : str, (displayablePaymentDetails == null && (linkAccount2 == null || (displayablePaymentDetails = linkAccount2.f43011c) == null || !zB)) ? null : displayablePaymentDetails, linkAuthIntentInfo == null ? (linkAccount2 == null || (linkAuthIntentInfo2 = linkAccount2.f43012d) == null || !zB) ? null : linkAuthIntentInfo2 : linkAuthIntentInfo, false);
        a80.e eVar = y0.f88884a;
        u70.d dVar = y70.o.f96819a.f90673f;
        p pVar = new p(this, linkAccount3, null);
        oVar.f55811t = linkAccount3;
        oVar.f55814w = 1;
        return t70.m0.y(dVar, pVar, oVar) == coroutineSingletons ? coroutineSingletons : linkAccount3;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(ConsumerSessionLookup consumerSessionLookup, boolean z11, String str, ContinuationImpl continuationImpl) {
        LinkAuthIntentInfo linkAuthIntentInfo;
        ConsentPresentation inline;
        this.f55863k.j(consumerSessionLookup.f43348g);
        if (str != null) {
            ConsentUi consentUi = consumerSessionLookup.f43347f;
            if (consentUi == null) {
                inline = null;
                linkAuthIntentInfo = new LinkAuthIntentInfo(str, inline);
            } else {
                ConsentUi.ConsentPane consentPane = consentUi.f43255a;
                if (consentPane != null) {
                    inline = new ConsentPresentation.FullScreen(consentPane);
                } else {
                    ConsentUi.ConsentSection consentSection = consentUi.f43256b;
                    if (consentSection != null) {
                        inline = new ConsentPresentation.Inline(consentSection);
                    }
                }
                linkAuthIntentInfo = new LinkAuthIntentInfo(str, inline);
            }
        } else {
            linkAuthIntentInfo = null;
        }
        ConsumerSession consumerSession = consumerSessionLookup.f43343b;
        if (consumerSession == null) {
            return null;
        }
        if (!z11) {
            return new LinkAccount(consumerSession, consumerSessionLookup.f43345d, consumerSessionLookup.f43346e, linkAuthIntentInfo, false);
        }
        Object objO = o(consumerSession, consumerSessionLookup.f43345d, consumerSessionLookup.f43346e, linkAuthIntentInfo, continuationImpl);
        return objO == CoroutineSingletons.f71806a ? objO : (LinkAccount) objO;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(LinkPaymentDetails.New r92, ContinuationImpl continuationImpl) {
        q qVar;
        Object objA;
        Object objA2;
        Object objR;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f55821v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f55821v = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        q qVar2 = qVar;
        Object obj = qVar2.f55819t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar2.f55821v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                ConsumerPaymentDetails.PaymentDetails paymentDetails = r92.f42935a;
                PaymentMethodCreateParams paymentMethodCreateParams = r92.f42937c;
                ms.z zVar = this.f55855c;
                String f43297c = paymentDetails.getF43297c();
                String str = ((LinkAccount) objA2).f43015g;
                ClientAttributionMetadata clientAttributionMetadata = this.f55854b.I;
                qVar2.f55821v = 1;
                objR = ((ms.x) zVar).r(paymentMethodCreateParams, f43297c, str, clientAttributionMetadata, qVar2);
                if (objR == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objR = ((Result) obj).f71688a;
            }
            ResultKt.b(objR);
            objA = (LinkPaymentDetails.Saved) objR;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object s(String str, String str2, String str3, String str4, String str5, ContinuationImpl continuationImpl) {
        r rVar;
        Object objA;
        Object objA2;
        Object objS;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f55824v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f55824v = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        r rVar2 = rVar;
        Object obj = rVar2.f55822t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar2.f55824v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                ms.z zVar = this.f55855c;
                String str6 = ((LinkAccount) objA2).f43015g;
                ClientAttributionMetadata clientAttributionMetadata = this.f55854b.I;
                rVar2.f55824v = 1;
                objS = ((ms.x) zVar).s(str6, str, str2, str3, str4, str5, clientAttributionMetadata, rVar2);
                if (objS == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objS = ((Result) obj).f71688a;
            }
            ResultKt.b(objS);
            objA = (SharePaymentDetails) objS;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x005c, code lost:
    
        if (r10 == r0) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(UserInput userInput, ContinuationImpl continuationImpl) {
        s sVar;
        Object objK;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f55828v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f55828v = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(this, continuationImpl);
            }
        }
        s sVar2 = sVar;
        Object obj = sVar2.f55826t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = sVar2.f55828v;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (userInput instanceof UserInput.SignIn) {
                String str = ((UserInput.SignIn) userInput).f43024a;
                ft.x xVar = ft.x.f56068b;
                String strB = this.f55854b.b();
                sVar2.f55828v = 1;
                objK = k(str, xVar, true, strB, sVar2);
            } else {
                if (!(userInput instanceof UserInput.SignUp)) {
                    throw new NoWhenBranchMatchedException();
                }
                UserInput.SignUp signUp = (UserInput.SignUp) userInput;
                String str2 = signUp.f43025a;
                String str3 = signUp.f43027c;
                String str4 = signUp.f43030f;
                String str5 = signUp.f43026b;
                String str6 = signUp.f43028d;
                rs.b0 b0Var = signUp.f43029e;
                sVar2.f55828v = 2;
                Object objV = v(str2, str5, str3, str4, str6, b0Var, sVar2);
                if (objV != obj2) {
                    return objV;
                }
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        objK = ((Result) obj).f71688a;
        int i12 = Result.f71687b;
        if (objK instanceof Result.Failure) {
            return objK;
        }
        try {
            LinkAccount linkAccount = (LinkAccount) objK;
            if (linkAccount != null) {
                return linkAccount;
            }
            throw new IllegalArgumentException("Error fetching user account");
        } catch (Throwable th2) {
            int i13 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0076, code lost:
    
        if (r0 == r1) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object u(String str, String str2, String str3, String str4, String str5, rs.b0 b0Var, ContinuationImpl continuationImpl) {
        t tVar;
        Object objG;
        y yVar;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f55832w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f55832w = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        t tVar2 = tVar;
        Object objP = tVar2.f55830u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar2.f55832w;
        try {
            if (i11 == 0) {
                ResultKt.b(objP);
                tVar2.f55829t = this;
                tVar2.f55832w = 1;
                objG = ((f0) this.f55859g).g(str, str2, str3, str4, str5, b0Var, tVar2);
                if (objG != coroutineSingletons) {
                    yVar = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objP);
                LinkAccount linkAccount = (LinkAccount) objP;
                int i12 = Result.f71687b;
                return linkAccount;
            }
            yVar = tVar2.f55829t;
            ResultKt.b(objP);
            objG = ((Result) objP).f71688a;
            int i13 = Result.f71687b;
            if (objG instanceof Result.Failure) {
                return objG;
            }
            ConsumerSessionSignup consumerSessionSignup = (ConsumerSessionSignup) objG;
            ConsumerSession consumerSession = consumerSessionSignup.f43351a;
            String str6 = consumerSessionSignup.f43352b;
            tVar2.f55829t = null;
            tVar2.f55832w = 2;
            objP = p(yVar, consumerSession, str6, tVar2, 12);
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            return ResultKt.a(th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object v(String str, String str2, String str3, String str4, String str5, rs.b0 b0Var, ContinuationImpl continuationImpl) {
        u uVar;
        String str6;
        rs.b0 b0Var2;
        String str7;
        String str8;
        String str9;
        String str10;
        String str11;
        String str12;
        y yVar;
        Object objU;
        y yVar2;
        Throwable thA;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.D;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.D = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuationImpl);
            }
        }
        u uVar2 = uVar;
        Object objF = uVar2.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar2.D;
        if (i11 == 0) {
            ResultKt.b(objF);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null || (str6 = linkAccount.f43016h) == null) {
                str6 = this.f55854b.f42900f.f42922b;
            }
            uVar2.f55833t = this;
            uVar2.f55834u = str;
            uVar2.f55835v = str2;
            uVar2.f55836w = str3;
            uVar2.f55837x = str4;
            uVar2.f55838y = str5;
            b0Var2 = b0Var;
            uVar2.f55839z = b0Var2;
            uVar2.A = str6;
            uVar2.D = 1;
            objF = f(linkAccount, true, uVar2);
            if (objF != coroutineSingletons) {
                str7 = str2;
                str8 = str3;
                str9 = str4;
                str10 = str5;
                str11 = str;
                str12 = str6;
                yVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar2 = uVar2.f55833t;
            ResultKt.b(objF);
            objU = ((Result) objF).f71688a;
            int i12 = Result.f71687b;
            if (!(objU instanceof Result.Failure)) {
                yVar2.f55856d.d();
            }
            thA = Result.a(objU);
            if (thA != null) {
                yVar2.f55856d.e(thA);
            }
            return objU;
        }
        str12 = uVar2.A;
        rs.b0 b0Var3 = uVar2.f55839z;
        String str13 = uVar2.f55838y;
        String str14 = uVar2.f55837x;
        String str15 = uVar2.f55836w;
        String str16 = uVar2.f55835v;
        str11 = uVar2.f55834u;
        y yVar3 = uVar2.f55833t;
        ResultKt.b(objF);
        b0Var2 = b0Var3;
        yVar = yVar3;
        str10 = str13;
        str7 = str16;
        str9 = str14;
        str8 = str15;
        ls.f fVar = (ls.f) objF;
        if (fVar instanceof ls.e) {
            yVar.f55856d.c(gs.h.f57784b);
            int i13 = Result.f71687b;
            return ResultKt.a(new AlreadyLoggedInLinkException(str12, fVar));
        }
        if ((fVar instanceof ls.b) || Intrinsics.b(fVar, ls.d.f75090a)) {
            yVar.f55856d.c(gs.h.f57783a);
            int i14 = Result.f71687b;
            return ResultKt.a(new AlreadyLoggedInLinkException(str12, fVar));
        }
        if (!Intrinsics.b(fVar, ls.c.f75089a) && !(fVar instanceof ls.a)) {
            throw new NoWhenBranchMatchedException();
        }
        uVar2.f55833t = yVar;
        uVar2.f55834u = null;
        uVar2.f55835v = null;
        uVar2.f55836w = null;
        uVar2.f55837x = null;
        uVar2.f55838y = null;
        uVar2.f55839z = null;
        uVar2.A = null;
        uVar2.D = 2;
        objU = yVar.u(str11, str7, str8, str9, str10, b0Var2, uVar2);
        if (objU != coroutineSingletons) {
            yVar2 = yVar;
            int i122 = Result.f71687b;
            if (!(objU instanceof Result.Failure)) {
            }
            thA = Result.a(objU);
            if (thA != null) {
            }
            return objU;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0092, code lost:
    
        if (r9 == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object w(boolean z11, ContinuationImpl continuationImpl) {
        w wVar;
        Object objT;
        y yVar;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f55847w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f55847w = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuationImpl);
            }
        }
        Object objP = wVar.f55845u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f55847w;
        if (i11 == 0) {
            ResultKt.b(objP);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new NoLinkAccountFoundException());
            }
            this.f55856d.a(gs.d.f57779s, null);
            String str = linkAccount.f43015g;
            wVar.f55844t = this;
            wVar.f55847w = 1;
            objT = ((ms.x) this.f55855c).t(str, wVar, z11);
            if (objT != coroutineSingletons) {
                yVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
            LinkAccount linkAccount2 = (LinkAccount) objP;
            int i13 = Result.f71687b;
            return linkAccount2;
        }
        yVar = wVar.f55844t;
        ResultKt.b(objP);
        objT = ((Result) objP).f71688a;
        if (Result.a(objT) != null) {
            yVar.f55856d.a(gs.d.f57780t, null);
        }
        if (objT instanceof Result.Failure) {
            return objT;
        }
        wVar.f55844t = null;
        wVar.f55847w = 2;
        objP = p(yVar, (ConsumerSession) objT, null, wVar, 14);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object x(ConsumerPaymentDetailsUpdateParams consumerPaymentDetailsUpdateParams, String str, ContinuationImpl continuationImpl) {
        x xVar;
        y yVar;
        Object obj;
        LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetailsE;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f55852x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f55852x = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object obj2 = xVar.f55850v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f55852x;
        if (i11 == 0) {
            ResultKt.b(obj2);
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) this.f55853a.f55777b.f93973a.getValue()).f42864a;
            if (linkAccount == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new NoLinkAccountFoundException());
            }
            String str2 = linkAccount.f43015g;
            xVar.f55848t = this;
            xVar.f55849u = str;
            xVar.f55852x = 1;
            Object objU = ((ms.x) this.f55855c).u(consumerPaymentDetailsUpdateParams, str2, xVar);
            if (objU == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
            obj = objU;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = xVar.f55849u;
            yVar = xVar.f55848t;
            ResultKt.b(obj2);
            obj = ((Result) obj2).f71688a;
        }
        int i13 = Result.f71687b;
        boolean z11 = obj instanceof Result.Failure;
        Object obj3 = obj;
        if (!z11) {
            ConsumerPaymentDetails consumerPaymentDetails = (ConsumerPaymentDetails) obj;
            i2 i2Var = yVar.f55860h;
            com.stripe.android.link.a aVar = (com.stripe.android.link.a) i2Var.getValue();
            com.stripe.android.link.a aVar2 = null;
            if (aVar != null) {
                ConsumerPaymentDetails.PaymentDetails updatedPayment = (ConsumerPaymentDetails.PaymentDetails) b70.g.W0(consumerPaymentDetails.f43270a);
                Intrinsics.g(updatedPayment, "updatedPayment");
                ArrayList<LinkPaymentMethod.ConsumerPaymentDetails> arrayList = aVar.f42962a;
                ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                for (LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails2 : arrayList) {
                    ConsumerPaymentDetails.PaymentDetails paymentDetails = consumerPaymentDetails2.f42942b;
                    String str3 = consumerPaymentDetails2.f42944d;
                    if (Intrinsics.b(paymentDetails.getF43297c(), updatedPayment.getF43297c())) {
                        if (str != null) {
                            str3 = str;
                        }
                        consumerPaymentDetailsE = LinkPaymentMethod.ConsumerPaymentDetails.e(consumerPaymentDetails2, updatedPayment, str3, 2);
                    } else {
                        if (str3 == null) {
                            str3 = str;
                        }
                        consumerPaymentDetailsE = LinkPaymentMethod.ConsumerPaymentDetails.e(consumerPaymentDetails2, null, str3, 3);
                    }
                    arrayList2.add(consumerPaymentDetailsE);
                }
                aVar2 = new com.stripe.android.link.a(arrayList2);
            }
            i2Var.j(aVar2);
            obj3 = consumerPaymentDetails;
        }
        return obj3;
    }
}
