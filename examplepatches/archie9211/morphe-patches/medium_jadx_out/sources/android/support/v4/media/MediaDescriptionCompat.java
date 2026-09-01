package android.support.v4.media;

import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import defpackage.h74;
import defpackage.tl7;
import defpackage.ul7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MediaDescriptionCompat implements Parcelable {
    public static final Parcelable.Creator<MediaDescriptionCompat> CREATOR = new h74(25);
    public final String a;
    public final CharSequence b;
    public final CharSequence c;
    public final CharSequence d;
    public final Bitmap e;
    public final Uri f;
    public final Bundle g;
    public final Uri h;
    public MediaDescription i;

    public MediaDescriptionCompat(String str, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, Bitmap bitmap, Uri uri, Bundle bundle, Uri uri2) {
        this.a = str;
        this.b = charSequence;
        this.c = charSequence2;
        this.d = charSequence3;
        this.e = bitmap;
        this.f = uri;
        this.g = bundle;
        this.h = uri2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        return ((Object) this.b) + ", " + ((Object) this.c) + ", " + ((Object) this.d);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        MediaDescription mediaDescriptionA = this.i;
        if (mediaDescriptionA == null) {
            MediaDescription.Builder builderB = tl7.b();
            tl7.n(builderB, this.a);
            tl7.p(builderB, this.b);
            tl7.o(builderB, this.c);
            tl7.j(builderB, this.d);
            tl7.l(builderB, this.e);
            tl7.m(builderB, this.f);
            tl7.k(builderB, this.g);
            ul7.b(builderB, this.h);
            mediaDescriptionA = tl7.a(builderB);
            this.i = mediaDescriptionA;
        }
        mediaDescriptionA.writeToParcel(parcel, i);
    }
}
