package o9;

import android.content.ContentResolver;
import android.net.Uri;
import android.os.Bundle;

/* loaded from: classes.dex */
public abstract class h2 {

    /* renamed from: a, reason: collision with root package name */
    public static final Uri f79866a = Uri.parse("content://com.teslacoilsw.launcher.settings/settings");

    public static Bundle a(ContentResolver contentResolver, String str) {
        return contentResolver.call(f79866a, str, (String) null, (Bundle) null);
    }
}
