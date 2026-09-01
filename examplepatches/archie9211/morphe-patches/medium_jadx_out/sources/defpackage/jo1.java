package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jo1 {
    public final String a = "androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE";
    public final Bundle b;

    public jo1() {
        Bundle bundle = new Bundle();
        this.b = bundle;
        if (!g76.L("androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE", "androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE") && !g76.L("androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE", "androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL")) {
            ay0.e(ev6.x("The request type ", "androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE", " is not supported."));
            throw null;
        }
        if (g76.L("androidx.credentials.TYPE_CLEAR_CREDENTIAL_STATE", "androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL")) {
            bundle.putBoolean("androidx.credentials.BUNDLE_KEY_CLEAR_RESTORE_CREDENTIAL_REQUEST", true);
        }
    }
}
