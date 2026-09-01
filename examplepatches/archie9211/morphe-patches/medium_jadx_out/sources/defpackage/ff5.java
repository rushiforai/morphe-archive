package defpackage;

import android.net.Uri;
import android.os.Bundle;
import com.facebook.FacebookException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;
import java.util.regex.Pattern;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ff5 {
    public static final String j;
    public static final Pattern k;
    public static volatile String l;
    public final w3 a;
    public final String b;
    public JSONObject c;
    public Bundle d;
    public String e;
    public final String f;
    public bf5 g;
    public dt5 h;
    public boolean i;

    static {
        char[] cArr = {'-', '_', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        StringBuilder sb = new StringBuilder();
        SecureRandom secureRandom = new SecureRandom();
        int iNextInt = secureRandom.nextInt(11) + 30;
        for (int i = 0; i < iNextInt; i++) {
            sb.append(cArr[secureRandom.nextInt(64)]);
        }
        j = sb.toString();
        k = Pattern.compile("^/?v\\d+\\.\\d+/(.*)");
    }

    public ff5(w3 w3Var, String str, Bundle bundle, dt5 dt5Var, bf5 bf5Var) {
        this.a = w3Var;
        this.b = str;
        this.f = null;
        j(bf5Var);
        k(dt5Var);
        if (bundle != null) {
            this.d = new Bundle(bundle);
        } else {
            this.d = new Bundle();
        }
        this.f = f94.d();
    }

    public static String f() {
        String strB = f94.b();
        hk7.G();
        String str = f94.h;
        if (str == null) {
            throw new FacebookException("A valid Facebook client token must be set in the AndroidManifest.xml or set by calling FacebookSdk.setClientToken before initializing the sdk. Visit https://developers.facebook.com/docs/android/getting-started#add-app_id for more information.");
        }
        if (strB.length() <= 0 || str.length() <= 0) {
            return null;
        }
        return ev6.r('|', strB, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            r6 = this;
            android.os.Bundle r0 = r6.d
            java.lang.String r1 = r6.e()
            r2 = 0
            if (r1 == 0) goto L10
            java.lang.String r3 = "|"
            boolean r3 = defpackage.muc.Q(r1, r3, r2)
            goto L11
        L10:
            r3 = r2
        L11:
            java.lang.String r4 = "access_token"
            if (r1 == 0) goto L26
            java.lang.String r5 = "IG"
            boolean r1 = defpackage.tuc.N(r1, r5, r2)
            if (r1 == 0) goto L26
            if (r3 != 0) goto L26
            boolean r1 = r6.i()
            if (r1 == 0) goto L26
            goto L3d
        L26:
            java.lang.String r1 = defpackage.f94.e()
            java.lang.String r2 = "instagram.com"
            boolean r1 = defpackage.g76.L(r1, r2)
            r2 = 1
            if (r1 != 0) goto L34
            goto L39
        L34:
            boolean r1 = r6.i()
            r2 = r2 ^ r1
        L39:
            if (r2 != 0) goto L45
            if (r3 != 0) goto L45
        L3d:
            java.lang.String r6 = f()
            r0.putString(r4, r6)
            goto L4e
        L45:
            java.lang.String r6 = r6.e()
            if (r6 == 0) goto L4e
            r0.putString(r4, r6)
        L4e:
            boolean r6 = r0.containsKey(r4)
            if (r6 != 0) goto L73
            f94 r6 = defpackage.f94.a
            defpackage.hk7.G()
            java.lang.String r6 = defpackage.f94.h
            if (r6 == 0) goto L6b
            boolean r6 = defpackage.epe.J(r6)
            if (r6 == 0) goto L73
            java.lang.String r6 = "ff5"
            java.lang.String r1 = "Starting with v13 of the SDK, a client token must be embedded in your client code before making Graph API calls. Visit https://developers.facebook.com/docs/android/getting-started#client-token to learn how to implement this change."
            android.util.Log.w(r6, r1)
            goto L73
        L6b:
            com.facebook.FacebookException r6 = new com.facebook.FacebookException
            java.lang.String r0 = "A valid Facebook client token must be set in the AndroidManifest.xml or set by calling FacebookSdk.setClientToken before initializing the sdk. Visit https://developers.facebook.com/docs/android/getting-started#add-app_id for more information."
            r6.<init>(r0)
            throw r6
        L73:
            java.lang.String r6 = "sdk"
            java.lang.String r1 = "android"
            r0.putString(r6, r1)
            java.lang.String r6 = "format"
            java.lang.String r1 = "json"
            r0.putString(r6, r1)
            i87 r6 = defpackage.i87.GRAPH_API_DEBUG_INFO
            defpackage.f94.h(r6)
            i87 r6 = defpackage.i87.GRAPH_API_DEBUG_WARNING
            defpackage.f94.h(r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ff5.a():void");
    }

    public final String b(String str, boolean z) {
        if (!z && this.h == dt5.POST) {
            return str;
        }
        Uri.Builder builderBuildUpon = Uri.parse(str).buildUpon();
        for (String str2 : this.d.keySet()) {
            Object obj = this.d.get(str2);
            if (obj == null) {
                obj = "";
            }
            if (xz5.f0(obj)) {
                builderBuildUpon.appendQueryParameter(str2, xz5.j0(obj).toString());
            } else if (this.h != dt5.GET) {
                ay0.e(String.format(Locale.US, "Unsupported parameter type for GET request: %s", Arrays.copyOf(new Object[]{obj.getClass().getSimpleName()}, 1)));
                return null;
            }
        }
        String string = builderBuildUpon.toString();
        string.getClass();
        return string;
    }

    public final if5 c() {
        ArrayList arrayListO = xz5.O(new hf5(k80.Q0(new ff5[]{this})));
        if (arrayListO.size() == 1) {
            return (if5) arrayListO.get(0);
        }
        throw new FacebookException("invalid state: expected a single response");
    }

    public final gf5 d() {
        hf5 hf5Var = new hf5(k80.Q0(new ff5[]{this}));
        hk7.D(hf5Var);
        gf5 gf5Var = new gf5(hf5Var);
        gf5Var.executeOnExecutor(f94.c(), new Void[0]);
        return gf5Var;
    }

    public final String e() {
        Bundle bundle = this.d;
        w3 w3Var = this.a;
        if (w3Var != null) {
            if (!bundle.containsKey("access_token")) {
                String str = w3Var.e;
                f87.b.t(str);
                return str;
            }
        } else if (!bundle.containsKey("access_token")) {
            return f();
        }
        return this.d.getString("access_token");
    }

    public final String g() {
        String str;
        String str2;
        if (this.h == dt5.POST && (str2 = this.b) != null && tuc.F(str2, "/videos", false)) {
            str = String.format("https://graph-video.%s", Arrays.copyOf(new Object[]{f94.e()}, 1));
        } else {
            String strE = f94.e();
            strE.getClass();
            str = String.format("https://graph.%s", Arrays.copyOf(new Object[]{strE}, 1));
        }
        String strH = h(str);
        a();
        return b(strH, false);
    }

    public final String h(String str) {
        if (!(!g76.L(f94.e(), "instagram.com") ? true : !i())) {
            str = String.format("https://graph.%s", Arrays.copyOf(new Object[]{f94.s}, 1));
        }
        Pattern pattern = k;
        String str2 = this.b;
        if (!pattern.matcher(str2).matches()) {
            str2 = String.format("%s/%s", Arrays.copyOf(new Object[]{this.f, str2}, 2));
        }
        return String.format("%s/%s", Arrays.copyOf(new Object[]{str, str2}, 2));
    }

    public final boolean i() {
        String str = this.b;
        if (str == null) {
            return false;
        }
        StringBuilder sb = new StringBuilder("^/?");
        sb.append(f94.b());
        sb.append("/?.*");
        return this.i || Pattern.matches(sb.toString(), str) || Pattern.matches("^/?app/?.*", str);
    }

    public final void j(bf5 bf5Var) {
        f94.h(i87.GRAPH_API_DEBUG_INFO);
        f94.h(i87.GRAPH_API_DEBUG_WARNING);
        this.g = bf5Var;
    }

    public final void k(dt5 dt5Var) {
        if (dt5Var == null) {
            dt5Var = dt5.GET;
        }
        this.h = dt5Var;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("{Request:  accessToken: ");
        Object obj = this.a;
        if (obj == null) {
            obj = "null";
        }
        sb.append(obj);
        sb.append(", graphPath: ");
        sb.append(this.b);
        sb.append(", graphObject: ");
        sb.append(this.c);
        sb.append(", httpMethod: ");
        sb.append(this.h);
        sb.append(", parameters: ");
        sb.append(this.d);
        sb.append("}");
        return sb.toString();
    }
}
