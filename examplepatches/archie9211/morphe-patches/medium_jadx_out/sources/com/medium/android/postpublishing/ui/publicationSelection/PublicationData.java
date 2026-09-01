package com.medium.android.postpublishing.ui.publicationSelection;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g04;
import defpackage.g76;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.rv8;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u0000\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001:\u0002=>BQ\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000e\u001a\u00020\u0007¢\u0006\u0004\b\u000f\u0010\u0010J\r\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0012\u0010\u0013J\u001d\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0011¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001bJ\u0010\u0010\u001d\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001bJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001bJ\u0010\u0010\u001f\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b#\u0010 J\u0010\u0010$\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b&\u0010 Jl\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\u000b\u001a\u00020\u00072\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000e\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b)\u0010\u001bJ\u0010\u0010*\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b*\u0010\u0013J\u001a\u0010-\u001a\u00020\u00072\b\u0010,\u001a\u0004\u0018\u00010+HÖ\u0003¢\u0006\u0004\b-\u0010.R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010/\u001a\u0004\b0\u0010\u001bR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010/\u001a\u0004\b1\u0010\u001bR\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010/\u001a\u0004\b2\u0010\u001bR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010/\u001a\u0004\b3\u0010\u001bR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00104\u001a\u0004\b\b\u0010 R\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u00105\u001a\u0004\b6\u0010\"R\u0017\u0010\u000b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\u000b\u00104\u001a\u0004\b\u000b\u0010 R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u00107\u001a\u0004\b8\u0010%R\u0017\u0010\u000e\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\u000e\u00104\u001a\u0004\b9\u0010 R\u0013\u0010<\u001a\u0004\u0018\u00010:8F¢\u0006\u0006\u001a\u0004\b;\u0010\u001b¨\u0006?"}, d2 = {"Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData;", "Landroid/os/Parcelable;", "", "id", "slug", "name", "avatarId", "", "isSelected", "Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;", "role", "isAcceptingSubmissions", "Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;", "publishStatePreference", "hasSubmission", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;ZLcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;Z)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "()Z", "component6", "()Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;", "component7", "component8", "()Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;", "component9", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;ZLcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;Z)Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "getSlug", "getName", "getAvatarId", "Z", "Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;", "getRole", "Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;", "getPublishStatePreference", "getHasSubmission", "Lax5;", "getAvatar-UvEXDLI", "avatar", "PublicationRole", "PublishStatePreference", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationData implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<PublicationData> CREATOR = new b();
    private final String avatarId;
    private final boolean hasSubmission;
    private final String id;
    private final boolean isAcceptingSubmissions;
    private final boolean isSelected;
    private final String name;
    private final PublishStatePreference publishStatePreference;
    private final PublicationRole role;
    private final String slug;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublicationRole;", "", "<init>", "(Ljava/lang/String;I)V", "EDITOR", "WRITER", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PublicationRole {
        private static final /* synthetic */ g04 $ENTRIES;
        private static final /* synthetic */ PublicationRole[] $VALUES;
        public static final PublicationRole EDITOR = new PublicationRole("EDITOR", 0);
        public static final PublicationRole WRITER = new PublicationRole("WRITER", 1);

        private static final /* synthetic */ PublicationRole[] $values() {
            return new PublicationRole[]{EDITOR, WRITER};
        }

        static {
            PublicationRole[] publicationRoleArr$values = $values();
            $VALUES = publicationRoleArr$values;
            $ENTRIES = rv8.x(publicationRoleArr$values);
        }

        private PublicationRole(String str, int i) {
        }

        public static g04 getEntries() {
            return $ENTRIES;
        }

        public static PublicationRole valueOf(String str) {
            return (PublicationRole) Enum.valueOf(PublicationRole.class, str);
        }

        public static PublicationRole[] values() {
            return (PublicationRole[]) $VALUES.clone();
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/medium/android/postpublishing/ui/publicationSelection/PublicationData$PublishStatePreference;", "", "<init>", "(Ljava/lang/String;I)V", "ANY", "DRAFT", "PUBLISHED", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PublishStatePreference {
        private static final /* synthetic */ g04 $ENTRIES;
        private static final /* synthetic */ PublishStatePreference[] $VALUES;
        public static final PublishStatePreference ANY = new PublishStatePreference("ANY", 0);
        public static final PublishStatePreference DRAFT = new PublishStatePreference("DRAFT", 1);
        public static final PublishStatePreference PUBLISHED = new PublishStatePreference("PUBLISHED", 2);

        private static final /* synthetic */ PublishStatePreference[] $values() {
            return new PublishStatePreference[]{ANY, DRAFT, PUBLISHED};
        }

        static {
            PublishStatePreference[] publishStatePreferenceArr$values = $values();
            $VALUES = publishStatePreferenceArr$values;
            $ENTRIES = rv8.x(publishStatePreferenceArr$values);
        }

        private PublishStatePreference(String str, int i) {
        }

        public static g04 getEntries() {
            return $ENTRIES;
        }

        public static PublishStatePreference valueOf(String str) {
            return (PublishStatePreference) Enum.valueOf(PublishStatePreference.class, str);
        }

        public static PublishStatePreference[] values() {
            return (PublishStatePreference[]) $VALUES.clone();
        }
    }

    public PublicationData(String str, String str2, String str3, String str4, boolean z, PublicationRole publicationRole, boolean z2, PublishStatePreference publishStatePreference, boolean z3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        publicationRole.getClass();
        publishStatePreference.getClass();
        this.id = str;
        this.slug = str2;
        this.name = str3;
        this.avatarId = str4;
        this.isSelected = z;
        this.role = publicationRole;
        this.isAcceptingSubmissions = z2;
        this.publishStatePreference = publishStatePreference;
        this.hasSubmission = z3;
    }

    public static /* synthetic */ PublicationData copy$default(PublicationData publicationData, String str, String str2, String str3, String str4, boolean z, PublicationRole publicationRole, boolean z2, PublishStatePreference publishStatePreference, boolean z3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationData.id;
        }
        if ((i & 2) != 0) {
            str2 = publicationData.slug;
        }
        if ((i & 4) != 0) {
            str3 = publicationData.name;
        }
        if ((i & 8) != 0) {
            str4 = publicationData.avatarId;
        }
        if ((i & 16) != 0) {
            z = publicationData.isSelected;
        }
        if ((i & 32) != 0) {
            publicationRole = publicationData.role;
        }
        if ((i & 64) != 0) {
            z2 = publicationData.isAcceptingSubmissions;
        }
        if ((i & 128) != 0) {
            publishStatePreference = publicationData.publishStatePreference;
        }
        if ((i & 256) != 0) {
            z3 = publicationData.hasSubmission;
        }
        PublishStatePreference publishStatePreference2 = publishStatePreference;
        boolean z4 = z3;
        PublicationRole publicationRole2 = publicationRole;
        boolean z5 = z2;
        boolean z6 = z;
        String str5 = str3;
        return publicationData.copy(str, str2, str5, str4, z6, publicationRole2, z5, publishStatePreference2, z4);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getSlug() {
        return this.slug;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getAvatarId() {
        return this.avatarId;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final boolean getIsSelected() {
        return this.isSelected;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final PublicationRole getRole() {
        return this.role;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final boolean getIsAcceptingSubmissions() {
        return this.isAcceptingSubmissions;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final PublishStatePreference getPublishStatePreference() {
        return this.publishStatePreference;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final boolean getHasSubmission() {
        return this.hasSubmission;
    }

    public final PublicationData copy(String id, String slug, String name, String avatarId, boolean isSelected, PublicationRole role, boolean isAcceptingSubmissions, PublishStatePreference publishStatePreference, boolean hasSubmission) {
        id.getClass();
        slug.getClass();
        name.getClass();
        role.getClass();
        publishStatePreference.getClass();
        return new PublicationData(id, slug, name, avatarId, isSelected, role, isAcceptingSubmissions, publishStatePreference, hasSubmission);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationData)) {
            return false;
        }
        PublicationData publicationData = (PublicationData) other;
        return g76.L(this.id, publicationData.id) && g76.L(this.slug, publicationData.slug) && g76.L(this.name, publicationData.name) && g76.L(this.avatarId, publicationData.avatarId) && this.isSelected == publicationData.isSelected && this.role == publicationData.role && this.isAcceptingSubmissions == publicationData.isAcceptingSubmissions && this.publishStatePreference == publicationData.publishStatePreference && this.hasSubmission == publicationData.hasSubmission;
    }

    /* JADX INFO: renamed from: getAvatar-UvEXDLI, reason: not valid java name */
    public final String m67getAvatarUvEXDLI() {
        String str = this.avatarId;
        if (str != null) {
            return str;
        }
        return null;
    }

    public final String getAvatarId() {
        return this.avatarId;
    }

    public final boolean getHasSubmission() {
        return this.hasSubmission;
    }

    public final String getId() {
        return this.id;
    }

    public final String getName() {
        return this.name;
    }

    public final PublishStatePreference getPublishStatePreference() {
        return this.publishStatePreference;
    }

    public final PublicationRole getRole() {
        return this.role;
    }

    public final String getSlug() {
        return this.slug;
    }

    public int hashCode() {
        int iO = wgd.o(wgd.o(this.id.hashCode() * 31, 31, this.slug), 31, this.name);
        String str = this.avatarId;
        return ((this.publishStatePreference.hashCode() + ((((this.role.hashCode() + ((((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.isSelected ? 1231 : 1237)) * 31)) * 31) + (this.isAcceptingSubmissions ? 1231 : 1237)) * 31)) * 31) + (this.hasSubmission ? 1231 : 1237);
    }

    public final boolean isAcceptingSubmissions() {
        return this.isAcceptingSubmissions;
    }

    public final boolean isSelected() {
        return this.isSelected;
    }

    public String toString() {
        String str = this.id;
        String str2 = this.slug;
        String str3 = this.name;
        String str4 = this.avatarId;
        boolean z = this.isSelected;
        PublicationRole publicationRole = this.role;
        boolean z2 = this.isAcceptingSubmissions;
        PublishStatePreference publishStatePreference = this.publishStatePreference;
        boolean z3 = this.hasSubmission;
        StringBuilder sbU = y30.u("PublicationData(id=", str, ", slug=", str2, ", name=");
        ka1.C(sbU, str3, ", avatarId=", str4, ", isSelected=");
        sbU.append(z);
        sbU.append(", role=");
        sbU.append(publicationRole);
        sbU.append(", isAcceptingSubmissions=");
        sbU.append(z2);
        sbU.append(", publishStatePreference=");
        sbU.append(publishStatePreference);
        sbU.append(", hasSubmission=");
        return lv8.t(sbU, z3, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.id);
        dest.writeString(this.slug);
        dest.writeString(this.name);
        dest.writeString(this.avatarId);
        dest.writeInt(this.isSelected ? 1 : 0);
        dest.writeString(this.role.name());
        dest.writeInt(this.isAcceptingSubmissions ? 1 : 0);
        dest.writeString(this.publishStatePreference.name());
        dest.writeInt(this.hasSubmission ? 1 : 0);
    }
}
