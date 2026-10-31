package c6;

import android.media.MediaDataSource;
import android.media.MediaMetadataRetriever;

/* loaded from: classes2.dex */
public abstract class i {
    public static void a(MediaMetadataRetriever mediaMetadataRetriever, MediaDataSource mediaDataSource) throws IllegalArgumentException {
        mediaMetadataRetriever.setDataSource(mediaDataSource);
    }
}
