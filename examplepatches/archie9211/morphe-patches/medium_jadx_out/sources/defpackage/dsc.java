package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.File;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dsc {
    public final SharedPreferences a;

    public dsc(Context context) {
        boolean zIsEmpty;
        SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.android.gms.appid", 0);
        this.a = sharedPreferences;
        File file = new File(context.getNoBackupFilesDir(), "com.google.android.gms.appid-no-backup");
        if (file.exists()) {
            return;
        }
        try {
            if (file.createNewFile()) {
                synchronized (this) {
                    zIsEmpty = sharedPreferences.getAll().isEmpty();
                }
                if (zIsEmpty) {
                    return;
                }
                Log.i("FirebaseMessaging", "App restored, clearing state");
                b();
            }
        } catch (IOException e) {
            if (Log.isLoggable("FirebaseMessaging", 3)) {
                Log.d("FirebaseMessaging", "Error creating file in no backup dir: " + e.getMessage());
            }
        }
    }

    public static String a(String str, String str2) {
        return lv8.r(str, "|T|", str2, "|*");
    }

    public synchronized void b() {
        this.a.edit().clear().commit();
    }

    public dsc(int i) {
        switch (i) {
            case 2:
                SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.AuthenticationTokenManager.SharedPreferences", 0);
                sharedPreferences.getClass();
                this.a = sharedPreferences;
                break;
            case 3:
                SharedPreferences sharedPreferences2 = f94.a().getSharedPreferences("com.facebook.AccessTokenManager.SharedPreferences", 0);
                sharedPreferences2.getClass();
                this.a = sharedPreferences2;
                break;
            default:
                SharedPreferences sharedPreferences3 = f94.a().getSharedPreferences("com.facebook.AccessTokenManager.SharedPreferences", 0);
                sharedPreferences3.getClass();
                this.a = sharedPreferences3;
                break;
        }
    }
}
