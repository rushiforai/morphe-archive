package n6;

import com.google.android.gms.auth.api.signin.internal.SignInHubActivity;
import h6.n0;

/* loaded from: classes2.dex */
public final class c implements n0 {

    /* renamed from: a, reason: collision with root package name */
    public final je.f f77897a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f77898b = false;

    public c(mg.d dVar, je.f fVar) {
        this.f77897a = fVar;
    }

    @Override // h6.n0
    public final void onChanged(Object obj) {
        this.f77898b = true;
        je.f fVar = this.f77897a;
        fVar.getClass();
        SignInHubActivity signInHubActivity = (SignInHubActivity) fVar.f69487b;
        signInHubActivity.setResult(signInHubActivity.f31766r, signInHubActivity.f31767s);
        signInHubActivity.finish();
    }

    public final String toString() {
        return this.f77897a.toString();
    }
}
