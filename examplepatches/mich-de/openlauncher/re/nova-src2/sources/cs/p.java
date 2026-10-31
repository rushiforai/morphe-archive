package cs;

import android.util.AndroidRuntimeException;
import androidx.fragment.app.m0;
import com.stripe.hcaptcha.HCaptchaException;
import com.stripe.hcaptcha.HCaptchaStateListener;
import java.util.Locale;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import p10.c0;
import pu.f0;
import t70.p2;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: c, reason: collision with root package name */
    public static final long f47846c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f47847d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final tm.o f47848a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f47849b = u1.c(b.f47804a);

    static {
        Duration.Companion companion = Duration.f72038b;
        f47846c = DurationKt.g(6, DurationUnit.f72046e);
    }

    public p(q qVar, tm.o oVar) {
        this.f47848a = oVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00c5, code lost:
    
        if (kotlin.Unit.f71706a != r8) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(m0 m0Var, String str, String str2, ContinuationImpl continuationImpl) {
        f fVar;
        String str3;
        p pVar;
        boolean z11;
        Object objA;
        p pVar2;
        String siteKey;
        Throwable thA;
        u uVar;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f47813z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f47813z = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        f fVar2 = fVar;
        Object objC = fVar2.f47811x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar2.f47813z;
        if (i11 == 0) {
            ResultKt.b(objC);
            c0.d0((ir.c) this.f47848a.f89495d, ir.b.f68001g);
            boolean zIsReady = ((e) this.f47849b.getValue()).isReady();
            try {
                int i12 = Result.f71687b;
                long j11 = f47846c;
                str3 = str;
                try {
                    androidx.room.p pVar3 = new androidx.room.p(this, m0Var, str3, str2, null, 7);
                    fVar2.f47807t = this;
                    str3 = str;
                    fVar2.f47808u = str3;
                    fVar2.f47810w = zIsReady;
                    fVar2.f47813z = 1;
                    objC = p2.c(j11, pVar3, fVar2);
                    if (objC != coroutineSingletons) {
                        pVar = this;
                        z11 = zIsReady;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    pVar = this;
                    z11 = zIsReady;
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th);
                    pVar2 = pVar;
                    siteKey = str3;
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    uVar = (u) objA;
                    i2 i2Var = pVar2.f47849b;
                    fVar2.f47807t = pVar2;
                    fVar2.f47808u = siteKey;
                    fVar2.f47809v = uVar;
                    fVar2.f47810w = z11;
                    fVar2.f47813z = 2;
                    i2Var.getClass();
                    i2Var.k(null, b.f47804a);
                }
            } catch (Throwable th3) {
                th = th3;
                str3 = str;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = fVar2.f47810w;
            uVar = fVar2.f47809v;
            siteKey = fVar2.f47808u;
            pVar2 = fVar2.f47807t;
            ResultKt.b(objC);
            tm.o oVar = pVar2.f47848a;
            Intrinsics.g(siteKey, "siteKey");
            oVar.b0(new ds.a(z11, siteKey), tm.o.Z(((ir.a) ((ir.c) oVar.f89495d)).a(ir.b.f68001g)));
            return uVar;
        }
        z11 = fVar2.f47810w;
        str3 = fVar2.f47808u;
        pVar = fVar2.f47807t;
        try {
            ResultKt.b(objC);
        } catch (Throwable th4) {
            th = th4;
            int i132 = Result.f71687b;
            objA = ResultKt.a(th);
            pVar2 = pVar;
            siteKey = str3;
            thA = Result.a(objA);
            if (thA != null) {
            }
            uVar = (u) objA;
            i2 i2Var2 = pVar2.f47849b;
            fVar2.f47807t = pVar2;
            fVar2.f47808u = siteKey;
            fVar2.f47809v = uVar;
            fVar2.f47810w = z11;
            fVar2.f47813z = 2;
            i2Var2.getClass();
            i2Var2.k(null, b.f47804a);
        }
        objA = (u) objC;
        int i14 = Result.f71687b;
        pVar2 = pVar;
        siteKey = str3;
        thA = Result.a(objA);
        if (thA != null) {
            objA = new s(thA);
        }
        uVar = (u) objA;
        i2 i2Var22 = pVar2.f47849b;
        fVar2.f47807t = pVar2;
        fVar2.f47808u = siteKey;
        fVar2.f47809v = uVar;
        fVar2.f47810w = z11;
        fVar2.f47813z = 2;
        i2Var22.getClass();
        i2Var22.k(null, b.f47804a);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(m0 m0Var, String siteKey, String str, ContinuationImpl continuationImpl) {
        g gVar;
        Throwable th2;
        p pVar;
        yw.a aVar;
        Object objA;
        Throwable thA;
        u uVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f47819y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f47819y = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        g gVar2 = gVar;
        Object objC = gVar2.f47817w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar2.f47819y;
        if (i11 == 0) {
            ResultKt.b(objC);
            yw.a aVar2 = new yw.a(new zw.d());
            Intrinsics.g(siteKey, "siteKey");
            tm.o oVar = this.f47848a;
            c0.d0((ir.c) oVar.f89495d, ir.b.f68000f);
            oVar.b0(new ds.b(siteKey, 1), b70.h.f17594a);
            try {
                int i12 = Result.f71687b;
                gVar2.f47814t = this;
                gVar2.f47815u = siteKey;
                gVar2.f47816v = aVar2;
                gVar2.f47819y = 1;
            } catch (Throwable th3) {
                th2 = th3;
                pVar = this;
            }
            try {
                objC = c(m0Var, siteKey, str, aVar2, gVar2);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
                pVar = this;
                siteKey = siteKey;
                aVar = aVar2;
            } catch (Throwable th4) {
                th2 = th4;
                pVar = this;
                siteKey = siteKey;
                aVar = aVar2;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
                thA = Result.a(objA);
                if (thA != null) {
                }
                uVar = (u) objA;
                if (uVar instanceof s) {
                }
                aVar.b();
                return uVar;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = gVar2.f47816v;
            siteKey = gVar2.f47815u;
            pVar = gVar2.f47814t;
            try {
                ResultKt.b(objC);
            } catch (Throwable th5) {
                th2 = th5;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th2);
                thA = Result.a(objA);
                if (thA != null) {
                }
                uVar = (u) objA;
                if (uVar instanceof s) {
                }
                aVar.b();
                return uVar;
            }
        }
        objA = (u) objC;
        int i14 = Result.f71687b;
        thA = Result.a(objA);
        if (thA != null) {
            objA = new s(thA);
        }
        uVar = (u) objA;
        if (uVar instanceof s) {
            tm.o oVar2 = pVar.f47848a;
            iu.f fVar = (iu.f) oVar2.f89496e;
            Throwable th6 = ((s) uVar).f47852a;
            Intrinsics.g(siteKey, "siteKey");
            Duration durationA = ((ir.a) ((ir.c) oVar2.f89495d)).a(ir.b.f68000f);
            if (th6 instanceof HCaptchaException) {
                t2.c.L(fVar, iu.c.B, null, null, 6);
            } else {
                t2.c.L(fVar, iu.e.A, null, null, 6);
            }
            oVar2.b0(new ds.a(siteKey, th6), tm.o.Z(durationA));
        } else {
            if (!(uVar instanceof t)) {
                throw new NoWhenBranchMatchedException();
            }
            tm.o oVar3 = pVar.f47848a;
            Intrinsics.g(siteKey, "siteKey");
            oVar3.b0(new ds.b(siteKey, 2), tm.o.Z(((ir.a) ((ir.c) oVar3.f89495d)).a(ir.b.f68000f)));
        }
        aVar.b();
        return uVar;
    }

    public final Object c(m0 activity, String str, String str2, yw.a aVar, g gVar) {
        zw.h hVar = zw.h.f98795b;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(gVar));
        mVar.t();
        mVar.v(new h(aVar, 0));
        aVar.f18673c.add(new i(mVar));
        aVar.a();
        aVar.f18674d.add(new j(mVar));
        aVar.a();
        String language = Locale.getDefault().getLanguage();
        zw.f fVar = zw.f.f98792b;
        zw.j jVar = zw.j.f98798b;
        Duration.Companion companion = Duration.f72038b;
        zw.c cVar = new zw.c(str, true, false, true, str2, "https://js.hcaptcha.com/1/api.js", (String) null, (String) null, (String) null, (String) null, language, hVar, fVar, jVar, "stripecdn.com", (String) null, (Function2) k.f47824a, DurationKt.g(120, DurationUnit.f72046e), true);
        zw.d dVar = aVar.f97658g;
        Intrinsics.g(activity, "activity");
        HCaptchaStateListener hCaptchaStateListener = new HCaptchaStateListener(new xu.d(aVar, 8), new f0(26, aVar, cVar), new xu.k(aVar, 5));
        try {
            aVar.f97659h = new cx.b(activity, zw.c.a(cVar), dVar, hCaptchaStateListener);
        } catch (AndroidRuntimeException unused) {
            hCaptchaStateListener.f45527c.invoke(new HCaptchaException(yw.c.f97667h));
        }
        yw.f fVar2 = aVar.f97659h;
        if (fVar2 == null) {
            throw new IllegalStateException("verifyWithHCaptcha must not be called before setup.");
        }
        aVar.f18676f.removeCallbacksAndMessages(null);
        fVar2.e(activity);
        this.f47848a.b0(new ds.b(str, 0), b70.h.f17594a);
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b8, code lost:
    
        if (kotlin.Unit.f71706a != r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(m0 m0Var, String str, String str2, ContinuationImpl continuationImpl) {
        o oVar;
        String str3;
        String str4;
        m0 m0Var2;
        p pVar;
        u uVar;
        Object dVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f47845z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f47845z = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object objB = oVar.f47843x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f47845z;
        if (i11 == 0) {
            ResultKt.b(objB);
            i2 i2Var = this.f47849b;
            if (!((e) i2Var.getValue()).a()) {
                return Unit.f71706a;
            }
            oVar.f47839t = this;
            oVar.f47840u = m0Var;
            oVar.f47841v = str;
            oVar.f47842w = str2;
            oVar.f47845z = 1;
            i2Var.getClass();
            i2Var.k(null, c.f47805a);
            if (Unit.f71706a != coroutineSingletons) {
                str3 = str2;
                str4 = str;
                m0Var2 = m0Var;
                pVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            String str5 = oVar.f47842w;
            String str6 = oVar.f47841v;
            m0 m0Var3 = oVar.f47840u;
            p pVar2 = oVar.f47839t;
            ResultKt.b(objB);
            str3 = str5;
            str4 = str6;
            m0Var2 = m0Var3;
            pVar = pVar2;
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objB);
                return Unit.f71706a;
            }
            pVar = oVar.f47839t;
            ResultKt.b(objB);
            uVar = (u) objB;
            if (!(uVar instanceof s)) {
                dVar = new a(((s) uVar).f47852a);
            } else {
                if (!(uVar instanceof t)) {
                    throw new NoWhenBranchMatchedException();
                }
                dVar = new d(((t) uVar).f47853a);
            }
            i2 i2Var2 = pVar.f47849b;
            oVar.f47839t = null;
            oVar.f47845z = 3;
            i2Var2.getClass();
            i2Var2.k(null, dVar);
        }
        oVar.f47839t = pVar;
        oVar.f47840u = null;
        oVar.f47841v = null;
        oVar.f47842w = null;
        oVar.f47845z = 2;
        objB = pVar.b(m0Var2, str4, str3, oVar);
        if (objB != coroutineSingletons) {
            uVar = (u) objB;
            if (!(uVar instanceof s)) {
            }
            i2 i2Var22 = pVar.f47849b;
            oVar.f47839t = null;
            oVar.f47845z = 3;
            i2Var22.getClass();
            i2Var22.k(null, dVar);
        }
        return coroutineSingletons;
    }
}
