package defpackage;

import com.medium.android.data.settings.Frequency;
import com.medium.android.data.settings.NotificationNetwork;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gee {
    public final Boolean a;
    public final Boolean b;
    public final Boolean c;
    public final Boolean d;
    public final NotificationNetwork e;
    public final Boolean f;
    public final NotificationNetwork g;
    public final NotificationNetwork h;
    public final Boolean i;
    public final NotificationNetwork j;
    public final Boolean k;
    public final NotificationNetwork l;
    public final Boolean m;
    public final Boolean n;
    public final Boolean o;
    public final Boolean p;
    public final Boolean q;
    public final Frequency r;

    public gee(Boolean bool, Boolean bool2, Boolean bool3, Boolean bool4, NotificationNetwork notificationNetwork, Boolean bool5, NotificationNetwork notificationNetwork2, NotificationNetwork notificationNetwork3, Boolean bool6, NotificationNetwork notificationNetwork4, Boolean bool7, NotificationNetwork notificationNetwork5, Boolean bool8, Boolean bool9, Boolean bool10, Boolean bool11, Boolean bool12, Frequency frequency) {
        this.a = bool;
        this.b = bool2;
        this.c = bool3;
        this.d = bool4;
        this.e = notificationNetwork;
        this.f = bool5;
        this.g = notificationNetwork2;
        this.h = notificationNetwork3;
        this.i = bool6;
        this.j = notificationNetwork4;
        this.k = bool7;
        this.l = notificationNetwork5;
        this.m = bool8;
        this.n = bool9;
        this.o = bool10;
        this.p = bool11;
        this.q = bool12;
        this.r = frequency;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gee)) {
            return false;
        }
        gee geeVar = (gee) obj;
        return g76.L(this.a, geeVar.a) && g76.L(this.b, geeVar.b) && g76.L(this.c, geeVar.c) && g76.L(this.d, geeVar.d) && this.e == geeVar.e && g76.L(this.f, geeVar.f) && this.g == geeVar.g && this.h == geeVar.h && g76.L(this.i, geeVar.i) && this.j == geeVar.j && g76.L(this.k, geeVar.k) && this.l == geeVar.l && g76.L(this.m, geeVar.m) && g76.L(this.n, geeVar.n) && g76.L(this.o, geeVar.o) && g76.L(this.p, geeVar.p) && g76.L(this.q, geeVar.q) && this.r == geeVar.r;
    }

    public final int hashCode() {
        Boolean bool = this.a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Boolean bool2 = this.b;
        int iHashCode2 = (iHashCode + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Boolean bool3 = this.c;
        int iHashCode3 = (iHashCode2 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Boolean bool4 = this.d;
        int iHashCode4 = (iHashCode3 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        NotificationNetwork notificationNetwork = this.e;
        int iHashCode5 = (iHashCode4 + (notificationNetwork == null ? 0 : notificationNetwork.hashCode())) * 31;
        Boolean bool5 = this.f;
        int iHashCode6 = (iHashCode5 + (bool5 == null ? 0 : bool5.hashCode())) * 31;
        NotificationNetwork notificationNetwork2 = this.g;
        int iHashCode7 = (iHashCode6 + (notificationNetwork2 == null ? 0 : notificationNetwork2.hashCode())) * 31;
        NotificationNetwork notificationNetwork3 = this.h;
        int iHashCode8 = (iHashCode7 + (notificationNetwork3 == null ? 0 : notificationNetwork3.hashCode())) * 31;
        Boolean bool6 = this.i;
        int iHashCode9 = (iHashCode8 + (bool6 == null ? 0 : bool6.hashCode())) * 31;
        NotificationNetwork notificationNetwork4 = this.j;
        int iHashCode10 = (iHashCode9 + (notificationNetwork4 == null ? 0 : notificationNetwork4.hashCode())) * 31;
        Boolean bool7 = this.k;
        int iHashCode11 = (iHashCode10 + (bool7 == null ? 0 : bool7.hashCode())) * 31;
        NotificationNetwork notificationNetwork5 = this.l;
        int iHashCode12 = (iHashCode11 + (notificationNetwork5 == null ? 0 : notificationNetwork5.hashCode())) * 31;
        Boolean bool8 = this.m;
        int iHashCode13 = (iHashCode12 + (bool8 == null ? 0 : bool8.hashCode())) * 31;
        Boolean bool9 = this.n;
        int iHashCode14 = (iHashCode13 + (bool9 == null ? 0 : bool9.hashCode())) * 31;
        Boolean bool10 = this.o;
        int iHashCode15 = (iHashCode14 + (bool10 == null ? 0 : bool10.hashCode())) * 31;
        Boolean bool11 = this.p;
        int iHashCode16 = (iHashCode15 + (bool11 == null ? 0 : bool11.hashCode())) * 31;
        Boolean bool12 = this.q;
        int iHashCode17 = (iHashCode16 + (bool12 == null ? 0 : bool12.hashCode())) * 31;
        Frequency frequency = this.r;
        return iHashCode17 + (frequency != null ? frequency.hashCode() : 0);
    }

    public final String toString() {
        return "UserPreferences(allowCatalogFollowedPushNotifications=" + this.a + ", allowDigestPushNotifications=" + this.b + ", allowDiscoveredByAddressbook=" + this.c + ", allowEditorialTopicPushNotifications=" + this.d + ", allowHighlightPushNotifications=" + this.e + ", allowItemAddedToFollowedCatalogPushNotifications=" + this.f + ", allowMentionPushNotifications=" + this.g + ", allowPostPushNotifications=" + this.h + ", allowPublicationFeaturedPostPushNotifications=" + this.i + ", allowRecommendPushNotifications=" + this.j + ", allowReposts=" + this.k + ", allowResponsePushNotifications=" + this.l + ", allowSocialPostPushNotifications=" + this.m + ", allowTodaysHighlightsPushNotifications=" + this.n + ", showClapsOnProfile=" + this.o + ", showHighlightsOnProfile=" + this.p + ", showResponsesOnProfile=" + this.q + ", socialEmailFrequency=" + this.r + ")";
    }
}
