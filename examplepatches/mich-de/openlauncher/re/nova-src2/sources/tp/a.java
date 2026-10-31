package tp;

import android.app.Application;
import android.content.ContentProviderClient;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import b50.d;
import sp.r0;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f89554a = 0;

    static {
        new d(a.class.getSimpleName());
    }

    public static String a(Application application, ResolveInfo resolveInfo) {
        String string;
        Cursor cursorQuery;
        String str = resolveInfo.providerInfo.authority;
        if (!r0.l(str)) {
            try {
                ContentProviderClient contentProviderClientAcquireUnstableContentProviderClient = application.getContentResolver().acquireUnstableContentProviderClient(str);
                try {
                    Uri uri = Uri.parse("content://" + str + "/trackers");
                    String[] strArr = {"encrypted_data"};
                    cursorQuery = contentProviderClientAcquireUnstableContentProviderClient != null ? contentProviderClientAcquireUnstableContentProviderClient.query(uri, strArr, "package_name=?", new String[]{application.getPackageName()}, null) : application.getContentResolver().query(uri, strArr, null, null, null);
                } catch (Throwable th2) {
                    th2.getMessage();
                }
                if (cursorQuery == null) {
                    string = null;
                } else if (cursorQuery.moveToFirst()) {
                    string = cursorQuery.getString(0);
                    cursorQuery.close();
                } else {
                    cursorQuery.close();
                    string = null;
                }
                contentProviderClientAcquireUnstableContentProviderClient.release();
                return string;
            } catch (Throwable th3) {
                r0.c(th3);
            }
        }
        return null;
    }
}
