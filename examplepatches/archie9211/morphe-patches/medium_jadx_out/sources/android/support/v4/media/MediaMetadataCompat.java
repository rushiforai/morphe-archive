package android.support.v4.media;

import android.media.MediaMetadata;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import defpackage.h74;
import defpackage.y70;
import defpackage.zm7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MediaMetadataCompat implements Parcelable {
    public static final Parcelable.Creator<MediaMetadataCompat> CREATOR;
    public static final y70 c;
    public final Bundle a;
    public MediaMetadata b;

    static {
        y70 y70Var = new y70(0);
        c = y70Var;
        y70Var.put("android.media.metadata.TITLE", 1);
        y70Var.put("android.media.metadata.ARTIST", 1);
        y70Var.put("android.media.metadata.DURATION", 0);
        y70Var.put("android.media.metadata.ALBUM", 1);
        y70Var.put("android.media.metadata.AUTHOR", 1);
        y70Var.put("android.media.metadata.WRITER", 1);
        y70Var.put("android.media.metadata.COMPOSER", 1);
        y70Var.put("android.media.metadata.COMPILATION", 1);
        y70Var.put("android.media.metadata.DATE", 1);
        y70Var.put("android.media.metadata.YEAR", 0);
        y70Var.put("android.media.metadata.GENRE", 1);
        y70Var.put("android.media.metadata.TRACK_NUMBER", 0);
        y70Var.put("android.media.metadata.NUM_TRACKS", 0);
        y70Var.put("android.media.metadata.DISC_NUMBER", 0);
        y70Var.put("android.media.metadata.ALBUM_ARTIST", 1);
        y70Var.put("android.media.metadata.ART", 2);
        y70Var.put("android.media.metadata.ART_URI", 1);
        y70Var.put("android.media.metadata.ALBUM_ART", 2);
        y70Var.put("android.media.metadata.ALBUM_ART_URI", 1);
        y70Var.put("android.media.metadata.USER_RATING", 3);
        y70Var.put("android.media.metadata.RATING", 3);
        y70Var.put("android.media.metadata.DISPLAY_TITLE", 1);
        y70Var.put("android.media.metadata.DISPLAY_SUBTITLE", 1);
        y70Var.put("android.media.metadata.DISPLAY_DESCRIPTION", 1);
        y70Var.put("android.media.metadata.DISPLAY_ICON", 2);
        y70Var.put("android.media.metadata.DISPLAY_ICON_URI", 1);
        y70Var.put("android.media.metadata.MEDIA_ID", 1);
        y70Var.put("android.media.metadata.BT_FOLDER_TYPE", 0);
        y70Var.put("android.media.metadata.MEDIA_URI", 1);
        y70Var.put("android.media.metadata.ADVERTISEMENT", 0);
        y70Var.put("android.media.metadata.DOWNLOAD_STATUS", 0);
        CREATOR = new h74(26);
    }

    public MediaMetadataCompat(Parcel parcel) {
        this.a = parcel.readBundle(zm7.class.getClassLoader());
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeBundle(this.a);
    }

    public MediaMetadataCompat(Bundle bundle) {
        Bundle bundle2 = new Bundle(bundle);
        this.a = bundle2;
        zm7.w(bundle2);
    }
}
