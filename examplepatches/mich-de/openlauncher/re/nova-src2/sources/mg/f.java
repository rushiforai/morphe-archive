package mg;

import android.content.Context;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public final class f extends b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f76296b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ GoogleSignInOptions f76297c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ g f76298d;

    public f(g gVar, Context context, GoogleSignInOptions googleSignInOptions) {
        this.f76296b = context;
        this.f76297c = googleSignInOptions;
        this.f76298d = gVar;
    }

    @Override // mg.b, mg.m
    public final void j(GoogleSignInAccount googleSignInAccount, Status status) {
        if (googleSignInAccount != null) {
            Context context = this.f76296b;
            GoogleSignInOptions googleSignInOptions = this.f76297c;
            l lVarX = l.x(context);
            synchronized (lVarX) {
                ((a) lVarX.f76309b).c(googleSignInAccount, googleSignInOptions);
                lVarX.f76310c = googleSignInAccount;
                lVarX.f76311d = googleSignInOptions;
            }
        }
        this.f76298d.C(new lg.c(googleSignInAccount, status));
    }
}
