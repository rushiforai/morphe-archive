package e00;

import android.content.Context;
import android.os.Parcelable;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.Stripe3ds2AuthParams;
import com.stripe.android.model.Stripe3ds2Fingerprint;
import com.stripe.android.stripe3ds2.transaction.AuthenticationRequestParameters;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.security.KeyPair;
import java.security.PublicKey;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x4 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51154t = 0;

    /* renamed from: u, reason: collision with root package name */
    public int f51155u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ int f51156v;

    /* renamed from: w, reason: collision with root package name */
    public Object f51157w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Parcelable f51158x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Object f51159y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Object f51160z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x4(SnapshotStateList snapshotStateList, int i5, SnapshotStateList snapshotStateList2, Context context, Continuation continuation) {
        super(2, continuation);
        this.f51158x = snapshotStateList;
        this.f51156v = i5;
        this.f51159y = snapshotStateList2;
        this.f51160z = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51154t) {
            case 0:
                return new x4((SnapshotStateList) this.f51158x, this.f51156v, (SnapshotStateList) this.f51159y, (Context) this.f51160z, continuation);
            default:
                return new x4((bn.i) this.f51157w, (Stripe3ds2Fingerprint) this.f51158x, this.f51156v, (com.stripe.android.payments.core.authentication.threeds2.g) this.f51159y, (ApiRequest$Options) this.f51160z, continuation);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f51154t) {
        }
        return ((x4) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        Object objY;
        i6 i6Var;
        Object objY2;
        Object obj2;
        int i5 = this.f51154t;
        Object obj3 = this.f51160z;
        Object obj4 = this.f51159y;
        Parcelable parcelable = this.f51158x;
        int i11 = 1;
        switch (i5) {
            case 0:
                SnapshotStateList snapshotStateList = (SnapshotStateList) obj4;
                SnapshotStateList snapshotStateList2 = (SnapshotStateList) parcelable;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = this.f51155u;
                int i13 = this.f51156v;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    i6 i6Var2 = (i6) snapshotStateList2.get(i13);
                    snapshotStateList2.set(i13, i6.a(i6Var2, k6.f50628b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                    cl.l0.j(snapshotStateList, "[RUN ] " + i6Var2.f50523b);
                    a80.e eVar = t70.y0.f88884a;
                    a80.d dVar = a80.d.f488c;
                    v4 v4Var = new v4(i6Var2, (Context) obj3, null, i11);
                    this.f51157w = i6Var2;
                    this.f51155u = 1;
                    objY = t70.m0.y(dVar, v4Var, this);
                    if (objY == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    i6Var = i6Var2;
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i6Var = (i6) this.f51157w;
                    ResultKt.b(obj);
                    objY = obj;
                }
                j6 j6Var = (j6) objY;
                boolean z11 = j6Var.f50597a;
                String str = j6Var.f50598b;
                snapshotStateList2.set(i13, i6.a(i6Var, z11 ? k6.f50629c : k6.f50630d, str));
                StringBuilder sbW = b.c0.w("[", j6Var.f50597a ? "PASS" : "FAIL", "] ", i6Var.f50523b, ": ");
                sbW.append(str);
                cl.l0.j(snapshotStateList, sbW.toString());
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i14 = this.f51155u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    bn.i iVar = (bn.i) this.f51157w;
                    this.f51155u = 1;
                    com.google.android.gms.internal.consent_sdk.z zVar = (com.google.android.gms.internal.consent_sdk.z) iVar.f18209a;
                    String str2 = (String) iVar.f18210b;
                    PublicKey publicKey = (PublicKey) iVar.f18211c;
                    String str3 = (String) iVar.f18212d;
                    SdkTransactionId sdkTransactionId = (SdkTransactionId) iVar.f18213e;
                    PublicKey publicKey2 = ((KeyPair) iVar.f18214f).getPublic();
                    Intrinsics.f(publicKey2, "getPublic(...)");
                    objY2 = t70.m0.y((CoroutineContext) zVar.f32334i, new d20.c(sdkTransactionId, zVar, publicKey2, str3, str2, publicKey, null), this);
                    if (objY2 == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i14 != 1) {
                        if (i14 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        obj2 = ((Result) obj).f71688a;
                        return new Result(obj2);
                    }
                    ResultKt.b(obj);
                    objY2 = obj;
                }
                AuthenticationRequestParameters authenticationRequestParameters = (AuthenticationRequestParameters) objY2;
                Stripe3ds2AuthParams stripe3ds2AuthParams = new Stripe3ds2AuthParams(((Stripe3ds2Fingerprint) parcelable).f43924a, authenticationRequestParameters.f45060c, authenticationRequestParameters.f45061d, authenticationRequestParameters.f45059b.f45118a, authenticationRequestParameters.f45058a, authenticationRequestParameters.f45062e, authenticationRequestParameters.f45063f, this.f51156v, null);
                this.f51155u = 2;
                Object objV = ((com.stripe.android.payments.core.authentication.threeds2.g) obj4).f44336c.V(stripe3ds2AuthParams, (ApiRequest$Options) obj3, this);
                if (objV == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                obj2 = objV;
                return new Result(obj2);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x4(bn.i iVar, Stripe3ds2Fingerprint stripe3ds2Fingerprint, int i5, com.stripe.android.payments.core.authentication.threeds2.g gVar, ApiRequest$Options apiRequest$Options, Continuation continuation) {
        super(2, continuation);
        this.f51157w = iVar;
        this.f51158x = stripe3ds2Fingerprint;
        this.f51156v = i5;
        this.f51159y = gVar;
        this.f51160z = apiRequest$Options;
    }
}
