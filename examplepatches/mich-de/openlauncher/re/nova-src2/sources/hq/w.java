package hq;

import com.stripe.android.cards.Bin;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.AccountRange;
import com.stripe.android.model.CardMetadata;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.y0;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class w implements e {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f60031a;

    /* renamed from: b, reason: collision with root package name */
    public final ApiRequest$Options f60032b;

    /* renamed from: c, reason: collision with root package name */
    public final t f60033c;

    /* renamed from: d, reason: collision with root package name */
    public final fr.l f60034d;

    /* renamed from: e, reason: collision with root package name */
    public final jt.a f60035e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f60036f;

    /* renamed from: g, reason: collision with root package name */
    public final o1 f60037g;

    public w(z0 z0Var, ApiRequest$Options apiRequest$Options, t tVar, fr.l lVar, jt.a aVar) {
        this.f60031a = z0Var;
        this.f60032b = apiRequest$Options;
        this.f60033c = tVar;
        this.f60034d = lVar;
        this.f60035e = aVar;
        i2 i2VarC = u1.c(Boolean.FALSE);
        this.f60036f = i2VarC;
        this.f60037g = new o1(i2VarC);
    }

    @Override // hq.e
    public final o1 b() {
        return this.f60037g;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // hq.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(f fVar, Continuation continuation) {
        u uVar;
        Bin bin;
        w wVar;
        w wVar2;
        u uVar2;
        f fVar2;
        u uVar3;
        Object obj;
        Bin bin2;
        w wVar3;
        u70.d dVar;
        v vVar;
        Object obj2;
        Bin bin3;
        f fVar3;
        w wVar4;
        boolean z11;
        f fVar4 = fVar;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i5 = uVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.A = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, (ContinuationImpl) continuation);
            }
        }
        Object obj3 = uVar.f60027y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.A;
        if (i11 == 0) {
            ResultKt.b(obj3);
            bin = fVar4.f59967g;
            if (bin == null) {
                return null;
            }
            a80.e eVar = y0.f88884a;
            u70.d dVar2 = y70.o.f96819a;
            v vVar2 = new v(this, null, 0);
            uVar.f60022t = this;
            uVar.f60023u = fVar4;
            uVar.f60024v = bin;
            uVar.f60025w = this;
            uVar.f60026x = uVar;
            uVar.A = 1;
            if (m0.y(dVar2, vVar2, uVar) != coroutineSingletons) {
                wVar = this;
                wVar2 = wVar;
                uVar2 = uVar;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                obj2 = uVar.f60025w;
                bin3 = uVar.f60024v;
                fVar3 = uVar.f60023u;
                wVar4 = uVar.f60022t;
                ResultKt.b(obj3);
                int i12 = Result.f71687b;
                z11 = obj2 instanceof Result.Failure;
                if (!z11) {
                    List accountRanges = (List) obj2;
                    t tVar = wVar4.f60033c;
                    Intrinsics.g(bin3, "bin");
                    Intrinsics.g(accountRanges, "accountRanges");
                    tVar.f60021a.put(bin3, accountRanges);
                    if (!accountRanges.isEmpty()) {
                        List list = accountRanges;
                        if (!(list instanceof Collection) || !list.isEmpty()) {
                            Iterator it = list.iterator();
                            while (it.hasNext()) {
                                if (((AccountRange) it.next()).f43122a.a(fVar3)) {
                                    break;
                                }
                            }
                            if (fVar3.f59968h) {
                                wVar4.f60034d.a(jt.a.c(wVar4.f60035e, PaymentAnalyticsEvent.T, null, null, null, null, 62));
                            }
                        } else if (fVar3.f59968h) {
                        }
                    }
                }
                return (List) (z11 ? null : obj2);
            }
            uVar3 = uVar.f60026x;
            wVar = (w) uVar.f60025w;
            bin2 = uVar.f60024v;
            fVar2 = uVar.f60023u;
            wVar3 = uVar.f60022t;
            ResultKt.b(obj3);
            obj = ((Result) obj3).f71688a;
            int i13 = Result.f71687b;
            if (!(obj instanceof Result.Failure)) {
                obj = ((CardMetadata) obj).f43175b;
            }
            a80.e eVar2 = y0.f88884a;
            dVar = y70.o.f96819a;
            vVar = new v(wVar, null, 1);
            uVar.f60022t = wVar3;
            uVar.f60023u = fVar2;
            uVar.f60024v = bin2;
            uVar.f60025w = obj;
            uVar.f60026x = null;
            uVar.A = 3;
            if (m0.y(dVar, vVar, uVar3) != coroutineSingletons) {
                obj2 = obj;
                bin3 = bin2;
                fVar3 = fVar2;
                wVar4 = wVar3;
                int i122 = Result.f71687b;
                z11 = obj2 instanceof Result.Failure;
                if (!z11) {
                }
                return (List) (z11 ? null : obj2);
            }
            return coroutineSingletons;
        }
        u uVar4 = uVar.f60026x;
        wVar = (w) uVar.f60025w;
        bin = uVar.f60024v;
        f fVar5 = uVar.f60023u;
        wVar2 = uVar.f60022t;
        ResultKt.b(obj3);
        uVar2 = uVar4;
        fVar4 = fVar5;
        z0 z0Var = wVar2.f60031a;
        ApiRequest$Options apiRequest$Options = wVar2.f60032b;
        uVar.f60022t = wVar2;
        uVar.f60023u = fVar4;
        uVar.f60024v = bin;
        uVar.f60025w = wVar;
        uVar.f60026x = uVar2;
        uVar.A = 2;
        Object objY = z0Var.y(bin, apiRequest$Options, uVar);
        if (objY != coroutineSingletons) {
            Bin bin4 = bin;
            fVar2 = fVar4;
            uVar3 = uVar2;
            obj = objY;
            bin2 = bin4;
            wVar3 = wVar2;
            int i132 = Result.f71687b;
            if (!(obj instanceof Result.Failure)) {
            }
            a80.e eVar22 = y0.f88884a;
            dVar = y70.o.f96819a;
            vVar = new v(wVar, null, 1);
            uVar.f60022t = wVar3;
            uVar.f60023u = fVar2;
            uVar.f60024v = bin2;
            uVar.f60025w = obj;
            uVar.f60026x = null;
            uVar.A = 3;
            if (m0.y(dVar, vVar, uVar3) != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
