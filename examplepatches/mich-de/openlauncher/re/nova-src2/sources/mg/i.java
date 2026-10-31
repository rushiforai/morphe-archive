package mg;

import android.os.Parcel;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Status;

/* loaded from: classes3.dex */
public final class i extends j {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f76303k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(qg.i iVar, int i5) {
        super(iVar);
        this.f76303k = i5;
    }

    @Override // mg.j
    public final void E(qg.c cVar) {
        switch (this.f76303k) {
            case 0:
                e eVar = (e) cVar;
                n nVar = (n) eVar.getService();
                h hVar = new h(0, this);
                GoogleSignInOptions googleSignInOptions = eVar.f76295c;
                Parcel parcelT = nVar.T();
                parcelT.writeStrongBinder(hVar);
                ih.e.c(parcelT, googleSignInOptions);
                nVar.U(parcelT, 102);
                break;
            default:
                e eVar2 = (e) cVar;
                n nVar2 = (n) eVar2.getService();
                h hVar2 = new h(1, this);
                GoogleSignInOptions googleSignInOptions2 = eVar2.f76295c;
                Parcel parcelT2 = nVar2.T();
                parcelT2.writeStrongBinder(hVar2);
                ih.e.c(parcelT2, googleSignInOptions2);
                nVar2.U(parcelT2, 103);
                break;
        }
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final /* bridge */ /* synthetic */ qg.k z(Status status) {
        int i5 = this.f76303k;
        return status;
    }
}
