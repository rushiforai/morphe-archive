package e10;

import android.content.Context;
import android.content.pm.PackageManager;
import android.provider.Settings;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Context context, ContinuationImpl continuationImpl) throws Throwable {
        u0 u0Var;
        if (continuationImpl instanceof u0) {
            u0Var = (u0) continuationImpl;
            int i5 = u0Var.f51838w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u0Var.f51838w = i5 - Integer.MIN_VALUE;
            } else {
                u0Var = new u0(this, continuationImpl);
            }
        }
        Object objY = u0Var.f51836u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u0Var.f51838w;
        int i12 = 0;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objY);
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            a80.e eVar = t70.y0.f88884a;
            a80.d dVar = a80.d.f488c;
            v0 v0Var = new v0(packageManager, continuation, i12);
            u0Var.f51835t = context;
            u0Var.f51838w = 1;
            objY = t70.m0.y(dVar, v0Var, u0Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            context = u0Var.f51835t;
            ResultKt.b(objY);
        }
        if (!Intrinsics.b((String) objY, "com.teslacoilsw.launcher")) {
            return new x0(context.getString(2132020351), context.getString(2132020352), new ar.c(context, 23));
        }
        if (Settings.Global.getInt(context.getContentResolver(), "always_finish_activities", 0) == 1) {
            return new x0(context.getString(2132017757), context.getString(2132020348), new ar.c(context, 24));
        }
        return null;
    }
}
