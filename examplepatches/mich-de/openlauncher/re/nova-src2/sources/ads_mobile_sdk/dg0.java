package ads_mobile_sdk;

import android.net.Uri;
import b.e6;
import b.r0;
import java.net.URL;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class dg0 implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f2499a;

    /* renamed from: b, reason: collision with root package name */
    public final xj f2500b;

    /* renamed from: c, reason: collision with root package name */
    public final e6 f2501c;

    /* renamed from: d, reason: collision with root package name */
    public final rf0 f2502d;

    public dg0(jr0 flags, xj appState, e6 httpClient, rf0 debugDialogManager) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(debugDialogManager, "debugDialogManager");
        this.f2499a = flags;
        this.f2500b = appState;
        this.f2501c = httpClient;
        this.f2502d = debugDialogManager;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x009e, code lost:
    
        if (b.e6.b(r7, r10, null, r9, 30) == r0) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.r0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(d33 d33Var, z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        cg0 cg0Var;
        dg0 dg0Var;
        if (continuation instanceof cg0) {
            cg0Var = (cg0) continuation;
            int i5 = cg0Var.f1857d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cg0Var.f1857d = i5 - Integer.MIN_VALUE;
            } else {
                cg0Var = new cg0(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = cg0Var.f1855b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = cg0Var.f1857d;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (!this.f2500b.f11739h.get() || z1Var.A.f34795a.isEmpty()) {
                return Unit.f71706a;
            }
            jr0 jr0Var = this.f2499a;
            jr0Var.getClass();
            String str = (String) jr0Var.a("gads:drx_debug:send_debug_data_url", "https://www.google.com/dfp/sendDebugData", u.a$7);
            String strL = d33Var.f2165a.f10559a.l();
            com.google.gson.r rVar = z1Var.A;
            cg0Var.f1854a = this;
            cg0Var.f1857d = 1;
            w81 w81Var = this.f2502d.f9160j;
            w81Var.getClass();
            objA = w81.a(w81Var, str, strL, rVar, cg0Var);
            if (objA != obj) {
                dg0Var = this;
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        dg0Var = cg0Var.f1854a;
        ResultKt.b(objA);
        String string = ((Uri) objA).toString();
        Intrinsics.f(string, "toString(...)");
        e6 e6Var = dg0Var.f2501c;
        URL url = new URL(string);
        cg0Var.f1854a = null;
        cg0Var.f1857d = 2;
    }
}
