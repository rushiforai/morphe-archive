package com.medium.stats.ui.user;

import com.medium.reader.R;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0013\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/medium/stats/ui/user/UserStatsTab;", "", "titleResId", "", "<init>", "(Ljava/lang/String;II)V", "getTitleResId", "()I", "STORIES", "AUDIENCE", "stats_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserStatsTab {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ UserStatsTab[] $VALUES;
    private final int titleResId;
    public static final UserStatsTab STORIES = new UserStatsTab("STORIES", 0, R.string.stats_tab_stories);
    public static final UserStatsTab AUDIENCE = new UserStatsTab("AUDIENCE", 1, R.string.stats_tab_audience);

    private static final /* synthetic */ UserStatsTab[] $values() {
        return new UserStatsTab[]{STORIES, AUDIENCE};
    }

    static {
        UserStatsTab[] userStatsTabArr$values = $values();
        $VALUES = userStatsTabArr$values;
        $ENTRIES = rv8.x(userStatsTabArr$values);
    }

    private UserStatsTab(String str, int i, int i2) {
        this.titleResId = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static UserStatsTab valueOf(String str) {
        return (UserStatsTab) Enum.valueOf(UserStatsTab.class, str);
    }

    public static UserStatsTab[] values() {
        return (UserStatsTab[]) $VALUES.clone();
    }

    public final int getTitleResId() {
        return this.titleResId;
    }
}
