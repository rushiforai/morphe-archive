package com.medium.android.unsplash.data;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gb6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010\u001a\u0012\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001e"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashUrls;", "Landroid/os/Parcelable;", "", "raw", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/unsplash/data/UnsplashUrls;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getRaw", "getRaw$annotations", "()V", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UnsplashUrls implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<UnsplashUrls> CREATOR = new Creator();
    private final String raw;

    public UnsplashUrls(@gb6(name = "raw") String str) {
        str.getClass();
        this.raw = str;
    }

    public static /* synthetic */ UnsplashUrls copy$default(UnsplashUrls unsplashUrls, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = unsplashUrls.raw;
        }
        return unsplashUrls.copy(str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getRaw() {
        return this.raw;
    }

    public final UnsplashUrls copy(@gb6(name = "raw") String raw) {
        raw.getClass();
        return new UnsplashUrls(raw);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UnsplashUrls) && g76.L(this.raw, ((UnsplashUrls) other).raw);
    }

    public final String getRaw() {
        return this.raw;
    }

    public final int hashCode() {
        return this.raw.hashCode();
    }

    public final String toString() {
        return ev6.x("UnsplashUrls(raw=", this.raw, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.raw);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements Parcelable.Creator<UnsplashUrls> {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashUrls createFromParcel(Parcel parcel) {
            parcel.getClass();
            return new UnsplashUrls(parcel.readString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashUrls[] newArray(int i) {
            return new UnsplashUrls[i];
        }

        @Override // android.os.Parcelable.Creator
        public final UnsplashUrls[] newArray(int i) {
            return new UnsplashUrls[i];
        }
    }

    @gb6(name = "raw")
    public static /* synthetic */ void getRaw$annotations() {
    }
}
