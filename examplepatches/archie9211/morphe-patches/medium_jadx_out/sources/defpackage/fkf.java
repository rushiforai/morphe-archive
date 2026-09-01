package defpackage;

import android.util.Log;
import com.google.android.gms.common.api.Status;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fkf implements Runnable {
    public static final xp c = new xp("RevokeAccessOperation", new String[0]);
    public final String a;
    public final src b;

    public fkf(String str) {
        vp7.n(str);
        this.a = str;
        this.b = new src(null);
    }

    @Override // java.lang.Runnable
    public final void run() {
        xp xpVar = c;
        Status status = Status.g;
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("https://accounts.google.com/o/oauth2/revoke?token=".concat(this.a)).openConnection();
            httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode == 200) {
                status = Status.e;
            } else {
                xpVar.j("Unable to revoke access!", new Object[0]);
            }
            String str = "Response Code: " + responseCode;
            Object[] objArr = new Object[0];
            if (xpVar.b <= 3) {
                Log.d((String) xpVar.c, xpVar.o(str, objArr));
            }
        } catch (IOException e) {
            xpVar.j("IOException when revoking access: ".concat(String.valueOf(e.toString())), new Object[0]);
        } catch (Exception e2) {
            xpVar.j("Exception when revoking access: ".concat(String.valueOf(e2.toString())), new Object[0]);
        }
        this.b.setResult(status);
    }
}
