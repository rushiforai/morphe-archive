package gx;

import android.app.Activity;
import android.util.Log;
import com.amplitude.core.events.Identify;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import dx.x0;
import f1.z1;
import java.util.Iterator;
import java.util.UUID;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import t70.p2;

/* loaded from: classes4.dex */
public final class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f58085a;

    /* renamed from: b, reason: collision with root package name */
    public final f f58086b;

    /* renamed from: c, reason: collision with root package name */
    public final e f58087c;

    /* renamed from: d, reason: collision with root package name */
    public final e f58088d;

    /* renamed from: e, reason: collision with root package name */
    public final e f58089e;

    /* renamed from: f, reason: collision with root package name */
    public final f f58090f;

    /* renamed from: g, reason: collision with root package name */
    public final dx.d0 f58091g;

    /* renamed from: h, reason: collision with root package name */
    public final dq.r f58092h;

    /* renamed from: i, reason: collision with root package name */
    public final b4.j f58093i;

    /* renamed from: j, reason: collision with root package name */
    public final Function0 f58094j;

    public i0(p pVar, f fVar, ex.q nativeSource, ex.f bannerSource, ex.m iconSource, f fVar2, dx.d0 d0Var, dq.r rVar, b4.j jVar) {
        z1 z1Var = new z1(18);
        Intrinsics.g(nativeSource, "nativeSource");
        Intrinsics.g(bannerSource, "bannerSource");
        Intrinsics.g(iconSource, "iconSource");
        this.f58085a = pVar;
        this.f58086b = fVar;
        this.f58087c = nativeSource;
        this.f58088d = bannerSource;
        this.f58089e = iconSource;
        this.f58090f = fVar2;
        this.f58091g = d0Var;
        this.f58092h = rVar;
        this.f58093i = jVar;
        this.f58094j = z1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x0439  */
    /* JADX WARN: Removed duplicated region for block: B:108:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0231  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0254  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0298  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x033d  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0353  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0358  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x036b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x03a7  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:101:0x0421 -> B:98:0x0405). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:71:0x033d -> B:72:0x034f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String p11, d0 d0Var, ContinuationImpl continuationImpl) {
        g0 g0Var;
        dx.j0 j0Var;
        Iterator it;
        String str;
        String str2;
        i0 i0Var;
        String str3;
        CoroutineSingletons coroutineSingletons;
        long j11;
        g0 g0Var2;
        Activity activity;
        Ref.ObjectRef objectRef;
        String str4;
        long j12;
        String str5;
        dx.f fVar;
        i0 i0Var2;
        String str6;
        e eVar;
        String str7;
        String str8;
        Object objD;
        String str9;
        dx.m mVar;
        String str10;
        String str11;
        e eVar2;
        Object obj;
        Ref.ObjectRef objectRef2;
        Integer num;
        Object objA;
        String str12;
        dx.n jVar;
        if (continuationImpl instanceof g0) {
            g0Var = (g0) continuationImpl;
            int i5 = g0Var.H;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.H = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(this, continuationImpl);
            }
        }
        Object obj2 = g0Var.F;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i11 = g0Var.H;
        String str13 = " cascade budget ";
        String str14 = "]";
        String str15 = "[";
        String str16 = Identify.UNSET_VALUE;
        String str17 = "/";
        String str18 = "NovaAds";
        dx.m mVar2 = dx.m.f49745a;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Intrinsics.g(p11, "p");
            dx.q0 q0Var = (dx.q0) ((dx.h) this.f58085a.f58149b.f58030e.getValue()).f49705a.get(new dx.t(p11));
            if (q0Var == null) {
                throw new AdErrorException(dx.i.f49709a);
            }
            dx.j0 j0Var2 = (dx.j0) this.f58086b.invoke();
            long jLongValue = ((Number) this.f58094j.invoke()).longValue();
            Activity activity2 = (Activity) this.f58090f.invoke();
            g0 g0Var3 = g0Var;
            String str19 = "req-" + UUID.randomUUID();
            String str20 = this.f58092h.f49364b;
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            objectRef3.f71863a = d0Var;
            Iterator it2 = q0Var.f49763b.iterator();
            j0Var = j0Var2;
            it = it2;
            str = p11;
            str2 = str20;
            i0Var = this;
            str3 = str19;
            coroutineSingletons = coroutineSingletons2;
            j11 = jLongValue;
            g0Var2 = g0Var3;
            activity = activity2;
            objectRef = objectRef3;
            if (it.hasNext()) {
            }
        } else if (i11 == 1) {
            long j13 = g0Var.D;
            e eVar3 = g0Var.C;
            dx.f fVar2 = g0Var.B;
            Iterator it3 = g0Var.A;
            eVar2 = eVar3;
            Ref.ObjectRef objectRef4 = g0Var.f58075z;
            String str21 = g0Var.f58074y;
            String str22 = g0Var.f58073x;
            Activity activity3 = g0Var.f58072w;
            dx.j0 j0Var3 = g0Var.f58071v;
            str9 = g0Var.f58070u;
            i0 i0Var3 = g0Var.f58069t;
            ResultKt.b(obj2);
            str10 = " cascade budget ";
            mVar = mVar2;
            str6 = str21;
            str11 = "]";
            i0Var2 = i0Var3;
            objectRef2 = objectRef4;
            it = it3;
            g0Var2 = g0Var;
            obj = obj2;
            str3 = str22;
            j0Var = j0Var3;
            str5 = Identify.UNSET_VALUE;
            fVar = fVar2;
            activity = activity3;
            j12 = j13;
            String str23 = str9;
            num = (Integer) obj;
            if (num != null) {
            }
            objectRef = objectRef2;
            if (((Number) i0Var2.f58094j.invoke()).longValue() - j12 <= j0Var.f49723g) {
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j14 = g0Var.E;
            long j15 = g0Var.D;
            dx.f fVar3 = g0Var.B;
            Iterator it4 = g0Var.A;
            Ref.ObjectRef objectRef5 = g0Var.f58075z;
            String str24 = g0Var.f58074y;
            String str25 = g0Var.f58073x;
            Activity activity4 = g0Var.f58072w;
            dx.j0 j0Var4 = g0Var.f58071v;
            String str26 = g0Var.f58070u;
            i0Var = g0Var.f58069t;
            ResultKt.b(obj2);
            String str27 = " cascade budget ";
            String str28 = "NovaAds";
            dx.m mVar3 = mVar2;
            String str29 = str24;
            String str30 = str25;
            String str31 = str26;
            dx.f fVar4 = fVar3;
            it = it4;
            String str32 = "]";
            String str33 = "/";
            g0 g0Var4 = g0Var;
            CoroutineSingletons coroutineSingletons3 = coroutineSingletons2;
            j11 = j15;
            objectRef = objectRef5;
            Activity activity5 = activity4;
            String str34 = "[";
            str5 = Identify.UNSET_VALUE;
            Result result = (Result) obj2;
            if (result == null) {
                objA = result.f71688a;
                mVar2 = mVar3;
            } else {
                int i12 = Result.f71687b;
                mVar2 = mVar3;
                objA = ResultKt.a(new AdErrorException(mVar2));
            }
            int i13 = Result.f71687b;
            if (objA instanceof Result.Failure) {
                f0 f0Var = (f0) objA;
                dx.d0 d0Var2 = i0Var.f58091g;
                Function0 function0 = i0Var.f58094j;
                long jLongValue2 = ((Number) function0.invoke()).longValue();
                String strA = fVar4.a();
                long jLongValue3 = ((Number) function0.invoke()).longValue() - j14;
                dx.u uVarE = f0Var.e();
                String strF = f0Var.f();
                x0 x0Var = x0.f49820a;
                d0Var2.a(new dx.r(jLongValue2, str31, str29, str30, strA, jLongValue3, uVarE, strF));
                return new e0(f0Var, str30);
            }
            String str35 = str30;
            Throwable thA = Result.a(objA);
            if (thA == null) {
                str12 = str35;
            } else {
                AdErrorException adErrorException = thA instanceof AdErrorException ? (AdErrorException) thA : null;
                if (adErrorException == null || (jVar = adErrorException.f45528a) == null) {
                    String message = thA.getMessage();
                    if (message == null) {
                        message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    jVar = new dx.j(message);
                }
                str12 = str35;
                i0Var.f58091g.a(new dx.q(((Number) i0Var.f58094j.invoke()).longValue(), str31, str29, str12, fVar4.a(), jVar));
            }
            activity = activity5;
            g0Var2 = g0Var4;
            str15 = str34;
            str14 = str32;
            str16 = str5;
            j0Var = j0Var4;
            str13 = str27;
            str18 = str28;
            str = str31;
            str2 = str29;
            str3 = str12;
            coroutineSingletons = coroutineSingletons3;
            str17 = str33;
            if (it.hasNext()) {
                str5 = str16;
                fVar = (dx.f) it.next();
                j12 = j11;
                if (((Number) i0Var.f58094j.invoke()).longValue() - j12 > j0Var.f49723g) {
                    String str36 = str2 == null ? str5 : str2;
                    if (str3 == null) {
                        str3 = str5;
                    }
                    Log.w(str18, b.c0.q(b.c0.w(str15, str36, str17, str3, str17), str == null ? str5 : str, str14) + str13 + j0Var.f49723g + "ms exceeded, bailing");
                    int i14 = Result.f71687b;
                    return ResultKt.a(new AdErrorException(mVar2));
                }
                if (fVar instanceof dx.d) {
                    eVar = i0Var.f58087c;
                } else if (fVar instanceof dx.b) {
                    eVar = i0Var.f58088d;
                } else if (fVar instanceof dx.c) {
                    eVar = i0Var.f58089e;
                } else {
                    String str37 = str13;
                    String str38 = str14;
                    str33 = str17;
                    String str39 = str18;
                    coroutineSingletons3 = coroutineSingletons;
                    String str40 = str2;
                    String str41 = str;
                    i0 i0Var4 = i0Var;
                    String str42 = str15;
                    if (!(fVar instanceof dx.e)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    str = str41;
                    str2 = str40;
                    i0Var = i0Var4;
                    str15 = str42;
                    str14 = str38;
                    str16 = str5;
                    j11 = j12;
                    str13 = str37;
                    str18 = str39;
                    coroutineSingletons = coroutineSingletons3;
                    str17 = str33;
                    if (it.hasNext()) {
                        int i15 = Result.f71687b;
                        return ResultKt.a(new AdErrorException(dx.l.f49740a));
                    }
                }
                if (fVar instanceof dx.b) {
                    dx.c0 c0Var = dx.c0.f49689a;
                    if (((d0) objectRef.f71863a).f58062a == null) {
                        b4.j jVar2 = i0Var.f58093i;
                        str10 = str13;
                        str11 = str14;
                        mVar = mVar2;
                        Long l9 = new Long(j0Var.o);
                        g0Var2.f58069t = i0Var;
                        g0Var2.f58070u = str;
                        g0Var2.f58071v = j0Var;
                        g0Var2.f58072w = activity;
                        g0Var2.f58073x = str3;
                        str6 = str2;
                        g0Var2.f58074y = str6;
                        g0Var2.f58075z = objectRef;
                        g0Var2.A = it;
                        g0Var2.B = fVar;
                        g0Var2.C = eVar;
                        str9 = str;
                        i0Var2 = i0Var;
                        g0Var2.D = j12;
                        g0Var2.H = 1;
                        Object objInvoke = jVar2.invoke(l9, g0Var2);
                        coroutineSingletons2 = coroutineSingletons;
                        if (objInvoke == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
                        Ref.ObjectRef objectRef6 = objectRef;
                        obj = objInvoke;
                        objectRef2 = objectRef6;
                        eVar2 = eVar;
                        String str232 = str9;
                        num = (Integer) obj;
                        if (num != null) {
                            ((d0) objectRef2.f71863a).getClass();
                            objectRef2.f71863a = new d0(num);
                        }
                        objectRef = objectRef2;
                        if (((Number) i0Var2.f58094j.invoke()).longValue() - j12 <= j0Var.f49723g) {
                            if (str6 == null) {
                                str6 = str5;
                            }
                            if (str3 == null) {
                                str3 = str5;
                            }
                            Log.w(str18, b.c0.q(b.c0.w(str15, str6, str17, str3, str17), str232 == null ? str5 : str232, str11) + str10 + j0Var.f49723g + "ms exceeded after width await, bailing");
                            int i16 = Result.f71687b;
                            return ResultKt.a(new AdErrorException(mVar));
                        }
                        str7 = str11;
                        str8 = str10;
                        mVar2 = mVar;
                        t70.m0.k(g0Var2.getContext());
                        str4 = str232;
                        eVar = eVar2;
                        String str43 = str3;
                        Ref.ObjectRef objectRef7 = objectRef;
                        String str44 = str6;
                        dx.f fVar5 = fVar;
                        Activity activity6 = activity;
                        long j16 = j12;
                        Function0 function02 = i0Var2.f58094j;
                        str32 = str7;
                        e eVar4 = eVar;
                        String str45 = str4;
                        str27 = str8;
                        i0Var2.f58091g.a(new dx.v(((Number) function02.invoke()).longValue(), str4, str44, str43, fVar5.a()));
                        str34 = str15;
                        long jLongValue4 = ((Number) function02.invoke()).longValue();
                        String str46 = str17;
                        str28 = str18;
                        long j17 = j0Var.f49722f;
                        h0 h0Var = new h0(eVar4, fVar5, activity6, objectRef7, null);
                        str33 = str46;
                        CoroutineSingletons coroutineSingletons4 = coroutineSingletons2;
                        mVar3 = mVar2;
                        fVar4 = fVar5;
                        g0Var2.f58069t = i0Var2;
                        g0Var2.f58070u = str45;
                        g0Var2.f58071v = j0Var;
                        g0Var2.f58072w = activity6;
                        g0Var2.f58073x = str43;
                        g0Var2.f58074y = str44;
                        g0Var2.f58075z = objectRef7;
                        g0Var2.A = it;
                        g0Var2.B = fVar4;
                        g0Var2.C = null;
                        g0Var2.D = j16;
                        g0Var2.E = jLongValue4;
                        g0Var2.H = 2;
                        objD = p2.d(j17, h0Var, g0Var2);
                        coroutineSingletons3 = coroutineSingletons4;
                        if (objD != coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                        str31 = str45;
                        j0Var4 = j0Var;
                        obj2 = objD;
                        i0Var = i0Var2;
                        str29 = str44;
                        g0Var4 = g0Var2;
                        str30 = str43;
                        j14 = jLongValue4;
                        activity5 = activity6;
                        j11 = j16;
                        objectRef = objectRef7;
                        Result result2 = (Result) obj2;
                        if (result2 == null) {
                        }
                        int i132 = Result.f71687b;
                        if (objA instanceof Result.Failure) {
                        }
                    }
                }
                String str47 = str13;
                str6 = str2;
                String str48 = str;
                str8 = str47;
                String str49 = str14;
                i0Var2 = i0Var;
                str7 = str49;
                coroutineSingletons2 = coroutineSingletons;
                str4 = str48;
                String str432 = str3;
                Ref.ObjectRef objectRef72 = objectRef;
                String str442 = str6;
                dx.f fVar52 = fVar;
                Activity activity62 = activity;
                long j162 = j12;
                Function0 function022 = i0Var2.f58094j;
                str32 = str7;
                e eVar42 = eVar;
                String str452 = str4;
                str27 = str8;
                i0Var2.f58091g.a(new dx.v(((Number) function022.invoke()).longValue(), str4, str442, str432, fVar52.a()));
                str34 = str15;
                long jLongValue42 = ((Number) function022.invoke()).longValue();
                String str462 = str17;
                str28 = str18;
                long j172 = j0Var.f49722f;
                h0 h0Var2 = new h0(eVar42, fVar52, activity62, objectRef72, null);
                str33 = str462;
                CoroutineSingletons coroutineSingletons42 = coroutineSingletons2;
                mVar3 = mVar2;
                fVar4 = fVar52;
                g0Var2.f58069t = i0Var2;
                g0Var2.f58070u = str452;
                g0Var2.f58071v = j0Var;
                g0Var2.f58072w = activity62;
                g0Var2.f58073x = str432;
                g0Var2.f58074y = str442;
                g0Var2.f58075z = objectRef72;
                g0Var2.A = it;
                g0Var2.B = fVar4;
                g0Var2.C = null;
                g0Var2.D = j162;
                g0Var2.E = jLongValue42;
                g0Var2.H = 2;
                objD = p2.d(j172, h0Var2, g0Var2);
                coroutineSingletons3 = coroutineSingletons42;
                if (objD != coroutineSingletons3) {
                }
            }
        }
    }
}
