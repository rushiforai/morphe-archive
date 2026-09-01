package com.medium.refinerecommendations;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lcom/medium/refinerecommendations/RefineRecommendationsFilter;", "", "<init>", "(Ljava/lang/String;I)V", "ALL", "PUBLICATIONS", "TAGS", "WRITERS", "FRIENDS", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RefineRecommendationsFilter {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ RefineRecommendationsFilter[] $VALUES;
    public static final RefineRecommendationsFilter ALL = new RefineRecommendationsFilter("ALL", 0);
    public static final RefineRecommendationsFilter PUBLICATIONS = new RefineRecommendationsFilter("PUBLICATIONS", 1);
    public static final RefineRecommendationsFilter TAGS = new RefineRecommendationsFilter("TAGS", 2);
    public static final RefineRecommendationsFilter WRITERS = new RefineRecommendationsFilter("WRITERS", 3);
    public static final RefineRecommendationsFilter FRIENDS = new RefineRecommendationsFilter("FRIENDS", 4);

    private static final /* synthetic */ RefineRecommendationsFilter[] $values() {
        return new RefineRecommendationsFilter[]{ALL, PUBLICATIONS, TAGS, WRITERS, FRIENDS};
    }

    static {
        RefineRecommendationsFilter[] refineRecommendationsFilterArr$values = $values();
        $VALUES = refineRecommendationsFilterArr$values;
        $ENTRIES = rv8.x(refineRecommendationsFilterArr$values);
    }

    private RefineRecommendationsFilter(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static RefineRecommendationsFilter valueOf(String str) {
        return (RefineRecommendationsFilter) Enum.valueOf(RefineRecommendationsFilter.class, str);
    }

    public static RefineRecommendationsFilter[] values() {
        return (RefineRecommendationsFilter[]) $VALUES.clone();
    }
}
