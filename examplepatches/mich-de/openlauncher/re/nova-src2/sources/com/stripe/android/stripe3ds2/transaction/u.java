package com.stripe.android.stripe3ds2.transaction;

import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestExecutor$Config;
import com.stripe.android.stripe3ds2.transaction.ChallengeRequestResult;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import com.stripe.android.stripe3ds2.transaction.InitChallengeResult;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.views.ChallengeViewArgs;
import java.security.interfaces.ECPublicKey;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ps.f0;
import t5.d0;
import t70.y0;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final SdkTransactionId f45139a;

    /* renamed from: b, reason: collision with root package name */
    public final wv.f f45140b;

    /* renamed from: c, reason: collision with root package name */
    public final uv.c f45141c;

    /* renamed from: d, reason: collision with root package name */
    public final d0 f45142d;

    /* renamed from: e, reason: collision with root package name */
    public final nx.l f45143e;

    /* renamed from: f, reason: collision with root package name */
    public final d0 f45144f;

    /* renamed from: g, reason: collision with root package name */
    public final StripeUiCustomization f45145g;

    /* renamed from: h, reason: collision with root package name */
    public final tv.c f45146h;

    /* renamed from: i, reason: collision with root package name */
    public final f0 f45147i;

    public u(SdkTransactionId sdkTransactionId, wv.l lVar, wv.f fVar, uv.c cVar, d0 d0Var, nx.l lVar2, d0 d0Var2, StripeUiCustomization uiCustomization, tv.c cVar2, f0 f0Var) {
        Intrinsics.g(sdkTransactionId, "sdkTransactionId");
        Intrinsics.g(uiCustomization, "uiCustomization");
        this.f45139a = sdkTransactionId;
        this.f45140b = fVar;
        this.f45141c = cVar;
        this.f45142d = d0Var;
        this.f45143e = lVar2;
        this.f45144f = d0Var2;
        this.f45145g = uiCustomization;
        this.f45146h = cVar2;
        this.f45147i = f0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00fd A[Catch: all -> 0x011e, TryCatch #2 {all -> 0x011e, blocks: (B:30:0x00f7, B:32:0x00fd, B:47:0x0175, B:35:0x0121, B:37:0x0125, B:39:0x0130, B:40:0x0138, B:41:0x0149, B:43:0x014d, B:44:0x0161, B:46:0x0165, B:48:0x0178, B:49:0x017d), top: B:68:0x00f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0121 A[Catch: all -> 0x011e, TryCatch #2 {all -> 0x011e, blocks: (B:30:0x00f7, B:32:0x00fd, B:47:0x0175, B:35:0x0121, B:37:0x0125, B:39:0x0130, B:40:0x0138, B:41:0x0149, B:43:0x014d, B:44:0x0161, B:46:0x0165, B:48:0x0178, B:49:0x017d), top: B:68:0x00f7 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(InitChallengeArgs initChallengeArgs, ContinuationImpl continuationImpl) {
        wv.e eVar;
        u uVar;
        u uVar2;
        wv.n nVar;
        ChallengeRequestExecutor$Config challengeRequestExecutor$Config;
        Object objA;
        Throwable thA;
        ChallengeRequestResult challengeRequestResult;
        InitChallengeArgs initChallengeArgs2 = initChallengeArgs;
        if (continuationImpl instanceof wv.e) {
            eVar = (wv.e) continuationImpl;
            int i5 = eVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.A = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new wv.e(this, continuationImpl);
            }
        }
        Object objB = eVar.f94715y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.A;
        if (i11 == 0) {
            ResultKt.b(objB);
            this.f45147i.u();
            try {
                int i12 = Result.f71687b;
                d0 d0Var = this.f45142d;
                wv.f fVar = this.f45140b;
                String str = initChallengeArgs2.f45108c.f45073d;
                if (str == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                AcsData acsDataF = d0Var.F(fVar.a(str));
                String acsUrl = acsDataF.f45055a;
                ECPublicKey eCPublicKey = acsDataF.f45056b;
                SdkTransactionId sdkTransactionId = this.f45139a;
                ChallengeParameters challengeParameters = initChallengeArgs2.f45108c;
                String str2 = challengeParameters.f45071b;
                if (str2 == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                String str3 = challengeParameters.f45070a;
                if (str3 == null) {
                    throw new IllegalArgumentException("Required value was null.");
                }
                ChallengeRequestData challengeRequestData = new ChallengeRequestData("2.2.0", str3, str2, sdkTransactionId, challengeParameters.f45074e, null, 4064);
                d0 d0Var2 = this.f45144f;
                tv.c cVar = this.f45146h;
                Intrinsics.g(acsUrl, "acsUrl");
                vk.j jVar = new vk.j(acsUrl, cVar, (CoroutineContext) d0Var2.f88562b);
                a80.e eVar2 = y0.f88884a;
                wv.n nVar2 = new wv.n(jVar, cVar, a80.d.f488c);
                uv.c cVar2 = this.f45141c;
                String str4 = initChallengeArgs2.f45106a;
                byte[] encoded = initChallengeArgs2.f45107b.getPrivate().getEncoded();
                Intrinsics.f(encoded, "getEncoded(...)");
                byte[] encoded2 = eCPublicKey.getEncoded();
                Intrinsics.f(encoded2, "getEncoded(...)");
                ChallengeRequestExecutor$Config challengeRequestExecutor$Config2 = new ChallengeRequestExecutor$Config(cVar2, str4, challengeRequestData, acsUrl, new ChallengeRequestExecutor$Config.Keys(encoded, encoded2));
                nx.l lVar = this.f45143e;
                eVar.f94710t = this;
                eVar.f94711u = initChallengeArgs2;
                eVar.f94712v = this;
                eVar.f94713w = nVar2;
                eVar.f94714x = challengeRequestExecutor$Config2;
                eVar.A = 1;
                objB = new y(challengeRequestExecutor$Config2).a((tv.c) lVar.f78644a, (CoroutineContext) lVar.f78645b).b(challengeRequestData, eVar);
                if (objB == coroutineSingletons) {
                    return coroutineSingletons;
                }
                uVar = this;
                uVar2 = uVar;
                nVar = nVar2;
                challengeRequestExecutor$Config = challengeRequestExecutor$Config2;
                challengeRequestResult = (ChallengeRequestResult) objB;
                if (!(challengeRequestResult instanceof ChallengeRequestResult.Success)) {
                }
                int i13 = Result.f71687b;
            } catch (Throwable th2) {
                th = th2;
                uVar = this;
                int i14 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ChallengeRequestExecutor$Config challengeRequestExecutor$Config3 = eVar.f94714x;
            nVar = eVar.f94713w;
            uVar2 = eVar.f94712v;
            InitChallengeArgs initChallengeArgs3 = eVar.f94711u;
            uVar = eVar.f94710t;
            try {
                ResultKt.b(objB);
                challengeRequestExecutor$Config = challengeRequestExecutor$Config3;
                initChallengeArgs2 = initChallengeArgs3;
            } catch (Throwable th3) {
                th = th3;
                initChallengeArgs2 = initChallengeArgs3;
                int i142 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
            }
            try {
                challengeRequestResult = (ChallengeRequestResult) objB;
                if (!(challengeRequestResult instanceof ChallengeRequestResult.Success)) {
                    objA = new InitChallengeResult.Start(new ChallengeViewArgs(((ChallengeRequestResult.Success) challengeRequestResult).f45085b, ((ChallengeRequestResult.Success) challengeRequestResult).f45084a, uVar2.f45145g, challengeRequestExecutor$Config, new y(challengeRequestExecutor$Config), initChallengeArgs2.f45109d, initChallengeArgs2.f45110e));
                } else if (challengeRequestResult instanceof ChallengeRequestResult.ProtocolError) {
                    if (((ChallengeRequestResult.ProtocolError) challengeRequestResult).f45082a.f45202e == xv.b.f96419c) {
                        nVar.a(((ChallengeRequestResult.ProtocolError) challengeRequestResult).f45082a);
                    }
                    objA = new InitChallengeResult.End(new ChallengeResult.ProtocolError(((ChallengeRequestResult.ProtocolError) challengeRequestResult).f45082a, null, initChallengeArgs2.f45110e));
                } else if (challengeRequestResult instanceof ChallengeRequestResult.Timeout) {
                    nVar.a(((ChallengeRequestResult.Timeout) challengeRequestResult).f45087a);
                    objA = new InitChallengeResult.End(new ChallengeResult.Timeout(null, null, initChallengeArgs2.f45110e));
                } else {
                    if (!(challengeRequestResult instanceof ChallengeRequestResult.RuntimeError)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    objA = new InitChallengeResult.End(new ChallengeResult.RuntimeError(((ChallengeRequestResult.RuntimeError) challengeRequestResult).f45083a, null, initChallengeArgs2.f45110e));
                }
                int i132 = Result.f71687b;
            } catch (Throwable th4) {
                th = th4;
                int i1422 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
            }
        }
        thA = Result.a(objA);
        if (thA != null) {
            return objA;
        }
        uVar.f45146h.c(thA);
        uVar.f45147i.l("Exception during initial challenge request.", thA);
        return new InitChallengeResult.End(new ChallengeResult.RuntimeError(thA, null, initChallengeArgs2.f45110e));
    }
}
