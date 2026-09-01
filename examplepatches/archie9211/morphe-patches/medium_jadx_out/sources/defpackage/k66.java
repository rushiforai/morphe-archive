package defpackage;

import android.os.Parcel;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k66 extends ihf {
    public final /* synthetic */ int f;
    public final /* synthetic */ wfd g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k66(wfd wfdVar, int i) {
        super("com.google.android.gms.auth.blockstore.restorecredential.internal.IClearRestoreCredentialCallback", 5);
        this.f = i;
        switch (i) {
            case 1:
                this.g = wfdVar;
                super("com.google.android.gms.auth.blockstore.restorecredential.internal.IGetRestoreCredentialCallback", 5);
                break;
            default:
                this.g = wfdVar;
                break;
        }
    }

    @Override // defpackage.ihf
    public final boolean e(int i, Parcel parcel) {
        int i2 = this.f;
        wfd wfdVar = this.g;
        switch (i2) {
            case 0:
                if (i == 1) {
                    Status status = (Status) nxf.a(parcel, Status.CREATOR);
                    boolean z = parcel.readInt() != 0;
                    ihf.h(parcel);
                    status.getClass();
                    tp7.C(status, Boolean.valueOf(z), wfdVar);
                }
                break;
            default:
                if (i == 1) {
                    Status status2 = (Status) nxf.a(parcel, Status.CREATOR);
                    wb5 wb5Var = (wb5) nxf.a(parcel, wb5.CREATOR);
                    ihf.h(parcel);
                    status2.getClass();
                    wb5Var.getClass();
                    tp7.C(status2, wb5Var, wfdVar);
                }
                break;
        }
        return true;
    }
}
