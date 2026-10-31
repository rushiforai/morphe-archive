package tx;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Tasks;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a4 {

    /* renamed from: a, reason: collision with root package name */
    public static final a4 f89654a = new a4();

    public static final Object a(fi.t tVar, SuspendLambda suspendLambda) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(suspendLambda));
        mVar.t();
        tVar.b(new u3(mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00b3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x011f -> B:48:0x0125). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(b4 b4Var, j.c cVar, Intent intent, ContinuationImpl continuationImpl) {
        y3 y3Var;
        Object objA;
        y3 y3Var2;
        a4 a4Var;
        int i5;
        b4 b4Var2;
        j.c cVar2;
        Intent intent2;
        long jCurrentTimeMillis;
        j.c cVar3;
        Intent intent3;
        b4 b4Var3;
        int i11;
        a4 a4Var2;
        if (continuationImpl instanceof y3) {
            y3Var = (y3) continuationImpl;
            int i12 = y3Var.B;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                y3Var.B = i12 - Integer.MIN_VALUE;
            } else {
                y3Var = new y3(continuationImpl);
            }
        }
        Object obj = y3Var.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = y3Var.B;
        Object obj2 = null;
        int i14 = 12501;
        int i15 = 1;
        if (i13 == 0) {
            ResultKt.b(obj);
            int i16 = Result.f71687b;
            objA = ResultKt.a(new ApiException(new Status(12501, null, null, null)));
            y3Var2 = y3Var;
            a4Var = f89654a;
            i5 = 1;
            b4Var2 = b4Var;
            cVar2 = cVar;
            intent2 = intent;
            if (i5 < 11) {
            }
            return objA;
        }
        if (i13 != 1) {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = y3Var.f90076y;
            objA = y3Var.f90075x;
            Intent intent4 = y3Var.f90074w;
            j.c cVar4 = y3Var.f90073v;
            b4 b4Var4 = y3Var.f90072u;
            a4 a4Var3 = y3Var.f90071t;
            ResultKt.b(obj);
            y3 y3Var3 = y3Var;
            int i17 = 1;
            cVar2 = cVar4;
            b4Var2 = b4Var4;
            a4Var = a4Var3;
            i5 = i11 + 1;
            intent2 = intent4;
            i15 = i17;
            i14 = 12501;
            y3Var2 = y3Var3;
            obj2 = null;
            if (i5 < 11) {
                jCurrentTimeMillis = System.currentTimeMillis();
                y3Var2.f90071t = a4Var;
                y3Var2.f90072u = b4Var2;
                y3Var2.f90073v = cVar2;
                y3Var2.f90074w = intent2;
                y3Var2.f90075x = obj2;
                y3Var2.f90076y = i5;
                y3Var2.f90077z = jCurrentTimeMillis;
                y3Var2.B = i15;
                objA = a4Var.e(b4Var2, cVar2, intent2, y3Var2);
                if (objA != coroutineSingletons) {
                    y3 y3Var4 = y3Var2;
                    b4Var3 = b4Var2;
                    a4Var2 = a4Var;
                    intent3 = intent2;
                    i11 = i5;
                    cVar3 = cVar2;
                    y3Var = y3Var4;
                    int i18 = Result.f71687b;
                    if (objA instanceof Result.Failure) {
                        return objA;
                    }
                    long jCurrentTimeMillis2 = System.currentTimeMillis() - jCurrentTimeMillis;
                    Throwable thA = Result.a(objA);
                    if ((thA instanceof ApiException) && ((ApiException) thA).f31794a.f31810f == i14) {
                        a4Var2.getClass();
                        long j11 = i11 == i15 ? 3000L : i11 == 2 ? 1000L : i11 != 3 ? 200L : 500L;
                        if (jCurrentTimeMillis2 >= j11 || i11 >= 10) {
                            mc0.b bVar = mc0.d.f76206a;
                            bVar.r("NOVA_AI");
                            bVar.h("Sign-In cancel #%d in %dms (threshold %dms) — giving up", new Integer(i11), new Long(jCurrentTimeMillis2), new Long(j11));
                        } else {
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r("NOVA_AI");
                            i17 = i15;
                            bVar2.h("Sign-In cancel #%d in %dms (< %dms) — retrying (likely tap-jacking filter)", new Integer(i11), new Long(jCurrentTimeMillis2), new Long(j11));
                            y3Var.f90071t = a4Var2;
                            y3Var.f90072u = b4Var3;
                            y3Var.f90073v = cVar3;
                            y3Var.f90074w = intent3;
                            y3Var.f90075x = objA;
                            y3Var.f90076y = i11;
                            y3Var.B = 2;
                            if (t70.t0.b(400L, y3Var) != coroutineSingletons) {
                                Intent intent5 = intent3;
                                a4Var = a4Var2;
                                b4Var2 = b4Var3;
                                intent4 = intent5;
                                y3Var3 = y3Var;
                                cVar2 = cVar3;
                                i5 = i11 + 1;
                                intent2 = intent4;
                                i15 = i17;
                                i14 = 12501;
                                y3Var2 = y3Var3;
                                obj2 = null;
                                if (i5 < 11) {
                                }
                            }
                        }
                    }
                }
                return coroutineSingletons;
            }
            return objA;
        }
        long j12 = y3Var.f90077z;
        i11 = y3Var.f90076y;
        intent3 = y3Var.f90074w;
        cVar3 = y3Var.f90073v;
        b4 b4Var5 = y3Var.f90072u;
        a4 a4Var4 = y3Var.f90071t;
        ResultKt.b(obj);
        objA = ((Result) obj).f71688a;
        b4Var3 = b4Var5;
        a4Var2 = a4Var4;
        jCurrentTimeMillis = j12;
        int i182 = Result.f71687b;
        if (objA instanceof Result.Failure) {
        }
    }

    public static void c(b4 b4Var, int i5, Intent intent) {
        lg.c cVar;
        t70.m mVar = b4Var.f89669a;
        if (mVar == null) {
            return;
        }
        b4Var.f89669a = null;
        if (i5 != -1 || intent == null) {
            int i11 = Result.f71687b;
            mVar.resumeWith(new Result(ResultKt.a(new ApiException(new Status(12501, null, null, null)))));
            return;
        }
        c00.d dVar = mg.k.f76304a;
        Status status = Status.f31808l;
        Status status2 = (Status) intent.getParcelableExtra("googleSignInStatus");
        GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) intent.getParcelableExtra("googleSignInAccount");
        if (googleSignInAccount == null) {
            if (status2 != null) {
                status = status2;
            }
            cVar = new lg.c(null, status);
        } else {
            cVar = new lg.c(googleSignInAccount, Status.f31806j);
        }
        Status status3 = cVar.f74932a;
        GoogleSignInAccount googleSignInAccount2 = cVar.f74933b;
        ((!status3.d() || googleSignInAccount2 == null) ? Tasks.c(p10.y1.C(status3)) : Tasks.d(googleSignInAccount2)).b(new ck.b(i5, mVar));
    }

    public static int g(Throwable th2) {
        if (Intrinsics.b(th2.getMessage(), "oauth_web_client_id_missing")) {
            return 2132018960;
        }
        if (Intrinsics.b(th2.getMessage(), "legacy_sign_in_canceled")) {
            return 2132018959;
        }
        boolean z11 = th2 instanceof ApiException;
        if (z11 && ((ApiException) th2).f31794a.f31810f == 12501) {
            return 2132018959;
        }
        if (Intrinsics.b(th2.getMessage(), "legacy_sign_in_no_id_token")) {
            return 2132018961;
        }
        if (z11 && ((ApiException) th2).f31794a.f31810f == 10) {
            return 2132018961;
        }
        return (z11 && ((ApiException) th2).f31794a.f31810f == 12500) ? 2132018961 : 2132018960;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Activity activity, b4 b4Var, j.c cVar, ContinuationImpl continuationImpl) {
        v3 v3Var;
        if (continuationImpl instanceof v3) {
            v3Var = (v3) continuationImpl;
            int i5 = v3Var.f90039v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v3Var.f90039v = i5 - Integer.MIN_VALUE;
            } else {
                v3Var = new v3(this, continuationImpl);
            }
        }
        Object objY = v3Var.f90037t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = v3Var.f90039v;
        if (i11 == 0) {
            ResultKt.b(objY);
            if (r70.k.U0("747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com")) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("NOVA_AI");
                bVar.d("GOOGLE_OAUTH_WEB_CLIENT_ID is blank — add buildConfigField in build.gradle", new Object[0]);
                int i12 = Result.f71687b;
                return ResultKt.a(new IllegalStateException("oauth_web_client_id_missing"));
            }
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NOVA_AI");
            bVar2.h("Runtime sign-in config: debug=%s package=%s appId=%s webClient=%s", Boolean.FALSE, activity.getPackageName(), activity.getApplicationInfo().packageName, "747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com");
            a80.e eVar = t70.y0.f88884a;
            u70.d dVar = y70.o.f96819a;
            w3 w3Var = new w3(activity, b4Var, cVar, null);
            v3Var.f90039v = 1;
            objY = t70.m0.y(dVar, w3Var, v3Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(b4 b4Var, j.c cVar, Intent intent, ContinuationImpl continuationImpl) {
        x3 x3Var;
        if (continuationImpl instanceof x3) {
            x3Var = (x3) continuationImpl;
            int i5 = x3Var.f90063v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x3Var.f90063v = i5 - Integer.MIN_VALUE;
            } else {
                x3Var = new x3(this, continuationImpl);
            }
        }
        Object objS = x3Var.f90061t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x3Var.f90063v;
        if (i11 == 0) {
            ResultKt.b(objS);
            x3Var.f90063v = 1;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(x3Var));
            mVar.t();
            mVar.v(new cs.h(b4Var, 10));
            b4Var.f89669a = mVar;
            cVar.a(intent, null);
            objS = mVar.s();
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
        }
        return ((Result) objS).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(Context context, ContinuationImpl continuationImpl) {
        z3 z3Var;
        if (continuationImpl instanceof z3) {
            z3Var = (z3) continuationImpl;
            int i5 = z3Var.f90092v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z3Var.f90092v = i5 - Integer.MIN_VALUE;
            } else {
                z3Var = new z3(this, continuationImpl);
            }
        }
        Object obj = z3Var.f90090t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z3Var.f90092v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                lg.b bVar = new lg.b(GoogleSignInOptions.f31741p);
                if (!r70.k.U0("747441958287-gki6qgj07or293npcieq5pqomuuaj3l2.apps.googleusercontent.com")) {
                    bVar.b();
                }
                bVar.f74923a.add(GoogleSignInOptions.f31742q);
                GoogleSignInOptions googleSignInOptionsA = bVar.a();
                a80.e eVar = t70.y0.f88884a;
                u70.d dVar = y70.o.f96819a;
                h0 h0Var = new h0(context, googleSignInOptionsA, (Continuation) null, 5);
                z3Var.f90092v = 1;
                if (t70.m0.y(dVar, h0Var, z3Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NOVA_AI");
            bVar2.h("Signed out of Google Sign-In", new Object[0]);
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar3 = mc0.d.f76206a;
            bVar3.r("NOVA_AI");
            bVar3.p(e11, "Google signOut failed", new Object[0]);
        }
        return Unit.f71706a;
    }
}
