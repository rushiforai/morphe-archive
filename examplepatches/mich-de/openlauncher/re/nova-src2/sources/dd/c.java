package dd;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.ViewParent;
import android.view.Window;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import c4.z;
import i2.r0;
import j2.d;
import kotlin.jvm.internal.Intrinsics;
import p1.n;
import p1.o;
import p1.t;
import p1.z2;

/* loaded from: classes3.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final long f49223a = r0.a(0.0f, 0.0f, 0.0f, 0.3f, d.f68662e);

    /* renamed from: b, reason: collision with root package name */
    public static final b f49224b = b.f49222j;

    public static final a a(o oVar) {
        t tVar = (t) oVar;
        tVar.c0(-715745933);
        tVar.c0(1009281237);
        z2 z2Var = AndroidCompositionLocals_androidKt.f14170f;
        ViewParent parent = ((View) tVar.j(z2Var)).getParent();
        Window window = null;
        z zVar = parent instanceof z ? (z) parent : null;
        Window window2 = zVar != null ? zVar.getWindow() : null;
        if (window2 == null) {
            Context context = ((View) tVar.j(z2Var)).getContext();
            Intrinsics.f(context, "getContext(...)");
            while (true) {
                if (!(context instanceof Activity)) {
                    if (!(context instanceof ContextWrapper)) {
                        break;
                    }
                    context = ((ContextWrapper) context).getBaseContext();
                    Intrinsics.f(context, "getBaseContext(...)");
                } else {
                    window = ((Activity) context).getWindow();
                    break;
                }
            }
            window2 = window;
        }
        tVar.p(false);
        View view = (View) tVar.j(AndroidCompositionLocals_androidKt.f14170f);
        tVar.c0(-1044852491);
        boolean zF = tVar.f(view) | tVar.f(window2);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new a(view, window2);
            tVar.m0(objP);
        }
        a aVar = (a) objP;
        tVar.p(false);
        tVar.p(false);
        return aVar;
    }
}
