package ads_mobile_sdk;

import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import ni.w;
import t70.m0;

/* loaded from: classes2.dex */
public final class zi3 {

    /* renamed from: a, reason: collision with root package name */
    public static final zi3 f12548a = new zi3();

    public static void a(Exception exc) {
        th3 th3VarA = ji3.a();
        th3VarA.a(exc);
        ArrayList arrayList = th3VarA.e().f1803s;
        String message = exc.getMessage();
        if (message == null) {
            message = exc.getClass().getName();
        }
        arrayList.add(message);
    }

    public static void b(Exception exc) {
        a(null, exc, true, false);
    }

    public static void a(String message) {
        Intrinsics.g(message, "message");
        th3 th3VarA = ji3.a();
        th3VarA.e().f1799m = false;
        th3VarA.e().f1803s.add(message);
    }

    public static t70.g2 a(t70.j0 j0Var, Function2 function2) {
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        return m0.t(j0Var, context, null, new ar.a(function2, null), 2);
    }

    public static void a(pu0 error, boolean z11) {
        String strF;
        Intrinsics.g(error, "error");
        if (error instanceof tu0) {
            strF = ((tu0) error).f10084c;
        } else if (error instanceof qu0) {
            qu0 qu0Var = (qu0) error;
            String str = qu0Var.f8813e;
            strF = str == null ? qu0Var.f8811c.getClass().getName() : str;
        } else if (error instanceof bv0) {
            strF = "WebView destroyed when method invoked.";
        } else if (error instanceof zu0) {
            zu0 zu0Var = (zu0) error;
            strF = zu0Var.f12666c + ": " + zu0Var.f12667d + " on url: " + zu0Var.f12668e;
        } else if (error instanceof su0) {
            w wVar = ((su0) error).f9692c;
            strF = wVar.b0() + ": " + wVar.getCom.bytedance.sdk.component.pglcrypt.PglCryptUtils.KEY_MESSAGE java.lang.String();
        } else if (error instanceof ru0) {
            ru0 ru0Var = (ru0) error;
            strF = a80.m.f(ru0Var.f9315c, "Code: ", ", Message: ", ru0Var.f9316d);
        } else if (error instanceof wu0) {
            strF = ((wu0) error).f11412c;
        } else if (error instanceof uu0) {
            strF = ((uu0) error).f10486c;
        } else if (error instanceof yu0) {
            strF = ((yu0) error).f12285c;
        } else if (error instanceof av0) {
            strF = "Live WebView cap reached. Too many WebViews are currently open in the application.";
        } else if (error instanceof vu0) {
            strF = ((vu0) error).f10896c;
        } else {
            throw new NoWhenBranchMatchedException();
        }
        a(strF, error.b(), false, z11);
    }

    public static /* synthetic */ void a(pu0 pu0Var) {
        a(pu0Var, false);
    }

    public static void a(int i5, String message, Throwable th2) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        Intrinsics.g(message, "message");
        a(message, th2, true, false);
    }

    public static void a(String str, Throwable th2, boolean z11, boolean z12) {
        th3 th3VarA;
        if (z12) {
            th3VarA = ji3.b().f4777a;
            if (th3VarA == null) {
                return;
            }
        } else {
            th3VarA = ji3.a();
        }
        if (str != null) {
            th3VarA.e().f1803s.add(str);
        }
        th3VarA.e().f1799m = false;
        if (th2 != null) {
            if (z11) {
                th3VarA.a(th2);
            } else {
                th3VarA.b(th2);
            }
        }
    }
}
