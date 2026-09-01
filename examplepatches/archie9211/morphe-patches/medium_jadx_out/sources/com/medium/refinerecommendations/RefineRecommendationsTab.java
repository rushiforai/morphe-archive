package com.medium.refinerecommendations;

import com.medium.reader.R;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\t\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0013\b\u0002\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000b¨\u0006\f"}, d2 = {"Lcom/medium/refinerecommendations/RefineRecommendationsTab;", "", "titleResId", "", "<init>", "(Ljava/lang/String;II)V", "getTitleResId", "()I", "Following", "ReadingHistory", "Muted", "Suggestions", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RefineRecommendationsTab {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ RefineRecommendationsTab[] $VALUES;
    private final int titleResId;
    public static final RefineRecommendationsTab Following = new RefineRecommendationsTab("Following", 0, R.string.refine_recommendations_following);
    public static final RefineRecommendationsTab ReadingHistory = new RefineRecommendationsTab("ReadingHistory", 1, R.string.refine_recommendations_reading_history);
    public static final RefineRecommendationsTab Muted = new RefineRecommendationsTab("Muted", 2, R.string.refine_recommendations_muted);
    public static final RefineRecommendationsTab Suggestions = new RefineRecommendationsTab("Suggestions", 3, R.string.refine_recommendations_suggestions);

    private static final /* synthetic */ RefineRecommendationsTab[] $values() {
        return new RefineRecommendationsTab[]{Following, ReadingHistory, Muted, Suggestions};
    }

    static {
        RefineRecommendationsTab[] refineRecommendationsTabArr$values = $values();
        $VALUES = refineRecommendationsTabArr$values;
        $ENTRIES = rv8.x(refineRecommendationsTabArr$values);
    }

    private RefineRecommendationsTab(String str, int i, int i2) {
        this.titleResId = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static RefineRecommendationsTab valueOf(String str) {
        return (RefineRecommendationsTab) Enum.valueOf(RefineRecommendationsTab.class, str);
    }

    public static RefineRecommendationsTab[] values() {
        return (RefineRecommendationsTab[]) $VALUES.clone();
    }

    public final int getTitleResId() {
        return this.titleResId;
    }
}
