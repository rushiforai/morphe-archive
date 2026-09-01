package defpackage;

import android.os.Parcel;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nkf extends BasePendingResult {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nkf(wif wifVar, int i) {
        super(wifVar);
        this.a = i;
        vp7.q("GoogleApiClient must not be null", wifVar);
        vp7.q("Api must not be null", yb0.a);
    }

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final /* bridge */ /* synthetic */ cjb a(Status status) {
        int i = this.a;
        return status;
    }

    public final void b(wd5 wd5Var) {
        switch (this.a) {
            case 0:
                kkf kkfVar = (kkf) wd5Var;
                qkf qkfVar = (qkf) kkfVar.h();
                mkf mkfVar = new mkf(this, 0);
                GoogleSignInOptions googleSignInOptions = kkfVar.z;
                Parcel parcelA = qkfVar.a();
                int i = hkf.a;
                parcelA.writeStrongBinder(mkfVar);
                hkf.c(parcelA, googleSignInOptions);
                qkfVar.c(102, parcelA);
                break;
            default:
                kkf kkfVar2 = (kkf) wd5Var;
                qkf qkfVar2 = (qkf) kkfVar2.h();
                mkf mkfVar2 = new mkf(this, 1);
                GoogleSignInOptions googleSignInOptions2 = kkfVar2.z;
                Parcel parcelA2 = qkfVar2.a();
                int i2 = hkf.a;
                parcelA2.writeStrongBinder(mkfVar2);
                hkf.c(parcelA2, googleSignInOptions2);
                qkfVar2.c(103, parcelA2);
                break;
        }
    }

    public final void c(Status status) {
        vp7.k("Failed result must not be success", !(status.a <= 0));
        setResult(a(status));
    }
}
