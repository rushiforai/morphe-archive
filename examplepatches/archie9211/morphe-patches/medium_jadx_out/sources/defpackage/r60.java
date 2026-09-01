package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.medium.android.susi.ui.apple.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class r60 implements x45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;

    public /* synthetic */ r60(kx6 kx6Var, boolean z, zid zidVar, uid uidVar, ry5 ry5Var, yqa yqaVar, lid lidVar, sb2 sb2Var, qy0 qy0Var) {
        this.c = kx6Var;
        this.b = z;
        this.d = zidVar;
        this.e = uidVar;
        this.f = ry5Var;
        this.g = yqaVar;
        this.h = lidVar;
        this.i = sb2Var;
        this.j = qy0Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        rjd rjdVarD;
        int i = this.a;
        Object obj2 = this.j;
        Object obj3 = this.i;
        Object obj4 = this.h;
        Object obj5 = this.g;
        Object obj6 = this.f;
        Object obj7 = this.e;
        Object obj8 = this.d;
        boolean z = this.b;
        Object obj9 = this.c;
        switch (i) {
            case 0:
                l78 l78Var = (l78) obj9;
                l78 l78Var2 = (l78) obj5;
                Context context = (Context) obj;
                context.getClass();
                WebView webView = new WebView(context);
                webView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
                webView.setWebViewClient(new s60(l78Var, (l78) obj8, (l78) obj7, (l78) obj6, (Uri) obj4, (a) obj3));
                webView.setWebChromeClient(new t60((g49) obj2, l78Var, 0));
                if (!z) {
                    WebSettings settings = webView.getSettings();
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(true);
                    settings.setUseWideViewPort(true);
                    settings.setDatabaseEnabled(true);
                }
                l78Var2.setValue(webView);
                return webView;
            default:
                kx6 kx6Var = (kx6) obj9;
                zid zidVar = (zid) obj8;
                uid uidVar = (uid) obj7;
                ry5 ry5Var = (ry5) obj6;
                yqa yqaVar = (yqa) obj5;
                lid lidVar = (lid) obj4;
                sb2 sb2Var = (sb2) obj3;
                qy0 qy0Var = (qy0) obj2;
                zr4 zr4Var = (zr4) obj;
                if (kx6Var.b() != zr4Var.isFocused()) {
                    kx6Var.f.setValue(Boolean.valueOf(zr4Var.isFocused()));
                    if (kx6Var.b() && z) {
                        rv8.P(zidVar, kx6Var, uidVar, ry5Var, yqaVar);
                    } else {
                        rv8.w(kx6Var);
                    }
                    if (zr4Var.isFocused() && (rjdVarD = kx6Var.d()) != null) {
                        vx0.c0(sb2Var, null, null, new b9(qy0Var, uidVar, kx6Var, rjdVarD, yqaVar, (n92) null, 14), 3);
                    }
                    if (!zr4Var.isFocused()) {
                        lidVar.d(null);
                    }
                }
                return c1e.a;
        }
    }

    public /* synthetic */ r60(l78 l78Var, l78 l78Var2, l78 l78Var3, l78 l78Var4, l78 l78Var5, g49 g49Var, Uri uri, a aVar, boolean z) {
        this.b = z;
        this.c = l78Var;
        this.d = l78Var2;
        this.e = l78Var3;
        this.f = l78Var4;
        this.h = uri;
        this.i = aVar;
        this.j = g49Var;
        this.g = l78Var5;
    }
}
