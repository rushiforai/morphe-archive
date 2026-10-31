package zp;

import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.LoginActivity;
import m.w;

/* loaded from: classes4.dex */
public final class a implements xp.a {

    /* renamed from: a, reason: collision with root package name */
    public d f98583a;

    /* renamed from: b, reason: collision with root package name */
    public w f98584b;

    @Override // xp.a
    public final boolean a(LoginActivity loginActivity, AuthorizationRequest authorizationRequest) {
        d dVar = new d(loginActivity, authorizationRequest);
        this.f98583a = dVar;
        dVar.f98590c = this.f98584b;
        dVar.show();
        return true;
    }

    @Override // xp.a
    public final void b(w wVar) {
        this.f98584b = wVar;
        d dVar = this.f98583a;
        if (dVar != null) {
            dVar.f98590c = wVar;
        }
    }

    @Override // xp.a
    public final void stop() {
        d dVar = this.f98583a;
        if (dVar != null) {
            if (dVar.f98592e) {
                dVar.dismiss();
            }
            this.f98583a = null;
        }
    }
}
