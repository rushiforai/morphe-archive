package d00;

import android.content.Context;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import mx.g0;
import t70.m0;
import t70.y0;
import tx.k2;
import tx.p3;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final c80.d f48701a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f48702b;

    /* renamed from: c, reason: collision with root package name */
    public volatile long f48703c;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00fd A[Catch: all -> 0x00f8, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x00f8, blocks: (B:64:0x00fd, B:38:0x0090, B:41:0x00a9, B:43:0x00bf, B:48:0x00c9, B:51:0x00d6, B:53:0x00dc), top: B:79:0x0090 }] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0121 A[Catch: all -> 0x0038, TryCatch #1 {all -> 0x0038, blocks: (B:14:0x0033, B:68:0x0119, B:71:0x0121, B:72:0x0130), top: B:81:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0130 A[Catch: all -> 0x0038, TRY_LEAVE, TryCatch #1 {all -> 0x0038, blocks: (B:14:0x0033, B:68:0x0119, B:71:0x0121, B:72:0x0130), top: B:81:0x0033 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v9, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v21 */
    /* JADX WARN: Type inference failed for: r2v26, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r2v27, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r2v28 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) throws Throwable {
        k kVar;
        c80.d dVar;
        l lVar;
        String string;
        String strO;
        l lVar2;
        ?? r22;
        ?? r12;
        c80.d dVar2;
        j jVar;
        c80.d dVar3;
        l lVar3;
        if (continuation instanceof k) {
            kVar = (k) continuation;
            int i5 = kVar.f48700x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f48700x = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuation);
            }
        }
        Object obj = kVar.f48698v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f48700x;
        int i12 = 0;
        Continuation continuation2 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                Context context = g0.f77088a;
                String string2 = g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).getString("instabridge_token", null);
                if (string2 != null) {
                    return string2;
                }
                if (this.f48702b) {
                    k2 k2Var = k2.f89839a;
                    if (k2.f()) {
                        dVar = this.f48701a;
                        kVar.f48696t = this;
                        kVar.f48697u = dVar;
                        kVar.f48700x = 1;
                        if (dVar.e(kVar) != coroutineSingletons) {
                            lVar = this;
                        }
                        return coroutineSingletons;
                    }
                }
                return null;
            }
            if (i11 == 1) {
                ?? r23 = kVar.f48697u;
                lVar = kVar.f48696t;
                ResultKt.b(obj);
                dVar = r23;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    r12 = kVar.f48697u;
                    lVar3 = kVar.f48696t;
                    try {
                        ResultKt.b(obj);
                        dVar3 = r12;
                        jVar = (j) obj;
                        lVar2 = lVar3;
                        dVar2 = dVar3;
                        if (jVar == null) {
                            lVar2.getClass();
                            lVar2.f48703c = System.currentTimeMillis() + 300000;
                            dVar = dVar2;
                            string = null;
                            dVar.g(null);
                            return string;
                        }
                        lVar2.getClass();
                        a.f48676b.a(jVar);
                        string = jVar.f48694a;
                        dVar = dVar2;
                        dVar.g(null);
                        return string;
                    } catch (Throwable th2) {
                        th = th2;
                        ((c80.d) r12).g(null);
                        throw th;
                    }
                }
                r22 = kVar.f48697u;
                lVar2 = kVar.f48696t;
                try {
                    ResultKt.b(obj);
                    r22 = r22;
                    c80.d dVar4 = r22;
                    strO = (String) obj;
                    dVar = dVar4;
                    if (strO != null) {
                        lVar2.getClass();
                        kVar.f48696t = lVar2;
                        kVar.f48697u = dVar;
                        kVar.f48700x = 3;
                        a80.e eVar = y0.f88884a;
                        Object objY = m0.y(a80.d.f488c, new h(strO, i12, continuation2), kVar);
                        if (objY != coroutineSingletons) {
                            dVar3 = dVar;
                            obj = objY;
                            lVar3 = lVar2;
                            jVar = (j) obj;
                            lVar2 = lVar3;
                            dVar2 = dVar3;
                            if (jVar == null) {
                            }
                        }
                        return coroutineSingletons;
                    }
                    dVar2 = dVar;
                    jVar = null;
                    if (jVar == null) {
                    }
                } catch (Throwable th3) {
                    th = th3;
                    r12 = r22;
                    ((c80.d) r12).g(null);
                    throw th;
                }
            }
            lVar.getClass();
            Context context2 = g0.f77088a;
            string = g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).getString("instabridge_token", null);
            if (string != null) {
                dVar.g(null);
                return string;
            }
            String string3 = g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_account_id", null);
            if (string3 == null || r70.k.U0(string3)) {
                string3 = null;
            }
            if (string3 != null && System.currentTimeMillis() >= lVar.f48703c) {
                strO = ps.k.o();
                if (strO == null) {
                    kVar.f48696t = lVar;
                    kVar.f48697u = dVar;
                    kVar.f48700x = 2;
                    Object objC = p3.f89946a.c(kVar);
                    if (objC != coroutineSingletons) {
                        r22 = dVar;
                        obj = objC;
                        lVar2 = lVar;
                        c80.d dVar42 = r22;
                        strO = (String) obj;
                        dVar = dVar42;
                        if (strO != null) {
                        }
                    }
                    return coroutineSingletons;
                }
                lVar2 = lVar;
                if (strO != null) {
                }
            }
            string = null;
            dVar.g(null);
            return string;
        } catch (Throwable th4) {
            r12 = dVar;
            th = th4;
            ((c80.d) r12).g(null);
            throw th;
        }
    }
}
