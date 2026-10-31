package f5;

import android.os.Bundle;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class k extends c3.b {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(String str, int i5, Bundle bundle) {
        super("androidx.credentials.TYPE_DIGITAL_CREDENTIAL", bundle);
        switch (i5) {
            case 1:
                super("android.credentials.TYPE_PASSWORD_CREDENTIAL", bundle);
                if (str.length() <= 0) {
                    throw new IllegalArgumentException("password should not be empty");
                }
                return;
            case 2:
                super("androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL", bundle);
                if (str.length() != 0) {
                    try {
                        new JSONObject(str);
                        return;
                    } catch (Exception unused) {
                    }
                }
                throw new IllegalArgumentException("authenticationResponseJson must not be empty, and must be a valid JSON");
            default:
                if (str.length() != 0) {
                    try {
                        new JSONObject(str);
                        return;
                    } catch (Exception unused2) {
                    }
                }
                throw new IllegalArgumentException("credentialJson must not be empty, and must be a valid JSON");
        }
    }
}
