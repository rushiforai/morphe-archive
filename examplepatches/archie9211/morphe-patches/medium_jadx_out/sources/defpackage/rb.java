package defpackage;

import android.content.Context;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.util.List;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class rb implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ rb(ba8 ba8Var, List list, boolean z) {
        this.a = 2;
        this.c = ba8Var;
        this.b = z;
        this.d = list;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Throwable {
        int i = this.a;
        final int i2 = 3;
        final int i3 = 2;
        final int i4 = 1;
        Throwable th = null;
        c1e c1eVar = c1e.a;
        int i5 = 0;
        final boolean z = this.b;
        Object obj2 = this.d;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                Context context = (Context) obj;
                context.getClass();
                WebView webView = new WebView(context);
                webView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
                webView.setWebViewClient(new tb(0, (x45) obj3));
                webView.setWebChromeClient(new ub((g49) obj2));
                if (!z) {
                    WebSettings settings = webView.getSettings();
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(true);
                    settings.setUseWideViewPort(true);
                    settings.setBuiltInZoomControls(true);
                    settings.setDisplayZoomControls(false);
                }
                return webView;
            case 1:
                l78 l78Var = (l78) obj3;
                l78 l78Var2 = (l78) obj2;
                WebView webView2 = (WebView) obj;
                webView2.getClass();
                if (!z) {
                    l78Var.setValue(Boolean.valueOf(webView2.canGoBack()));
                    webView2.loadUrl((String) l78Var2.getValue());
                }
                return c1eVar;
            case 2:
                final ba8 ba8Var = (ba8) obj3;
                final List list = (List) obj2;
                cy6 cy6Var = new cy6() { // from class: kb3
                    @Override // defpackage.cy6
                    public final void f(iy6 iy6Var, ux6 ux6Var) {
                        boolean z2 = z;
                        List list2 = list;
                        ba8 ba8Var2 = ba8Var;
                        if (z2 && !list2.contains(ba8Var2)) {
                            list2.add(ba8Var2);
                        }
                        if (ux6Var == ux6.ON_START && !list2.contains(ba8Var2)) {
                            list2.add(ba8Var2);
                        }
                        if (ux6Var == ux6.ON_STOP) {
                            list2.remove(ba8Var2);
                        }
                    }
                };
                ba8Var.h.j.a(cy6Var);
                return new am0(ba8Var, 1, cy6Var);
            case 3:
                final gz8 gz8Var = (gz8) obj3;
                final sb2 sb2Var = (sb2) obj2;
                jyb jybVar = (jyb) obj;
                if (z) {
                    final int i6 = 0;
                    m45 m45Var = new m45() { // from class: ty8
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i6;
                            sb2 sb2Var2 = sb2Var;
                            gz8 gz8Var2 = gz8Var;
                            boolean z2 = false;
                            switch (i7) {
                                case 0:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 1:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 2:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                default:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                            }
                        }
                    };
                    fj6[] fj6VarArr = gyb.a;
                    jybVar.d(sxb.y, new i4(null, m45Var));
                    jybVar.d(sxb.A, new i4(null, new m45() { // from class: ty8
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i4;
                            sb2 sb2Var2 = sb2Var;
                            gz8 gz8Var2 = gz8Var;
                            boolean z2 = false;
                            switch (i7) {
                                case 0:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 1:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 2:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                default:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                            }
                        }
                    }));
                } else {
                    m45 m45Var2 = new m45() { // from class: ty8
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i3;
                            sb2 sb2Var2 = sb2Var;
                            gz8 gz8Var2 = gz8Var;
                            boolean z2 = false;
                            switch (i7) {
                                case 0:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 1:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 2:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                default:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                            }
                        }
                    };
                    fj6[] fj6VarArr2 = gyb.a;
                    jybVar.d(sxb.z, new i4(null, m45Var2));
                    jybVar.d(sxb.B, new i4(null, new m45() { // from class: ty8
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i2;
                            sb2 sb2Var2 = sb2Var;
                            gz8 gz8Var2 = gz8Var;
                            boolean z2 = false;
                            switch (i7) {
                                case 0:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 1:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                case 2:
                                    if (gz8Var2.c()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(0, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                                default:
                                    if (gz8Var2.d()) {
                                        vx0.c0(sb2Var2, null, null, new uy8(1, null, gz8Var2), 3);
                                        z2 = true;
                                    }
                                    return Boolean.valueOf(z2);
                            }
                        }
                    }));
                }
                return c1eVar;
            case 4:
                gqa gqaVar = (gqa) obj2;
                x45 x45Var = (x45) obj3;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                int i7 = 0;
                for (Object obj4 : gqaVar.a) {
                    int i8 = i7 + 1;
                    if (i7 < 0) {
                        Throwable th2 = th;
                        d46.i0();
                        throw th2;
                    }
                    int i9 = i5;
                    for (Object obj5 : ((eqa) obj4).a) {
                        int i10 = i9 + 1;
                        if (i9 < 0) {
                            Throwable th3 = th;
                            d46.i0();
                            throw th3;
                        }
                        pj8 pj8Var = (pj8) obj5;
                        Throwable th4 = th;
                        ev6.j(xu6Var, pj8Var.getName() + "_" + i7 + "_" + i9, new mz1(new pr3(pj8Var, z, x45Var, i2), true, 2077713188), 2);
                        i9 = i10;
                        th = th4;
                    }
                    Throwable th5 = th;
                    if (i7 < gqaVar.a.size() - 1) {
                        ev6.j(xu6Var, b09.w(i7, eoLmc.ywa), m40.f, 2);
                    }
                    i7 = i8;
                    th = th5;
                    i5 = 0;
                }
                return c1eVar;
            case 5:
                String str = (String) obj3;
                jhc jhcVar = (jhc) obj2;
                jyb jybVar2 = (jyb) obj;
                if (z) {
                    gyb.d(jybVar2, 0);
                }
                gyb.e(jybVar2, str);
                jybVar2.d(sxb.v, new i4(null, new dhc(jhcVar, 0)));
                return c1eVar;
            case 6:
                String str2 = (String) obj3;
                ihc ihcVar = (ihc) obj2;
                jyb jybVar3 = (jyb) obj;
                if (z) {
                    gyb.d(jybVar3, 0);
                }
                ehc ehcVar = new ehc(ihcVar, 0);
                fj6[] fj6VarArr3 = gyb.a;
                jybVar3.d(sxb.v, new i4(null, ehcVar));
                gyb.e(jybVar3, str2);
                return c1eVar;
            default:
                yo2 yo2Var = (yo2) obj;
                yo2Var.getClass();
                return new w6f((String) obj3, (String) obj2, z, new t51((ex1) ((ys2) yo2Var.a.e).b.W.get()));
        }
    }

    public /* synthetic */ rb(gqa gqaVar, boolean z, x45 x45Var) {
        this.a = 4;
        this.d = gqaVar;
        this.b = z;
        this.c = x45Var;
    }

    public /* synthetic */ rb(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
        this.d = obj2;
    }

    public /* synthetic */ rb(String str, String str2, boolean z) {
        this.a = 7;
        this.c = str;
        this.d = str2;
        this.b = z;
    }
}
