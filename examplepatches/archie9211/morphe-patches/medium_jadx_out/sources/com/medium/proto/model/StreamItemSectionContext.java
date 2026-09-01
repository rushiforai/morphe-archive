package com.medium.proto.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.atc;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b(\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$j\u0002\b%j\u0002\b&j\u0002\b'j\u0002\b(j\u0002\b)j\u0002\b*¨\u0006+"}, d2 = {"Lcom/medium/proto/model/StreamItemSectionContext;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "atc", "SECTION_CONTEXT_NONE", "SECTION_CONTEXT_PUBLISHED_BY_COLLECTION", "SECTION_CONTEXT_PUBLISHED_BY_USER", "SECTION_CONTEXT_RECOMMENDED_BY_USER", "SECTION_CONTEXT_RECOMMENDED_IN_TAG", "SECTION_CONTEXT_CURATED_IN_TOPIC", "SECTION_CONTEXT_MIXED_FEED", "SECTION_CONTEXT_PUBLISHED_BY_USER_IN_COLLECTION", "SECTION_CONTEXT_MEMBERS", "SECTION_CONTEXT_PUBLISHED_BY_USER_AND_COLLECTION", "SECTION_CONTEXT_READING_QUEUE", "SECTION_CONTEXT_ONBOARDING", "SECTION_CONTEXT_TOPIC_EXPLORE", "SECTION_CONTEXT_SUGGESTED_TOPIC", "SECTION_CONTEXT_POPCHUNK", "SECTION_CONTEXT_TOP_STORIES_FOR_YOU", "SECTION_CONTEXT_COLLABORATIVE_FILTERING", "SECTION_CONTEXT_FEATURED_CHUNK", "SECTION_CONTEXT_POPULAR", "SECTION_CONTEXT_SEQUENCE_CAROUSEL", "SECTION_CONTEXT_FEATURED_STORIES", "SECTION_CONTEXT_FEATURED_WRITER", "SECTION_CONTEXT_MOST_POPULAR_STORIES_IN_TOPIC", "SECTION_CONTEXT_TODAYS_HIGHLIGHTS", "READ_NEXT_SIDEBAR", "READ_NEXT_HEADER", "YOUR_TOPICS", "RELATED_TAGS", "TOP_WRITERS", "RECOMMENDED_TOPICS", "HOMEPAGE_FILTERED_TAG", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class StreamItemSectionContext implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ StreamItemSectionContext[] $VALUES;
    public static final ProtoAdapter<StreamItemSectionContext> ADAPTER;
    public static final atc Companion;
    private final int value;
    public static final StreamItemSectionContext SECTION_CONTEXT_NONE = new StreamItemSectionContext("SECTION_CONTEXT_NONE", 0, 1);
    public static final StreamItemSectionContext SECTION_CONTEXT_PUBLISHED_BY_COLLECTION = new StreamItemSectionContext("SECTION_CONTEXT_PUBLISHED_BY_COLLECTION", 1, 2);
    public static final StreamItemSectionContext SECTION_CONTEXT_PUBLISHED_BY_USER = new StreamItemSectionContext("SECTION_CONTEXT_PUBLISHED_BY_USER", 2, 3);
    public static final StreamItemSectionContext SECTION_CONTEXT_RECOMMENDED_BY_USER = new StreamItemSectionContext("SECTION_CONTEXT_RECOMMENDED_BY_USER", 3, 4);
    public static final StreamItemSectionContext SECTION_CONTEXT_RECOMMENDED_IN_TAG = new StreamItemSectionContext("SECTION_CONTEXT_RECOMMENDED_IN_TAG", 4, 5);
    public static final StreamItemSectionContext SECTION_CONTEXT_CURATED_IN_TOPIC = new StreamItemSectionContext("SECTION_CONTEXT_CURATED_IN_TOPIC", 5, 6);
    public static final StreamItemSectionContext SECTION_CONTEXT_MIXED_FEED = new StreamItemSectionContext("SECTION_CONTEXT_MIXED_FEED", 6, 7);
    public static final StreamItemSectionContext SECTION_CONTEXT_PUBLISHED_BY_USER_IN_COLLECTION = new StreamItemSectionContext("SECTION_CONTEXT_PUBLISHED_BY_USER_IN_COLLECTION", 7, 8);
    public static final StreamItemSectionContext SECTION_CONTEXT_MEMBERS = new StreamItemSectionContext("SECTION_CONTEXT_MEMBERS", 8, 9);
    public static final StreamItemSectionContext SECTION_CONTEXT_PUBLISHED_BY_USER_AND_COLLECTION = new StreamItemSectionContext("SECTION_CONTEXT_PUBLISHED_BY_USER_AND_COLLECTION", 9, 10);
    public static final StreamItemSectionContext SECTION_CONTEXT_READING_QUEUE = new StreamItemSectionContext("SECTION_CONTEXT_READING_QUEUE", 10, 11);
    public static final StreamItemSectionContext SECTION_CONTEXT_ONBOARDING = new StreamItemSectionContext("SECTION_CONTEXT_ONBOARDING", 11, 12);
    public static final StreamItemSectionContext SECTION_CONTEXT_TOPIC_EXPLORE = new StreamItemSectionContext("SECTION_CONTEXT_TOPIC_EXPLORE", 12, 13);
    public static final StreamItemSectionContext SECTION_CONTEXT_SUGGESTED_TOPIC = new StreamItemSectionContext("SECTION_CONTEXT_SUGGESTED_TOPIC", 13, 14);
    public static final StreamItemSectionContext SECTION_CONTEXT_POPCHUNK = new StreamItemSectionContext("SECTION_CONTEXT_POPCHUNK", 14, 15);
    public static final StreamItemSectionContext SECTION_CONTEXT_TOP_STORIES_FOR_YOU = new StreamItemSectionContext("SECTION_CONTEXT_TOP_STORIES_FOR_YOU", 15, 16);
    public static final StreamItemSectionContext SECTION_CONTEXT_COLLABORATIVE_FILTERING = new StreamItemSectionContext("SECTION_CONTEXT_COLLABORATIVE_FILTERING", 16, 17);
    public static final StreamItemSectionContext SECTION_CONTEXT_FEATURED_CHUNK = new StreamItemSectionContext("SECTION_CONTEXT_FEATURED_CHUNK", 17, 18);
    public static final StreamItemSectionContext SECTION_CONTEXT_POPULAR = new StreamItemSectionContext("SECTION_CONTEXT_POPULAR", 18, 19);
    public static final StreamItemSectionContext SECTION_CONTEXT_SEQUENCE_CAROUSEL = new StreamItemSectionContext("SECTION_CONTEXT_SEQUENCE_CAROUSEL", 19, 22);
    public static final StreamItemSectionContext SECTION_CONTEXT_FEATURED_STORIES = new StreamItemSectionContext("SECTION_CONTEXT_FEATURED_STORIES", 20, 20);
    public static final StreamItemSectionContext SECTION_CONTEXT_FEATURED_WRITER = new StreamItemSectionContext("SECTION_CONTEXT_FEATURED_WRITER", 21, 21);
    public static final StreamItemSectionContext SECTION_CONTEXT_MOST_POPULAR_STORIES_IN_TOPIC = new StreamItemSectionContext("SECTION_CONTEXT_MOST_POPULAR_STORIES_IN_TOPIC", 22, 23);
    public static final StreamItemSectionContext SECTION_CONTEXT_TODAYS_HIGHLIGHTS = new StreamItemSectionContext("SECTION_CONTEXT_TODAYS_HIGHLIGHTS", 23, 24);
    public static final StreamItemSectionContext READ_NEXT_SIDEBAR = new StreamItemSectionContext("READ_NEXT_SIDEBAR", 24, 25);
    public static final StreamItemSectionContext READ_NEXT_HEADER = new StreamItemSectionContext("READ_NEXT_HEADER", 25, 26);
    public static final StreamItemSectionContext YOUR_TOPICS = new StreamItemSectionContext("YOUR_TOPICS", 26, 27);
    public static final StreamItemSectionContext RELATED_TAGS = new StreamItemSectionContext("RELATED_TAGS", 27, 28);
    public static final StreamItemSectionContext TOP_WRITERS = new StreamItemSectionContext("TOP_WRITERS", 28, 29);
    public static final StreamItemSectionContext RECOMMENDED_TOPICS = new StreamItemSectionContext("RECOMMENDED_TOPICS", 29, 30);
    public static final StreamItemSectionContext HOMEPAGE_FILTERED_TAG = new StreamItemSectionContext(gYpYQDQkhfs.nlirSXOSIV, 30, 31);

    private static final /* synthetic */ StreamItemSectionContext[] $values() {
        return new StreamItemSectionContext[]{SECTION_CONTEXT_NONE, SECTION_CONTEXT_PUBLISHED_BY_COLLECTION, SECTION_CONTEXT_PUBLISHED_BY_USER, SECTION_CONTEXT_RECOMMENDED_BY_USER, SECTION_CONTEXT_RECOMMENDED_IN_TAG, SECTION_CONTEXT_CURATED_IN_TOPIC, SECTION_CONTEXT_MIXED_FEED, SECTION_CONTEXT_PUBLISHED_BY_USER_IN_COLLECTION, SECTION_CONTEXT_MEMBERS, SECTION_CONTEXT_PUBLISHED_BY_USER_AND_COLLECTION, SECTION_CONTEXT_READING_QUEUE, SECTION_CONTEXT_ONBOARDING, SECTION_CONTEXT_TOPIC_EXPLORE, SECTION_CONTEXT_SUGGESTED_TOPIC, SECTION_CONTEXT_POPCHUNK, SECTION_CONTEXT_TOP_STORIES_FOR_YOU, SECTION_CONTEXT_COLLABORATIVE_FILTERING, SECTION_CONTEXT_FEATURED_CHUNK, SECTION_CONTEXT_POPULAR, SECTION_CONTEXT_SEQUENCE_CAROUSEL, SECTION_CONTEXT_FEATURED_STORIES, SECTION_CONTEXT_FEATURED_WRITER, SECTION_CONTEXT_MOST_POPULAR_STORIES_IN_TOPIC, SECTION_CONTEXT_TODAYS_HIGHLIGHTS, READ_NEXT_SIDEBAR, READ_NEXT_HEADER, YOUR_TOPICS, RELATED_TAGS, TOP_WRITERS, RECOMMENDED_TOPICS, HOMEPAGE_FILTERED_TAG};
    }

    private StreamItemSectionContext(String str, int i, int i2) {
        this.value = i2;
    }

    public static final StreamItemSectionContext fromValue(int i) {
        Companion.getClass();
        return atc.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static StreamItemSectionContext valueOf(String str) {
        return (StreamItemSectionContext) Enum.valueOf(StreamItemSectionContext.class, str);
    }

    public static StreamItemSectionContext[] values() {
        return (StreamItemSectionContext[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }

    static {
        StreamItemSectionContext[] streamItemSectionContextArr$values = $values();
        $VALUES = streamItemSectionContextArr$values;
        $ENTRIES = new i04(streamItemSectionContextArr$values);
        Companion = new atc();
        ADAPTER = new StreamItemSectionContext$Companion$ADAPTER$1(n1b.a.b(StreamItemSectionContext.class), Syntax.PROTO_2, null);
    }
}
