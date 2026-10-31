package android.support.v4.media;

import android.media.MediaDescription;
import android.net.Uri;

/* loaded from: classes2.dex */
public abstract class b {
    public static Uri a(MediaDescription mediaDescription) {
        return mediaDescription.getMediaUri();
    }

    public static void b(MediaDescription.Builder builder, Uri uri) {
        builder.setMediaUri(uri);
    }
}
