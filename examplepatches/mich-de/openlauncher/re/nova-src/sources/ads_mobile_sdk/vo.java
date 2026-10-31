package ads_mobile_sdk;

import ab.e0;
import android.content.Context;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class vo {

    /* renamed from: a, reason: collision with root package name */
    public final Context f10834a;

    /* renamed from: b, reason: collision with root package name */
    public final bs3 f10835b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f10836c;

    public vo(Context context, bs3 bs3Var, jr0 jr0Var) {
        Intrinsics.g(context, "context");
        this.f10834a = context;
        this.f10835b = bs3Var;
        this.f10836c = jr0Var;
    }

    public final void a(zv executor, boolean z11, gq3 gq3Var) {
        Set setF1;
        jr0 jr0Var = this.f10836c;
        Intrinsics.g(executor, "executor");
        try {
            Boolean bool = Boolean.TRUE;
            jn jnVar = jn.a$10;
            setF1 = (((Boolean) jr0Var.a("gads:webview_profile:enabled", bool, jnVar)).booleanValue() && ((Boolean) jr0Var.a("gads:init_profile_during_webview_startup:enabled", Boolean.FALSE, jnVar)).booleanValue()) ? kotlin.collections.c.f1(new String[]{"GMA_WEBVIEW_PROFILE", "Default"}) : e0.U("Default");
        } catch (Throwable unused) {
            setF1 = EmptySet.f71734a;
        }
        AtomicBoolean atomicBoolean = lp3.f6929a;
        lp3.a(this.f10834a, executor, z11, setF1, gq3Var);
    }
}
