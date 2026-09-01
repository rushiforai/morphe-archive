package defpackage;

import com.medium.reader.R;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lv0 {
    public static final lv0 EXPLORE;
    public static final lv0 HOME;
    public static final lv0 YOUR_FOLLOWING_FEED;
    public static final lv0 YOUR_LIBRARY;
    public static final lv0 YOUR_PROFILE;
    public static final /* synthetic */ lv0[] a;
    public static final /* synthetic */ i04 b;

    static {
        lv0 lv0Var = new lv0("HOME", 0);
        HOME = lv0Var;
        lv0 lv0Var2 = new lv0("YOUR_FOLLOWING_FEED", 1);
        YOUR_FOLLOWING_FEED = lv0Var2;
        lv0 lv0Var3 = new lv0("EXPLORE", 2);
        EXPLORE = lv0Var3;
        lv0 lv0Var4 = new lv0("YOUR_LIBRARY", 3);
        YOUR_LIBRARY = lv0Var4;
        lv0 lv0Var5 = new lv0("YOUR_PROFILE", 4);
        YOUR_PROFILE = lv0Var5;
        lv0[] lv0VarArr = {lv0Var, lv0Var2, lv0Var3, lv0Var4, lv0Var5};
        a = lv0VarArr;
        b = new i04(lv0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static lv0 valueOf(String str) {
        return (lv0) Enum.valueOf(lv0.class, str);
    }

    public static lv0[] values() {
        return (lv0[]) a.clone();
    }

    public final int getIcon(boolean z) {
        int i = kv0.a[ordinal()];
        if (i == 1) {
            return z ? R.drawable.ic_following_selected_24 : R.drawable.ic_following_24;
        }
        if (i == 2) {
            return z ? R.drawable.ic_home_active : R.drawable.ic_home;
        }
        if (i == 3) {
            return z ? R.drawable.ic_search_active_24 : R.drawable.ic_search_24;
        }
        if (i == 4) {
            return z ? R.drawable.ic_list_active : R.drawable.ic_list;
        }
        if (i == 5) {
            return z ? R.drawable.ic_tab_you_active : R.drawable.ic_tab_you_inactive;
        }
        ygf.a();
        return 0;
    }

    public final int getItemId() {
        int i = kv0.a[ordinal()];
        if (i == 1) {
            return R.id.yourFollowingFeedFragment;
        }
        if (i == 2) {
            return R.id.homeFragment;
        }
        if (i == 3) {
            return R.id.exploreFragment;
        }
        if (i == 4) {
            return R.id.yourLibraryFragment;
        }
        if (i == 5) {
            return R.id.youProfileFragment;
        }
        ygf.a();
        return 0;
    }

    public final int getText() {
        int i = kv0.a[ordinal()];
        if (i == 1) {
            return R.string.following;
        }
        if (i == 2) {
            return R.string.home;
        }
        if (i == 3) {
            return R.string.discover_tab_title;
        }
        if (i == 4) {
            return R.string.nav_your_lists;
        }
        if (i == 5) {
            return R.string.common_you;
        }
        ygf.a();
        return 0;
    }
}
