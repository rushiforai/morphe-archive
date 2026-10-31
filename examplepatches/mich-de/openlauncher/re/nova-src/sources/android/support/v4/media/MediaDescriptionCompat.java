package android.support.v4.media;

import ab.w;
import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public final class MediaDescriptionCompat implements Parcelable {
    public static final Parcelable.Creator<MediaDescriptionCompat> CREATOR = new w(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f13557a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f13558b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f13559c;

    /* renamed from: d, reason: collision with root package name */
    public final CharSequence f13560d;

    /* renamed from: e, reason: collision with root package name */
    public final Bitmap f13561e;

    /* renamed from: f, reason: collision with root package name */
    public final Uri f13562f;

    /* renamed from: g, reason: collision with root package name */
    public final Bundle f13563g;

    /* renamed from: h, reason: collision with root package name */
    public final Uri f13564h;

    /* renamed from: i, reason: collision with root package name */
    public MediaDescription f13565i;

    public MediaDescriptionCompat(String str, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, Bitmap bitmap, Uri uri, Bundle bundle, Uri uri2) {
        this.f13557a = str;
        this.f13558b = charSequence;
        this.f13559c = charSequence2;
        this.f13560d = charSequence3;
        this.f13561e = bitmap;
        this.f13562f = uri;
        this.f13563g = bundle;
        this.f13564h = uri2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        return ((Object) this.f13558b) + ", " + ((Object) this.f13559c) + ", " + ((Object) this.f13560d);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        MediaDescription mediaDescriptionA = this.f13565i;
        if (mediaDescriptionA == null) {
            MediaDescription.Builder builderB = a.b();
            a.n(builderB, this.f13557a);
            a.p(builderB, this.f13558b);
            a.o(builderB, this.f13559c);
            a.j(builderB, this.f13560d);
            a.l(builderB, this.f13561e);
            a.m(builderB, this.f13562f);
            a.k(builderB, this.f13563g);
            b.b(builderB, this.f13564h);
            mediaDescriptionA = a.a(builderB);
            this.f13565i = mediaDescriptionA;
        }
        mediaDescriptionA.writeToParcel(parcel, i5);
    }
}
