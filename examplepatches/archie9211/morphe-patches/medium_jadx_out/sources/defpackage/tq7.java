package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.reader.R;
import java.util.List;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tq7 {
    public static final tq7 AUDIO;
    public static final tq7 CATALOG_FOLLOWED;
    public static final sq7 Companion;
    public static final tq7 DIGEST;
    public static final tq7 EDITORIAL_RECOMMENDED_STORY;
    public static final tq7 FOLLOWED_PUBLICATION_FEATURED_STORY;
    public static final tq7 FOLLOWED_USERS_RECOMMENDED_STORY;
    public static final tq7 FOLLOWED_USER_PUBLISHED_STORY;
    public static final tq7 FOLLOWER;
    public static final tq7 HIGHLIGHT;
    public static final tq7 ITEM_ADDED_TO_FOLLOWED_CATALOG;
    public static final tq7 MARKETING;
    public static final tq7 MEDIUM;
    public static final tq7 OFFLINE_READING;
    public static final tq7 RESPONSE;
    public static final tq7 TODAYS_HIGHLIGHTS;
    public static final tq7 USER_MENTIONED_IN_STORY;
    public static final List f;
    public static final /* synthetic */ tq7[] g;
    public static final /* synthetic */ i04 h;
    public final String a;
    public final int b;
    public final Integer c;
    public final int d;
    public final vq7 e;

    public tq7(String str, int i, String str2, int i2, Integer num, int i3, vq7 vq7Var) {
        this.a = str2;
        this.b = i2;
        this.c = num;
        this.d = i3;
        this.e = vq7Var;
    }

    public static g04 getEntries() {
        return h;
    }

    public static tq7 valueOf(String str) {
        return (tq7) Enum.valueOf(tq7.class, str);
    }

    public static tq7[] values() {
        return (tq7[]) g.clone();
    }

    public final Integer getDescriptionResId() {
        return this.c;
    }

    public final String getId() {
        return this.a;
    }

    public final int getImportance() {
        return this.d;
    }

    public final vq7 getMediumNotificationGroup() {
        return this.e;
    }

    public final int getNameResId() {
        return this.b;
    }

    static {
        vq7 vq7Var = vq7.RECOMMENDATIONS;
        tq7 tq7Var = new tq7("TODAYS_HIGHLIGHTS", 0, "TODAYS_HIGHLIGHTS", R.string.notification_daily_read, null, 3, vq7Var);
        TODAYS_HIGHLIGHTS = tq7Var;
        tq7 tq7Var2 = new tq7("DIGEST", 1, "DIGEST", R.string.notification_digest, null, 3, vq7Var);
        DIGEST = tq7Var2;
        tq7 tq7Var3 = new tq7("FOLLOWED_USER_PUBLISHED_STORY", 2, "FOLLOWED_USER_PUBLISHED_STORY", R.string.notification_followed_user_published_story, null, 3, vq7Var);
        FOLLOWED_USER_PUBLISHED_STORY = tq7Var3;
        tq7 tq7Var4 = new tq7("FOLLOWED_PUBLICATION_FEATURED_STORY", 3, "FOLLOWED_PUBLICATION_FEATURED_STORY", R.string.notification_followed_publication_featured_story, null, 3, vq7Var);
        FOLLOWED_PUBLICATION_FEATURED_STORY = tq7Var4;
        tq7 tq7Var5 = new tq7("EDITORIAL_RECOMMENDED_STORY", 4, "EDITORIAL_RECOMMENDED_STORY", R.string.notification_editorial_recommended_story, null, 3, vq7Var);
        EDITORIAL_RECOMMENDED_STORY = tq7Var5;
        vq7 vq7Var2 = vq7.SOCIAL;
        tq7 tq7Var6 = new tq7("USER_MENTIONED_IN_STORY", 5, "USER_MENTIONED_IN_STORY", R.string.notification_mentioned_in_story, null, 3, vq7Var2);
        USER_MENTIONED_IN_STORY = tq7Var6;
        tq7 tq7Var7 = new tq7("HIGHLIGHT", 6, "HIGHLIGHT", R.string.notification_highlight, null, 3, vq7Var2);
        HIGHLIGHT = tq7Var7;
        tq7 tq7Var8 = new tq7("FOLLOWED_USERS_RECOMMENDED_STORY", 7, "FOLLOWED_USERS_RECOMMENDED_STORY", R.string.notification_followed_users_recommended_story, null, 3, vq7Var2);
        FOLLOWED_USERS_RECOMMENDED_STORY = tq7Var8;
        tq7 tq7Var9 = new tq7("RESPONSE", 8, "RESPONSE", R.string.notification_response, null, 3, vq7Var2);
        RESPONSE = tq7Var9;
        tq7 tq7Var10 = new tq7("FOLLOWER", 9, "FOLLOWER", R.string.notification_follower, null, 3, vq7Var2);
        FOLLOWER = tq7Var10;
        tq7 tq7Var11 = new tq7("CATALOG_FOLLOWED", 10, "CATALOG_FOLLOWED", R.string.notification_catalog_followed, null, 3, vq7Var2);
        CATALOG_FOLLOWED = tq7Var11;
        tq7 tq7Var12 = new tq7("ITEM_ADDED_TO_FOLLOWED_CATALOG", 11, "ITEM_ADDED_TO_FOLLOWED_CATALOG", R.string.notification_item_added_to_followed_catalog, null, 3, vq7Var2);
        ITEM_ADDED_TO_FOLLOWED_CATALOG = tq7Var12;
        vq7 vq7Var3 = vq7.FEATURES;
        tq7 tq7Var13 = new tq7("OFFLINE_READING", 12, "OFFLINE_READING", R.string.notification_offline_reading, null, 2, vq7Var3);
        OFFLINE_READING = tq7Var13;
        tq7 tq7Var14 = new tq7("AUDIO", 13, "READ_POST_AUDIO_SERVICE_CHANNEL_ID", R.string.audio_player_channel_name, Integer.valueOf(R.string.audio_player_channel_description), 2, vq7Var3);
        AUDIO = tq7Var14;
        tq7 tq7Var15 = new tq7("MARKETING", 14, KLTXZbnQvj.njNA, R.string.notification_marketing, null, 3, vq7.MARKETING);
        MARKETING = tq7Var15;
        tq7 tq7Var16 = new tq7("MEDIUM", 15, "MEDIUM", R.string.notification_medium, null, 3, vq7.MEDIUM);
        MEDIUM = tq7Var16;
        tq7[] tq7VarArr = {tq7Var, tq7Var2, tq7Var3, tq7Var4, tq7Var5, tq7Var6, tq7Var7, tq7Var8, tq7Var9, tq7Var10, tq7Var11, tq7Var12, tq7Var13, tq7Var14, tq7Var15, tq7Var16};
        g = tq7VarArr;
        h = new i04(tq7VarArr);
        Companion = new sq7();
        f = d46.R("SOCIAL_CHANNEL_ID", "RECOMMENDATIONS_CHANNEL_ID", "PLAYBACK_CHANNEL_ID", "DEFAULT_CHANNEL_ID", "AUDIO_CHANNEL_ID", "FOLLOWED_USER_PUBLISHED_SERIES", "FOLLOWED_USER_UPDATED_SERIES", "SERIES_CLAP_MILESTONE", "AUDIO_PLAYBACK");
    }
}
