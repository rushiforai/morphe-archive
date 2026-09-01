package defpackage;

import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ge5 extends tl2 {
    public final String c;

    public ge5(String str, String str2, String str3, String str4, String str5, Uri uri, String str6) {
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID", str);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID_TOKEN", str2);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_DISPLAY_NAME", str3);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_FAMILY_NAME", str4);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_GIVEN_NAME", str5);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PHONE_NUMBER", str6);
        bundle.putParcelable("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PROFILE_PICTURE_URI", uri);
        super("com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL", bundle);
        this.c = str2;
        int length = str.length();
        String str7 = null;
        if (length <= 0) {
            ay0.e("id should not be empty");
            throw null;
        }
        if (str2.length() <= 0) {
            ay0.e("idToken should not be empty");
            throw null;
        }
        List listP0 = muc.p0(str2, new String[]{"."}, 0, 6);
        if (listP0.size() != 3) {
            ay0.e("Invalid token format");
            throw null;
        }
        try {
            byte[] bArrDecode = Base64.decode((String) listP0.get(1), 8);
            bArrDecode.getClass();
            Charset charset = StandardCharsets.UTF_8;
            charset.getClass();
            JSONObject jSONObject = new JSONObject(new String(bArrDecode, charset));
            jSONObject.optString("email").getClass();
            String strOptString = jSONObject.optString("sub");
            if (strOptString.length() != 0) {
                str7 = strOptString;
            }
            if (str7 != null) {
            } else {
                throw new IllegalArgumentException("ID token missing required field: sub");
            }
        } catch (JSONException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
