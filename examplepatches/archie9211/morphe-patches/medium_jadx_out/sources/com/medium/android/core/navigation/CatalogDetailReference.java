package com.medium.android.core.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.graphql.type.PredefinedCatalogType;
import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006À\u0006\u0003"}, d2 = {"Lcom/medium/android/core/navigation/CatalogDetailReference;", "Landroid/os/Parcelable;", "CatalogDetailById", "PredefinedCatalogDetail", "Lcom/medium/android/core/navigation/CatalogDetailReference$CatalogDetailById;", "Lcom/medium/android/core/navigation/CatalogDetailReference$PredefinedCatalogDetail;", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public interface CatalogDetailReference extends Parcelable {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/core/navigation/CatalogDetailReference$CatalogDetailById;", "Lcom/medium/android/core/navigation/CatalogDetailReference;", "", "catalogId", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/core/navigation/CatalogDetailReference$CatalogDetailById;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogDetailById implements CatalogDetailReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<CatalogDetailById> CREATOR = new a();
        private final String catalogId;

        public CatalogDetailById(String str) {
            str.getClass();
            this.catalogId = str;
        }

        public static /* synthetic */ CatalogDetailById copy$default(CatalogDetailById catalogDetailById, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogDetailById.catalogId;
            }
            return catalogDetailById.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getCatalogId() {
            return this.catalogId;
        }

        public final CatalogDetailById copy(String catalogId) {
            catalogId.getClass();
            return new CatalogDetailById(catalogId);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof CatalogDetailById) && g76.L(this.catalogId, ((CatalogDetailById) other).catalogId);
        }

        public final String getCatalogId() {
            return this.catalogId;
        }

        public int hashCode() {
            return this.catalogId.hashCode();
        }

        public String toString() {
            return ev6.x("CatalogDetailById(catalogId=", this.catalogId, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.catalogId);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J$\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0018\u0010\nJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b!\u0010\u0014¨\u0006\""}, d2 = {"Lcom/medium/android/core/navigation/CatalogDetailReference$PredefinedCatalogDetail;", "Lcom/medium/android/core/navigation/CatalogDetailReference;", "", "username", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "predefinedCatalogType", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PredefinedCatalogType;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PredefinedCatalogType;)Lcom/medium/android/core/navigation/CatalogDetailReference$PredefinedCatalogDetail;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUsername", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getPredefinedCatalogType", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PredefinedCatalogDetail implements CatalogDetailReference {
        public static final int $stable = 0;
        public static final Parcelable.Creator<PredefinedCatalogDetail> CREATOR = new b();
        private final PredefinedCatalogType predefinedCatalogType;
        private final String username;

        public PredefinedCatalogDetail(String str, PredefinedCatalogType predefinedCatalogType) {
            str.getClass();
            predefinedCatalogType.getClass();
            this.username = str;
            this.predefinedCatalogType = predefinedCatalogType;
        }

        public static /* synthetic */ PredefinedCatalogDetail copy$default(PredefinedCatalogDetail predefinedCatalogDetail, String str, PredefinedCatalogType predefinedCatalogType, int i, Object obj) {
            if ((i & 1) != 0) {
                str = predefinedCatalogDetail.username;
            }
            if ((i & 2) != 0) {
                predefinedCatalogType = predefinedCatalogDetail.predefinedCatalogType;
            }
            return predefinedCatalogDetail.copy(str, predefinedCatalogType);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getUsername() {
            return this.username;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PredefinedCatalogType getPredefinedCatalogType() {
            return this.predefinedCatalogType;
        }

        public final PredefinedCatalogDetail copy(String username, PredefinedCatalogType predefinedCatalogType) {
            username.getClass();
            predefinedCatalogType.getClass();
            return new PredefinedCatalogDetail(username, predefinedCatalogType);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PredefinedCatalogDetail)) {
                return false;
            }
            PredefinedCatalogDetail predefinedCatalogDetail = (PredefinedCatalogDetail) other;
            return g76.L(this.username, predefinedCatalogDetail.username) && this.predefinedCatalogType == predefinedCatalogDetail.predefinedCatalogType;
        }

        public final PredefinedCatalogType getPredefinedCatalogType() {
            return this.predefinedCatalogType;
        }

        public final String getUsername() {
            return this.username;
        }

        public int hashCode() {
            return this.predefinedCatalogType.hashCode() + (this.username.hashCode() * 31);
        }

        public String toString() {
            return "PredefinedCatalogDetail(username=" + this.username + ", predefinedCatalogType=" + this.predefinedCatalogType + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.username);
            dest.writeString(this.predefinedCatalogType.name());
        }
    }
}
