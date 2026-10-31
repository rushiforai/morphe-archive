package ads_mobile_sdk;

import b.a6;
import b.c0;
import b.f8;
import b.h7;
import b.s0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Optional;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ni.w;
import t70.m0;

/* loaded from: classes2.dex */
public final class qe3 extends e2 {

    /* renamed from: l, reason: collision with root package name */
    public final s0 f8609l;

    /* renamed from: m, reason: collision with root package name */
    public final s0 f8610m;
    public final Optional n;
    public final a6 o;

    /* renamed from: p, reason: collision with root package name */
    public final kh0 f8611p;

    /* renamed from: q, reason: collision with root package name */
    public final t70.j0 f8612q;

    /* renamed from: r, reason: collision with root package name */
    public final sb f8613r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qe3(s0 adapterWrapper, s0 rtbAdapterWrapper, Optional oldAdapterWrapper, a6 mediationAdapterProxyFactory, kh0 delegatingThirdPartyEventEmitter, t70.j0 uiScope, sb adapterInitializer, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, eg2 placementIdWrapper) {
        super(traceMetaSet, baseRequest, requestType, j11, i5, adConfiguration, commonConfiguration, serverTransaction, renderId, placementIdWrapper);
        Intrinsics.g(adapterWrapper, "adapterWrapper");
        Intrinsics.g(rtbAdapterWrapper, "rtbAdapterWrapper");
        Intrinsics.g(oldAdapterWrapper, "oldAdapterWrapper");
        Intrinsics.g(mediationAdapterProxyFactory, "mediationAdapterProxyFactory");
        Intrinsics.g(delegatingThirdPartyEventEmitter, "delegatingThirdPartyEventEmitter");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(adapterInitializer, "adapterInitializer");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(renderId, "renderId");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        this.f8609l = adapterWrapper;
        this.f8610m = rtbAdapterWrapper;
        this.n = oldAdapterWrapper;
        this.o = mediationAdapterProxyFactory;
        this.f8611p = delegatingThirdPartyEventEmitter;
        this.f8612q = uiScope;
        this.f8613r = adapterInitializer;
    }

