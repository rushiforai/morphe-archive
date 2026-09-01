package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z56 extends f49 {
    public final /* synthetic */ int z;

    @Override // defpackage.f49
    public wd5 s(Context context, Looper looper, uz5 uz5Var, Object obj, ce5 ce5Var, de5 de5Var) {
        switch (this.z) {
            case 2:
                Object obj2 = uz5Var.e;
                Integer num = (Integer) uz5Var.f;
                Bundle bundle = new Bundle();
                bundle.putParcelable("com.google.android.gms.signin.internal.clientRequestedAccount", null);
                if (num != null) {
                    bundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", num.intValue());
                }
                bundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", false);
                bundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", false);
                bundle.putString("com.google.android.gms.signin.internal.serverClientId", null);
                bundle.putBoolean("com.google.android.gms.signin.internal.usePromptModeForAuthCode", true);
                bundle.putBoolean("com.google.android.gms.signin.internal.forceCodeForRefreshToken", false);
                bundle.putString("com.google.android.gms.signin.internal.hostedDomain", null);
                bundle.putString("com.google.android.gms.signin.internal.logSessionId", null);
                bundle.putBoolean("com.google.android.gms.signin.internal.waitForAccessTokenRefresh", false);
                return new t9c(context, looper, uz5Var, bundle, ce5Var, de5Var);
            case 3:
                throw y30.k(obj);
            case 4:
            case 5:
            case 7:
            default:
                return super.s(context, looper, uz5Var, obj, ce5Var, de5Var);
            case 6:
                return new jkf(context, looper, uz5Var, (ikf) obj, (uif) ce5Var, (uif) de5Var);
            case 8:
                return new kkf(context, looper, uz5Var, (GoogleSignInOptions) obj, (uif) ce5Var, (uif) de5Var);
        }
    }

    @Override // defpackage.f49
    public wd5 t(Context context, Looper looper, uz5 uz5Var, Object obj, uif uifVar, uif uifVar2) {
        switch (this.z) {
            case 0:
                context.getClass();
                looper.getClass();
                ((ry) obj).getClass();
                return new tv5(context, looper, 352, uz5Var, uifVar, uifVar2);
            case 1:
                context.getClass();
                looper.getClass();
                ((ry) obj).getClass();
                return new rib(context, looper, 381, uz5Var, uifVar, uifVar2);
            case 2:
            case 3:
            case 6:
            case 8:
            default:
                return super.t(context, looper, uz5Var, obj, uifVar, uifVar2);
            case 4:
                return new sif(context, looper, 449, uz5Var, uifVar, uifVar2);
            case 5:
                return new wjf(context, looper, uz5Var, (fgd) obj, uifVar, uifVar2);
            case 7:
                return new dkf(context, looper, uz5Var, uifVar, uifVar2);
            case 9:
                context.getClass();
                looper.getClass();
                ((ry) obj).getClass();
                return new neg(context, looper, 380, uz5Var, uifVar, uifVar2);
        }
    }
}
