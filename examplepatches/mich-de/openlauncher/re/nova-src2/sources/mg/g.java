package mg;

import android.content.Context;
import android.os.Parcel;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Status;
import rg.r;

/* loaded from: classes3.dex */
public final class g extends j {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Context f76299k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ GoogleSignInOptions f76300l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(r rVar, Context context, GoogleSignInOptions googleSignInOptions) {
        super(rVar);
        this.f76299k = context;
        this.f76300l = googleSignInOptions;
    }

    @Override // mg.j
    public final void E(qg.c cVar) {
        n nVar = (n) ((e) cVar).getService();
        Context context = this.f76299k;
        GoogleSignInOptions googleSignInOptions = this.f76300l;
        f fVar = new f(this, context, googleSignInOptions);
        Parcel parcelT = nVar.T();
        parcelT.writeStrongBinder(fVar);
        ih.e.c(parcelT, googleSignInOptions);
        nVar.U(parcelT, 101);
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final /* synthetic */ qg.k z(Status status) {
        return new lg.c(null, status);
    }
}
