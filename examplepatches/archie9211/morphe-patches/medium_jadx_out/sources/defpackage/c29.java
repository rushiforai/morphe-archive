package defpackage;

import android.content.Context;
import android.net.Uri;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class c29 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ n39 b;

    public /* synthetic */ c29(n39 n39Var, int i) {
        this.a = i;
        this.b = n39Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        n39 n39Var = this.b;
        switch (i) {
            case 0:
                Context context = (Context) obj;
                context.getClass();
                ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, mk7.x(n39Var.m.O()));
                FrameLayout frameLayout = new FrameLayout(context);
                LayoutInflater.from(contextThemeWrapper).inflate(n19.a(n39Var.b, n39Var.c), (ViewGroup) frameLayout, true);
                return frameLayout;
            case 1:
                Uri uri = (Uri) obj;
                uri.getClass();
                f09 f09VarA = j07.a(n39Var.d);
                LinkedHashMap linkedHashMapS = ei7.S((Map) f09VarA.a, (Map) f09VarA.b);
                ev9 ev9Var = n39Var.f;
                Uri uri2 = (Uri) linkedHashMapS.get(uri.toString());
                if (uri2 != null) {
                    uri = uri2;
                }
                ev9Var.a(uri);
                return c1e.a;
            default:
                j09 j09Var = (j09) obj;
                j09Var.getClass();
                j09Var.b(n39Var.b);
                return j09Var.a();
        }
    }
}
