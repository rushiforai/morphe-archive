package defpackage;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.util.Log;
import com.google.firebase.auth.FirebaseAuth;
import com.pairip.VMRunner;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class inf extends AsyncTask {
    public static final xp g = new xp("FirebaseAuth", new String[]{"GetAuthDomainTask"});
    public final String a;
    public final String b;
    public final WeakReference c;
    public final Uri.Builder d;
    public final String e;
    public final xj4 f;

    public inf(String str, String str2, Intent intent, xj4 xj4Var, onf onfVar) {
        vp7.n(str);
        this.a = str;
        this.f = xj4Var;
        vp7.n(str2);
        vp7.p(intent);
        String stringExtra = intent.getStringExtra("com.google.firebase.auth.KEY_API_KEY");
        vp7.n(stringExtra);
        Uri.Builder builderBuildUpon = Uri.parse(onfVar.a(stringExtra)).buildUpon();
        Uri.Builder builderAppendQueryParameter = builderBuildUpon.appendPath("getProjectConfig").appendQueryParameter("key", stringExtra).appendQueryParameter("androidPackageName", str);
        vp7.p(str2);
        builderAppendQueryParameter.appendQueryParameter("sha1Cert", str2);
        this.b = builderBuildUpon.build().toString();
        this.c = new WeakReference(onfVar);
        this.d = onfVar.d(intent, str, str2);
        this.e = intent.getStringExtra("com.google.firebase.auth.KEY_CUSTOM_AUTH_DOMAIN");
    }

    public static String a(HttpURLConnection httpURLConnection) {
        try {
            if (httpURLConnection.getResponseCode() < 400) {
                return null;
            }
            InputStream errorStream = httpURLConnection.getErrorStream();
            return errorStream == null ? "WEB_INTERNAL_ERROR:Could not retrieve the authDomain for this project but did not receive an error response from the network request. Please try again." : mk7.I(new String(d(errorStream)));
        } catch (IOException e) {
            xp xpVar = g;
            Log.w((String) xpVar.c, xpVar.o("Error parsing error message from response body in getErrorMessageFromBody. ".concat(String.valueOf(e)), new Object[0]));
            return null;
        }
    }

    public static boolean c(String str) {
        try {
            String host = new URI("https://" + str).getHost();
            if (host != null) {
                if (host.endsWith("firebaseapp.com")) {
                    return true;
                }
                if (host.endsWith("web.app")) {
                    return true;
                }
            }
        } catch (URISyntaxException e) {
            g.j(lv8.r("Error parsing URL for auth domain check: ", str, ". ", e.getMessage()), new Object[0]);
        }
        return false;
    }

    public static byte[] d(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            byte[] bArr = new byte[128];
            while (true) {
                int i = inputStream.read(bArr);
                if (i == -1) {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    byteArrayOutputStream.close();
                    return byteArray;
                }
                byteArrayOutputStream.write(bArr, 0, i);
            }
        } catch (Throwable th) {
            byteArrayOutputStream.close();
            throw th;
        }
    }

    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final void onPostExecute(pnf pnfVar) {
        String str;
        String str2;
        Uri.Builder builder;
        onf onfVar = (onf) this.c.get();
        if (pnfVar != null) {
            str = pnfVar.a;
            str2 = pnfVar.b;
        } else {
            str = null;
            str2 = null;
        }
        if (onfVar == null) {
            g.j("An error has occurred: the handler reference has returned null.", new Object[0]);
        } else if (TextUtils.isEmpty(str) || (builder = this.d) == null) {
            onfVar.b(hp7.K(str2));
        } else {
            builder.authority(str);
            onfVar.e(builder.build(), this.a, FirebaseAuth.getInstance(this.f).p);
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return VMRunner.invoke("EMJQtX6i3OmrxDV0", new Object[]{this, objArr});
    }

    @Override // android.os.AsyncTask
    public final /* synthetic */ void onCancelled(Object obj) {
        onPostExecute(null);
    }
}
