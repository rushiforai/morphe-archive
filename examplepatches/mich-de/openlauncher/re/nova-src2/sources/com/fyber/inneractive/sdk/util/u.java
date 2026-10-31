package com.fyber.inneractive.sdk.util;

import android.graphics.BitmapFactory;
import android.net.Uri;
import android.webkit.MimeTypeMap;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;

/* loaded from: classes3.dex */
public abstract class u {
    public static String a(String str) {
        String fileExtensionFromUrl = MimeTypeMap.getFileExtensionFromUrl(str);
        if (fileExtensionFromUrl == null || fileExtensionFromUrl.isEmpty()) {
            return null;
        }
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl.toLowerCase(Locale.US));
    }

    public static Float a(Uri uri) throws IOException {
        InputStream inputStreamOpenInputStream;
        int i5;
        try {
            inputStreamOpenInputStream = IAConfigManager.Q.f27762v.f27857a.getApplicationContext().getContentResolver().openInputStream(uri);
        } catch (Exception e3) {
            IAlog.b("%sFailed to retrieve image aspect ratio. Reason: %s", IAlog.a(u.class), e3.getMessage());
        }
        if (inputStreamOpenInputStream == null) {
            if (inputStreamOpenInputStream == null) {
                return null;
            }
            inputStreamOpenInputStream.close();
            return null;
        }
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeStream(inputStreamOpenInputStream, null, options);
            int i11 = options.outHeight;
            if (i11 <= 0 || (i5 = options.outWidth) <= 0) {
                inputStreamOpenInputStream.close();
                return null;
            }
            Float fValueOf = Float.valueOf(i5 / i11);
            inputStreamOpenInputStream.close();
            return fValueOf;
        } finally {
        }
    }
}
