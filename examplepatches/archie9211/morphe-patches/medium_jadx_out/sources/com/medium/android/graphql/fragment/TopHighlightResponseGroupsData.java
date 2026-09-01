package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001fB%\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ4\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u000bJ\u0010\u0010\u0013\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u000bR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u001c\u0010\u000bR\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001d\u001a\u0004\b\u001e\u0010\u000e¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData;", "Lg15;", "", "__typename", "id", "", "Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData$TopHighlightResponseGroup;", "topHighlightResponseGroups", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Ljava/util/List;", "getTopHighlightResponseGroups", "TopHighlightResponseGroup", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TopHighlightResponseGroupsData implements g15 {
    private final String __typename;
    private final String id;
    private final List<TopHighlightResponseGroup> topHighlightResponseGroups;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/TopHighlightResponseGroupsData$TopHighlightResponseGroup;", "", "__typename", "", "highlightGroupData", "Lcom/medium/android/graphql/fragment/HighlightGroupData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightGroupData;)V", "get__typename", "()Ljava/lang/String;", "getHighlightGroupData", "()Lcom/medium/android/graphql/fragment/HighlightGroupData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TopHighlightResponseGroup {
        private final String __typename;
        private final HighlightGroupData highlightGroupData;

        public TopHighlightResponseGroup(String str, HighlightGroupData highlightGroupData) {
            str.getClass();
            highlightGroupData.getClass();
            this.__typename = str;
            this.highlightGroupData = highlightGroupData;
        }

        public static /* synthetic */ TopHighlightResponseGroup copy$default(TopHighlightResponseGroup topHighlightResponseGroup, String str, HighlightGroupData highlightGroupData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = topHighlightResponseGroup.__typename;
            }
            if ((i & 2) != 0) {
                highlightGroupData = topHighlightResponseGroup.highlightGroupData;
            }
            return topHighlightResponseGroup.copy(str, highlightGroupData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final HighlightGroupData getHighlightGroupData() {
            return this.highlightGroupData;
        }

        public final TopHighlightResponseGroup copy(String __typename, HighlightGroupData highlightGroupData) {
            __typename.getClass();
            highlightGroupData.getClass();
            return new TopHighlightResponseGroup(__typename, highlightGroupData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TopHighlightResponseGroup)) {
                return false;
            }
            TopHighlightResponseGroup topHighlightResponseGroup = (TopHighlightResponseGroup) other;
            return g76.L(this.__typename, topHighlightResponseGroup.__typename) && g76.L(this.highlightGroupData, topHighlightResponseGroup.highlightGroupData);
        }

        public final HighlightGroupData getHighlightGroupData() {
            return this.highlightGroupData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightGroupData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "TopHighlightResponseGroup(__typename=" + this.__typename + ", highlightGroupData=" + this.highlightGroupData + ")";
        }
    }

    public TopHighlightResponseGroupsData(String str, String str2, List<TopHighlightResponseGroup> list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.__typename = str;
        this.id = str2;
        this.topHighlightResponseGroups = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ TopHighlightResponseGroupsData copy$default(TopHighlightResponseGroupsData topHighlightResponseGroupsData, String str, String str2, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = topHighlightResponseGroupsData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = topHighlightResponseGroupsData.id;
        }
        if ((i & 4) != 0) {
            list = topHighlightResponseGroupsData.topHighlightResponseGroups;
        }
        return topHighlightResponseGroupsData.copy(str, str2, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final List<TopHighlightResponseGroup> component3() {
        return this.topHighlightResponseGroups;
    }

    public final TopHighlightResponseGroupsData copy(String __typename, String id, List<TopHighlightResponseGroup> topHighlightResponseGroups) {
        __typename.getClass();
        id.getClass();
        topHighlightResponseGroups.getClass();
        return new TopHighlightResponseGroupsData(__typename, id, topHighlightResponseGroups);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TopHighlightResponseGroupsData)) {
            return false;
        }
        TopHighlightResponseGroupsData topHighlightResponseGroupsData = (TopHighlightResponseGroupsData) other;
        return g76.L(this.__typename, topHighlightResponseGroupsData.__typename) && g76.L(this.id, topHighlightResponseGroupsData.id) && g76.L(this.topHighlightResponseGroups, topHighlightResponseGroupsData.topHighlightResponseGroups);
    }

    public final String getId() {
        return this.id;
    }

    public final List<TopHighlightResponseGroup> getTopHighlightResponseGroups() {
        return this.topHighlightResponseGroups;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.topHighlightResponseGroups.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return b09.B(y30.u("TopHighlightResponseGroupsData(__typename=", str, ", id=", str2, ", topHighlightResponseGroups="), this.topHighlightResponseGroups, ")");
    }
}
