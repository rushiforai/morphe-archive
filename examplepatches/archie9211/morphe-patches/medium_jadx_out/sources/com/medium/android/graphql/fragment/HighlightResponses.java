package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0016\b\u0086\b\u0018\u00002\u00020\u0001:\u0004789:BO\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\u0006\u0010\u000e\u001a\u00020\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0012J\u0010\u0010\u0014\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u0012Jh\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000e\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b!\u0010\u0012J\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00052\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010)\u001a\u0004\b*\u0010\u0012R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b+\u0010\u0012R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010,\u001a\u0004\b-\u0010\u0015R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010.\u001a\u0004\b/\u0010\u0017R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u00100\u001a\u0004\b1\u0010\u0019R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u00102\u001a\u0004\b3\u0010\u001bR\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u00104\u001a\u0004\b5\u0010\u001dR\u0017\u0010\u000e\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010)\u001a\u0004\b6\u0010\u0012¨\u0006;"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponses;", "Lg15;", "", "__typename", "latestPublishedVersion", "", "responsesLocked", "allowResponses", "Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "postResponses", "Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "creator", "Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "highlightGroup", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Boolean;Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Z", "component4", "()Ljava/lang/Boolean;", "component5", "()Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "component6", "()Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "component7", "()Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "component8", "copy", "(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Boolean;Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/HighlightResponses;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getLatestPublishedVersion", "Z", "getResponsesLocked", "Ljava/lang/Boolean;", "getAllowResponses", "Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "getPostResponses", "Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "getCreator", "Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "getHighlightGroup", "getId", "PostResponses", "Creator", "HighlightGroup", "Responses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HighlightResponses implements g15 {
    private final String __typename;
    private final Boolean allowResponses;
    private final Creator creator;
    private final HighlightGroup highlightGroup;
    private final String id;
    private final String latestPublishedVersion;
    private final PostResponses postResponses;
    private final boolean responsesLocked;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String name;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            return creator.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        public final Creator copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÆ\u0003J)\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "", "__typename", "", "responses", "Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;", "highlightGroupData", "Lcom/medium/android/graphql/fragment/HighlightGroupData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;Lcom/medium/android/graphql/fragment/HighlightGroupData;)V", "get__typename", "()Ljava/lang/String;", "getResponses", "()Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;", "getHighlightGroupData", "()Lcom/medium/android/graphql/fragment/HighlightGroupData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class HighlightGroup {
        private final String __typename;
        private final HighlightGroupData highlightGroupData;
        private final Responses responses;

        public HighlightGroup(String str, Responses responses, HighlightGroupData highlightGroupData) {
            str.getClass();
            highlightGroupData.getClass();
            this.__typename = str;
            this.responses = responses;
            this.highlightGroupData = highlightGroupData;
        }

        public static /* synthetic */ HighlightGroup copy$default(HighlightGroup highlightGroup, String str, Responses responses, HighlightGroupData highlightGroupData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = highlightGroup.__typename;
            }
            if ((i & 2) != 0) {
                responses = highlightGroup.responses;
            }
            if ((i & 4) != 0) {
                highlightGroupData = highlightGroup.highlightGroupData;
            }
            return highlightGroup.copy(str, responses, highlightGroupData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Responses getResponses() {
            return this.responses;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final HighlightGroupData getHighlightGroupData() {
            return this.highlightGroupData;
        }

        public final HighlightGroup copy(String __typename, Responses responses, HighlightGroupData highlightGroupData) {
            __typename.getClass();
            highlightGroupData.getClass();
            return new HighlightGroup(__typename, responses, highlightGroupData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof HighlightGroup)) {
                return false;
            }
            HighlightGroup highlightGroup = (HighlightGroup) other;
            return g76.L(this.__typename, highlightGroup.__typename) && g76.L(this.responses, highlightGroup.responses) && g76.L(this.highlightGroupData, highlightGroup.highlightGroupData);
        }

        public final HighlightGroupData getHighlightGroupData() {
            return this.highlightGroupData;
        }

        public final Responses getResponses() {
            return this.responses;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Responses responses = this.responses;
            return this.highlightGroupData.hashCode() + ((iHashCode + (responses == null ? 0 : responses.hashCode())) * 31);
        }

        public final String toString() {
            return "HighlightGroup(__typename=" + this.__typename + ", responses=" + this.responses + ", highlightGroupData=" + this.highlightGroupData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "", "__typename", "", "count", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResponses {
        private final String __typename;
        private final Integer count;

        public PostResponses(String str, Integer num) {
            str.getClass();
            this.__typename = str;
            this.count = num;
        }

        public static /* synthetic */ PostResponses copy$default(PostResponses postResponses, String str, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResponses.__typename;
            }
            if ((i & 2) != 0) {
                num = postResponses.count;
            }
            return postResponses.copy(str, num);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getCount() {
            return this.count;
        }

        public final PostResponses copy(String __typename, Integer count) {
            __typename.getClass();
            return new PostResponses(__typename, count);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResponses)) {
                return false;
            }
            PostResponses postResponses = (PostResponses) other;
            return g76.L(this.__typename, postResponses.__typename) && g76.L(this.count, postResponses.count);
        }

        public final Integer getCount() {
            return this.count;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.count;
            return iHashCode + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            return "PostResponses(__typename=" + this.__typename + ", count=" + this.count + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;", "", "__typename", "", "highlightResponseThreadData", "Lcom/medium/android/graphql/fragment/HighlightResponseThreadData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightResponseThreadData;)V", "get__typename", "()Ljava/lang/String;", "getHighlightResponseThreadData", "()Lcom/medium/android/graphql/fragment/HighlightResponseThreadData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Responses {
        private final String __typename;
        private final HighlightResponseThreadData highlightResponseThreadData;

        public Responses(String str, HighlightResponseThreadData highlightResponseThreadData) {
            str.getClass();
            highlightResponseThreadData.getClass();
            this.__typename = str;
            this.highlightResponseThreadData = highlightResponseThreadData;
        }

        public static /* synthetic */ Responses copy$default(Responses responses, String str, HighlightResponseThreadData highlightResponseThreadData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = responses.__typename;
            }
            if ((i & 2) != 0) {
                highlightResponseThreadData = responses.highlightResponseThreadData;
            }
            return responses.copy(str, highlightResponseThreadData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final HighlightResponseThreadData getHighlightResponseThreadData() {
            return this.highlightResponseThreadData;
        }

        public final Responses copy(String __typename, HighlightResponseThreadData highlightResponseThreadData) {
            __typename.getClass();
            highlightResponseThreadData.getClass();
            return new Responses(__typename, highlightResponseThreadData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Responses)) {
                return false;
            }
            Responses responses = (Responses) other;
            return g76.L(this.__typename, responses.__typename) && g76.L(this.highlightResponseThreadData, responses.highlightResponseThreadData);
        }

        public final HighlightResponseThreadData getHighlightResponseThreadData() {
            return this.highlightResponseThreadData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightResponseThreadData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Responses(__typename=" + this.__typename + ", highlightResponseThreadData=" + this.highlightResponseThreadData + ")";
        }
    }

    public HighlightResponses(String str, String str2, boolean z, Boolean bool, PostResponses postResponses, Creator creator, HighlightGroup highlightGroup, String str3) {
        b09.I(str, str2, str3);
        this.__typename = str;
        this.latestPublishedVersion = str2;
        this.responsesLocked = z;
        this.allowResponses = bool;
        this.postResponses = postResponses;
        this.creator = creator;
        this.highlightGroup = highlightGroup;
        this.id = str3;
    }

    public static /* synthetic */ HighlightResponses copy$default(HighlightResponses highlightResponses, String str, String str2, boolean z, Boolean bool, PostResponses postResponses, Creator creator, HighlightGroup highlightGroup, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = highlightResponses.__typename;
        }
        if ((i & 2) != 0) {
            str2 = highlightResponses.latestPublishedVersion;
        }
        if ((i & 4) != 0) {
            z = highlightResponses.responsesLocked;
        }
        if ((i & 8) != 0) {
            bool = highlightResponses.allowResponses;
        }
        if ((i & 16) != 0) {
            postResponses = highlightResponses.postResponses;
        }
        if ((i & 32) != 0) {
            creator = highlightResponses.creator;
        }
        if ((i & 64) != 0) {
            highlightGroup = highlightResponses.highlightGroup;
        }
        if ((i & 128) != 0) {
            str3 = highlightResponses.id;
        }
        HighlightGroup highlightGroup2 = highlightGroup;
        String str4 = str3;
        PostResponses postResponses2 = postResponses;
        Creator creator2 = creator;
        return highlightResponses.copy(str, str2, z, bool, postResponses2, creator2, highlightGroup2, str4);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final boolean getResponsesLocked() {
        return this.responsesLocked;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Boolean getAllowResponses() {
        return this.allowResponses;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final PostResponses getPostResponses() {
        return this.postResponses;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final HighlightGroup getHighlightGroup() {
        return this.highlightGroup;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final HighlightResponses copy(String __typename, String latestPublishedVersion, boolean responsesLocked, Boolean allowResponses, PostResponses postResponses, Creator creator, HighlightGroup highlightGroup, String id) {
        __typename.getClass();
        latestPublishedVersion.getClass();
        id.getClass();
        return new HighlightResponses(__typename, latestPublishedVersion, responsesLocked, allowResponses, postResponses, creator, highlightGroup, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HighlightResponses)) {
            return false;
        }
        HighlightResponses highlightResponses = (HighlightResponses) other;
        return g76.L(this.__typename, highlightResponses.__typename) && g76.L(this.latestPublishedVersion, highlightResponses.latestPublishedVersion) && this.responsesLocked == highlightResponses.responsesLocked && g76.L(this.allowResponses, highlightResponses.allowResponses) && g76.L(this.postResponses, highlightResponses.postResponses) && g76.L(this.creator, highlightResponses.creator) && g76.L(this.highlightGroup, highlightResponses.highlightGroup) && g76.L(this.id, highlightResponses.id);
    }

    public final Boolean getAllowResponses() {
        return this.allowResponses;
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final HighlightGroup getHighlightGroup() {
        return this.highlightGroup;
    }

    public final String getId() {
        return this.id;
    }

    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    public final PostResponses getPostResponses() {
        return this.postResponses;
    }

    public final boolean getResponsesLocked() {
        return this.responsesLocked;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = (wgd.o(this.__typename.hashCode() * 31, 31, this.latestPublishedVersion) + (this.responsesLocked ? 1231 : 1237)) * 31;
        Boolean bool = this.allowResponses;
        int iHashCode = (iO + (bool == null ? 0 : bool.hashCode())) * 31;
        PostResponses postResponses = this.postResponses;
        int iHashCode2 = (iHashCode + (postResponses == null ? 0 : postResponses.hashCode())) * 31;
        Creator creator = this.creator;
        int iHashCode3 = (iHashCode2 + (creator == null ? 0 : creator.hashCode())) * 31;
        HighlightGroup highlightGroup = this.highlightGroup;
        return this.id.hashCode() + ((iHashCode3 + (highlightGroup != null ? highlightGroup.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.latestPublishedVersion;
        boolean z = this.responsesLocked;
        Boolean bool = this.allowResponses;
        PostResponses postResponses = this.postResponses;
        Creator creator = this.creator;
        HighlightGroup highlightGroup = this.highlightGroup;
        String str3 = this.id;
        StringBuilder sbU = y30.u("HighlightResponses(__typename=", str, ", latestPublishedVersion=", str2, ", responsesLocked=");
        sbU.append(z);
        sbU.append(", allowResponses=");
        sbU.append(bool);
        sbU.append(", postResponses=");
        sbU.append(postResponses);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", highlightGroup=");
        sbU.append(highlightGroup);
        sbU.append(", id=");
        sbU.append(str3);
        sbU.append(")");
        return sbU.toString();
    }
}
