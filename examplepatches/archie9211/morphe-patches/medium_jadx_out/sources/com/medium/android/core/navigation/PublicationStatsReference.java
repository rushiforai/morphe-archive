package com.medium.android.core.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006À\u0006\u0003"}, d2 = {"Lcom/medium/android/core/navigation/PublicationStatsReference;", "Landroid/os/Parcelable;", "PubById", "PubBySlug", "Lcom/medium/android/core/navigation/PublicationStatsReference$PubById;", "Lcom/medium/android/core/navigation/PublicationStatsReference$PubBySlug;", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public interface PublicationStatsReference extends Parcelable {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/core/navigation/PublicationStatsReference$PubById;", "Lcom/medium/android/core/navigation/PublicationStatsReference;", "", "publicationId", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/core/navigation/PublicationStatsReference$PubById;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PubById implements PublicationStatsReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<PubById> CREATOR = new g();
        private final String publicationId;

        public PubById(String str) {
            str.getClass();
            this.publicationId = str;
        }

        public static /* synthetic */ PubById copy$default(PubById pubById, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pubById.publicationId;
            }
            return pubById.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getPublicationId() {
            return this.publicationId;
        }

        public final PubById copy(String publicationId) {
            publicationId.getClass();
            return new PubById(publicationId);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof PubById) && g76.L(this.publicationId, ((PubById) other).publicationId);
        }

        public final String getPublicationId() {
            return this.publicationId;
        }

        public int hashCode() {
            return this.publicationId.hashCode();
        }

        public String toString() {
            return ev6.x("PubById(publicationId=", this.publicationId, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.publicationId);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/core/navigation/PublicationStatsReference$PubBySlug;", "Lcom/medium/android/core/navigation/PublicationStatsReference;", "", "slug", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/core/navigation/PublicationStatsReference$PubBySlug;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getSlug", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PubBySlug implements PublicationStatsReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<PubBySlug> CREATOR = new h();
        private final String slug;

        public PubBySlug(String str) {
            str.getClass();
            this.slug = str;
        }

        public static /* synthetic */ PubBySlug copy$default(PubBySlug pubBySlug, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pubBySlug.slug;
            }
            return pubBySlug.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getSlug() {
            return this.slug;
        }

        public final PubBySlug copy(String slug) {
            slug.getClass();
            return new PubBySlug(slug);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof PubBySlug) && g76.L(this.slug, ((PubBySlug) other).slug);
        }

        public final String getSlug() {
            return this.slug;
        }

        public int hashCode() {
            return this.slug.hashCode();
        }

        public String toString() {
            return ev6.x("PubBySlug(slug=", this.slug, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.slug);
        }
    }
}
