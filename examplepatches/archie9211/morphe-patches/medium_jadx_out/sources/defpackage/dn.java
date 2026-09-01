package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import com.medium.android.core.navigation.s;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dn extends x55 implements c55 {
    public final /* synthetic */ int a = 1;

    public dn(p13 p13Var) {
        super(3, 0, s.class, p13Var, "navigateToExternalWebView", "navigateToExternalWebView(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V");
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        switch (this.a) {
            case 0:
                if (obj != null) {
                    rd6.m();
                    return null;
                }
                mn mnVar = (mn) this.receiver;
                Resources resources = mnVar.getContext().getResources();
                z02 z02Var = new z02(new p73(resources.getDisplayMetrics().density, resources.getConfiguration().fontScale), ((dfc) obj2).a, (x45) obj3);
                if (Build.VERSION.SDK_INT >= 24) {
                    return Boolean.valueOf(wn.a.a(mnVar, null, z02Var));
                }
                throw null;
            default:
                Context context = (Context) obj;
                Uri uri = (Uri) obj2;
                String str = (String) obj3;
                context.getClass();
                uri.getClass();
                str.getClass();
                ((p13) ((s) this.receiver)).f(context, uri, str);
                return c1e.a;
        }
    }
}
