package com.medium.android.graphql.fragment;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.graphql.type.PostVisibilityType;
import defpackage.g15;
import defpackage.g76;
import defpackage.km4;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import java.util.Currency;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0019\b\u0086\b\u0018\u00002\u00020\u0001:\u0004DEFGBm\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\n\u001a\u0004\u0018\u00010\b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\u0006\u0010\u0013\u001a\u00020\u000b¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0017J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0017J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJ\u0012\u0010\u001f\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\rHÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0012\u0010#\u001a\u0004\u0018\u00010\u000fHÆ\u0003¢\u0006\u0004\b#\u0010$J\u0012\u0010%\u001a\u0004\u0018\u00010\u0011HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b'\u0010(J\u008c\u0001\u0010)\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\b\b\u0002\u0010\u0013\u001a\u00020\u000bHÆ\u0001¢\u0006\u0004\b)\u0010*J\u0010\u0010+\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b+\u0010\u0017J\u0010\u0010-\u001a\u00020,HÖ\u0001¢\u0006\u0004\b-\u0010.J\u001a\u00101\u001a\u00020\u000b2\b\u00100\u001a\u0004\u0018\u00010/HÖ\u0003¢\u0006\u0004\b1\u00102R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00103\u001a\u0004\b4\u0010\u0017R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00103\u001a\u0004\b5\u0010\u0017R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00103\u001a\u0004\b6\u0010\u0017R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00107\u001a\u0004\b8\u0010\u001bR\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u00109\u001a\u0004\b:\u0010\u001dR\u0019\u0010\n\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\n\u00109\u001a\u0004\b;\u0010\u001dR\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010<\u001a\u0004\b\f\u0010 R\u0017\u0010\u000e\u001a\u00020\r8\u0006¢\u0006\f\n\u0004\b\u000e\u0010=\u001a\u0004\b>\u0010\"R\u0019\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010?\u001a\u0004\b@\u0010$R\u0019\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010A\u001a\u0004\bB\u0010&R\u0017\u0010\u0013\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\u0013\u0010C\u001a\u0004\b\u0013\u0010(¨\u0006H"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPost;", "Lg15;", "", "__typename", "id", "title", "Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "creator", "", "firstPublishedAt", "firstBoostedAt", "", "isLocked", "Lcom/medium/android/graphql/type/PostVisibilityType;", "visibility", "Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "earnings", "Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "totalStats", "isFeaturedInPublishedPublication", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/StatsPost$Creator;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/fragment/StatsPost$Earnings;Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;Z)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "component5", "()Ljava/lang/Long;", "component6", "component7", "()Ljava/lang/Boolean;", "component8", "()Lcom/medium/android/graphql/type/PostVisibilityType;", "component9", "()Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "component10", "()Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "component11", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/StatsPost$Creator;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Lcom/medium/android/graphql/type/PostVisibilityType;Lcom/medium/android/graphql/fragment/StatsPost$Earnings;Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;Z)Lcom/medium/android/graphql/fragment/StatsPost;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getTitle", "Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "getCreator", "Ljava/lang/Long;", "getFirstPublishedAt", "getFirstBoostedAt", "Ljava/lang/Boolean;", "Lcom/medium/android/graphql/type/PostVisibilityType;", "getVisibility", "Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "getEarnings", "Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "getTotalStats", "Z", "Creator", "Earnings", "TotalStats", "Total", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class StatsPost implements g15 {
    private final String __typename;
    private final Creator creator;
    private final Earnings earnings;
    private final Long firstBoostedAt;
    private final Long firstPublishedAt;
    private final String id;
    private final boolean isFeaturedInPublishedPublication;
    private final Boolean isLocked;
    private final String title;
    private final TotalStats totalStats;
    private final PostVisibilityType visibility;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPost$Creator;", "", "__typename", "", "id", "name", "imageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getImageId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;

        public Creator(String str, String str2, String str3, String str4) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.imageId = str4;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, String str4, int i, Object obj) {
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
                str4 = creator.imageId;
            }
            return creator.copy(str, str2, str3, str4);
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
        public final String getImageId() {
            return this.imageId;
        }

        public final Creator copy(String __typename, String id, String name, String imageId) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name, imageId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name) && g76.L(this.imageId, creator.imageId);
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

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return km4.C(y30.u(CspinKvYN.tWVxuTQ, str, ", id=", str2, ", name="), this.name, ", imageId=", this.imageId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPost$Earnings;", "", "__typename", "", "total", "Lcom/medium/android/graphql/fragment/StatsPost$Total;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/StatsPost$Total;)V", "get__typename", "()Ljava/lang/String;", "getTotal", "()Lcom/medium/android/graphql/fragment/StatsPost$Total;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Earnings {
        private final String __typename;
        private final Total total;

        public Earnings(String str, Total total) {
            str.getClass();
            total.getClass();
            this.__typename = str;
            this.total = total;
        }

        public static /* synthetic */ Earnings copy$default(Earnings earnings, String str, Total total, int i, Object obj) {
            if ((i & 1) != 0) {
                str = earnings.__typename;
            }
            if ((i & 2) != 0) {
                total = earnings.total;
            }
            return earnings.copy(str, total);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Total getTotal() {
            return this.total;
        }

        public final Earnings copy(String __typename, Total total) {
            __typename.getClass();
            total.getClass();
            return new Earnings(__typename, total);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Earnings)) {
                return false;
            }
            Earnings earnings = (Earnings) other;
            return g76.L(this.__typename, earnings.__typename) && g76.L(this.total, earnings.total);
        }

        public final Total getTotal() {
            return this.total;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.total.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Earnings(__typename=" + this.__typename + ", total=" + this.total + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0007HÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPost$Total;", "", "__typename", "", "currency", "Ljava/util/Currency;", "nanos", "", "units", "<init>", "(Ljava/lang/String;Ljava/util/Currency;II)V", "get__typename", "()Ljava/lang/String;", "getCurrency", "()Ljava/util/Currency;", "getNanos", "()I", "getUnits", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Total {
        private final String __typename;
        private final Currency currency;
        private final int nanos;
        private final int units;

        public Total(String str, Currency currency, int i, int i2) {
            str.getClass();
            currency.getClass();
            this.__typename = str;
            this.currency = currency;
            this.nanos = i;
            this.units = i2;
        }

        public static /* synthetic */ Total copy$default(Total total, String str, Currency currency, int i, int i2, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                str = total.__typename;
            }
            if ((i3 & 2) != 0) {
                currency = total.currency;
            }
            if ((i3 & 4) != 0) {
                i = total.nanos;
            }
            if ((i3 & 8) != 0) {
                i2 = total.units;
            }
            return total.copy(str, currency, i, i2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Currency getCurrency() {
            return this.currency;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getNanos() {
            return this.nanos;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final int getUnits() {
            return this.units;
        }

        public final Total copy(String __typename, Currency currency, int nanos, int units) {
            __typename.getClass();
            currency.getClass();
            return new Total(__typename, currency, nanos, units);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Total)) {
                return false;
            }
            Total total = (Total) other;
            return g76.L(this.__typename, total.__typename) && g76.L(this.currency, total.currency) && this.nanos == total.nanos && this.units == total.units;
        }

        public final Currency getCurrency() {
            return this.currency;
        }

        public final int getNanos() {
            return this.nanos;
        }

        public final int getUnits() {
            return this.units;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return ((((this.currency.hashCode() + (this.__typename.hashCode() * 31)) * 31) + this.nanos) * 31) + this.units;
        }

        public final String toString() {
            return "Total(__typename=" + this.__typename + ", currency=" + this.currency + ", nanos=" + this.nanos + ", units=" + this.units + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ<\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u000f\u0010\rR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u0010\u0010\r¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "", "__typename", "", "presentations", "", "views", "reads", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getPresentations", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getViews", "getReads", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/medium/android/graphql/fragment/StatsPost$TotalStats;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TotalStats {
        private final String __typename;
        private final Integer presentations;
        private final Integer reads;
        private final Integer views;

        public TotalStats(String str, Integer num, Integer num2, Integer num3) {
            str.getClass();
            this.__typename = str;
            this.presentations = num;
            this.views = num2;
            this.reads = num3;
        }

        public static /* synthetic */ TotalStats copy$default(TotalStats totalStats, String str, Integer num, Integer num2, Integer num3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = totalStats.__typename;
            }
            if ((i & 2) != 0) {
                num = totalStats.presentations;
            }
            if ((i & 4) != 0) {
                num2 = totalStats.views;
            }
            if ((i & 8) != 0) {
                num3 = totalStats.reads;
            }
            return totalStats.copy(str, num, num2, num3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getPresentations() {
            return this.presentations;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getViews() {
            return this.views;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getReads() {
            return this.reads;
        }

        public final TotalStats copy(String __typename, Integer presentations, Integer views, Integer reads) {
            __typename.getClass();
            return new TotalStats(__typename, presentations, views, reads);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TotalStats)) {
                return false;
            }
            TotalStats totalStats = (TotalStats) other;
            return g76.L(this.__typename, totalStats.__typename) && g76.L(this.presentations, totalStats.presentations) && g76.L(this.views, totalStats.views) && g76.L(this.reads, totalStats.reads);
        }

        public final Integer getPresentations() {
            return this.presentations;
        }

        public final Integer getReads() {
            return this.reads;
        }

        public final Integer getViews() {
            return this.views;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.presentations;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.views;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            Integer num3 = this.reads;
            return iHashCode3 + (num3 != null ? num3.hashCode() : 0);
        }

        public final String toString() {
            return "TotalStats(__typename=" + this.__typename + ", presentations=" + this.presentations + ", views=" + this.views + ", reads=" + this.reads + ")";
        }
    }

    public StatsPost(String str, String str2, String str3, Creator creator, Long l, Long l2, Boolean bool, PostVisibilityType postVisibilityType, Earnings earnings, TotalStats totalStats, boolean z) {
        str.getClass();
        str2.getClass();
        postVisibilityType.getClass();
        this.__typename = str;
        this.id = str2;
        this.title = str3;
        this.creator = creator;
        this.firstPublishedAt = l;
        this.firstBoostedAt = l2;
        this.isLocked = bool;
        this.visibility = postVisibilityType;
        this.earnings = earnings;
        this.totalStats = totalStats;
        this.isFeaturedInPublishedPublication = z;
    }

    public static /* synthetic */ StatsPost copy$default(StatsPost statsPost, String str, String str2, String str3, Creator creator, Long l, Long l2, Boolean bool, PostVisibilityType postVisibilityType, Earnings earnings, TotalStats totalStats, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = statsPost.__typename;
        }
        if ((i & 2) != 0) {
            str2 = statsPost.id;
        }
        if ((i & 4) != 0) {
            str3 = statsPost.title;
        }
        if ((i & 8) != 0) {
            creator = statsPost.creator;
        }
        if ((i & 16) != 0) {
            l = statsPost.firstPublishedAt;
        }
        if ((i & 32) != 0) {
            l2 = statsPost.firstBoostedAt;
        }
        if ((i & 64) != 0) {
            bool = statsPost.isLocked;
        }
        if ((i & 128) != 0) {
            postVisibilityType = statsPost.visibility;
        }
        if ((i & 256) != 0) {
            earnings = statsPost.earnings;
        }
        if ((i & 512) != 0) {
            totalStats = statsPost.totalStats;
        }
        if ((i & 1024) != 0) {
            z = statsPost.isFeaturedInPublishedPublication;
        }
        TotalStats totalStats2 = totalStats;
        boolean z2 = z;
        PostVisibilityType postVisibilityType2 = postVisibilityType;
        Earnings earnings2 = earnings;
        Long l3 = l2;
        Boolean bool2 = bool;
        Long l4 = l;
        String str4 = str3;
        return statsPost.copy(str, str2, str4, creator, l4, l3, bool2, postVisibilityType2, earnings2, totalStats2, z2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final TotalStats getTotalStats() {
        return this.totalStats;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final boolean getIsFeaturedInPublishedPublication() {
        return this.isFeaturedInPublishedPublication;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Long getFirstBoostedAt() {
        return this.firstBoostedAt;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Boolean getIsLocked() {
        return this.isLocked;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Earnings getEarnings() {
        return this.earnings;
    }

    public final StatsPost copy(String __typename, String id, String title, Creator creator, Long firstPublishedAt, Long firstBoostedAt, Boolean isLocked, PostVisibilityType visibility, Earnings earnings, TotalStats totalStats, boolean isFeaturedInPublishedPublication) {
        __typename.getClass();
        id.getClass();
        visibility.getClass();
        return new StatsPost(__typename, id, title, creator, firstPublishedAt, firstBoostedAt, isLocked, visibility, earnings, totalStats, isFeaturedInPublishedPublication);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof StatsPost)) {
            return false;
        }
        StatsPost statsPost = (StatsPost) other;
        return g76.L(this.__typename, statsPost.__typename) && g76.L(this.id, statsPost.id) && g76.L(this.title, statsPost.title) && g76.L(this.creator, statsPost.creator) && g76.L(this.firstPublishedAt, statsPost.firstPublishedAt) && g76.L(this.firstBoostedAt, statsPost.firstBoostedAt) && g76.L(this.isLocked, statsPost.isLocked) && this.visibility == statsPost.visibility && g76.L(this.earnings, statsPost.earnings) && g76.L(this.totalStats, statsPost.totalStats) && this.isFeaturedInPublishedPublication == statsPost.isFeaturedInPublishedPublication;
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final Earnings getEarnings() {
        return this.earnings;
    }

    public final Long getFirstBoostedAt() {
        return this.firstBoostedAt;
    }

    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    public final String getId() {
        return this.id;
    }

    public final String getTitle() {
        return this.title;
    }

    public final TotalStats getTotalStats() {
        return this.totalStats;
    }

    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.title;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        Creator creator = this.creator;
        int iHashCode2 = (iHashCode + (creator == null ? 0 : creator.hashCode())) * 31;
        Long l = this.firstPublishedAt;
        int iHashCode3 = (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.firstBoostedAt;
        int iHashCode4 = (iHashCode3 + (l2 == null ? 0 : l2.hashCode())) * 31;
        Boolean bool = this.isLocked;
        int iHashCode5 = (this.visibility.hashCode() + ((iHashCode4 + (bool == null ? 0 : bool.hashCode())) * 31)) * 31;
        Earnings earnings = this.earnings;
        int iHashCode6 = (iHashCode5 + (earnings == null ? 0 : earnings.hashCode())) * 31;
        TotalStats totalStats = this.totalStats;
        return ((iHashCode6 + (totalStats != null ? totalStats.hashCode() : 0)) * 31) + (this.isFeaturedInPublishedPublication ? 1231 : 1237);
    }

    public final boolean isFeaturedInPublishedPublication() {
        return this.isFeaturedInPublishedPublication;
    }

    public final Boolean isLocked() {
        return this.isLocked;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.title;
        Creator creator = this.creator;
        Long l = this.firstPublishedAt;
        Long l2 = this.firstBoostedAt;
        Boolean bool = this.isLocked;
        PostVisibilityType postVisibilityType = this.visibility;
        Earnings earnings = this.earnings;
        TotalStats totalStats = this.totalStats;
        boolean z = this.isFeaturedInPublishedPublication;
        StringBuilder sbU = y30.u("StatsPost(__typename=", str, ", id=", str2, ", title=");
        sbU.append(str3);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", firstPublishedAt=");
        sbU.append(l);
        sbU.append(", firstBoostedAt=");
        sbU.append(l2);
        sbU.append(", isLocked=");
        sbU.append(bool);
        sbU.append(", visibility=");
        sbU.append(postVisibilityType);
        sbU.append(", earnings=");
        sbU.append(earnings);
        sbU.append(", totalStats=");
        sbU.append(totalStats);
        sbU.append(", isFeaturedInPublishedPublication=");
        return lv8.t(sbU, z, ")");
    }
}
