package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.android.graphql.type.PredefinedCatalogType;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001a\b\u0086\b\u0018\u00002\u00020\u0001:\u0004FGHIBa\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000e\u001a\u00020\u0002\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0006\u0010\u0012\u001a\u00020\u0011\u0012\u0006\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0018J\u0010\u0010\u001b\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0012\u0010\u001f\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b#\u0010\u0018J\u0010\u0010$\u001a\u00020\u000fHÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0011HÆ\u0003¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\u0013HÆ\u0003¢\u0006\u0004\b(\u0010)J\u0080\u0001\u0010*\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000e\u001a\u00020\u00022\b\b\u0002\u0010\u0010\u001a\u00020\u000f2\b\b\u0002\u0010\u0012\u001a\u00020\u00112\b\b\u0002\u0010\u0014\u001a\u00020\u0013HÆ\u0001¢\u0006\u0004\b*\u0010+J\u0010\u0010,\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b,\u0010\u0018J\u0010\u0010-\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b-\u0010'J\u001a\u00101\u001a\u0002002\b\u0010/\u001a\u0004\u0018\u00010.HÖ\u0003¢\u0006\u0004\b1\u00102R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00103\u001a\u0004\b4\u0010\u0018R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00103\u001a\u0004\b5\u0010\u0018R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00103\u001a\u0004\b6\u0010\u0018R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00107\u001a\u0004\b8\u0010\u001cR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00109\u001a\u0004\b:\u0010\u001eR\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010;\u001a\u0004\b<\u0010 R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010=\u001a\u0004\b>\u0010\"R\u0017\u0010\u000e\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u00103\u001a\u0004\b?\u0010\u0018R\u0017\u0010\u0010\u001a\u00020\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010@\u001a\u0004\bA\u0010%R\u0017\u0010\u0012\u001a\u00020\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010B\u001a\u0004\bC\u0010'R\u0017\u0010\u0014\u001a\u00020\u00138\u0006¢\u0006\f\n\u0004\b\u0014\u0010D\u001a\u0004\bE\u0010)¨\u0006J"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "Lg15;", "", "__typename", "id", "name", "Lcom/medium/android/graphql/type/CatalogType;", "type", "Lcom/medium/android/graphql/type/CatalogVisibility;", "visibility", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "predefined", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "creator", "version", "", "itemsLastInsertedAt", "", "postItemsCount", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;Lcom/medium/android/graphql/type/CatalogVisibility;Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;Ljava/lang/String;JILcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/type/CatalogType;", "component5", "()Lcom/medium/android/graphql/type/CatalogVisibility;", "component6", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "component7", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "component8", "component9", "()J", "component10", "()I", "component11", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;Lcom/medium/android/graphql/type/CatalogVisibility;Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;Ljava/lang/String;JILcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;)Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "Lcom/medium/android/graphql/type/CatalogType;", "getType", "Lcom/medium/android/graphql/type/CatalogVisibility;", "getVisibility", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getPredefined", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "getCreator", "getVersion", "J", "getItemsLastInsertedAt", "I", "getPostItemsCount", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "getViewerEdge", "Creator", "ViewerEdge1", "ViewerEdge", "Verifications", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogSummaryData implements g15 {
    private final String __typename;
    private final Creator creator;
    private final String id;
    private final long itemsLastInsertedAt;
    private final String name;
    private final int postItemsCount;
    private final PredefinedCatalogType predefined;
    private final CatalogType type;
    private final String version;
    private final ViewerEdge1 viewerEdge;
    private final CatalogVisibility visibility;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BO\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\f\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010!\u001a\u00020\tHÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\t\u0010#\u001a\u00020\rHÆ\u0003Ja\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\f\u001a\u00020\rHÆ\u0001J\u0013\u0010%\u001a\u00020&2\b\u0010'\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010(\u001a\u00020)HÖ\u0001J\t\u0010*\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "", "__typename", "", "id", "name", "username", "imageId", "viewerEdge", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;", "verifications", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;", "userNewsletterData", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;Lcom/medium/android/graphql/fragment/UserNewsletterData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getUsername", "getImageId", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;", "getVerifications", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;", "getUserNewsletterData", "()Lcom/medium/android/graphql/fragment/UserNewsletterData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;
        private final UserNewsletterData userNewsletterData;
        private final String username;
        private final Verifications verifications;
        private final ViewerEdge viewerEdge;

        public Creator(String str, String str2, String str3, String str4, String str5, ViewerEdge viewerEdge, Verifications verifications, UserNewsletterData userNewsletterData) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            userNewsletterData.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.username = str4;
            this.imageId = str5;
            this.viewerEdge = viewerEdge;
            this.verifications = verifications;
            this.userNewsletterData = userNewsletterData;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, String str4, String str5, ViewerEdge viewerEdge, Verifications verifications, UserNewsletterData userNewsletterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            if ((i & 8) != 0) {
                str4 = creator.username;
            }
            if ((i & 16) != 0) {
                str5 = creator.imageId;
            }
            if ((i & 32) != 0) {
                viewerEdge = creator.viewerEdge;
            }
            if ((i & 64) != 0) {
                verifications = creator.verifications;
            }
            if ((i & 128) != 0) {
                userNewsletterData = creator.userNewsletterData;
            }
            Verifications verifications2 = verifications;
            UserNewsletterData userNewsletterData2 = userNewsletterData;
            String str6 = str5;
            ViewerEdge viewerEdge2 = viewerEdge;
            return creator.copy(str, str2, str3, str4, str6, viewerEdge2, verifications2, userNewsletterData2);
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

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getUsername() {
            return this.username;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final Verifications getVerifications() {
            return this.verifications;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
        }

        public final Creator copy(String __typename, String id, String name, String username, String imageId, ViewerEdge viewerEdge, Verifications verifications, UserNewsletterData userNewsletterData) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            userNewsletterData.getClass();
            return new Creator(__typename, id, name, username, imageId, viewerEdge, verifications, userNewsletterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name) && g76.L(this.username, creator.username) && g76.L(this.imageId, creator.imageId) && g76.L(this.viewerEdge, creator.viewerEdge) && g76.L(this.verifications, creator.verifications) && g76.L(this.userNewsletterData, creator.userNewsletterData);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String getName() {
            return this.name;
        }

        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
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
            int iHashCode3 = (this.viewerEdge.hashCode() + ((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
            Verifications verifications = this.verifications;
            return this.userNewsletterData.hashCode() + ((iHashCode3 + (verifications != null ? verifications.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.username;
            String str5 = this.imageId;
            ViewerEdge viewerEdge = this.viewerEdge;
            Verifications verifications = this.verifications;
            UserNewsletterData userNewsletterData = this.userNewsletterData;
            StringBuilder sbU = y30.u("Creator(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", username=", str4, ", imageId=");
            sbU.append(str5);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(", verifications=");
            sbU.append(verifications);
            sbU.append(", userNewsletterData=");
            sbU.append(userNewsletterData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;", "", "__typename", "", "id", "isUser", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge(String str, String str2, boolean z) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isUser = z;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge.isUser;
            }
            return viewerEdge.copy(str, str2, z);
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
        public final boolean getIsUser() {
            return this.isUser;
        }

        public final ViewerEdge copy(String __typename, String id, boolean isUser) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, isUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && this.isUser == viewerEdge.isUser;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isUser ? 1231 : 1237);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return lv8.t(y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", isUser="), this.isUser, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "", "__typename", "", "id", "followersCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getId", "getFollowersCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge1 {
        private final String __typename;
        private final Integer followersCount;
        private final String id;

        public ViewerEdge1(String str, String str2, Integer num) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.followersCount = num;
        }

        public static /* synthetic */ ViewerEdge1 copy$default(ViewerEdge1 viewerEdge1, String str, String str2, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge1.id;
            }
            if ((i & 4) != 0) {
                num = viewerEdge1.followersCount;
            }
            return viewerEdge1.copy(str, str2, num);
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
        public final Integer getFollowersCount() {
            return this.followersCount;
        }

        public final ViewerEdge1 copy(String __typename, String id, Integer followersCount) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge1(__typename, id, followersCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge1)) {
                return false;
            }
            ViewerEdge1 viewerEdge1 = (ViewerEdge1) other;
            return g76.L(this.__typename, viewerEdge1.__typename) && g76.L(this.id, viewerEdge1.id) && g76.L(this.followersCount, viewerEdge1.followersCount);
        }

        public final Integer getFollowersCount() {
            return this.followersCount;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Integer num = this.followersCount;
            return iO + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Integer num = this.followersCount;
            StringBuilder sbU = y30.u(fiHTiFJ.sJFsCsyhLk, str, ", id=", str2, ", followersCount=");
            sbU.append(num);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public CatalogSummaryData(String str, String str2, String str3, CatalogType catalogType, CatalogVisibility catalogVisibility, PredefinedCatalogType predefinedCatalogType, Creator creator, String str4, long j, int i, ViewerEdge1 viewerEdge1) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        catalogType.getClass();
        catalogVisibility.getClass();
        creator.getClass();
        str4.getClass();
        viewerEdge1.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.type = catalogType;
        this.visibility = catalogVisibility;
        this.predefined = predefinedCatalogType;
        this.creator = creator;
        this.version = str4;
        this.itemsLastInsertedAt = j;
        this.postItemsCount = i;
        this.viewerEdge = viewerEdge1;
    }

    public static /* synthetic */ CatalogSummaryData copy$default(CatalogSummaryData catalogSummaryData, String str, String str2, String str3, CatalogType catalogType, CatalogVisibility catalogVisibility, PredefinedCatalogType predefinedCatalogType, Creator creator, String str4, long j, int i, ViewerEdge1 viewerEdge1, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = catalogSummaryData.__typename;
        }
        if ((i2 & 2) != 0) {
            str2 = catalogSummaryData.id;
        }
        if ((i2 & 4) != 0) {
            str3 = catalogSummaryData.name;
        }
        if ((i2 & 8) != 0) {
            catalogType = catalogSummaryData.type;
        }
        if ((i2 & 16) != 0) {
            catalogVisibility = catalogSummaryData.visibility;
        }
        if ((i2 & 32) != 0) {
            predefinedCatalogType = catalogSummaryData.predefined;
        }
        if ((i2 & 64) != 0) {
            creator = catalogSummaryData.creator;
        }
        if ((i2 & 128) != 0) {
            str4 = catalogSummaryData.version;
        }
        if ((i2 & 256) != 0) {
            j = catalogSummaryData.itemsLastInsertedAt;
        }
        if ((i2 & 512) != 0) {
            i = catalogSummaryData.postItemsCount;
        }
        if ((i2 & 1024) != 0) {
            viewerEdge1 = catalogSummaryData.viewerEdge;
        }
        long j2 = j;
        Creator creator2 = creator;
        String str5 = str4;
        CatalogVisibility catalogVisibility2 = catalogVisibility;
        PredefinedCatalogType predefinedCatalogType2 = predefinedCatalogType;
        String str6 = str3;
        CatalogType catalogType2 = catalogType;
        return catalogSummaryData.copy(str, str2, str6, catalogType2, catalogVisibility2, predefinedCatalogType2, creator2, str5, j2, i, viewerEdge1);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final int getPostItemsCount() {
        return this.postItemsCount;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final ViewerEdge1 getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final CatalogType getType() {
        return this.type;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final CatalogVisibility getVisibility() {
        return this.visibility;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final PredefinedCatalogType getPredefined() {
        return this.predefined;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getVersion() {
        return this.version;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final long getItemsLastInsertedAt() {
        return this.itemsLastInsertedAt;
    }

    public final CatalogSummaryData copy(String __typename, String id, String name, CatalogType type, CatalogVisibility visibility, PredefinedCatalogType predefined, Creator creator, String version, long itemsLastInsertedAt, int postItemsCount, ViewerEdge1 viewerEdge) {
        __typename.getClass();
        id.getClass();
        name.getClass();
        type.getClass();
        visibility.getClass();
        creator.getClass();
        version.getClass();
        viewerEdge.getClass();
        return new CatalogSummaryData(__typename, id, name, type, visibility, predefined, creator, version, itemsLastInsertedAt, postItemsCount, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogSummaryData)) {
            return false;
        }
        CatalogSummaryData catalogSummaryData = (CatalogSummaryData) other;
        return g76.L(this.__typename, catalogSummaryData.__typename) && g76.L(this.id, catalogSummaryData.id) && g76.L(this.name, catalogSummaryData.name) && this.type == catalogSummaryData.type && this.visibility == catalogSummaryData.visibility && this.predefined == catalogSummaryData.predefined && g76.L(this.creator, catalogSummaryData.creator) && g76.L(this.version, catalogSummaryData.version) && this.itemsLastInsertedAt == catalogSummaryData.itemsLastInsertedAt && this.postItemsCount == catalogSummaryData.postItemsCount && g76.L(this.viewerEdge, catalogSummaryData.viewerEdge);
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final String getId() {
        return this.id;
    }

    public final long getItemsLastInsertedAt() {
        return this.itemsLastInsertedAt;
    }

    public final String getName() {
        return this.name;
    }

    public final int getPostItemsCount() {
        return this.postItemsCount;
    }

    public final PredefinedCatalogType getPredefined() {
        return this.predefined;
    }

    public final CatalogType getType() {
        return this.type;
    }

    public final String getVersion() {
        return this.version;
    }

    public final ViewerEdge1 getViewerEdge() {
        return this.viewerEdge;
    }

    public final CatalogVisibility getVisibility() {
        return this.visibility;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = (this.visibility.hashCode() + ((this.type.hashCode() + wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.name)) * 31)) * 31;
        PredefinedCatalogType predefinedCatalogType = this.predefined;
        int iO = wgd.o((this.creator.hashCode() + ((iHashCode + (predefinedCatalogType == null ? 0 : predefinedCatalogType.hashCode())) * 31)) * 31, 31, this.version);
        long j = this.itemsLastInsertedAt;
        return this.viewerEdge.hashCode() + ((((iO + ((int) (j ^ (j >>> 32)))) * 31) + this.postItemsCount) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        CatalogType catalogType = this.type;
        CatalogVisibility catalogVisibility = this.visibility;
        PredefinedCatalogType predefinedCatalogType = this.predefined;
        Creator creator = this.creator;
        String str4 = this.version;
        long j = this.itemsLastInsertedAt;
        int i = this.postItemsCount;
        ViewerEdge1 viewerEdge1 = this.viewerEdge;
        StringBuilder sbU = y30.u("CatalogSummaryData(__typename=", str, ", id=", str2, ", name=");
        sbU.append(str3);
        sbU.append(", type=");
        sbU.append(catalogType);
        sbU.append(", visibility=");
        sbU.append(catalogVisibility);
        sbU.append(", predefined=");
        sbU.append(predefinedCatalogType);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", version=");
        sbU.append(str4);
        sbU.append(", itemsLastInsertedAt=");
        sbU.append(j);
        sbU.append(", postItemsCount=");
        sbU.append(i);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge1);
        sbU.append(")");
        return sbU.toString();
    }
}
