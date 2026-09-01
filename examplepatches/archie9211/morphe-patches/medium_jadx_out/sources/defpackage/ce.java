package defpackage;

import android.content.res.Resources;
import android.graphics.Rect;
import android.os.CancellationSignal;
import java.io.File;
import java.io.FileFilter;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ce extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ce(int i, Object obj) {
        super(1);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        n92 n92Var = null;
        int i2 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                de deVar = (de) obj;
                bq6 bq6Var = (bq6) obj2;
                if (deVar.l() != Integer.MAX_VALUE) {
                    if (deVar.c().b) {
                        deVar.C();
                    }
                    for (Map.Entry entry : deVar.c().i.entrySet()) {
                        bq6Var.a((yd) entry.getKey(), ((Number) entry.getValue()).intValue(), deVar.e());
                    }
                    eh8 eh8Var = deVar.e().q;
                    eh8Var.getClass();
                    while (!eh8Var.equals(bq6Var.a.e())) {
                        for (yd ydVar : bq6Var.b(eh8Var).keySet()) {
                            bq6Var.a(ydVar, bq6Var.c(eh8Var, ydVar), eh8Var);
                        }
                        eh8Var = eh8Var.q;
                        eh8Var.getClass();
                    }
                }
                return c1eVar;
            case 1:
                return Boolean.valueOf(((es4) obj).P0(((br4) obj2).a));
            case 2:
                cb7 cb7Var = (cb7) obj;
                mn mnVar = ((ym) obj2).p;
                if (mnVar.getInsetsListener().h.g() > 0) {
                    k68 k68Var = j5f.a;
                    long j = cb7Var.a().j();
                    f78 f78Var = mnVar.getInsetsListener().g;
                    int i3 = (int) (j >> 32);
                    int i4 = (int) (j & 4294967295L);
                    for (h5f h5fVar : j5f.b) {
                        Object objG = f78Var.g(h5fVar);
                        objG.getClass();
                        u5f u5fVar = (u5f) objG;
                        j5f.a(cb7Var, ((i5f) h5fVar).c, u5fVar.h, i3, i4);
                        if (((Boolean) u5fVar.b.getValue()).booleanValue()) {
                            j5f.a(cb7Var, u5fVar.f, u5fVar.j, i3, i4);
                            j5f.a(cb7Var, u5fVar.g, u5fVar.k, i3, i4);
                        }
                        j5f.a(cb7Var, ((i5f) h5fVar).d, u5fVar.i, i3, i4);
                    }
                    x68 x68Var = mnVar.getInsetsListener().i;
                    if (x68Var.i()) {
                        ejc ejcVar = mnVar.getInsetsListener().j;
                        Object[] objArr = x68Var.a;
                        int i5 = x68Var.b;
                        while (i2 < i5) {
                            l78 l78Var = (l78) objArr[i2];
                            m26 m26Var = (m26) ejcVar.get(i2);
                            Rect rect = (Rect) l78Var.getValue();
                            cb7Var.c(m26Var.b(), rect.left);
                            cb7Var.c(m26Var.d(), rect.top);
                            cb7Var.c(m26Var.c(), rect.right);
                            cb7Var.c(m26Var.a(), rect.bottom);
                            i2++;
                        }
                    }
                }
                return c1eVar;
            case 3:
                return Boolean.valueOf(((i46) obj2).a(((zxb) obj).f));
            case 4:
                return Boolean.valueOf(bo.X((zxb) obj, (Resources) obj2));
            case 5:
                ((aq6) obj2).Z((m73) obj);
                return c1eVar;
            case 6:
                return Boolean.valueOf(g76.L(obj, obj2));
            case 7:
                obj.getClass();
                return Boolean.valueOf(super/*java.util.concurrent.LinkedBlockingQueue*/.offer(obj));
            case 8:
                zwa zwaVar = (zwa) obj;
                ny0 ny0Var = (ny0) obj2;
                if (ny0Var.n) {
                    vx0.c0(ny0Var.u0(), null, null, new j0(ny0Var, zwaVar, n92Var, 28), 3);
                }
                return c1eVar;
            case 9:
                cx cxVar = (cx) obj;
                float f = cxVar.b;
                if (f < 0.0f) {
                    f = 0.0f;
                }
                if (f > 1.0f) {
                    f = 1.0f;
                }
                float f2 = cxVar.c;
                if (f2 < -0.5f) {
                    f2 = -0.5f;
                }
                if (f2 > 0.5f) {
                    f2 = 0.5f;
                }
                float f3 = cxVar.d;
                float f4 = f3 >= -0.5f ? f3 : -0.5f;
                float f5 = f4 <= 0.5f ? f4 : 0.5f;
                float f6 = cxVar.a;
                float f7 = f6 >= 0.0f ? f6 : 0.0f;
                return new uu1(uu1.a(op8.i(f, f2, f5, f7 <= 1.0f ? f7 : 1.0f, lv1.x), (jv1) obj2));
            case 10:
                if (((Throwable) obj) != null) {
                    ((CancellationSignal) obj2).cancel();
                }
                return c1eVar;
            case 11:
                return new u7(6, (ai3) obj2);
            case 12:
                tjb tjbVar = (tjb) obj;
                i3f i3fVar = (i3f) obj2;
                if (!Float.isNaN(i3fVar.f) || !Float.isNaN(i3fVar.g)) {
                    tjbVar.s(mq7.r(Float.isNaN(i3fVar.f) ? 0.5f : i3fVar.f, Float.isNaN(i3fVar.g) ? 0.5f : i3fVar.g));
                }
                if (!Float.isNaN(i3fVar.h)) {
                    tjbVar.h(i3fVar.h);
                }
                if (!Float.isNaN(i3fVar.i)) {
                    tjbVar.i(i3fVar.i);
                }
                if (!Float.isNaN(i3fVar.j)) {
                    tjbVar.j(i3fVar.j);
                }
                if (!Float.isNaN(i3fVar.k)) {
                    tjbVar.t(i3fVar.k);
                }
                if (!Float.isNaN(i3fVar.l)) {
                    tjbVar.v(i3fVar.l);
                }
                if (!Float.isNaN(i3fVar.m)) {
                    tjbVar.m(i3fVar.m);
                }
                if (!Float.isNaN(i3fVar.n) || !Float.isNaN(i3fVar.o)) {
                    tjbVar.k(Float.isNaN(i3fVar.n) ? 1.0f : i3fVar.n);
                    tjbVar.l(Float.isNaN(i3fVar.o) ? 1.0f : i3fVar.o);
                }
                if (!Float.isNaN(i3fVar.p)) {
                    tjbVar.c(i3fVar.p);
                }
                return c1eVar;
            case 13:
                return Boolean.valueOf(!g76.L(obj, ((dsd) obj2).d.getValue()));
            case 14:
                ((tjb) obj).c(((Number) ((upc) obj2).getValue()).floatValue());
                return c1eVar;
            case 15:
                Throwable th = (Throwable) obj;
                mu2 mu2Var = (mu2) obj2;
                w5d w5dVar = mu2Var.j;
                if (th != null) {
                    mu2Var.h.y(new ai4(th));
                }
                if (w5dVar.a()) {
                    ((zg4) w5dVar.getValue()).close();
                }
                return c1eVar;
            case 16:
                dk3 dk3Var = (dk3) obj;
                if (!dk3Var.a.n) {
                    return rsd.SkipSubtreeAndContinueTraversal;
                }
                dk3 dk3Var2 = dk3Var.p;
                if (dk3Var2 != null) {
                    ce ceVar = new ce(16, (md5) obj2);
                    if (ceVar.invoke(dk3Var2) == rsd.ContinueTraversal) {
                        br7.C(dk3Var2, ceVar);
                    }
                }
                dk3Var.p = null;
                dk3Var.o = null;
                return rsd.ContinueTraversal;
            case 17:
                File file = (File) obj;
                file.getClass();
                return file.listFiles((FileFilter) obj2);
            case 18:
                File file2 = (File) obj;
                file2.getClass();
                return oh4.K0(file2, (Charset) obj2);
            case 19:
                File file3 = (File) obj;
                file3.getClass();
                return Boolean.valueOf(file3.renameTo((File) obj2));
            case 20:
                if (td5.b.compareAndSet(false, true)) {
                    ((uz0) obj2).e(c1eVar);
                }
                return c1eVar;
            case 21:
                String str = (String) obj;
                Object objOpt = ((JSONObject) obj2).opt(str);
                if (objOpt == null) {
                    return null;
                }
                try {
                    return URLEncoder.encode(str, "UTF-8") + '=' + URLEncoder.encode(objOpt.toString(), "UTF-8");
                } catch (Exception unused) {
                    return null;
                }
            case 22:
                zl3 zl3Var = (zl3) obj;
                of5 of5Var = (of5) obj2;
                br brVar = of5Var.l;
                if (of5Var.n && of5Var.w && brVar != null) {
                    m50 m50VarB0 = zl3Var.b0();
                    long jB = m50VarB0.B();
                    m50VarB0.x().h();
                    try {
                        ((m50) ((md5) m50VarB0.b).b).x().n(brVar);
                        of5Var.d(zl3Var);
                    } finally {
                        y30.x(m50VarB0, jB);
                    }
                } else {
                    of5Var.d(zl3Var);
                }
                return c1eVar;
            case 23:
                zl3 zl3Var2 = (zl3) obj;
                e61 e61VarX = zl3Var2.b0().x();
                b55 b55Var = ((rf5) obj2).d;
                if (b55Var != null) {
                    b55Var.invoke(e61VarX, (of5) zl3Var2.b0().c);
                }
                return c1eVar;
            case 24:
                zpe zpeVar = (zpe) obj;
                wg5 wg5Var = (wg5) obj2;
                wg5Var.g(zpeVar);
                x45 x45Var = wg5Var.i;
                if (x45Var != null) {
                    x45Var.invoke(zpeVar);
                }
                return c1eVar;
            case 25:
                yl8 yl8Var = (yl8) obj;
                xwa xwaVar = yl8Var.b;
                if (xwaVar != null) {
                    yl8Var.a(xwaVar);
                    yl8Var.b = null;
                }
                t26 t26Var = (t26) obj2;
                o78 o78Var = t26Var.d;
                Object[] objArr2 = o78Var.a;
                int i6 = o78Var.c;
                while (true) {
                    if (i2 >= i6) {
                        i2 = -1;
                    } else if (!g76.L((e1f) objArr2[i2], yl8Var)) {
                        i2++;
                    }
                }
                if (i2 >= 0) {
                    o78Var.m(i2);
                }
                if (o78Var.c == 0) {
                    t26Var.b.invoke();
                }
                return c1eVar;
            case 26:
                ((d37) obj2).cancel(false);
                return c1eVar;
            case 27:
                File file4 = (File) obj;
                file4.getClass();
                return new p58(((k92) obj2).a, file4);
            case 28:
                ((o78) obj2).b((p28) obj);
                return Boolean.TRUE;
            default:
                return obj == ((x68) obj2) ? "(this)" : String.valueOf(obj);
        }
    }
}
