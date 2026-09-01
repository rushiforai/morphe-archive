package defpackage;

import android.content.Context;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ey0 implements x45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ ey0(int i, int i2, yv5 yv5Var, x45 x45Var, d28 d28Var, xv5 xv5Var) {
        this.b = i;
        this.c = i2;
        this.d = yv5Var;
        this.e = x45Var;
        this.f = d28Var;
        this.g = xv5Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                dy0.d((s99) obj, (t99) obj5, (tk7) obj4, ((bl7) obj3).getLayoutDirection(), this.b, this.c, ((gy0) obj2).a);
                return c1e.a;
            default:
                yv5 yv5Var = (yv5) obj5;
                x45 x45Var = (x45) obj4;
                Context context = (Context) obj;
                context.getClass();
                cw5 cw5Var = new cw5(context);
                cw5Var.setLayoutParams(new ViewGroup.LayoutParams(this.b, this.c));
                cw5Var.setWebViewClient(new uv5((d28) obj3, x45Var, (xv5) obj2));
                cw5Var.addJavascriptInterface(new vv5(cw5Var), "donkey");
                cw5Var.setWebChromeClient(new WebChromeClient());
                WebSettings settings = cw5Var.getSettings();
                settings.setJavaScriptEnabled(true);
                settings.setDomStorageEnabled(true);
                String strX = ev6.x(yv5Var.b, "/media/", yv5Var.a);
                String strConcat = "loading url: ".concat(strX);
                km4.I(wld.a, null, strConcat, new Object[0], strConcat);
                cw5Var.loadUrl(strX);
                boolean z = !yv5Var.e;
                cw5Var.setClickable(z);
                cw5Var.setFocusable(z);
                cw5Var.setFocusableInTouchMode(z);
                cw5Var.setDuplicateParentStateEnabled(true);
                x45Var.invoke(d28.LOADING);
                return cw5Var;
        }
    }

    public /* synthetic */ ey0(t99 t99Var, tk7 tk7Var, bl7 bl7Var, int i, int i2, gy0 gy0Var) {
        this.d = t99Var;
        this.e = tk7Var;
        this.f = bl7Var;
        this.b = i;
        this.c = i2;
        this.g = gy0Var;
    }
}
