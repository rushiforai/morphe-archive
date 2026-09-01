package com.medium.android.graphql.fragment;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.type.PartnerProgramV4EnrollmentStatus;
import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.km4;
import defpackage.wgd;
import defpackage.y30;
import defpackage.z73;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b$\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b(\b\u0086\b\u0018\u00002\u00020\u0001:\bfghijklmBË\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0012\u001a\u00020\u0002\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u0017\u0012\b\u0010\u001a\u001a\u0004\u0018\u00010\u000e\u0012\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017\u0012\u0006\u0010\u001c\u001a\u00020\u000e\u0012\u0006\u0010\u001d\u001a\u00020\u0002\u0012\b\u0010\u001f\u001a\u0004\u0018\u00010\u001e¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b$\u0010#J\u0012\u0010%\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b%\u0010#J\u0012\u0010&\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b&\u0010#J\u0012\u0010'\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b'\u0010#J\u0012\u0010(\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b(\u0010#J\u0012\u0010)\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b)\u0010#J\u0012\u0010*\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b*\u0010+J\u0012\u0010,\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b,\u0010-J\u0012\u0010.\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b.\u0010/J\u0010\u00100\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\b0\u00101J\u0010\u00102\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b2\u0010#J\u0012\u00103\u001a\u0004\u0018\u00010\u0013HÆ\u0003¢\u0006\u0004\b3\u00104J\u0012\u00105\u001a\u0004\u0018\u00010\u0015HÆ\u0003¢\u0006\u0004\b5\u00106J\u0016\u00107\u001a\b\u0012\u0004\u0012\u00020\u00180\u0017HÆ\u0003¢\u0006\u0004\b7\u00108J\u0012\u00109\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b9\u0010/J\u0016\u0010:\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017HÆ\u0003¢\u0006\u0004\b:\u00108J\u0010\u0010;\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b;\u0010<J\u0010\u0010=\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b=\u0010#J\u0012\u0010>\u001a\u0004\u0018\u00010\u001eHÆ\u0003¢\u0006\u0004\b>\u0010?Jü\u0001\u0010@\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u00102\b\b\u0002\u0010\u0012\u001a\u00020\u00022\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\u000e\b\u0002\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u00172\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u000e2\u000e\b\u0002\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u00172\b\b\u0002\u0010\u001c\u001a\u00020\u000e2\b\b\u0002\u0010\u001d\u001a\u00020\u00022\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001eHÆ\u0001¢\u0006\u0004\b@\u0010AJ\u0010\u0010B\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\bB\u0010#J\u0010\u0010D\u001a\u00020CHÖ\u0001¢\u0006\u0004\bD\u0010EJ\u001a\u0010H\u001a\u00020\u000e2\b\u0010G\u001a\u0004\u0018\u00010FHÖ\u0003¢\u0006\u0004\bH\u0010IR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010J\u001a\u0004\bK\u0010#R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010J\u001a\u0004\bL\u0010#R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010J\u001a\u0004\bM\u0010#R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010J\u001a\u0004\bN\u0010#R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010J\u001a\u0004\bO\u0010#R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010J\u001a\u0004\bP\u0010#R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010J\u001a\u0004\bQ\u0010#R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010R\u001a\u0004\bS\u0010+R\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u0010T\u001a\u0004\bU\u0010-R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010V\u001a\u0004\b\u000f\u0010/R\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010W\u001a\u0004\bX\u00101R\u0017\u0010\u0012\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0012\u0010J\u001a\u0004\bY\u0010#R\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006¢\u0006\f\n\u0004\b\u0014\u0010Z\u001a\u0004\b[\u00104R\u0019\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006¢\u0006\f\n\u0004\b\u0016\u0010\\\u001a\u0004\b]\u00106R\u001d\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u00178\u0006¢\u0006\f\n\u0004\b\u0019\u0010^\u001a\u0004\b_\u00108R\u0019\u0010\u001a\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u001a\u0010V\u001a\u0004\b`\u0010/R\u001d\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00020\u00178\u0006¢\u0006\f\n\u0004\b\u001b\u0010^\u001a\u0004\ba\u00108R\u0017\u0010\u001c\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u001c\u0010b\u001a\u0004\b\u001c\u0010<R\u0017\u0010\u001d\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001d\u0010J\u001a\u0004\bc\u0010#R\u0019\u0010\u001f\u001a\u0004\u0018\u00010\u001e8\u0006¢\u0006\f\n\u0004\b\u001f\u0010d\u001a\u0004\be\u0010?¨\u0006n"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData;", "Lg15;", "", "__typename", "id", "name", "username", "imageId", "bio", "aboutAsHtml", "Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "socialStats", "Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "membership", "", "isMembershipTrialEligible", "Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "viewerEdge", "twitterScreenName", "Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "verifications", "Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "partnerProgramEnrollment", "", "Lcom/medium/android/graphql/fragment/CurrentUserData$AdminCollection;", "adminCollections", "allowEmailAddressSharingEditorWriter", "pronouns", "isSuspended", "xDisplayName", "Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "linkedAccounts", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;Ljava/util/List;Ljava/lang/Boolean;Ljava/util/List;ZLjava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "()Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "component9", "()Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "component10", "()Ljava/lang/Boolean;", "component11", "()Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "component12", "component13", "()Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "component14", "()Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "component15", "()Ljava/util/List;", "component16", "component17", "component18", "()Z", "component19", "component20", "()Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;Ljava/util/List;Ljava/lang/Boolean;Ljava/util/List;ZLjava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;)Lcom/medium/android/graphql/fragment/CurrentUserData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getUsername", "getImageId", "getBio", "getAboutAsHtml", "Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "getSocialStats", "Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "getMembership", "Ljava/lang/Boolean;", "Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "getViewerEdge", "getTwitterScreenName", "Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "getVerifications", "Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "getPartnerProgramEnrollment", "Ljava/util/List;", "getAdminCollections", "getAllowEmailAddressSharingEditorWriter", "getPronouns", "Z", "getXDisplayName", "Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "getLinkedAccounts", "SocialStats", "Membership", "ViewerEdge", "Verifications", "PartnerProgramEnrollment", "AdminCollection", "LinkedAccounts", "Mastodon", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CurrentUserData implements g15 {
    private final String __typename;
    private final String aboutAsHtml;
    private final List<AdminCollection> adminCollections;
    private final Boolean allowEmailAddressSharingEditorWriter;
    private final String bio;
    private final String id;
    private final String imageId;
    private final Boolean isMembershipTrialEligible;
    private final boolean isSuspended;
    private final LinkedAccounts linkedAccounts;
    private final Membership membership;
    private final String name;
    private final PartnerProgramEnrollment partnerProgramEnrollment;
    private final List<String> pronouns;
    private final SocialStats socialStats;
    private final String twitterScreenName;
    private final String username;
    private final Verifications verifications;
    private final ViewerEdge viewerEdge;
    private final String xDisplayName;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$AdminCollection;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AdminCollection {
        private final String __typename;
        private final String id;
        private final String name;

        public AdminCollection(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ AdminCollection copy$default(AdminCollection adminCollection, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = adminCollection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = adminCollection.id;
            }
            if ((i & 4) != 0) {
                str3 = adminCollection.name;
            }
            return adminCollection.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        public final AdminCollection copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new AdminCollection(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AdminCollection)) {
                return false;
            }
            AdminCollection adminCollection = (AdminCollection) other;
            return g76.L(this.__typename, adminCollection.__typename) && g76.L(this.id, adminCollection.id) && g76.L(this.name, adminCollection.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("AdminCollection(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "", "__typename", "", "mastodon", "Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;)V", "get__typename", "()Ljava/lang/String;", "getMastodon", "()Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class LinkedAccounts {
        private final String __typename;
        private final Mastodon mastodon;

        public LinkedAccounts(String str, Mastodon mastodon) {
            str.getClass();
            this.__typename = str;
            this.mastodon = mastodon;
        }

        public static /* synthetic */ LinkedAccounts copy$default(LinkedAccounts linkedAccounts, String str, Mastodon mastodon, int i, Object obj) {
            if ((i & 1) != 0) {
                str = linkedAccounts.__typename;
            }
            if ((i & 2) != 0) {
                mastodon = linkedAccounts.mastodon;
            }
            return linkedAccounts.copy(str, mastodon);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Mastodon getMastodon() {
            return this.mastodon;
        }

        public final LinkedAccounts copy(String __typename, Mastodon mastodon) {
            __typename.getClass();
            return new LinkedAccounts(__typename, mastodon);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof LinkedAccounts)) {
                return false;
            }
            LinkedAccounts linkedAccounts = (LinkedAccounts) other;
            return g76.L(this.__typename, linkedAccounts.__typename) && g76.L(this.mastodon, linkedAccounts.mastodon);
        }

        public final Mastodon getMastodon() {
            return this.mastodon;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Mastodon mastodon = this.mastodon;
            return iHashCode + (mastodon == null ? 0 : mastodon.hashCode());
        }

        public final String toString() {
            return "LinkedAccounts(__typename=" + this.__typename + ", mastodon=" + this.mastodon + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J'\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;", "", "__typename", "", "domain", "username", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getDomain", "getUsername", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Mastodon {
        private final String __typename;
        private final String domain;
        private final String username;

        public Mastodon(String str, String str2, String str3) {
            b09.I(str, str2, str3);
            this.__typename = str;
            this.domain = str2;
            this.username = str3;
        }

        public static /* synthetic */ Mastodon copy$default(Mastodon mastodon, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mastodon.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mastodon.domain;
            }
            if ((i & 4) != 0) {
                str3 = mastodon.username;
            }
            return mastodon.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getDomain() {
            return this.domain;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getUsername() {
            return this.username;
        }

        public final Mastodon copy(String __typename, String domain, String username) {
            __typename.getClass();
            domain.getClass();
            username.getClass();
            return new Mastodon(__typename, domain, username);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Mastodon)) {
                return false;
            }
            Mastodon mastodon = (Mastodon) other;
            return g76.L(this.__typename, mastodon.__typename) && g76.L(this.domain, mastodon.domain) && g76.L(this.username, mastodon.username);
        }

        public final String getDomain() {
            return this.domain;
        }

        public final String getUsername() {
            return this.username;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.username.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.domain);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.domain;
            return ka1.v(y30.u("Mastodon(__typename=", str, peNPu.XjVBKUeMz, str2, ", username="), this.username, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Membership {
        private final String __typename;
        private final MembershipFragment membershipFragment;

        public Membership(String str, MembershipFragment membershipFragment) {
            str.getClass();
            membershipFragment.getClass();
            this.__typename = str;
            this.membershipFragment = membershipFragment;
        }

        public static /* synthetic */ Membership copy$default(Membership membership, String str, MembershipFragment membershipFragment, int i, Object obj) {
            if ((i & 1) != 0) {
                str = membership.__typename;
            }
            if ((i & 2) != 0) {
                membershipFragment = membership.membershipFragment;
            }
            return membership.copy(str, membershipFragment);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final Membership copy(String __typename, MembershipFragment membershipFragment) {
            __typename.getClass();
            membershipFragment.getClass();
            return new Membership(__typename, membershipFragment);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Membership)) {
                return false;
            }
            Membership membership = (Membership) other;
            return g76.L(this.__typename, membership.__typename) && g76.L(this.membershipFragment, membership.membershipFragment);
        }

        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.membershipFragment.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Membership(__typename=" + this.__typename + ", membershipFragment=" + this.membershipFragment + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ<\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u000f\u0010\rR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u0010\u0010\r¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "", "__typename", "", "followerCount", "", "followingCount", "collectionFollowingCount", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getFollowerCount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getFollowingCount", "getCollectionFollowingCount", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SocialStats {
        private final String __typename;
        private final Long collectionFollowingCount;
        private final Long followerCount;
        private final Long followingCount;

        public SocialStats(String str, Long l, Long l2, Long l3) {
            str.getClass();
            this.__typename = str;
            this.followerCount = l;
            this.followingCount = l2;
            this.collectionFollowingCount = l3;
        }

        public static /* synthetic */ SocialStats copy$default(SocialStats socialStats, String str, Long l, Long l2, Long l3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = socialStats.__typename;
            }
            if ((i & 2) != 0) {
                l = socialStats.followerCount;
            }
            if ((i & 4) != 0) {
                l2 = socialStats.followingCount;
            }
            if ((i & 8) != 0) {
                l3 = socialStats.collectionFollowingCount;
            }
            return socialStats.copy(str, l, l2, l3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getFollowerCount() {
            return this.followerCount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Long getFollowingCount() {
            return this.followingCount;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Long getCollectionFollowingCount() {
            return this.collectionFollowingCount;
        }

        public final SocialStats copy(String __typename, Long followerCount, Long followingCount, Long collectionFollowingCount) {
            __typename.getClass();
            return new SocialStats(__typename, followerCount, followingCount, collectionFollowingCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SocialStats)) {
                return false;
            }
            SocialStats socialStats = (SocialStats) other;
            return g76.L(this.__typename, socialStats.__typename) && g76.L(this.followerCount, socialStats.followerCount) && g76.L(this.followingCount, socialStats.followingCount) && g76.L(this.collectionFollowingCount, socialStats.collectionFollowingCount);
        }

        public final Long getCollectionFollowingCount() {
            return this.collectionFollowingCount;
        }

        public final Long getFollowerCount() {
            return this.followerCount;
        }

        public final Long getFollowingCount() {
            return this.followingCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.followerCount;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            Long l2 = this.followingCount;
            int iHashCode3 = (iHashCode2 + (l2 == null ? 0 : l2.hashCode())) * 31;
            Long l3 = this.collectionFollowingCount;
            return iHashCode3 + (l3 != null ? l3.hashCode() : 0);
        }

        public final String toString() {
            return "SocialStats(__typename=" + this.__typename + ", followerCount=" + this.followerCount + ", followingCount=" + this.followingCount + ", collectionFollowingCount=" + this.collectionFollowingCount + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Verifications {
        private final String __typename;
        private final boolean isBookAuthor;

        public Verifications(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.isBookAuthor = z;
        }

        public static /* synthetic */ Verifications copy$default(Verifications verifications, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = verifications.__typename;
            }
            if ((i & 2) != 0) {
                z = verifications.isBookAuthor;
            }
            return verifications.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsBookAuthor() {
            return this.isBookAuthor;
        }

        public final Verifications copy(String __typename, boolean isBookAuthor) {
            __typename.getClass();
            return new Verifications(__typename, isBookAuthor);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Verifications)) {
                return false;
            }
            Verifications verifications = (Verifications) other;
            return g76.L(this.__typename, verifications.__typename) && this.isBookAuthor == verifications.isBookAuthor;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.isBookAuthor ? 1231 : 1237);
        }

        public final boolean isBookAuthor() {
            return this.isBookAuthor;
        }

        public final String toString() {
            return km4.z("Verifications(__typename=", this.__typename, ", isBookAuthor=", ")", this.isBookAuthor);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0019\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\u0006\u0010\n\u001a\u00020\u0003¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0006HÆ\u0003J\u0010\u0010\u001a\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0002\u0010\u0013J\u0010\u0010\u001b\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0002\u0010\u0013J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003JP\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\n\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u001eJ\u0013\u0010\u001f\u001a\u00020\u00062\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0012\u0010\u0013R\u0015\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0015\u0010\u0013R\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000e¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "", "__typename", "", "facebookDisplayName", "hasList", "", "firstOpenedAndroidApp", "", "lastPostCreatedAt", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFacebookDisplayName", "getHasList", "()Z", "getFirstOpenedAndroidApp", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getLastPostCreatedAt", "getId", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String facebookDisplayName;
        private final Long firstOpenedAndroidApp;
        private final boolean hasList;
        private final String id;
        private final Long lastPostCreatedAt;

        public ViewerEdge(String str, String str2, boolean z, Long l, Long l2, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.facebookDisplayName = str2;
            this.hasList = z;
            this.firstOpenedAndroidApp = l;
            this.lastPostCreatedAt = l2;
            this.id = str3;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, boolean z, Long l, Long l2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.facebookDisplayName;
            }
            if ((i & 4) != 0) {
                z = viewerEdge.hasList;
            }
            if ((i & 8) != 0) {
                l = viewerEdge.firstOpenedAndroidApp;
            }
            if ((i & 16) != 0) {
                l2 = viewerEdge.lastPostCreatedAt;
            }
            if ((i & 32) != 0) {
                str3 = viewerEdge.id;
            }
            Long l3 = l2;
            String str4 = str3;
            return viewerEdge.copy(str, str2, z, l, l3, str4);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getFacebookDisplayName() {
            return this.facebookDisplayName;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final boolean getHasList() {
            return this.hasList;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Long getFirstOpenedAndroidApp() {
            return this.firstOpenedAndroidApp;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Long getLastPostCreatedAt() {
            return this.lastPostCreatedAt;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, String facebookDisplayName, boolean hasList, Long firstOpenedAndroidApp, Long lastPostCreatedAt, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, facebookDisplayName, hasList, firstOpenedAndroidApp, lastPostCreatedAt, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.facebookDisplayName, viewerEdge.facebookDisplayName) && this.hasList == viewerEdge.hasList && g76.L(this.firstOpenedAndroidApp, viewerEdge.firstOpenedAndroidApp) && g76.L(this.lastPostCreatedAt, viewerEdge.lastPostCreatedAt) && g76.L(this.id, viewerEdge.id);
        }

        public final String getFacebookDisplayName() {
            return this.facebookDisplayName;
        }

        public final Long getFirstOpenedAndroidApp() {
            return this.firstOpenedAndroidApp;
        }

        public final boolean getHasList() {
            return this.hasList;
        }

        public final String getId() {
            return this.id;
        }

        public final Long getLastPostCreatedAt() {
            return this.lastPostCreatedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.facebookDisplayName;
            int iHashCode2 = (((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.hasList ? 1231 : 1237)) * 31;
            Long l = this.firstOpenedAndroidApp;
            int iHashCode3 = (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31;
            Long l2 = this.lastPostCreatedAt;
            return this.id.hashCode() + ((iHashCode3 + (l2 != null ? l2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.facebookDisplayName;
            boolean z = this.hasList;
            Long l = this.firstOpenedAndroidApp;
            Long l2 = this.lastPostCreatedAt;
            String str3 = this.id;
            StringBuilder sbU = y30.u("ViewerEdge(__typename=", str, ", facebookDisplayName=", str2, ", hasList=");
            sbU.append(z);
            sbU.append(", firstOpenedAndroidApp=");
            sbU.append(l);
            sbU.append(", lastPostCreatedAt=");
            sbU.append(l2);
            sbU.append(", id=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public CurrentUserData(String str, String str2, String str3, String str4, String str5, String str6, String str7, SocialStats socialStats, Membership membership, Boolean bool, ViewerEdge viewerEdge, String str8, Verifications verifications, PartnerProgramEnrollment partnerProgramEnrollment, List<AdminCollection> list, Boolean bool2, List<String> list2, boolean z, String str9, LinkedAccounts linkedAccounts) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        str8.getClass();
        list.getClass();
        list2.getClass();
        str9.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.username = str4;
        this.imageId = str5;
        this.bio = str6;
        this.aboutAsHtml = str7;
        this.socialStats = socialStats;
        this.membership = membership;
        this.isMembershipTrialEligible = bool;
        this.viewerEdge = viewerEdge;
        this.twitterScreenName = str8;
        this.verifications = verifications;
        this.partnerProgramEnrollment = partnerProgramEnrollment;
        this.adminCollections = list;
        this.allowEmailAddressSharingEditorWriter = bool2;
        this.pronouns = list2;
        this.isSuspended = z;
        this.xDisplayName = str9;
        this.linkedAccounts = linkedAccounts;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ CurrentUserData copy$default(CurrentUserData currentUserData, String str, String str2, String str3, String str4, String str5, String str6, String str7, SocialStats socialStats, Membership membership, Boolean bool, ViewerEdge viewerEdge, String str8, Verifications verifications, PartnerProgramEnrollment partnerProgramEnrollment, List list, Boolean bool2, List list2, boolean z, String str9, LinkedAccounts linkedAccounts, int i, Object obj) {
        LinkedAccounts linkedAccounts2;
        String str10;
        String str11 = (i & 1) != 0 ? currentUserData.__typename : str;
        String str12 = (i & 2) != 0 ? currentUserData.id : str2;
        String str13 = (i & 4) != 0 ? currentUserData.name : str3;
        String str14 = (i & 8) != 0 ? currentUserData.username : str4;
        String str15 = (i & 16) != 0 ? currentUserData.imageId : str5;
        String str16 = (i & 32) != 0 ? currentUserData.bio : str6;
        String str17 = (i & 64) != 0 ? currentUserData.aboutAsHtml : str7;
        SocialStats socialStats2 = (i & 128) != 0 ? currentUserData.socialStats : socialStats;
        Membership membership2 = (i & 256) != 0 ? currentUserData.membership : membership;
        Boolean bool3 = (i & 512) != 0 ? currentUserData.isMembershipTrialEligible : bool;
        ViewerEdge viewerEdge2 = (i & 1024) != 0 ? currentUserData.viewerEdge : viewerEdge;
        String str18 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? currentUserData.twitterScreenName : str8;
        Verifications verifications2 = (i & 4096) != 0 ? currentUserData.verifications : verifications;
        PartnerProgramEnrollment partnerProgramEnrollment2 = (i & 8192) != 0 ? currentUserData.partnerProgramEnrollment : partnerProgramEnrollment;
        String str19 = str11;
        List list3 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? currentUserData.adminCollections : list;
        Boolean bool4 = (i & 32768) != 0 ? currentUserData.allowEmailAddressSharingEditorWriter : bool2;
        List list4 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? currentUserData.pronouns : list2;
        boolean z2 = (i & 131072) != 0 ? currentUserData.isSuspended : z;
        String str20 = (i & 262144) != 0 ? currentUserData.xDisplayName : str9;
        if ((i & 524288) != 0) {
            str10 = str20;
            linkedAccounts2 = currentUserData.linkedAccounts;
        } else {
            linkedAccounts2 = linkedAccounts;
            str10 = str20;
        }
        return currentUserData.copy(str19, str12, str13, str14, str15, str16, str17, socialStats2, membership2, bool3, viewerEdge2, str18, verifications2, partnerProgramEnrollment2, list3, bool4, list4, z2, str10, linkedAccounts2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final Boolean getIsMembershipTrialEligible() {
        return this.isMembershipTrialEligible;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final String getTwitterScreenName() {
        return this.twitterScreenName;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final Verifications getVerifications() {
        return this.verifications;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final PartnerProgramEnrollment getPartnerProgramEnrollment() {
        return this.partnerProgramEnrollment;
    }

    public final List<AdminCollection> component15() {
        return this.adminCollections;
    }

    /* JADX INFO: renamed from: component16, reason: from getter */
    public final Boolean getAllowEmailAddressSharingEditorWriter() {
        return this.allowEmailAddressSharingEditorWriter;
    }

    public final List<String> component17() {
        return this.pronouns;
    }

    /* JADX INFO: renamed from: component18, reason: from getter */
    public final boolean getIsSuspended() {
        return this.isSuspended;
    }

    /* JADX INFO: renamed from: component19, reason: from getter */
    public final String getXDisplayName() {
        return this.xDisplayName;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component20, reason: from getter */
    public final LinkedAccounts getLinkedAccounts() {
        return this.linkedAccounts;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getUsername() {
        return this.username;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getImageId() {
        return this.imageId;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getBio() {
        return this.bio;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final SocialStats getSocialStats() {
        return this.socialStats;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Membership getMembership() {
        return this.membership;
    }

    public final CurrentUserData copy(String __typename, String id, String name, String username, String imageId, String bio, String aboutAsHtml, SocialStats socialStats, Membership membership, Boolean isMembershipTrialEligible, ViewerEdge viewerEdge, String twitterScreenName, Verifications verifications, PartnerProgramEnrollment partnerProgramEnrollment, List<AdminCollection> adminCollections, Boolean allowEmailAddressSharingEditorWriter, List<String> pronouns, boolean isSuspended, String xDisplayName, LinkedAccounts linkedAccounts) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        twitterScreenName.getClass();
        adminCollections.getClass();
        pronouns.getClass();
        xDisplayName.getClass();
        return new CurrentUserData(__typename, id, name, username, imageId, bio, aboutAsHtml, socialStats, membership, isMembershipTrialEligible, viewerEdge, twitterScreenName, verifications, partnerProgramEnrollment, adminCollections, allowEmailAddressSharingEditorWriter, pronouns, isSuspended, xDisplayName, linkedAccounts);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CurrentUserData)) {
            return false;
        }
        CurrentUserData currentUserData = (CurrentUserData) other;
        return g76.L(this.__typename, currentUserData.__typename) && g76.L(this.id, currentUserData.id) && g76.L(this.name, currentUserData.name) && g76.L(this.username, currentUserData.username) && g76.L(this.imageId, currentUserData.imageId) && g76.L(this.bio, currentUserData.bio) && g76.L(this.aboutAsHtml, currentUserData.aboutAsHtml) && g76.L(this.socialStats, currentUserData.socialStats) && g76.L(this.membership, currentUserData.membership) && g76.L(this.isMembershipTrialEligible, currentUserData.isMembershipTrialEligible) && g76.L(this.viewerEdge, currentUserData.viewerEdge) && g76.L(this.twitterScreenName, currentUserData.twitterScreenName) && g76.L(this.verifications, currentUserData.verifications) && g76.L(this.partnerProgramEnrollment, currentUserData.partnerProgramEnrollment) && g76.L(this.adminCollections, currentUserData.adminCollections) && g76.L(this.allowEmailAddressSharingEditorWriter, currentUserData.allowEmailAddressSharingEditorWriter) && g76.L(this.pronouns, currentUserData.pronouns) && this.isSuspended == currentUserData.isSuspended && g76.L(this.xDisplayName, currentUserData.xDisplayName) && g76.L(this.linkedAccounts, currentUserData.linkedAccounts);
    }

    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    public final List<AdminCollection> getAdminCollections() {
        return this.adminCollections;
    }

    public final Boolean getAllowEmailAddressSharingEditorWriter() {
        return this.allowEmailAddressSharingEditorWriter;
    }

    public final String getBio() {
        return this.bio;
    }

    public final String getId() {
        return this.id;
    }

    public final String getImageId() {
        return this.imageId;
    }

    public final LinkedAccounts getLinkedAccounts() {
        return this.linkedAccounts;
    }

    public final Membership getMembership() {
        return this.membership;
    }

    public final String getName() {
        return this.name;
    }

    public final PartnerProgramEnrollment getPartnerProgramEnrollment() {
        return this.partnerProgramEnrollment;
    }

    public final List<String> getPronouns() {
        return this.pronouns;
    }

    public final SocialStats getSocialStats() {
        return this.socialStats;
    }

    public final String getTwitterScreenName() {
        return this.twitterScreenName;
    }

    public final String getUsername() {
        return this.username;
    }

    public final Verifications getVerifications() {
        return this.verifications;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String getXDisplayName() {
        return this.xDisplayName;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.name;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.username;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.imageId;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.bio;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.aboutAsHtml;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        SocialStats socialStats = this.socialStats;
        int iHashCode6 = (iHashCode5 + (socialStats == null ? 0 : socialStats.hashCode())) * 31;
        Membership membership = this.membership;
        int iHashCode7 = (iHashCode6 + (membership == null ? 0 : membership.hashCode())) * 31;
        Boolean bool = this.isMembershipTrialEligible;
        int iO2 = wgd.o((this.viewerEdge.hashCode() + ((iHashCode7 + (bool == null ? 0 : bool.hashCode())) * 31)) * 31, 31, this.twitterScreenName);
        Verifications verifications = this.verifications;
        int iHashCode8 = (iO2 + (verifications == null ? 0 : verifications.hashCode())) * 31;
        PartnerProgramEnrollment partnerProgramEnrollment = this.partnerProgramEnrollment;
        int iP = wgd.p((iHashCode8 + (partnerProgramEnrollment == null ? 0 : partnerProgramEnrollment.hashCode())) * 31, 31, this.adminCollections);
        Boolean bool2 = this.allowEmailAddressSharingEditorWriter;
        int iO3 = wgd.o((wgd.p((iP + (bool2 == null ? 0 : bool2.hashCode())) * 31, 31, this.pronouns) + (this.isSuspended ? 1231 : 1237)) * 31, 31, this.xDisplayName);
        LinkedAccounts linkedAccounts = this.linkedAccounts;
        return iO3 + (linkedAccounts != null ? linkedAccounts.hashCode() : 0);
    }

    public final Boolean isMembershipTrialEligible() {
        return this.isMembershipTrialEligible;
    }

    public final boolean isSuspended() {
        return this.isSuspended;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.username;
        String str5 = this.imageId;
        String str6 = this.bio;
        String str7 = this.aboutAsHtml;
        SocialStats socialStats = this.socialStats;
        Membership membership = this.membership;
        Boolean bool = this.isMembershipTrialEligible;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str8 = this.twitterScreenName;
        Verifications verifications = this.verifications;
        PartnerProgramEnrollment partnerProgramEnrollment = this.partnerProgramEnrollment;
        List<AdminCollection> list = this.adminCollections;
        Boolean bool2 = this.allowEmailAddressSharingEditorWriter;
        List<String> list2 = this.pronouns;
        boolean z = this.isSuspended;
        String str9 = this.xDisplayName;
        LinkedAccounts linkedAccounts = this.linkedAccounts;
        StringBuilder sbU = y30.u("CurrentUserData(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", username=", str4, ", imageId=");
        ka1.C(sbU, str5, ", bio=", str6, ", aboutAsHtml=");
        sbU.append(str7);
        sbU.append(", socialStats=");
        sbU.append(socialStats);
        sbU.append(", membership=");
        sbU.append(membership);
        sbU.append(", isMembershipTrialEligible=");
        sbU.append(bool);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", twitterScreenName=");
        sbU.append(str8);
        sbU.append(", verifications=");
        sbU.append(verifications);
        sbU.append(", partnerProgramEnrollment=");
        sbU.append(partnerProgramEnrollment);
        sbU.append(", adminCollections=");
        sbU.append(list);
        sbU.append(", allowEmailAddressSharingEditorWriter=");
        sbU.append(bool2);
        sbU.append(", pronouns=");
        sbU.append(list2);
        sbU.append(", isSuspended=");
        sbU.append(z);
        sbU.append(", xDisplayName=");
        sbU.append(str9);
        sbU.append(", linkedAccounts=");
        sbU.append(linkedAccounts);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\n\u0010\u000b\u001a\u0004\b\f\u0010\r¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "", "__typename", "", "status", "Lcom/medium/android/graphql/type/PartnerProgramV4EnrollmentStatus;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PartnerProgramV4EnrollmentStatus;)V", "get__typename", "()Ljava/lang/String;", "getStatus$annotations", "()V", "getStatus", "()Lcom/medium/android/graphql/type/PartnerProgramV4EnrollmentStatus;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PartnerProgramEnrollment {
        private final String __typename;
        private final PartnerProgramV4EnrollmentStatus status;

        public PartnerProgramEnrollment(String str, PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatus) {
            str.getClass();
            partnerProgramV4EnrollmentStatus.getClass();
            this.__typename = str;
            this.status = partnerProgramV4EnrollmentStatus;
        }

        public static /* synthetic */ PartnerProgramEnrollment copy$default(PartnerProgramEnrollment partnerProgramEnrollment, String str, PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatus, int i, Object obj) {
            if ((i & 1) != 0) {
                str = partnerProgramEnrollment.__typename;
            }
            if ((i & 2) != 0) {
                partnerProgramV4EnrollmentStatus = partnerProgramEnrollment.status;
            }
            return partnerProgramEnrollment.copy(str, partnerProgramV4EnrollmentStatus);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PartnerProgramV4EnrollmentStatus getStatus() {
            return this.status;
        }

        public final PartnerProgramEnrollment copy(String __typename, PartnerProgramV4EnrollmentStatus status) {
            __typename.getClass();
            status.getClass();
            return new PartnerProgramEnrollment(__typename, status);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PartnerProgramEnrollment)) {
                return false;
            }
            PartnerProgramEnrollment partnerProgramEnrollment = (PartnerProgramEnrollment) other;
            return g76.L(this.__typename, partnerProgramEnrollment.__typename) && this.status == partnerProgramEnrollment.status;
        }

        public final PartnerProgramV4EnrollmentStatus getStatus() {
            return this.status;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.status.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "PartnerProgramEnrollment(__typename=" + this.__typename + ", status=" + this.status + ")";
        }

        @z73
        public static /* synthetic */ void getStatus$annotations() {
        }
    }
}
