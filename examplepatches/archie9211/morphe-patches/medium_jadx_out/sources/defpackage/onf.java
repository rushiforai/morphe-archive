package defpackage;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.api.Status;
import java.net.HttpURLConnection;
import java.net.URL;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public interface onf {
    public static final xp j0 = new xp("FirebaseAuth", new String[]{"GetAuthDomainTaskResponseHandler"});

    String a(String str);

    void b(Status status);

    Uri.Builder d(Intent intent, String str, String str2);

    void e(Uri uri, String str, h8a h8aVar);

    HttpURLConnection f(URL url);

    Context zza();
}
