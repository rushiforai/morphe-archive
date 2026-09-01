package defpackage;

import android.net.Uri;
import android.webkit.CookieManager;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j2f implements d40 {
    public final String a;
    public final w5d b;
    public final u3 c;
    public final kb2 d;
    public final sb2 e;
    public final hx4 f;

    public j2f(String str, u3 u3Var, kb2 kb2Var, sb2 sb2Var, hx4 hx4Var) {
        str.getClass();
        w5d w5dVar = new w5d(new tkc(19));
        this.a = str;
        this.b = w5dVar;
        this.c = u3Var;
        this.d = kb2Var;
        this.e = sb2Var;
        this.f = hx4Var;
    }

    public static String a(aa2 aa2Var) {
        String string = new Uri.Builder().authority(aa2Var.d).scheme(aa2Var.f ? "https" : "http").build().toString();
        string.getClass();
        return string;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.d40
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object N(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.g2f
            if (r0 == 0) goto L13
            r0 = r6
            g2f r0 = (defpackage.g2f) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            g2f r0 = new g2f
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r6)
            goto L43
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            obb r6 = new obb
            r2 = 26
            r6.<init>(r5, r3, r2)
            r0.d = r4
            kb2 r2 = r5.d
            java.lang.Object r6 = defpackage.vx0.m0(r2, r6, r0)
            if (r6 != r1) goto L43
            return r1
        L43:
            ood r6 = new ood
            r0 = 5
            r6.<init>(r5, r3, r0)
            r0 = 3
            sb2 r5 = r5.e
            defpackage.vx0.c0(r5, r3, r3, r6, r0)
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j2f.N(p92):java.lang.Object");
    }

    @Override // defpackage.ba2
    public final List P(qt5 qt5Var) {
        qt5Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.d40
    public final void clear() {
        CookieManager cookieManager = (CookieManager) this.b.getValue();
        if (cookieManager != null) {
            cookieManager.removeAllCookies(null);
        }
    }

    @Override // defpackage.ba2
    public final void z(qt5 qt5Var, List list) {
        qt5Var.getClass();
        CookieManager cookieManager = (CookieManager) this.b.getValue();
        if (cookieManager != null && g76.L(qt5Var.i(), this.a)) {
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                aa2 aa2Var = (aa2) it2.next();
                cookieManager.setCookie(a(aa2Var), aa2Var.toString());
            }
            cookieManager.flush();
        }
    }
}
