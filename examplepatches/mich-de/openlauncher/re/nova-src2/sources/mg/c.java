package mg;

import android.util.Log;
import com.google.android.gms.common.api.Status;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import sg.w;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: c, reason: collision with root package name */
    public static final c00.d f76281c = new c00.d("RevokeAccessOperation", new String[0]);

    /* renamed from: a, reason: collision with root package name */
    public final String f76282a;

    /* renamed from: b, reason: collision with root package name */
    public final qg.m f76283b;

    public c(String str) {
        w.e(str);
        this.f76282a = str;
        this.f76283b = new qg.m(null, 1);
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        c00.d dVar = f76281c;
        Status status = Status.f31808l;
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("https://accounts.google.com/o/oauth2/revoke?token=" + this.f76282a).openConnection();
            httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode == 200) {
                status = Status.f31806j;
            } else {
                Log.e((String) dVar.f19045c, ((String) dVar.f19046d).concat("Unable to revoke access!"));
            }
            dVar.i("Response Code: " + responseCode, new Object[0]);
        } catch (IOException e3) {
            Log.e((String) dVar.f19045c, ((String) dVar.f19046d).concat("IOException when revoking access: ".concat(String.valueOf(e3.toString()))));
        } catch (Exception e11) {
            Log.e((String) dVar.f19045c, ((String) dVar.f19046d).concat("Exception when revoking access: ".concat(String.valueOf(e11.toString()))));
        }
        this.f76283b.C(status);
    }
}
