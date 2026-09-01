package defpackage;

import android.os.Bundle;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class te3 extends n4 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public te3(String str, Bundle bundle, int i) {
        super("androidx.credentials.TYPE_DIGITAL_CREDENTIAL", bundle);
        switch (i) {
            case 1:
                super("android.credentials.TYPE_PASSWORD_CREDENTIAL", bundle);
                if (str.length() > 0) {
                    return;
                }
                ay0.e("password should not be empty");
                throw null;
            case 2:
                super("androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL", bundle);
                if (str.length() != 0) {
                    try {
                        new JSONObject(str);
                        return;
                    } catch (Exception unused) {
                    }
                }
                ay0.e("authenticationResponseJson must not be empty, and must be a valid JSON");
                throw null;
            default:
                if (str.length() != 0) {
                    try {
                        new JSONObject(str);
                        return;
                    } catch (Exception unused2) {
                    }
                }
                ay0.e("credentialJson must not be empty, and must be a valid JSON");
                throw null;
        }
    }
}
