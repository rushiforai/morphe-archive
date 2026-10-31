package r8;

import ai.y0;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Looper;
import android.os.NetworkOnMainThreadException;
import android.webkit.MimeTypeMap;
import b.u4;
import coil.network.HttpException;
import h6.c1;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import m90.c0;
import m90.d0;
import m90.z;
import x80.a0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.l0;
import x80.m0;
import x80.p0;

/* loaded from: classes2.dex */
public final class m implements h {

    /* renamed from: e, reason: collision with root package name */
    public static final x80.g f85639e = new x80.g(true, true, -1, -1, false, false, false, -1, -1, false, false, false, null);

    /* renamed from: f, reason: collision with root package name */
    public static final x80.g f85640f = new x80.g(true, false, -1, -1, false, false, false, -1, -1, true, false, false, null);

    /* renamed from: a, reason: collision with root package name */
    public final String f85641a;

    /* renamed from: b, reason: collision with root package name */
    public final x8.n f85642b;

    /* renamed from: c, reason: collision with root package name */
    public final a70.d f85643c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f85644d;

    public m(String str, x8.n nVar, a70.d dVar, a70.d dVar2) {
        this.f85641a = str;
        this.f85642b = nVar;
        this.f85643c = dVar;
        this.f85644d = dVar2;
    }

