package com.medium.android.unsplash.data;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gb6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u0001:\u0001%B\u001b\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J$\u0010\u0015\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u00022\b\b\u0003\u0010\u0005\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0018\u0010\nJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010\u001e\u0012\u0004\b \u0010!\u001a\u0004\b\u001f\u0010\u0012R \u0010\u0005\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0005\u0010\"\u0012\u0004\b$\u0010!\u001a\u0004\b#\u0010\u0014¨\u0006&"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashUser;", "Landroid/os/Parcelable;", "", "name", "Lcom/medium/android/unsplash/data/UnsplashUser$Links;", "links", "<init>", "(Ljava/lang/String;Lcom/medium/android/unsplash/data/UnsplashUser$Links;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/unsplash/data/UnsplashUser$Links;", "copy", "(Ljava/lang/String;Lcom/medium/android/unsplash/data/UnsplashUser$Links;)Lcom/medium/android/unsplash/data/UnsplashUser;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getName", "getName$annotations", "()V", "Lcom/medium/android/unsplash/data/UnsplashUser$Links;", "getLinks", "getLinks$annotations", "Links", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UnsplashUser implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<UnsplashUser> CREATOR = new Creator();
    private final Links links;
    private final String name;

    public UnsplashUser(@gb6(name = "name") String str, @gb6(name = "links") Links links) {
        str.getClass();
        links.getClass();
        this.name = str;
        this.links = links;
    }

    public static /* synthetic */ UnsplashUser copy$default(UnsplashUser unsplashUser, String str, Links links, int i, Object obj) {
        if ((i & 1) != 0) {
            str = unsplashUser.name;
        }
        if ((i & 2) != 0) {
            links = unsplashUser.links;
        }
        return unsplashUser.copy(str, links);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final Links getLinks() {
        return this.links;
    }

    public final UnsplashUser copy(@gb6(name = "name") String name, @gb6(name = "links") Links links) {
        name.getClass();
        links.getClass();
        return new UnsplashUser(name, links);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UnsplashUser)) {
            return false;
        }
        UnsplashUser unsplashUser = (UnsplashUser) other;
        return g76.L(this.name, unsplashUser.name) && g76.L(this.links, unsplashUser.links);
    }

    public final Links getLinks() {
        return this.links;
    }

    public final String getName() {
        return this.name;
    }

    public final int hashCode() {
        return this.links.hashCode() + (this.name.hashCode() * 31);
    }

    public final String toString() {
        return "UnsplashUser(name=" + this.name + ", links=" + this.links + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.name);
        this.links.writeToParcel(dest, flags);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\b\u0001\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001c\u0010\u0011\u001a\u00020\u00002\n\b\u0003\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\"\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010\u001a\u0012\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001e"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashUser$Links;", "Landroid/os/Parcelable;", "", "html", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/unsplash/data/UnsplashUser$Links;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getHtml", "getHtml$annotations", "()V", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Links implements Parcelable {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Links> CREATOR = new Creator();
        private final String html;

        public Links(@gb6(name = "html") String str) {
            this.html = str;
        }

        public static /* synthetic */ Links copy$default(Links links, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = links.html;
            }
            return links.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getHtml() {
            return this.html;
        }

        public final Links copy(@gb6(name = "html") String html) {
            return new Links(html);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Links) && g76.L(this.html, ((Links) other).html);
        }

        public final String getHtml() {
            return this.html;
        }

        public final int hashCode() {
            String str = this.html;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("Links(html=", this.html, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.html);
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

        @gb6(name = "html")
        public static /* synthetic */ void getHtml$annotations() {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements Parcelable.Creator<UnsplashUser> {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashUser createFromParcel(Parcel parcel) {
            parcel.getClass();
            return new UnsplashUser(parcel.readString(), Links.CREATOR.createFromParcel(parcel));
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final UnsplashUser[] newArray(int i) {
            return new UnsplashUser[i];
        }

        @Override // android.os.Parcelable.Creator
        public final UnsplashUser[] newArray(int i) {
            return new UnsplashUser[i];
        }
    }

    @gb6(name = "links")
    public static /* synthetic */ void getLinks$annotations() {
    }

    @gb6(name = "name")
    public static /* synthetic */ void getName$annotations() {
    }
}
