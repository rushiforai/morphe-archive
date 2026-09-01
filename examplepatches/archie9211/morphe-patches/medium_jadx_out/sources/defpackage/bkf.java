package defpackage;

import android.os.Parcel;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bkf extends ihf {
    public final /* synthetic */ wfd f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bkf(wfd wfdVar) {
        super("com.google.android.gms.common.api.internal.IStatusCallback", 1);
        this.f = wfdVar;
    }

    @Override // defpackage.ihf
    public final boolean j(int i, Parcel parcel, Parcel parcel2) {
        if (i != 1) {
            return false;
        }
        Status status = (Status) zif.a(parcel, Status.CREATOR);
        zif.b(parcel);
        tp7.C(status, null, this.f);
        return true;
    }
}
