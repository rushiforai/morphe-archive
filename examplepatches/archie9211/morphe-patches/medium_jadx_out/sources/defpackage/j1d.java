package defpackage;

import gen.model.SuggestionReasonType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j1d {
    public static SuggestionReasonType a(int i) {
        switch (i) {
            case 1:
                return SuggestionReasonType.SUGGESTION_FEATURED;
            case 2:
                return SuggestionReasonType.SUGGESTION_CURATED;
            case 3:
                return SuggestionReasonType.SUGGESTION_COLLECTION_INTEREST_GRAPH;
            case 4:
                return SuggestionReasonType.SUGGESTION_TAG_INTEREST_GRAPH;
            case 5:
                return SuggestionReasonType.SUGGESTION_COLLAB_FILTERING;
            case 6:
                return SuggestionReasonType.SUGGESTION_USER_INTEREST_GRAPH;
            case 7:
                return SuggestionReasonType.SUGGESTION_WRITER_IN_TOPIC;
            case 8:
                return SuggestionReasonType.SUGGESTION_RELATED_TOPIC;
            case 9:
                return SuggestionReasonType.SUGGESTION_TOPIC_INTEREST_GRAPH;
            case 10:
                return SuggestionReasonType.SUGGESTION_TWITTER_GRAPH;
            default:
                return null;
        }
    }
}
