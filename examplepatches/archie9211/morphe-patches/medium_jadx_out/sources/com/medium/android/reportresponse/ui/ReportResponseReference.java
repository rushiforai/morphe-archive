package com.medium.android.reportresponse.ui;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.ev6;
import defpackage.g76;
import defpackage.ka1;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\n\u000bR\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X¦\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\t\u0082\u0001\u0002\f\r¨\u0006\u000eÀ\u0006\u0003"}, d2 = {"Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "Landroid/os/Parcelable;", "responseId", "", "getResponseId", "()Ljava/lang/String;", "canHideResponse", "", "getCanHideResponse", "()Z", "Post", "Catalog", "Lcom/medium/android/reportresponse/ui/ReportResponseReference$Catalog;", "Lcom/medium/android/reportresponse/ui/ReportResponseReference$Post;", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public interface ReportResponseReference extends Parcelable {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0002\b\t\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\n\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0013J.\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u0013J\u0010\u0010\u001a\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\u001a\u0010\u000bJ\u001a\u0010\u001d\u001a\u00020\u00042\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bHÖ\u0003¢\u0006\u0004\b\u001d\u0010\u001eR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u001f\u001a\u0004\b \u0010\u0013R\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010!\u001a\u0004\b\"\u0010\u0015R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u001a\u0004\b#\u0010\u0013¨\u0006$"}, d2 = {"Lcom/medium/android/reportresponse/ui/ReportResponseReference$Catalog;", "Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "", "responseId", "", "canHideResponse", "catalogId", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Z", "component3", "copy", "(Ljava/lang/String;ZLjava/lang/String;)Lcom/medium/android/reportresponse/ui/ReportResponseReference$Catalog;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getResponseId", "Z", "getCanHideResponse", "getCatalogId", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Catalog implements ReportResponseReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Catalog> CREATOR = new a();
        private final boolean canHideResponse;
        private final String catalogId;
        private final String responseId;

        public Catalog(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.responseId = str;
            this.canHideResponse = z;
            this.catalogId = str2;
        }

        public static /* synthetic */ Catalog copy$default(Catalog catalog, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalog.responseId;
            }
            if ((i & 2) != 0) {
                z = catalog.canHideResponse;
            }
            if ((i & 4) != 0) {
                str2 = catalog.catalogId;
            }
            return catalog.copy(str, z, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getResponseId() {
            return this.responseId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getCanHideResponse() {
            return this.canHideResponse;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        public final Catalog copy(String responseId, boolean canHideResponse, String catalogId) {
            responseId.getClass();
            catalogId.getClass();
            return new Catalog(responseId, canHideResponse, catalogId);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Catalog)) {
                return false;
            }
            Catalog catalog = (Catalog) other;
            return g76.L(this.responseId, catalog.responseId) && this.canHideResponse == catalog.canHideResponse && g76.L(this.catalogId, catalog.catalogId);
        }

        @Override // com.medium.android.reportresponse.ui.ReportResponseReference
        public boolean getCanHideResponse() {
            return this.canHideResponse;
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        @Override // com.medium.android.reportresponse.ui.ReportResponseReference
        public String getResponseId() {
            return this.responseId;
        }

        public int hashCode() {
            return this.catalogId.hashCode() + (((this.responseId.hashCode() * 31) + (this.canHideResponse ? 1231 : 1237)) * 31);
        }

        public String toString() {
            String str = this.responseId;
            boolean z = this.canHideResponse;
            return ka1.v(ev6.D("Catalog(responseId=", str, ", canHideResponse=", ", catalogId=", z), this.catalogId, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.responseId);
            dest.writeInt(this.canHideResponse ? 1 : 0);
            dest.writeString(this.catalogId);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0002\b\t\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\r\u0010\n\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0013J.\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u0013J\u0010\u0010\u001a\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\u001a\u0010\u000bJ\u001a\u0010\u001d\u001a\u00020\u00042\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bHÖ\u0003¢\u0006\u0004\b\u001d\u0010\u001eR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u001f\u001a\u0004\b \u0010\u0013R\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010!\u001a\u0004\b\"\u0010\u0015R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u001a\u0004\b#\u0010\u0013¨\u0006$"}, d2 = {"Lcom/medium/android/reportresponse/ui/ReportResponseReference$Post;", "Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "", "responseId", "", "canHideResponse", "rootPostId", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Z", "component3", "copy", "(Ljava/lang/String;ZLjava/lang/String;)Lcom/medium/android/reportresponse/ui/ReportResponseReference$Post;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getResponseId", "Z", "getCanHideResponse", "getRootPostId", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post implements ReportResponseReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<Post> CREATOR = new b();
        private final boolean canHideResponse;
        private final String responseId;
        private final String rootPostId;

        public Post(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.responseId = str;
            this.canHideResponse = z;
            this.rootPostId = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.responseId;
            }
            if ((i & 2) != 0) {
                z = post.canHideResponse;
            }
            if ((i & 4) != 0) {
                str2 = post.rootPostId;
            }
            return post.copy(str, z, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getResponseId() {
            return this.responseId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getCanHideResponse() {
            return this.canHideResponse;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getRootPostId() {
            return this.rootPostId;
        }

        public final Post copy(String responseId, boolean canHideResponse, String rootPostId) {
            responseId.getClass();
            rootPostId.getClass();
            return new Post(responseId, canHideResponse, rootPostId);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.responseId, post.responseId) && this.canHideResponse == post.canHideResponse && g76.L(this.rootPostId, post.rootPostId);
        }

        @Override // com.medium.android.reportresponse.ui.ReportResponseReference
        public boolean getCanHideResponse() {
            return this.canHideResponse;
        }

        @Override // com.medium.android.reportresponse.ui.ReportResponseReference
        public String getResponseId() {
            return this.responseId;
        }

        public final String getRootPostId() {
            return this.rootPostId;
        }

        public int hashCode() {
            return this.rootPostId.hashCode() + (((this.responseId.hashCode() * 31) + (this.canHideResponse ? 1231 : 1237)) * 31);
        }

        public String toString() {
            String str = this.responseId;
            boolean z = this.canHideResponse;
            return ka1.v(ev6.D("Post(responseId=", str, ", canHideResponse=", ", rootPostId=", z), this.rootPostId, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.responseId);
            dest.writeInt(this.canHideResponse ? 1 : 0);
            dest.writeString(this.rootPostId);
        }
    }

    boolean getCanHideResponse();

    String getResponseId();
}
