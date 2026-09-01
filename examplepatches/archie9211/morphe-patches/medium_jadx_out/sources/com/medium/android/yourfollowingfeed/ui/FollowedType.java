package com.medium.android.yourfollowingfeed.ui;

import com.medium.reader.R;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0013\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/medium/android/yourfollowingfeed/ui/FollowedType;", "", "displayName", "", "<init>", "(Ljava/lang/String;II)V", "getDisplayName", "()I", "WRITERS_AND_PUBLICATIONS", "TAGS", "yourfollowingfeed_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowedType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ FollowedType[] $VALUES;
    private final int displayName;
    public static final FollowedType WRITERS_AND_PUBLICATIONS = new FollowedType("WRITERS_AND_PUBLICATIONS", 0, R.string.your_following_feed_writers_and_publications);
    public static final FollowedType TAGS = new FollowedType("TAGS", 1, R.string.common_topics);

    private static final /* synthetic */ FollowedType[] $values() {
        return new FollowedType[]{WRITERS_AND_PUBLICATIONS, TAGS};
    }

    static {
        FollowedType[] followedTypeArr$values = $values();
        $VALUES = followedTypeArr$values;
        $ENTRIES = rv8.x(followedTypeArr$values);
    }

    private FollowedType(String str, int i, int i2) {
        this.displayName = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static FollowedType valueOf(String str) {
        return (FollowedType) Enum.valueOf(FollowedType.class, str);
    }

    public static FollowedType[] values() {
        return (FollowedType[]) $VALUES.clone();
    }

    public final int getDisplayName() {
        return this.displayName;
    }
}