    /* JADX WARN: Path cross not found for [B:23:0x0075, B:26:0x0088], limit reached: 31 */
    /* JADX WARN: Removed duplicated region for block: B:17:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x006a -> B:21:0x006d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ArrayList arrayList, boolean z11, ContinuationImpl continuationImpl) {
        me3 me3Var;
        qe3 qe3Var;
        Iterator it;
        b.a1 tu0Var;
        b.kb kbVarA;
        if (continuationImpl instanceof me3) {
            me3Var = (me3) continuationImpl;
            int i5 = me3Var.f7193h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                me3Var.f7193h = i5 - Integer.MIN_VALUE;
            } else {
                me3Var = new me3(this, continuationImpl);
            }
        }
        Object objA = me3Var.f7191f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = me3Var.f7193h;
        if (i11 == 0) {
            ResultKt.b(objA);
            qe3Var = this;
            it = arrayList.iterator();
            tu0Var = null;
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            boolean z12 = me3Var.f7190e;
            String str = me3Var.f7189d;
            it = me3Var.f7188c;
            tu0Var = me3Var.f7187b;
            qe3Var = me3Var.f7186a;
            ResultKt.b(objA);
            if (((Boolean) objA).booleanValue() && tu0Var == null) {
                tu0Var = new tu0(c0.l("The adapter requested for this mediation element (", str, ") is not eligible because it was excluded by AdRequest.skipUninitializedAdapters and has not yet successfully initialized."), wd1.f11220h);
            } else {
                qe3Var.getClass();
                kbVarA = a6.a(qe3Var.o, str, z12, qe3Var.f2708c, 4);
                if (kbVarA != null) {
                    return new xu0(kbVarA);
                }
            }
            z11 = z12;
            if (it.hasNext()) {
                String str2 = (String) it.next();
                sb sbVar = qe3Var.f8613r;
                ni.q qVar = qe3Var.f2707b;
                me3Var.f7186a = qe3Var;
                me3Var.f7187b = tu0Var;
                me3Var.f7188c = it;
                me3Var.f7189d = str2;
                me3Var.f7190e = z11;
                me3Var.f7193h = 1;
                sbVar.getClass();
                objA = sb.a(sbVar, qVar, str2, me3Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                boolean z13 = z11;
                str = str2;
                z12 = z13;
                if (((Boolean) objA).booleanValue()) {
                }
                qe3Var.getClass();
                kbVarA = a6.a(qe3Var.o, str, z12, qe3Var.f2708c, 4);
                if (kbVarA != null) {
                }
                z11 = z12;
                if (it.hasNext()) {
                    return tu0Var;
                }
            }
        }
    }

    @Override // b.b
    public final boolean b() {
        return !this.f2711f.f12369b.isEmpty();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b.kb kbVar, ContinuationImpl continuationImpl) {
        oe3 oe3Var;
        qe3 qe3Var;
        b.kb kbVar2;
        b.kb kbVar3;
        qe3 qe3Var2;
        b.a1 tu0Var;
        if (continuationImpl instanceof oe3) {
            oe3Var = (oe3) continuationImpl;
            int i5 = oe3Var.f7886e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oe3Var.f7886e = i5 - Integer.MIN_VALUE;
            } else {
                oe3Var = new oe3(this, continuationImpl);
            }
        }
        Object objS = oe3Var.f7884c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oe3Var.f7886e;
        if (i11 == 0) {
            ResultKt.b(objS);
            oe3Var.f7882a = this;
            oe3Var.f7883b = kbVar;
            oe3Var.f7886e = 1;
            if ((kbVar instanceof e52) && !this.n.isPresent()) {
                objS = new tu0("oldAdapterWrapper is empty for OldMediationAdapterProxy", wd1.f11213a);
                qe3Var = this;
                kbVar2 = kbVar;
            } else {
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(oe3Var));
                mVar.t();
                qe3Var = this;
                kbVar2 = kbVar;
                b10.k kVar = new b10.k(kbVar2, qe3Var, mVar, (Continuation) null, 4);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                t70.j0 j0Var = qe3Var.f8612q;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(kVar, null), 2);
                objS = mVar.s();
            }
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
            kbVar3 = kbVar2;
            qe3Var2 = qe3Var;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            kbVar3 = oe3Var.f7883b;
            qe3Var2 = oe3Var.f7882a;
            ResultKt.b(objS);
        }
        b.a1 a1Var = (b.a1) objS;
        if (a1Var instanceof pu0) {
            return a1Var;
        }
        if (a1Var instanceof xu0) {
            qe3Var2.getClass();
            s0 s0Var = qe3Var2.f8610m;
            s0 s0Var2 = qe3Var2.f8609l;
            Optional optional = qe3Var2.n;
            z1 z1Var = qe3Var2.f2711f;
            d33 d33Var = qe3Var2.f2713h;
            boolean z11 = kbVar3 instanceof ko1;
            if (z11) {
                tu0Var = new xu0(s0Var2.a(d33Var, z1Var, kbVar3));
            } else if (kbVar3 instanceof b03) {
                tu0Var = new xu0(s0Var.a(d33Var, z1Var, kbVar3));
            } else if (kbVar3 instanceof e52) {
                if (optional.isPresent()) {
                    tu0Var = new xu0(((s0) optional.get()).a(d33Var, z1Var, kbVar3));
                } else {
                    tu0Var = new tu0("OldAdapterWrapper is empty, unable to wrap " + kbVar3 + ".");
                }
            } else {
                throw new NoWhenBranchMatchedException();
            }
            if (tu0Var instanceof pu0) {
                return (pu0) tu0Var;
            }
            boolean z12 = kbVar3 instanceof b03;
            f8 f8Var = (f8) qe3Var2.a((h7) ((xu0) tu0Var).f11834b, z12).a();
            kh0 kh0Var = qe3Var2.f8611p;
            of3 thirdPartyEventEmitter = f8Var.f();
            kh0Var.getClass();
            Intrinsics.g(thirdPartyEventEmitter, "thirdPartyEventEmitter");
            kh0Var.f5738a.setValue(kh0Var, kh0.f5737b[0], thirdPartyEventEmitter);
            if (z11) {
                s0Var2.a(f8Var);
            } else if (z12) {
                s0Var.a(f8Var);
            } else if ((kbVar3 instanceof e52) && optional.isPresent()) {
                ((s0) optional.get()).a(f8Var);
            }
            return new xu0(f8Var.a());
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0069, code lost:
    
        if (r7 == r1) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.e2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        pe3 pe3Var;
        qe3 qe3Var;
        if (continuation instanceof pe3) {
            pe3Var = (pe3) continuation;
            int i5 = pe3Var.f8246d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pe3Var.f8246d = i5 - Integer.MIN_VALUE;
            } else {
                pe3Var = new pe3(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = pe3Var.f8244b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pe3Var.f8246d;
        if (i11 == 0) {
            ResultKt.b(objA);
            ArrayList arrayList = this.f2711f.f12369b;
            pe3Var.f8243a = this;
            pe3Var.f8246d = 1;
            objA = a(arrayList, z11, pe3Var);
            if (objA != coroutineSingletons) {
                qe3Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            b.a1 a1Var = (b.a1) objA;
            if (a1Var instanceof pu0) {
                return a1Var;
            }
            if (a1Var instanceof xu0) {
                return new xu0(new n8.q(a1Var, 3));
            }
            throw new NoWhenBranchMatchedException();
        }
        qe3Var = pe3Var.f8243a;
        ResultKt.b(objA);
        b.a1 a1Var2 = (b.a1) objA;
        if (a1Var2 != null) {
            if (a1Var2 instanceof pu0) {
                return (pu0) a1Var2;
            }
            b.kb kbVar = (b.kb) ((xu0) a1Var2).f11834b;
            if (kbVar != null) {
                pe3Var.f8243a = null;
                pe3Var.f8246d = 2;
                objA = qe3Var.a(kbVar, pe3Var);
            }
        }
        ni.u uVar = ni.u.f78326b;
        return new su0(new w(7, "Unable to instantiate any mediation adapter class: " + qe3Var.f2711f.f12369b + ".", "undefined"));
    }
}
