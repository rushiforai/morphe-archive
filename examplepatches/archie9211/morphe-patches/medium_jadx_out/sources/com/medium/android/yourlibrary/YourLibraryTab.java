package com.medium.android.yourlibrary;

import com.medium.reader.R;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u000b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0013\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lcom/medium/android/yourlibrary/YourLibraryTab;", "", "titleResId", "", "<init>", "(Ljava/lang/String;II)V", "getTitleResId", "()I", "YOUR_LISTS", "SAVED_LISTS", "DIGEST", "HIGHLIGHTS", "READING_HISTORY", "RESPONSES", "yourlibrary_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class YourLibraryTab {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ YourLibraryTab[] $VALUES;
    private final int titleResId;
    public static final YourLibraryTab YOUR_LISTS = new YourLibraryTab("YOUR_LISTS", 0, R.string.your_library_your_lists_tab);
    public static final YourLibraryTab SAVED_LISTS = new YourLibraryTab("SAVED_LISTS", 1, R.string.your_library_saved_lists_tab);
    public static final YourLibraryTab DIGEST = new YourLibraryTab("DIGEST", 2, R.string.your_library_digest);
    public static final YourLibraryTab HIGHLIGHTS = new YourLibraryTab("HIGHLIGHTS", 3, R.string.your_library_highlights_tab);
    public static final YourLibraryTab READING_HISTORY = new YourLibraryTab("READING_HISTORY", 4, R.string.your_library_reading_history_tab);
    public static final YourLibraryTab RESPONSES = new YourLibraryTab("RESPONSES", 5, R.string.your_library_responses);

    private static final /* synthetic */ YourLibraryTab[] $values() {
        return new YourLibraryTab[]{YOUR_LISTS, SAVED_LISTS, DIGEST, HIGHLIGHTS, READING_HISTORY, RESPONSES};
    }

    static {
        YourLibraryTab[] yourLibraryTabArr$values = $values();
        $VALUES = yourLibraryTabArr$values;
        $ENTRIES = rv8.x(yourLibraryTabArr$values);
    }

    private YourLibraryTab(String str, int i, int i2) {
        this.titleResId = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static YourLibraryTab valueOf(String str) {
        return (YourLibraryTab) Enum.valueOf(YourLibraryTab.class, str);
    }

    public static YourLibraryTab[] values() {
        return (YourLibraryTab[]) $VALUES.clone();
    }

    public final int getTitleResId() {
        return this.titleResId;
    }
}
