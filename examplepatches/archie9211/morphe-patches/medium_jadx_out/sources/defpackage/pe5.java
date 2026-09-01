package defpackage;

import android.content.Context;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pe5 {
    public static final boolean b;
    public final md5 a;

    static {
        lsa lsaVar = msa.a;
        b = msa.b.f().nextDouble() <= 1.0E-4d;
    }

    public pe5(Context context) {
        this.a = new md5(context);
    }

    public final void a(String str, Bundle bundle) {
        if (b && muc.Q(str, "gps", false)) {
            this.a.s(str, bundle);
        }
    }
}
