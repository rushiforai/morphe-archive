package defpackage;

import com.google.android.gms.auth.api.signin.internal.SignInHubActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p57 implements kn8 {
    public final ujf a;
    public boolean b = false;

    public p57(gkf gkfVar, ujf ujfVar) {
        this.a = ujfVar;
    }

    @Override // defpackage.kn8
    public final void onChanged(Object obj) {
        this.b = true;
        SignInHubActivity signInHubActivity = (SignInHubActivity) this.a.b;
        signInHubActivity.setResult(signInHubActivity.i, signInHubActivity.j);
        signInHubActivity.finish();
    }

    public final String toString() {
        return this.a.toString();
    }
}
