package defpackage;

import com.medium.proto.model.StreamItemSectionContext;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class atc {
    public static StreamItemSectionContext a(int i) {
        switch (i) {
            case 1:
                return StreamItemSectionContext.SECTION_CONTEXT_NONE;
            case 2:
                return StreamItemSectionContext.SECTION_CONTEXT_PUBLISHED_BY_COLLECTION;
            case 3:
                return StreamItemSectionContext.SECTION_CONTEXT_PUBLISHED_BY_USER;
            case 4:
                return StreamItemSectionContext.SECTION_CONTEXT_RECOMMENDED_BY_USER;
            case 5:
                return StreamItemSectionContext.SECTION_CONTEXT_RECOMMENDED_IN_TAG;
            case 6:
                return StreamItemSectionContext.SECTION_CONTEXT_CURATED_IN_TOPIC;
            case 7:
                return StreamItemSectionContext.SECTION_CONTEXT_MIXED_FEED;
            case 8:
                return StreamItemSectionContext.SECTION_CONTEXT_PUBLISHED_BY_USER_IN_COLLECTION;
            case 9:
                return StreamItemSectionContext.SECTION_CONTEXT_MEMBERS;
            case 10:
                return StreamItemSectionContext.SECTION_CONTEXT_PUBLISHED_BY_USER_AND_COLLECTION;
            case 11:
                return StreamItemSectionContext.SECTION_CONTEXT_READING_QUEUE;
            case 12:
                return StreamItemSectionContext.SECTION_CONTEXT_ONBOARDING;
            case 13:
                return StreamItemSectionContext.SECTION_CONTEXT_TOPIC_EXPLORE;
            case 14:
                return StreamItemSectionContext.SECTION_CONTEXT_SUGGESTED_TOPIC;
            case 15:
                return StreamItemSectionContext.SECTION_CONTEXT_POPCHUNK;
            case 16:
                return StreamItemSectionContext.SECTION_CONTEXT_TOP_STORIES_FOR_YOU;
            case 17:
                return StreamItemSectionContext.SECTION_CONTEXT_COLLABORATIVE_FILTERING;
            case 18:
                return StreamItemSectionContext.SECTION_CONTEXT_FEATURED_CHUNK;
            case 19:
                return StreamItemSectionContext.SECTION_CONTEXT_POPULAR;
            case 20:
                return StreamItemSectionContext.SECTION_CONTEXT_FEATURED_STORIES;
            case 21:
                return StreamItemSectionContext.SECTION_CONTEXT_FEATURED_WRITER;
            case 22:
                return StreamItemSectionContext.SECTION_CONTEXT_SEQUENCE_CAROUSEL;
            case 23:
                return StreamItemSectionContext.SECTION_CONTEXT_MOST_POPULAR_STORIES_IN_TOPIC;
            case 24:
                return StreamItemSectionContext.SECTION_CONTEXT_TODAYS_HIGHLIGHTS;
            case 25:
                return StreamItemSectionContext.READ_NEXT_SIDEBAR;
            case 26:
                return StreamItemSectionContext.READ_NEXT_HEADER;
            case 27:
                return StreamItemSectionContext.YOUR_TOPICS;
            case 28:
                return StreamItemSectionContext.RELATED_TAGS;
            case 29:
                return StreamItemSectionContext.TOP_WRITERS;
            case 30:
                return StreamItemSectionContext.RECOMMENDED_TOPICS;
            case 31:
                return StreamItemSectionContext.HOMEPAGE_FILTERED_TAG;
            default:
                return null;
        }
    }
}
