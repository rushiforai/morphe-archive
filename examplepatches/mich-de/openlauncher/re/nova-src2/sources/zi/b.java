package zi;

import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import f5.j;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONException;
import org.json.JSONObject;
import r70.k;

/* loaded from: classes3.dex */
public final class b extends j {

    /* renamed from: g, reason: collision with root package name */
    public final String f98532g;

    /* renamed from: h, reason: collision with root package name */
    public final String f98533h;

    /* renamed from: i, reason: collision with root package name */
    public final String f98534i;

    public b(String id2, String idToken, String str, Uri uri, String str2, String str3, String str4) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(idToken, "idToken");
        Bundle bundle = new Bundle();
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID", id2);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID_TOKEN", idToken);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_DISPLAY_NAME", str);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_FAMILY_NAME", str2);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_GIVEN_NAME", str3);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PHONE_NUMBER", str4);
        bundle.putParcelable("com.google.android.libraries.identity.googleid.BUNDLE_KEY_PROFILE_PICTURE_URI", uri);
        super("com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL", bundle);
        this.f98532g = id2;
        this.f98533h = idToken;
        this.f98534i = str;
        if (id2.length() <= 0) {
            throw new IllegalArgumentException("id should not be empty");
        }
        if (idToken.length() <= 0) {
            throw new IllegalArgumentException("idToken should not be empty");
        }
        List listI1 = k.i1(idToken, new String[]{"."}, 6);
        if (listI1.size() != 3) {
            throw new IllegalArgumentException("Invalid token format");
        }
        try {
            byte[] bArrDecode = Base64.decode((String) listI1.get(1), 8);
            Intrinsics.d(bArrDecode);
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            JSONObject jSONObject = new JSONObject(new String(bArrDecode, UTF_8));
            jSONObject.optString(ActionCategory.EMAIL).getClass();
            String strOptString = jSONObject.optString("sub");
            if ((strOptString.length() == 0 ? null : strOptString) != null) {
            } else {
                throw new IllegalArgumentException("ID token missing required field: sub");
            }
        } catch (JSONException e3) {
            throw new IllegalArgumentException(e3);
        }
    }
}
