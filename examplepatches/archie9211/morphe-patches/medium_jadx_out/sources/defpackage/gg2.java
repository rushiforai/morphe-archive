package defpackage;

import android.os.Bundle;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gg2 extends bf2 {
    public gg2(String str, Bundle bundle) {
        bundle.getClass();
        if (str.length() != 0) {
            try {
                new JSONObject(str);
                return;
            } catch (Exception unused) {
            }
        }
        ay0.e("registrationResponseJson must not be empty, and must be a valid JSON");
        throw null;
    }
}
