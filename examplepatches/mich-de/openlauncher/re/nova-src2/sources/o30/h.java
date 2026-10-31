package o30;

import android.os.RemoteException;
import android.text.TextUtils;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import org.json.JSONObject;
import ya.j;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: e, reason: collision with root package name */
    public static final String f79500e = "UTF-8";

    /* renamed from: a, reason: collision with root package name */
    public final String f79501a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79502b;

    /* renamed from: c, reason: collision with root package name */
    public final String f79503c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f79504d = false;

    public h(String str, String str2, String str3) {
        this.f79501a = str;
        this.f79502b = str2;
        this.f79503c = str3;
    }

    public static String b(HashMap map) {
        JSONObject jSONObject = new JSONObject(map);
        StringBuilder sb2 = new StringBuilder();
        String str = f79500e;
        sb2.append(URLEncoder.encode("data", str));
        sb2.append("=");
        sb2.append(URLEncoder.encode(jSONObject.toString(), str));
        String string = sb2.toString();
        URLConnection uRLConnectionOpenConnection = new URL("https://api.novalauncher.com/x").openConnection();
        uRLConnectionOpenConnection.setDoOutput(true);
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(uRLConnectionOpenConnection.getOutputStream());
        outputStreamWriter.write(string);
        outputStreamWriter.flush();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(uRLConnectionOpenConnection.getInputStream()));
        StringBuilder sb3 = new StringBuilder();
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                outputStreamWriter.close();
                bufferedReader.close();
                return sb3.toString();
            }
            sb3.append(line);
        }
    }

    public final void a(long j11, String str, e eVar) {
        String str2 = this.f79501a;
        if (!TextUtils.isEmpty(str2)) {
            String str3 = this.f79502b;
            if (!TextUtils.isEmpty(str3)) {
                HashMap map = new HashMap();
                map.put("nonce", Long.toString(j11));
                map.put("packageName", str);
                map.put("username", str2);
                map.put("deviceId", this.f79503c);
                map.put("unlockCode", str3);
                map.put("versionCode", "89400");
                map.put("extra", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                j.f97146a.execute(new androidx.fragment.app.d(23, this, map, eVar));
                return;
            }
        }
        try {
            eVar.p(1, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } catch (RemoteException unused) {
        }
    }
}
