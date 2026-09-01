package defpackage;

import android.os.Parcelable;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ua3 extends ba7 {
    public static ScheduledThreadPoolExecutor d;
    public static final cd7 c = new cd7();
    public static final Parcelable.Creator<ua3> CREATOR = new xkf(27);

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return "device_auth";
    }

    @Override // defpackage.ba7
    public final int k(m87 m87Var) {
        m87Var.getClass();
        m15 m15VarE = d().e();
        if (m15VarE == null || m15VarE.isFinishing()) {
            return 1;
        }
        ta3 ta3Var = new ta3();
        ta3Var.c0(m15VarE.m(), "login_with_facebook");
        ta3Var.l0(m87Var);
        return 1;
    }
}
