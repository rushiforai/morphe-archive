package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0017\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0086\b\u0018\u00002\u00020\u0001Be\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0012\u0010\u0013\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0012J\u0018\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0012J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0017J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u0012J\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u0012J\u0080\u0001\u0010\u001e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b \u0010\u0012J\u0010\u0010!\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010&\u001a\u00020%2\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010(\u001a\u0004\b)\u0010\u0012R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010(\u001a\u0004\b*\u0010\u0012R\u001f\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u0015R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010-\u001a\u0004\b.\u0010\u0017R\u0019\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010(\u001a\u0004\b/\u0010\u0012R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\n\u0010-\u001a\u0004\b0\u0010\u0017R\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u00101\u001a\u0004\b2\u0010\u001bR\u0019\u0010\r\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\r\u0010(\u001a\u0004\b3\u0010\u0012R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010(\u001a\u0004\b4\u0010\u0012¨\u00065"}, d2 = {"Lcom/medium/android/graphql/fragment/PagingParamsData;", "Lg15;", "", "__typename", "from", "", "ignoredIds", "", "limit", "order", "page", "", "since", "source", "to", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Ljava/util/List;", "component4", "()Ljava/lang/Integer;", "component5", "component6", "component7", "()Ljava/lang/Long;", "component8", "component9", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/PagingParamsData;", "toString", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getFrom", "Ljava/util/List;", "getIgnoredIds", "Ljava/lang/Integer;", "getLimit", "getOrder", "getPage", "Ljava/lang/Long;", "getSince", "getSource", "getTo", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PagingParamsData implements g15 {
    private final String __typename;
    private final String from;
    private final List<String> ignoredIds;
    private final Integer limit;
    private final String order;
    private final Integer page;
    private final Long since;
    private final String source;
    private final String to;

    public PagingParamsData(String str, String str2, List<String> list, Integer num, String str3, Integer num2, Long l, String str4, String str5) {
        str.getClass();
        this.__typename = str;
        this.from = str2;
        this.ignoredIds = list;
        this.limit = num;
        this.order = str3;
        this.page = num2;
        this.since = l;
        this.source = str4;
        this.to = str5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PagingParamsData copy$default(PagingParamsData pagingParamsData, String str, String str2, List list, Integer num, String str3, Integer num2, Long l, String str4, String str5, int i, Object obj) {
        if ((i & 1) != 0) {
            str = pagingParamsData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = pagingParamsData.from;
        }
        if ((i & 4) != 0) {
            list = pagingParamsData.ignoredIds;
        }
        if ((i & 8) != 0) {
            num = pagingParamsData.limit;
        }
        if ((i & 16) != 0) {
            str3 = pagingParamsData.order;
        }
        if ((i & 32) != 0) {
            num2 = pagingParamsData.page;
        }
        if ((i & 64) != 0) {
            l = pagingParamsData.since;
        }
        if ((i & 128) != 0) {
            str4 = pagingParamsData.source;
        }
        if ((i & 256) != 0) {
            str5 = pagingParamsData.to;
        }
        String str6 = str4;
        String str7 = str5;
        Integer num3 = num2;
        Long l2 = l;
        String str8 = str3;
        List list2 = list;
        return pagingParamsData.copy(str, str2, list2, num, str8, num3, l2, str6, str7);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getFrom() {
        return this.from;
    }

    public final List<String> component3() {
        return this.ignoredIds;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Integer getLimit() {
        return this.limit;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getOrder() {
        return this.order;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Integer getPage() {
        return this.page;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Long getSince() {
        return this.since;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final String getSource() {
        return this.source;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final String getTo() {
        return this.to;
    }

    public final PagingParamsData copy(String __typename, String from, List<String> ignoredIds, Integer limit, String order, Integer page, Long since, String source, String to) {
        __typename.getClass();
        return new PagingParamsData(__typename, from, ignoredIds, limit, order, page, since, source, to);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PagingParamsData)) {
            return false;
        }
        PagingParamsData pagingParamsData = (PagingParamsData) other;
        return g76.L(this.__typename, pagingParamsData.__typename) && g76.L(this.from, pagingParamsData.from) && g76.L(this.ignoredIds, pagingParamsData.ignoredIds) && g76.L(this.limit, pagingParamsData.limit) && g76.L(this.order, pagingParamsData.order) && g76.L(this.page, pagingParamsData.page) && g76.L(this.since, pagingParamsData.since) && g76.L(this.source, pagingParamsData.source) && g76.L(this.to, pagingParamsData.to);
    }

    public final String getFrom() {
        return this.from;
    }

    public final List<String> getIgnoredIds() {
        return this.ignoredIds;
    }

    public final Integer getLimit() {
        return this.limit;
    }

    public final String getOrder() {
        return this.order;
    }

    public final Integer getPage() {
        return this.page;
    }

    public final Long getSince() {
        return this.since;
    }

    public final String getSource() {
        return this.source;
    }

    public final String getTo() {
        return this.to;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.from;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        List<String> list = this.ignoredIds;
        int iHashCode3 = (iHashCode2 + (list == null ? 0 : list.hashCode())) * 31;
        Integer num = this.limit;
        int iHashCode4 = (iHashCode3 + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.order;
        int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num2 = this.page;
        int iHashCode6 = (iHashCode5 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Long l = this.since;
        int iHashCode7 = (iHashCode6 + (l == null ? 0 : l.hashCode())) * 31;
        String str3 = this.source;
        int iHashCode8 = (iHashCode7 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.to;
        return iHashCode8 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.from;
        List<String> list = this.ignoredIds;
        Integer num = this.limit;
        String str3 = this.order;
        Integer num2 = this.page;
        Long l = this.since;
        String str4 = this.source;
        String str5 = this.to;
        StringBuilder sbU = y30.u("PagingParamsData(__typename=", str, ", from=", str2, ", ignoredIds=");
        sbU.append(list);
        sbU.append(", limit=");
        sbU.append(num);
        sbU.append(", order=");
        sbU.append(str3);
        sbU.append(", page=");
        sbU.append(num2);
        sbU.append(", since=");
        sbU.append(l);
        sbU.append(", source=");
        sbU.append(str4);
        sbU.append(", to=");
        return ka1.v(sbU, str5, ")");
    }
}
