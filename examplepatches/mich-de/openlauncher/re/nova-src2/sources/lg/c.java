package lg;

import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Status;
import qg.k;

/* loaded from: classes3.dex */
public final class c implements k {

    /* renamed from: a, reason: collision with root package name */
    public final Status f74932a;

    /* renamed from: b, reason: collision with root package name */
    public final GoogleSignInAccount f74933b;

    public c(GoogleSignInAccount googleSignInAccount, Status status) {
        this.f74933b = googleSignInAccount;
        this.f74932a = status;
    }

    @Override // qg.k
    public final Status h() {
        return this.f74932a;
    }
}
