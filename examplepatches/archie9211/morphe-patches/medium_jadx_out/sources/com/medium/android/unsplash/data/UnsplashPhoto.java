package com.medium.android.unsplash.data;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gb6;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001a\b\u0087\b\u0018\u00002\u00020\u0001:\u0001DB[\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0004\u0012\n\b\u0001\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0001\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\b\b\u0001\u0010\n\u001a\u00020\t\u0012\b\b\u0001\u0010\f\u001a\u00020\u000b\u0012\b\b\u0001\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\u0004¢\u0006\u0004\b\u0011\u0010\u0012J\u001d\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0004¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u0012J\u0010\u0010\u001c\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0012J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001aJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001aJ\u0010\u0010\u001f\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\rHÆ\u0003¢\u0006\u0004\b#\u0010$Jd\u0010%\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u00022\b\b\u0003\u0010\u0005\u001a\u00020\u00042\b\b\u0003\u0010\u0006\u001a\u00020\u00042\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u00022\b\b\u0003\u0010\n\u001a\u00020\t2\b\b\u0003\u0010\f\u001a\u00020\u000b2\b\b\u0003\u0010\u000e\u001a\u00020\rHÆ\u0001¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b'\u0010\u001aJ\u0010\u0010(\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b(\u0010\u0012J\u001a\u0010,\u001a\u00020+2\b\u0010*\u001a\u0004\u0018\u00010)HÖ\u0003¢\u0006\u0004\b,\u0010-R \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010.\u0012\u0004\b0\u00101\u001a\u0004\b/\u0010\u001aR \u0010\u0005\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0005\u00102\u0012\u0004\b4\u00101\u001a\u0004\b3\u0010\u0012R \u0010\u0006\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0006\u00102\u0012\u0004\b6\u00101\u001a\u0004\b5\u0010\u0012R\"\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0007\u0010.\u0012\u0004\b8\u00101\u001a\u0004\b7\u0010\u001aR\"\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\b\u0010.\u0012\u0004\b:\u00101\u001a\u0004\b9\u0010\u001aR \u0010\n\u001a\u00020\t8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\n\u0010;\u0012\u0004\b=\u00101\u001a\u0004\b<\u0010 R \u0010\f\u001a\u00020\u000b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\f\u0010>\u0012\u0004\b@\u00101\u001a\u0004\b?\u0010\"R \u0010\u000e\u001a\u00020\r8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u000e\u0010A\u0012\u0004\bC\u00101\u001a\u0004\bB\u0010$¨\u0006E"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashPhoto;", "Landroid/os/Parcelable;", "", "id", "", "width", "height", "color", "description", "Lcom/medium/android/unsplash/data/UnsplashUrls;", "urls", "Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;", "links", "Lcom/medium/android/unsplash/data/UnsplashUser;", "user", "<init>", "(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Lcom/medium/android/unsplash/data/UnsplashUrls;Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;Lcom/medium/android/unsplash/data/UnsplashUser;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "()Lcom/medium/android/unsplash/data/UnsplashUrls;", "component7", "()Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;", "component8", "()Lcom/medium/android/unsplash/data/UnsplashUser;", "copy", "(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Lcom/medium/android/unsplash/data/UnsplashUrls;Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;Lcom/medium/android/unsplash/data/UnsplashUser;)Lcom/medium/android/unsplash/data/UnsplashPhoto;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "getId$annotations", "()V", "I", "getWidth", "getWidth$annotations", "getHeight", "getHeight$annotations", "getColor", "getColor$annotations", "getDescription", "getDescription$annotations", "Lcom/medium/android/unsplash/data/UnsplashUrls;", "getUrls", "getUrls$annotations", "Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;", "getLinks", "getLinks$annotations", "Lcom/medium/android/unsplash/data/UnsplashUser;", "getUser", "getUser$annotations", "Links", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UnsplashPhoto implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<UnsplashPhoto> CREATOR = new Creator();
    private final String color;
    private final String description;
    private final int height;
    private final String id;
    private final Links links;
    private final UnsplashUrls urls;
    private final UnsplashUser user;
    private final int width;

    public UnsplashPhoto(@gb6(name = "id") String str, @gb6(name = "width") int i, @gb6(name = "height") int i2, @gb6(name = "color") String str2, @gb6(name = "description") String str3, @gb6(name = "urls") UnsplashUrls unsplashUrls, @gb6(name = "links") Links links, @gb6(name = "user") UnsplashUser unsplashUser) {
        str.getClass();
        unsplashUrls.getClass();
        links.getClass();
        unsplashUser.getClass();
        this.id = str;
        this.width = i;
        this.height = i2;
        this.color = str2;
        this.description = str3;
        this.urls = unsplashUrls;
        this.links = links;
        this.user = unsplashUser;
    }

    public static /* synthetic */ UnsplashPhoto copy$default(UnsplashPhoto unsplashPhoto, String str, int i, int i2, String str2, String str3, UnsplashUrls unsplashUrls, Links links, UnsplashUser unsplashUser, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = unsplashPhoto.id;
        }
        if ((i3 & 2) != 0) {
            i = unsplashPhoto.width;
        }
        if ((i3 & 4) != 0) {
            i2 = unsplashPhoto.height;
        }
        if ((i3 & 8) != 0) {
            str2 = unsplashPhoto.color;
        }
        if ((i3 & 16) != 0) {
            str3 = unsplashPhoto.description;
        }
        if ((i3 & 32) != 0) {
            unsplashUrls = unsplashPhoto.urls;
        }
        if ((i3 & 64) != 0) {
            links = unsplashPhoto.links;
        }
        if ((i3 & 128) != 0) {
            unsplashUser = unsplashPhoto.user;
        }
        Links links2 = links;
        UnsplashUser unsplashUser2 = unsplashUser;
        String str4 = str3;
        UnsplashUrls unsplashUrls2 = unsplashUrls;
        return unsplashPhoto.copy(str, i, i2, str2, str4, unsplashUrls2, links2, unsplashUser2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getWidth() {
        return this.width;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getHeight() {
        return this.height;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getColor() {
        return this.color;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final UnsplashUrls getUrls() {
        return this.urls;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Links getLinks() {
        return this.links;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final UnsplashUser getUser() {
        return this.user;
    }

    public final UnsplashPhoto copy(@gb6(name = "id") String id, @gb6(name = "width") int width, @gb6(name = "height") int height, @gb6(name = "color") String color, @gb6(name = "description") String description, @gb6(name = "urls") UnsplashUrls urls, @gb6(name = "links") Links links, @gb6(name = "user") UnsplashUser user) {
        id.getClass();
        urls.getClass();
        links.getClass();
        user.getClass();
        return new UnsplashPhoto(id, width, height, color, description, urls, links, user);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UnsplashPhoto)) {
            return false;
        }
        UnsplashPhoto unsplashPhoto = (UnsplashPhoto) other;
        return g76.L(this.id, unsplashPhoto.id) && this.width == unsplashPhoto.width && this.height == unsplashPhoto.height && g76.L(this.color, unsplashPhoto.color) && g76.L(this.description, unsplashPhoto.description) && g76.L(this.urls, unsplashPhoto.urls) && g76.L(this.links, unsplashPhoto.links) && g76.L(this.user, unsplashPhoto.user);
    }

    public final String getColor() {
        return this.color;
    }

    public final String getDescription() {
        return this.description;
    }

    public final int getHeight() {
        return this.height;
    }

    public final String getId() {
        return this.id;
    }

    public final Links getLinks() {
        return this.links;
    }

    public final UnsplashUrls getUrls() {
        return this.urls;
    }

    public final UnsplashUser getUser() {
        return this.user;
    }

    public final int getWidth() {
        return this.width;
    }

    public final int hashCode() {
        int iHashCode = ((((this.id.hashCode() * 31) + this.width) * 31) + this.height) * 31;
        String str = this.color;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.description;
        return this.user.hashCode() + ((this.links.hashCode() + ((this.urls.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.id;
        int i = this.width;
        int i2 = this.height;
        String str2 = this.color;
        String str3 = this.description;
        UnsplashUrls unsplashUrls = this.urls;
        Links links = this.links;
        UnsplashUser unsplashUser = this.user;
        StringBuilder sbT = y30.t(i, "UnsplashPhoto(id=", str, ", width=", ", height=");
        sbT.append(i2);
        sbT.append(", color=");
        sbT.append(str2);
        sbT.append(", description=");
        sbT.append(str3);
        sbT.append(", urls=");
        sbT.append(unsplashUrls);
        sbT.append(", links=");
        sbT.append(links);
        sbT.append(", user=");
        sbT.append(unsplashUser);
        sbT.append(")");
        return sbT.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.id);
        dest.writeInt(this.width);
        dest.writeInt(this.height);
        dest.writeString(this.color);
        dest.writeString(this.description);
        this.urls.writeToParcel(dest, flags);
        this.links.writeToParcel(dest, flags);
        this.user.writeToParcel(dest, flags);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010\u001a\u0012\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001e"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;", "Landroid/os/Parcelable;", "", "downloadLocation", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/unsplash/data/UnsplashPhoto$Links;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getDownloadLocation", "getDownloadLocation$annotations", "()V", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Links implements Parcelable {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Links> CREATOR = new Creator();
        private final String downloadLocation;

        public Links(@gb6(name = "download_location") String str) {
            str.getClass();
            this.downloadLocation = str;
        }

        public static /* synthetic */ Links copy$default(Links links, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = links.downloadLocation;
            }
            return links.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getDownloadLocation() {
            return this.downloadLocation;
        }

        public final Links copy(@gb6(name = "download_location") String downloadLocation) {
            downloadLocation.getClass();
            return new Links(downloadLocation);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Links) && g76.L(this.downloadLocation, ((Links) other).downloadLocation);
        }

        public final String getDownloadLocation() {
            return this.downloadLocation;
        }

        public final int hashCode() {
            return this.downloadLocation.hashCode();
        }

        public final String toString() {
            return ev6.x("Links(downloadLocation=", this.downloadLocation, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.downloadLocation);
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class Creator implements Parcelable.Creator<Links> {
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Links createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new Links(parcel.readString());
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public final Links[] newArray(int i) {
                return new Links[i];
            }

            @Override // android.os.Parcelable.Creator
            public final Links[] newArray(int i) {
                return new Links[i];
            }
        }

        @gb6(name = "download_location")
        public static /* synthetic */ void getDownloadLocation$annotations() {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements Parcelable.Creator<UnsplashPhoto> {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashPhoto createFromParcel(Parcel parcel) {
            parcel.getClass();
            return new UnsplashPhoto(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.readString(), parcel.readString(), UnsplashUrls.CREATOR.createFromParcel(parcel), Links.CREATOR.createFromParcel(parcel), UnsplashUser.CREATOR.createFromParcel(parcel));
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashPhoto[] newArray(int i) {
            return new UnsplashPhoto[i];
        }

        @Override // android.os.Parcelable.Creator
        public final UnsplashPhoto[] newArray(int i) {
            return new UnsplashPhoto[i];
        }
    }

    @gb6(name = "color")
    public static /* synthetic */ void getColor$annotations() {
    }

    @gb6(name = "description")
    public static /* synthetic */ void getDescription$annotations() {
    }

    @gb6(name = "height")
    public static /* synthetic */ void getHeight$annotations() {
    }

    @gb6(name = "id")
    public static /* synthetic */ void getId$annotations() {
    }

    @gb6(name = "links")
    public static /* synthetic */ void getLinks$annotations() {
    }

    @gb6(name = "urls")
    public static /* synthetic */ void getUrls$annotations() {
    }

    @gb6(name = "user")
    public static /* synthetic */ void getUser$annotations() {
    }

    @gb6(name = "width")
    public static /* synthetic */ void getWidth$annotations() {
    }
}
