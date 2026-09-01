package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.LinkAlternateType;
import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0002\u001f B%\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ4\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u000bJ\u0010\u0010\u0013\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u000bR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u001c\u0010\u000bR\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001d\u001a\u0004\b\u001e\u0010\u000e¨\u0006!"}, d2 = {"Lcom/medium/android/graphql/fragment/LinkMetadataList;", "Lg15;", "", "__typename", "id", "", "Lcom/medium/android/graphql/fragment/LinkMetadataList$LinkMetadataList;", "linkMetadataList", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/fragment/LinkMetadataList;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Ljava/util/List;", "getLinkMetadataList", "LinkMetadataList", "Alt", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class LinkMetadataList implements g15 {
    private final String __typename;
    private final String id;
    private final List<C0000LinkMetadataList> linkMetadataList;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J+\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/LinkMetadataList$Alt;", "", "__typename", "", "type", "Lcom/medium/android/graphql/type/LinkAlternateType;", "url", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/LinkAlternateType;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getType", "()Lcom/medium/android/graphql/type/LinkAlternateType;", "getUrl", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Alt {
        private final String __typename;
        private final LinkAlternateType type;
        private final String url;

        public Alt(String str, LinkAlternateType linkAlternateType, String str2) {
            str.getClass();
            this.__typename = str;
            this.type = linkAlternateType;
            this.url = str2;
        }

        public static /* synthetic */ Alt copy$default(Alt alt, String str, LinkAlternateType linkAlternateType, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = alt.__typename;
            }
            if ((i & 2) != 0) {
                linkAlternateType = alt.type;
            }
            if ((i & 4) != 0) {
                str2 = alt.url;
            }
            return alt.copy(str, linkAlternateType, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final LinkAlternateType getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getUrl() {
            return this.url;
        }

        public final Alt copy(String __typename, LinkAlternateType type, String url) {
            __typename.getClass();
            return new Alt(__typename, type, url);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Alt)) {
                return false;
            }
            Alt alt = (Alt) other;
            return g76.L(this.__typename, alt.__typename) && this.type == alt.type && g76.L(this.url, alt.url);
        }

        public final LinkAlternateType getType() {
            return this.type;
        }

        public final String getUrl() {
            return this.url;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            LinkAlternateType linkAlternateType = this.type;
            int iHashCode2 = (iHashCode + (linkAlternateType == null ? 0 : linkAlternateType.hashCode())) * 31;
            String str = this.url;
            return iHashCode2 + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            LinkAlternateType linkAlternateType = this.type;
            String str2 = this.url;
            StringBuilder sb = new StringBuilder("Alt(__typename=");
            sb.append(str);
            sb.append(", type=");
            sb.append(linkAlternateType);
            sb.append(", url=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: renamed from: com.medium.android.graphql.fragment.LinkMetadataList$LinkMetadataList, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\u0010\u0005\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\u0011\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0012\b\u0002\u0010\u0005\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u001b\u0010\u0005\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/LinkMetadataList$LinkMetadataList;", "", "__typename", "", "url", "alts", "", "Lcom/medium/android/graphql/fragment/LinkMetadataList$Alt;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getUrl", "getAlts", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class C0000LinkMetadataList {
        private final String __typename;
        private final List<Alt> alts;
        private final String url;

        public C0000LinkMetadataList(String str, String str2, List<Alt> list) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.url = str2;
            this.alts = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ C0000LinkMetadataList copy$default(C0000LinkMetadataList c0000LinkMetadataList, String str, String str2, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = c0000LinkMetadataList.__typename;
            }
            if ((i & 2) != 0) {
                str2 = c0000LinkMetadataList.url;
            }
            if ((i & 4) != 0) {
                list = c0000LinkMetadataList.alts;
            }
            return c0000LinkMetadataList.copy(str, str2, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getUrl() {
            return this.url;
        }

        public final List<Alt> component3() {
            return this.alts;
        }

        public final C0000LinkMetadataList copy(String __typename, String url, List<Alt> alts) {
            __typename.getClass();
            url.getClass();
            return new C0000LinkMetadataList(__typename, url, alts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof C0000LinkMetadataList)) {
                return false;
            }
            C0000LinkMetadataList c0000LinkMetadataList = (C0000LinkMetadataList) other;
            return g76.L(this.__typename, c0000LinkMetadataList.__typename) && g76.L(this.url, c0000LinkMetadataList.url) && g76.L(this.alts, c0000LinkMetadataList.alts);
        }

        public final List<Alt> getAlts() {
            return this.alts;
        }

        public final String getUrl() {
            return this.url;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.url);
            List<Alt> list = this.alts;
            return iO + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.url;
            return b09.B(y30.u("LinkMetadataList(__typename=", str, ", url=", str2, ", alts="), this.alts, ")");
        }
    }

    public LinkMetadataList(String str, String str2, List<C0000LinkMetadataList> list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.__typename = str;
        this.id = str2;
        this.linkMetadataList = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ LinkMetadataList copy$default(LinkMetadataList linkMetadataList, String str, String str2, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = linkMetadataList.__typename;
        }
        if ((i & 2) != 0) {
            str2 = linkMetadataList.id;
        }
        if ((i & 4) != 0) {
            list = linkMetadataList.linkMetadataList;
        }
        return linkMetadataList.copy(str, str2, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final List<C0000LinkMetadataList> component3() {
        return this.linkMetadataList;
    }

    public final LinkMetadataList copy(String __typename, String id, List<C0000LinkMetadataList> linkMetadataList) {
        __typename.getClass();
        id.getClass();
        linkMetadataList.getClass();
        return new LinkMetadataList(__typename, id, linkMetadataList);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LinkMetadataList)) {
            return false;
        }
        LinkMetadataList linkMetadataList = (LinkMetadataList) other;
        return g76.L(this.__typename, linkMetadataList.__typename) && g76.L(this.id, linkMetadataList.id) && g76.L(this.linkMetadataList, linkMetadataList.linkMetadataList);
    }

    public final String getId() {
        return this.id;
    }

    public final List<C0000LinkMetadataList> getLinkMetadataList() {
        return this.linkMetadataList;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.linkMetadataList.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return b09.B(y30.u("LinkMetadataList(__typename=", str, ", id=", str2, ", linkMetadataList="), this.linkMetadataList, ")");
    }
}
