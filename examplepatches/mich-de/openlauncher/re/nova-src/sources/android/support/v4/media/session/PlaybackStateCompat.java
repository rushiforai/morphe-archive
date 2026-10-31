package android.support.v4.media.session;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public final class PlaybackStateCompat implements Parcelable {
    public static final Parcelable.Creator<PlaybackStateCompat> CREATOR = new a(4);

    /* renamed from: a, reason: collision with root package name */
    public final int f13579a;

    /* renamed from: b, reason: collision with root package name */
    public final long f13580b;

    /* renamed from: c, reason: collision with root package name */
    public final long f13581c;

    /* renamed from: d, reason: collision with root package name */
    public final float f13582d;

    /* renamed from: e, reason: collision with root package name */
    public final long f13583e;

    /* renamed from: f, reason: collision with root package name */
    public final int f13584f;

    /* renamed from: g, reason: collision with root package name */
    public final CharSequence f13585g;

    /* renamed from: h, reason: collision with root package name */
    public final long f13586h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f13587i;

    /* renamed from: j, reason: collision with root package name */
    public final long f13588j;

    /* renamed from: k, reason: collision with root package name */
    public final Bundle f13589k;

    public static final class CustomAction implements Parcelable {
        public static final Parcelable.Creator<CustomAction> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f13590a;

        /* renamed from: b, reason: collision with root package name */
        public final CharSequence f13591b;

        /* renamed from: c, reason: collision with root package name */
        public final int f13592c;

        /* renamed from: d, reason: collision with root package name */
        public final Bundle f13593d;

        public CustomAction(Parcel parcel) {
            this.f13590a = parcel.readString();
            this.f13591b = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.f13592c = parcel.readInt();
            this.f13593d = parcel.readBundle(b.class.getClassLoader());
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            return "Action:mName='" + ((Object) this.f13591b) + ", mIcon=" + this.f13592c + ", mExtras=" + this.f13593d;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f13590a);
            TextUtils.writeToParcel(this.f13591b, parcel, i5);
            parcel.writeInt(this.f13592c);
            parcel.writeBundle(this.f13593d);
        }
    }

    public PlaybackStateCompat(Parcel parcel) {
        this.f13579a = parcel.readInt();
        this.f13580b = parcel.readLong();
        this.f13582d = parcel.readFloat();
        this.f13586h = parcel.readLong();
        this.f13581c = parcel.readLong();
        this.f13583e = parcel.readLong();
        this.f13585g = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        this.f13587i = parcel.createTypedArrayList(CustomAction.CREATOR);
        this.f13588j = parcel.readLong();
        this.f13589k = parcel.readBundle(b.class.getClassLoader());
        this.f13584f = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PlaybackState {state=");
        sb2.append(this.f13579a);
        sb2.append(", position=");
        sb2.append(this.f13580b);
        sb2.append(", buffered position=");
        sb2.append(this.f13581c);
        sb2.append(", speed=");
        sb2.append(this.f13582d);
        sb2.append(", updated=");
        sb2.append(this.f13586h);
        sb2.append(", actions=");
        sb2.append(this.f13583e);
        sb2.append(", error code=");
        sb2.append(this.f13584f);
        sb2.append(", error message=");
        sb2.append(this.f13585g);
        sb2.append(", custom actions=");
        sb2.append(this.f13587i);
        sb2.append(", active item id=");
        return a2.c.i(this.f13588j, "}", sb2);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f13579a);
        parcel.writeLong(this.f13580b);
        parcel.writeFloat(this.f13582d);
        parcel.writeLong(this.f13586h);
        parcel.writeLong(this.f13581c);
        parcel.writeLong(this.f13583e);
        TextUtils.writeToParcel(this.f13585g, parcel, i5);
        parcel.writeTypedList(this.f13587i);
        parcel.writeLong(this.f13588j);
        parcel.writeBundle(this.f13589k);
        parcel.writeInt(this.f13584f);
    }
}
