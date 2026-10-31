package com.stripe.android.stripe3ds2.transaction;

import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.util.Arrays;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import org.json.JSONException;
import org.json.JSONObject;
import t70.p2;

/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: g, reason: collision with root package name */
    public static final long f45119g = TimeUnit.SECONDS.toMillis(10);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f45120h = 0;

    /* renamed from: a, reason: collision with root package name */
    public final uv.e f45121a;

    /* renamed from: b, reason: collision with root package name */
    public final tv.d f45122b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f45123c;

    /* renamed from: d, reason: collision with root package name */
    public final vk.j f45124d;

    /* renamed from: e, reason: collision with root package name */
    public final SecretKey f45125e;

    /* renamed from: f, reason: collision with root package name */
    public final n f45126f;

    public a0(uv.e messageTransformer, String sdkReferenceId, ECPrivateKey eCPrivateKey, ECPublicKey eCPublicKey, String acsUrl, tv.d errorReporter, uv.f fVar, CoroutineContext workContext, ChallengeRequestExecutor$Config creqExecutorConfig) {
        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
        Intrinsics.g(messageTransformer, "messageTransformer");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(creqExecutorConfig, "creqExecutorConfig");
        Intrinsics.g(sdkReferenceId, "sdkReferenceId");
        Intrinsics.g(acsUrl, "acsUrl");
        Intrinsics.g(workContext, "workContext");
        this.f45121a = messageTransformer;
        this.f45122b = errorReporter;
        this.f45123c = workContext;
        this.f45124d = jVar;
        SecretKey secretKeyA = fVar.a(eCPublicKey, eCPrivateKey, sdkReferenceId);
        this.f45125e = secretKeyA;
        this.f45126f = new n(messageTransformer, secretKeyA, errorReporter, creqExecutorConfig);
    }

    public static final String a(a0 a0Var, JSONObject jSONObject) throws JSONException {
        uv.e eVar = a0Var.f45121a;
        SecretKey secretKey = a0Var.f45125e;
        uv.c cVar = (uv.c) eVar;
        cVar.getClass();
        Intrinsics.g(secretKey, "secretKey");
        String string = jSONObject.getString("acsTransID");
        Intrinsics.f(string, "getString(...)");
        uo.i iVar = uo.i.f91446k;
        uo.f fVar = uv.c.f91568d;
        if (iVar.f91409a.equals(uo.a.f91408b.f91409a)) {
            throw new IllegalArgumentException("The JWE algorithm \"alg\" cannot be \"none\"");
        }
        Objects.requireNonNull(fVar);
        uo.k kVar = new uo.k(iVar, fVar, null, null, null, null, null, null, null, null, null, string, null, null, null, null, null, 0, null, null, null, null, null, null, null, null);
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        jSONObject.put("sdkCounterStoA", String.format(Locale.ROOT, "%03d", Arrays.copyOf(new Object[]{Byte.valueOf(cVar.f91570b)}, 1)));
        uo.l lVar = new uo.l(kVar, new uo.r(jSONObject.toString()));
        uo.f fVar2 = kVar.o;
        Intrinsics.f(fVar2, "getEncryptionMethod(...)");
        byte[] encoded = secretKey.getEncoded();
        uo.f fVar3 = uo.f.f91431i;
        if (fVar3 == fVar2) {
            encoded = Arrays.copyOfRange(encoded, 0, fVar3.f91435c / 8);
            Intrinsics.d(encoded);
        } else {
            Intrinsics.d(encoded);
        }
        lVar.b(new uv.h(new SecretKeySpec(encoded, "AES")));
        byte b11 = (byte) (cVar.f91570b + 1);
        cVar.f91570b = b11;
        if (b11 == 0) {
            throw new IllegalArgumentException("SDK to ACS counter is zero");
        }
        String strD = lVar.d();
        Intrinsics.f(strD, "serialize(...)");
        return strD;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ChallengeRequestData challengeRequestData, ContinuationImpl continuationImpl) {
        wv.m mVar;
        if (continuationImpl instanceof wv.m) {
            mVar = (wv.m) continuationImpl;
            int i5 = mVar.f94738w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f94738w = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new wv.m(this, continuationImpl);
            }
        }
        Object objD = mVar.f94736u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f94738w;
        if (i11 == 0) {
            ResultKt.b(objD);
            z zVar = new z(this, challengeRequestData, null);
            mVar.f94735t = challengeRequestData;
            mVar.f94738w = 1;
            objD = p2.d(f45119g, zVar, mVar);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            challengeRequestData = mVar.f94735t;
            ResultKt.b(objD);
        }
        ChallengeRequestResult challengeRequestResult = (ChallengeRequestResult) objD;
        return challengeRequestResult == null ? x.a(challengeRequestData) : challengeRequestResult;
    }
}
