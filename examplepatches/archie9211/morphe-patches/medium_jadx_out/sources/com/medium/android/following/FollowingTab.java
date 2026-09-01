package com.medium.android.following;

import com.medium.reader.R;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0013\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/medium/android/following/FollowingTab;", "", "titleResId", "", "<init>", "(Ljava/lang/String;II)V", "getTitleResId", "()I", "USERS", "PUBLICATIONS", "following_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowingTab {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ FollowingTab[] $VALUES;
    private final int titleResId;
    public static final FollowingTab USERS = new FollowingTab("USERS", 0, R.string.following_tab_users);
    public static final FollowingTab PUBLICATIONS = new FollowingTab("PUBLICATIONS", 1, R.string.following_tab_publications);

    private static final /* synthetic */ FollowingTab[] $values() {
        return new FollowingTab[]{USERS, PUBLICATIONS};
    }

    static {
        FollowingTab[] followingTabArr$values = $values();
        $VALUES = followingTabArr$values;
        $ENTRIES = rv8.x(followingTabArr$values);
    }

    private FollowingTab(String str, int i, int i2) {
        this.titleResId = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static FollowingTab valueOf(String str) {
        return (FollowingTab) Enum.valueOf(FollowingTab.class, str);
    }

    public static FollowingTab[] values() {
        return (FollowingTab[]) $VALUES.clone();
    }

    public final int getTitleResId() {
        return this.titleResId;
    }
}
