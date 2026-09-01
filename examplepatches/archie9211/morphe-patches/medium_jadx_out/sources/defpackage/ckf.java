package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Parcelable;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ckf extends zd5 {
    public static final s26 m = new s26("Auth.Api.Identity.SignIn.API", new z56(7), new u3b(11));
    public final String l;

    public ckf(Context context, skf skfVar) {
        super(context, m, skfVar, yd5.c);
        this.l = ekf.a();
    }

    public static u9c c(Intent intent) throws ApiException {
        Status status = Status.g;
        if (intent == null) {
            throw new ApiException(status);
        }
        Parcelable.Creator<Status> creator = Status.CREATOR;
        byte[] byteArrayExtra = intent.getByteArrayExtra(AEVqIoD.tiDxqzmHE);
        Status status2 = (Status) (byteArrayExtra == null ? null : mo7.H(byteArrayExtra, creator));
        if (status2 == null) {
            throw new ApiException(Status.i);
        }
        if (status2.a > 0) {
            throw new ApiException(status2);
        }
        Parcelable.Creator<u9c> creator2 = u9c.CREATOR;
        byte[] byteArrayExtra2 = intent.getByteArrayExtra("sign_in_credential");
        u9c u9cVar = (u9c) (byteArrayExtra2 != null ? mo7.H(byteArrayExtra2, creator2) : null);
        if (u9cVar != null) {
            return u9cVar;
        }
        throw new ApiException(status);
    }
}