    public static String d(String str, a0 a0Var) {
        String strB;
        String str2 = a0Var != null ? a0Var.f95398a : null;
        if ((str2 == null || r70.j.I0(str2, "text/plain", false)) && (strB = c9.g.b(MimeTypeMap.getSingleton(), str)) != null) {
            return strB;
        }
        if (str2 != null) {
            return r70.k.q1(str2, ';');
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x009b A[Catch: Exception -> 0x00d4, TRY_ENTER, TryCatch #4 {Exception -> 0x00d4, blocks: (B:93:0x01f9, B:94:0x01fc, B:56:0x0137, B:95:0x01fd, B:96:0x0202, B:33:0x009b, B:35:0x00a9, B:44:0x00d8, B:47:0x00f1, B:52:0x011e, B:38:0x00be, B:40:0x00c6, B:49:0x0107, B:50:0x010e, B:51:0x010f), top: B:106:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x010f A[Catch: Exception -> 0x00d4, TryCatch #4 {Exception -> 0x00d4, blocks: (B:93:0x01f9, B:94:0x01fc, B:56:0x0137, B:95:0x01fd, B:96:0x0202, B:33:0x009b, B:35:0x00a9, B:44:0x00d8, B:47:0x00f1, B:52:0x011e, B:38:0x00be, B:40:0x00c6, B:49:0x0107, B:50:0x010e, B:51:0x010f), top: B:106:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01c4 A[Catch: Exception -> 0x01f0, TryCatch #0 {Exception -> 0x01f0, blocks: (B:81:0x01bd, B:83:0x01c4, B:87:0x01ec, B:91:0x01f3, B:92:0x01f8), top: B:100:0x01bd }] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01f3 A[Catch: Exception -> 0x01f0, TryCatch #0 {Exception -> 0x01f0, blocks: (B:81:0x01bd, B:83:0x01c4, B:87:0x01ec, B:91:0x01f3, B:92:0x01f8), top: B:100:0x01bd }] */
    /* JADX WARN: Type inference failed for: r3v12, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r4v0, types: [int] */
    @Override // r8.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) throws Exception {
        l lVar;
        p8.f fVar;
        p8.f fVar2;
        long j11;
        w8.d dVarA;
        Object objB;
        w8.d dVar;
        m mVar;
        p8.g gVar;
        m0 m0Var;
        m mVar2;
        m0 m0Var2;
        p0 p0Var;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i5 = lVar.f85638y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f85638y = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, (ContinuationImpl) continuation);
            }
        }
        Object objB2 = lVar.f85636w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r42 = lVar.f85638y;
        int i11 = 4;
        try {
            if (r42 == 0) {
                ResultKt.b(objB2);
                x8.n nVar = this.f85642b;
                boolean zD = c1.d(nVar.f95363l);
                String str = this.f85641a;
                if (!zD || (gVar = (p8.g) this.f85644d.getValue()) == null) {
                    fVar2 = null;
                    if (fVar2 == null) {
                        m90.m mVarC = c();
                        p8.b bVar = (p8.b) fVar2.f82452b;
                        j11 = 0;
                        if (bVar.f82430b) {
                            throw new IllegalStateException("snapshot is closed");
                        }
                        Long l9 = (Long) mVarC.i((z) bVar.f82429a.f82422c.get(0)).f59102e;
                        if (l9 != null && l9.longValue() == 0) {
                            return new n(g(fVar2), d(str, null), 3);
                        }
                        dVarA = new w8.c(e(), f(fVar2)).a();
                        w8.b bVar2 = dVarA.f94115b;
                        if (dVarA.f94114a == null && bVar2 != null) {
                            return new n(g(fVar2), d(str, (a0) bVar2.f94098b.getValue()), 3);
                        }
                    } else {
                        j11 = 0;
                        dVarA = new w8.c(e(), null).a();
                    }
                    h0 h0Var = dVarA.f94114a;
                    Intrinsics.d(h0Var);
                    lVar.f85633t = this;
                    lVar.f85634u = fVar2;
                    lVar.f85635v = dVarA;
                    lVar.f85638y = 1;
                    objB = b(h0Var, lVar);
                    if (objB != coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    dVar = dVarA;
                    objB2 = objB;
                    mVar = this;
                } else {
                    nVar.getClass();
                    p8.d dVar2 = gVar.f82454b;
                    m90.j jVar = m90.j.f76130d;
                    p8.b bVarC = dVar2.c(lm.e.n(str).b("SHA-256").d());
                    if (bVarC != null) {
                        fVar2 = new p8.f(bVarC, 0);
                    }
                    if (fVar2 == null) {
                    }
                    h0 h0Var2 = dVarA.f94114a;
                    Intrinsics.d(h0Var2);
                    lVar.f85633t = this;
                    lVar.f85634u = fVar2;
                    lVar.f85635v = dVarA;
                    lVar.f85638y = 1;
                    objB = b(h0Var2, lVar);
                    if (objB != coroutineSingletons) {
                    }
                }
                c9.g.a(m0Var);
                throw e;
            }
            if (r42 == 1) {
                w8.d dVar3 = (w8.d) lVar.f85635v;
                fVar = lVar.f85634u;
                mVar = lVar.f85633t;
                try {
                    ResultKt.b(objB2);
                    dVar = dVar3;
                    fVar2 = fVar;
                    j11 = 0;
                } catch (Exception e3) {
                    e = e3;
                    if (fVar != null) {
                        c9.g.a(fVar);
                    }
                    throw e;
                }
            } else {
                if (r42 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                m0Var = (m0) lVar.f85635v;
                p8.f fVar3 = lVar.f85634u;
                mVar2 = lVar.f85633t;
                try {
                    ResultKt.b(objB2);
                    m0Var2 = (m0) objB2;
                    try {
                        mVar2.getClass();
                        p0Var = m0Var2.f95559g;
                        if (p0Var != null) {
                            throw new IllegalStateException("response body == null");
                        }
                        m90.i iVarSource = p0Var.source();
                        Context context = mVar2.f85642b.f95352a;
                        Bitmap.Config[] configArr = c9.g.f19862a;
                        File cacheDir = context.getCacheDir();
                        cacheDir.mkdirs();
                        o8.m mVar3 = new o8.m(iVarSource, cacheDir, null);
                        String strD = d(mVar2.f85641a, p0Var.contentType());
                        if (m0Var2.f95560h == null) {
                            i11 = 3;
                        }
                        return new n(mVar3, strD, i11);
                    } catch (Exception e11) {
                        e = e11;
                        m0Var = m0Var2;
                    }
                } catch (Exception e12) {
                    e = e12;
                }
            }
            m0 m0Var3 = (m0) objB2;
            mVar.getClass();
            p0 p0Var2 = m0Var3.f95559g;
            if (p0Var2 == null) {
                throw new IllegalStateException("response body == null");
            }
            try {
                String str2 = mVar.f85641a;
                p8.f fVarH = mVar.h(fVar2, dVar.f94114a, m0Var3, dVar.f94115b);
                if (fVarH != null) {
                    o8.j jVarG = mVar.g(fVarH);
                    w8.b bVarF = mVar.f(fVarH);
                    return new n(jVarG, d(str2, bVarF != null ? (a0) bVarF.f94098b.getValue() : null), 4);
                }
                if (p0Var2.contentLength() > j11) {
                    m90.i iVarSource2 = p0Var2.source();
                    Context context2 = mVar.f85642b.f95352a;
                    Bitmap.Config[] configArr2 = c9.g.f19862a;
                    File cacheDir2 = context2.getCacheDir();
                    cacheDir2.mkdirs();
                    o8.m mVar4 = new o8.m(iVarSource2, cacheDir2, null);
                    String strD2 = d(str2, p0Var2.contentType());
                    if (m0Var3.f95560h == null) {
                        i11 = 3;
                    }
                    return new n(mVar4, strD2, i11);
                }
                c9.g.a(m0Var3);
                h0 h0VarE = mVar.e();
                lVar.f85633t = mVar;
                lVar.f85634u = fVarH;
                lVar.f85635v = m0Var3;
                lVar.f85638y = 2;
                objB2 = mVar.b(h0VarE, lVar);
                if (objB2 != coroutineSingletons) {
                    m0Var = m0Var3;
                    mVar2 = mVar;
                    m0Var2 = (m0) objB2;
                    mVar2.getClass();
                    p0Var = m0Var2.f95559g;
                    if (p0Var != null) {
                    }
                }
                return coroutineSingletons;
            } catch (Exception e13) {
                e = e13;
                m0Var = m0Var3;
            }
        } catch (Exception e14) {
            e = e14;
            fVar = r42;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(h0 h0Var, ContinuationImpl continuationImpl) throws IOException {
        k kVar;
        m0 m0VarL;
        boolean zC;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f85632v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f85632v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object objS = kVar.f85630t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f85632v;
        if (i11 == 0) {
            ResultKt.b(objS);
            Bitmap.Config[] configArr = c9.g.f19862a;
            boolean zB = Intrinsics.b(Looper.myLooper(), Looper.getMainLooper());
            a70.d dVar = this.f85643c;
            if (zB) {
                if (c1.d(this.f85642b.f95364m)) {
                    throw new NetworkOnMainThreadException();
                }
                m0VarL = ((e0) ((x80.h) dVar.getValue())).c(h0Var).l();
                zC = m0VarL.c();
                int i12 = m0VarL.f95556d;
                if (!zC || i12 == 304) {
                    return m0VarL;
                }
                p0 p0Var = m0VarL.f95559g;
                if (p0Var != null) {
                    c9.g.a(p0Var);
                }
                StringBuilder sbJ = u4.j(i12, "HTTP ", ": ");
                sbJ.append(m0VarL.f95555c);
                throw new HttpException(sbJ.toString());
            }
            b90.j jVarC = ((e0) ((x80.h) dVar.getValue())).c(h0Var);
            kVar.f85632v = 1;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(kVar));
            mVar.t();
            c9.h hVar = new c9.h(0, jVarC, mVar);
            jVarC.b(hVar);
            mVar.v(hVar);
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
        m0VarL = (m0) objS;
        zC = m0VarL.c();
        int i122 = m0VarL.f95556d;
        if (zC) {
        }
        return m0VarL;
    }

    public final m90.m c() {
        Object value = this.f85644d.getValue();
        Intrinsics.d(value);
        return ((p8.g) value).f82453a;
    }

    public final h0 e() {
        g0 g0Var = new g0();
        g0Var.k(this.f85641a);
        x8.n nVar = this.f85642b;
        g0Var.f(nVar.f95359h);
        for (Map.Entry entry : nVar.f95360i.f95375a.entrySet()) {
            Object key = entry.getKey();
            Intrinsics.e(key, "null cannot be cast to non-null type java.lang.Class<kotlin.Any>");
            g0Var.j((Class) key, entry.getValue());
        }
        int i5 = nVar.f95363l;
        boolean zD = c1.d(i5);
        boolean zD2 = c1.d(nVar.f95364m);
        if (!zD2 && zD) {
            g0Var.c(x80.g.o);
        } else if (!zD2 || zD) {
            if (!zD2 && !zD) {
                g0Var.c(f85640f);
            }
        } else if (c1.e(i5)) {
            g0Var.c(x80.g.n);
        } else {
            g0Var.c(f85639e);
        }
        return g0Var.b();
    }

    public final w8.b f(p8.f fVar) throws Throwable {
        Throwable th2;
        w8.b bVar;
        try {
            m90.m mVarC = c();
            p8.b bVar2 = (p8.b) fVar.f82452b;
            if (bVar2.f82430b) {
                throw new IllegalStateException("snapshot is closed");
            }
            d0 d0VarR = x7.f.r(mVarC.n((z) bVar2.f82429a.f82422c.get(0)));
            try {
                bVar = new w8.b(d0VarR);
                try {
                    d0VarR.close();
                    th2 = null;
                } catch (Throwable th3) {
                    th2 = th3;
                }
            } catch (Throwable th4) {
                try {
                    d0VarR.close();
                } catch (Throwable th5) {
                    ExceptionsKt.a(th4, th5);
                }
                th2 = th4;
                bVar = null;
            }
            if (th2 != null) {
                throw th2;
            }
            Intrinsics.d(bVar);
            return bVar;
        } catch (IOException unused) {
            return null;
        }
    }

    public final o8.j g(p8.f fVar) {
        p8.b bVar = (p8.b) fVar.f82452b;
        if (bVar.f82430b) {
            throw new IllegalStateException("snapshot is closed");
        }
        z zVar = (z) bVar.f82429a.f82422c.get(1);
        m90.m mVarC = c();
        this.f85642b.getClass();
        return new o8.j(zVar, mVarC, this.f85641a, fVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final p8.f h(p8.f fVar, h0 h0Var, m0 m0Var, w8.b bVar) throws IOException {
        je.f fVar2;
        Throwable th2;
        Unit unit;
        Long lValueOf;
        Unit unit2;
        y0 y0VarB;
        Throwable th3 = null;
        if (!c1.e(this.f85642b.f95363l) || h0Var.a().f95492b || m0Var.a().f95492b || Intrinsics.b(m0Var.f95558f.b("Vary"), "*")) {
            if (fVar != null) {
                c9.g.a(fVar);
            }
        } else if (fVar != null) {
            p8.b bVar2 = (p8.b) fVar.f82452b;
            p8.d dVar = bVar2.f82431c;
            synchronized (dVar) {
                bVar2.close();
                y0VarB = dVar.b(bVar2.f82429a.f82420a);
            }
            fVar2 = y0VarB != null ? new je.f(y0VarB, 27) : null;
            if (fVar2 != null) {
                try {
                    try {
                        if (m0Var.f95556d != 304 || bVar == null) {
                            c0 c0VarQ = x7.f.q(c().m(((y0) fVar2.f69487b).n(0)));
                            try {
                                new w8.b(m0Var).a(c0VarQ);
                                unit = Unit.f71706a;
                                try {
                                    c0VarQ.close();
                                    th2 = null;
                                } catch (Throwable th4) {
                                    th2 = th4;
                                }
                            } catch (Throwable th5) {
                                try {
                                    c0VarQ.close();
                                } catch (Throwable th6) {
                                    ExceptionsKt.a(th5, th6);
                                }
                                th2 = th5;
                                unit = null;
                            }
                            if (th2 != null) {
                                throw th2;
                            }
                            Intrinsics.d(unit);
                            c0 c0VarQ2 = x7.f.q(c().m(((y0) fVar2.f69487b).n(1)));
                            try {
                                p0 p0Var = m0Var.f95559g;
                                Intrinsics.d(p0Var);
                                lValueOf = Long.valueOf(p0Var.source().O(c0VarQ2));
                                try {
                                    c0VarQ2.close();
                                } catch (Throwable th7) {
                                    th3 = th7;
                                }
                            } catch (Throwable th8) {
                                try {
                                    c0VarQ2.close();
                                } catch (Throwable th9) {
                                    ExceptionsKt.a(th8, th9);
                                }
                                th3 = th8;
                                lValueOf = null;
                            }
                            if (th3 != null) {
                                throw th3;
                            }
                            Intrinsics.d(lValueOf);
                        } else {
                            l0 l0VarD = m0Var.d();
                            l0VarD.c(ps.f.c(bVar.f94102f, m0Var.f95558f));
                            m0 m0VarA = l0VarD.a();
                            c0 c0VarQ3 = x7.f.q(c().m(((y0) fVar2.f69487b).n(0)));
                            try {
                                new w8.b(m0VarA).a(c0VarQ3);
                                unit2 = Unit.f71706a;
                                try {
                                    c0VarQ3.close();
                                } catch (Throwable th10) {
                                    th3 = th10;
                                }
                            } catch (Throwable th11) {
                                try {
                                    c0VarQ3.close();
                                } catch (Throwable th12) {
                                    ExceptionsKt.a(th11, th12);
                                }
                                th3 = th11;
                                unit2 = null;
                            }
                            if (th3 != null) {
                                throw th3;
                            }
                            Intrinsics.d(unit2);
                        }
                        p8.f fVarH = fVar2.h();
                        c9.g.a(m0Var);
                        return fVarH;
                    } catch (Exception e3) {
                        Bitmap.Config[] configArr = c9.g.f19862a;
                        try {
                            ((y0) fVar2.f69487b).h(false);
                        } catch (Exception unused) {
                        }
                        throw e3;
                    }
                } catch (Throwable th13) {
                    c9.g.a(m0Var);
                    throw th13;
                }
            }
        } else {
            p8.g gVar = (p8.g) this.f85644d.getValue();
            if (gVar != null) {
                this.f85642b.getClass();
                String str = this.f85641a;
                p8.d dVar2 = gVar.f82454b;
                m90.j jVar = m90.j.f76130d;
                y0 y0VarB2 = dVar2.b(lm.e.n(str).b("SHA-256").d());
                if (y0VarB2 != null) {
                    fVar2 = new je.f(y0VarB2, 27);
                }
                if (fVar2 != null) {
                }
            }
        }
        return null;
    }
}
