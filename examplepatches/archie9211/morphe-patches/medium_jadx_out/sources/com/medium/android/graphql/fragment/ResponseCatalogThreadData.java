package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0014\b\u0086\b\u0018\u00002\u00020\u0001:\u000b\"#$%&'()*+,B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u000e\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J8\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0010\b\u0002\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\fJ\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\fR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001e\u001a\u0004\b\u001f\u0010\u000eR\u001f\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b!\u0010\u0010¨\u0006-"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;", "pagingInfo", "", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post;", "posts", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;", "component3", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;Ljava/util/List;)Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;", "getPagingInfo", "Ljava/util/List;", "getPosts", "PagingInfo", "Post", "Next", "ThreadedPostResponses", "PagingInfo1", "Next1", "Post1", "ThreadedPostResponses1", "PagingInfo2", "Next2", "Post2", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ResponseCatalogThreadData implements g15 {
    private final String __typename;
    private final PagingInfo pagingInfo;
    private final List<Post> posts;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next copy$default(Next next, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next.pagingParamsData;
            }
            return next.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next)) {
                return false;
            }
            Next next = (Next) other;
            return g76.L(this.__typename, next.__typename) && g76.L(this.pagingParamsData, next.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next1;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next1 {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next1(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next1 copy$default(Next1 next1, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next1.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next1.pagingParamsData;
            }
            return next1.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next1 copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next1(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next1)) {
                return false;
            }
            Next1 next1 = (Next1) other;
            return g76.L(this.__typename, next1.__typename) && g76.L(this.pagingParamsData, next1.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next1(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next2;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next2 {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next2(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next2 copy$default(Next2 next2, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next2.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next2.pagingParamsData;
            }
            return next2.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next2 copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next2(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next2)) {
                return false;
            }
            Next2 next2 = (Next2) other;
            return g76.L(this.__typename, next2.__typename) && g76.L(this.pagingParamsData, next2.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next2(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo;", "", "__typename", "", "next", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo {
        private final String __typename;
        private final Next next;

        public PagingInfo(String str, Next next) {
            str.getClass();
            this.__typename = str;
            this.next = next;
        }

        public static /* synthetic */ PagingInfo copy$default(PagingInfo pagingInfo, String str, Next next, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo.__typename;
            }
            if ((i & 2) != 0) {
                next = pagingInfo.next;
            }
            return pagingInfo.copy(str, next);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next getNext() {
            return this.next;
        }

        public final PagingInfo copy(String __typename, Next next) {
            __typename.getClass();
            return new PagingInfo(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo)) {
                return false;
            }
            PagingInfo pagingInfo = (PagingInfo) other;
            return g76.L(this.__typename, pagingInfo.__typename) && g76.L(this.next, pagingInfo.next);
        }

        public final Next getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next next = this.next;
            return iHashCode + (next == null ? 0 : next.hashCode());
        }

        public final String toString() {
            return "PagingInfo(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo1;", "", "__typename", "", "next", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next1;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo1 {
        private final String __typename;
        private final Next1 next;

        public PagingInfo1(String str, Next1 next1) {
            str.getClass();
            this.__typename = str;
            this.next = next1;
        }

        public static /* synthetic */ PagingInfo1 copy$default(PagingInfo1 pagingInfo1, String str, Next1 next1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo1.__typename;
            }
            if ((i & 2) != 0) {
                next1 = pagingInfo1.next;
            }
            return pagingInfo1.copy(str, next1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next1 getNext() {
            return this.next;
        }

        public final PagingInfo1 copy(String __typename, Next1 next) {
            __typename.getClass();
            return new PagingInfo1(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo1)) {
                return false;
            }
            PagingInfo1 pagingInfo1 = (PagingInfo1) other;
            return g76.L(this.__typename, pagingInfo1.__typename) && g76.L(this.next, pagingInfo1.next);
        }

        public final Next1 getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next1 next1 = this.next;
            return iHashCode + (next1 == null ? 0 : next1.hashCode());
        }

        public final String toString() {
            return "PagingInfo1(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo2;", "", "__typename", "", "next", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next2;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next2;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Next2;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo2 {
        private final String __typename;
        private final Next2 next;

        public PagingInfo2(String str, Next2 next2) {
            str.getClass();
            this.__typename = str;
            this.next = next2;
        }

        public static /* synthetic */ PagingInfo2 copy$default(PagingInfo2 pagingInfo2, String str, Next2 next2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo2.__typename;
            }
            if ((i & 2) != 0) {
                next2 = pagingInfo2.next;
            }
            return pagingInfo2.copy(str, next2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next2 getNext() {
            return this.next;
        }

        public final PagingInfo2 copy(String __typename, Next2 next) {
            __typename.getClass();
            return new PagingInfo2(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo2)) {
                return false;
            }
            PagingInfo2 pagingInfo2 = (PagingInfo2) other;
            return g76.L(this.__typename, pagingInfo2.__typename) && g76.L(this.next, pagingInfo2.next);
        }

        public final Next2 getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next2 next2 = this.next;
            return iHashCode + (next2 == null ? 0 : next2.hashCode());
        }

        public final String toString() {
            return "PagingInfo2(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J3\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post;", "", "__typename", "", "threadedPostResponses", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses;", "id", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "get__typename", "()Ljava/lang/String;", "getThreadedPostResponses", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses;", "getId", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final ResponseItemData responseItemData;
        private final ThreadedPostResponses threadedPostResponses;

        public Post(String str, ThreadedPostResponses threadedPostResponses, String str2, ResponseItemData responseItemData) {
            str.getClass();
            str2.getClass();
            responseItemData.getClass();
            this.__typename = str;
            this.threadedPostResponses = threadedPostResponses;
            this.id = str2;
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, ThreadedPostResponses threadedPostResponses, String str2, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                threadedPostResponses = post.threadedPostResponses;
            }
            if ((i & 4) != 0) {
                str2 = post.id;
            }
            if ((i & 8) != 0) {
                responseItemData = post.responseItemData;
            }
            return post.copy(str, threadedPostResponses, str2, responseItemData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ThreadedPostResponses getThreadedPostResponses() {
            return this.threadedPostResponses;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final Post copy(String __typename, ThreadedPostResponses threadedPostResponses, String id, ResponseItemData responseItemData) {
            __typename.getClass();
            id.getClass();
            responseItemData.getClass();
            return new Post(__typename, threadedPostResponses, id, responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.threadedPostResponses, post.threadedPostResponses) && g76.L(this.id, post.id) && g76.L(this.responseItemData, post.responseItemData);
        }

        public final String getId() {
            return this.id;
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final ThreadedPostResponses getThreadedPostResponses() {
            return this.threadedPostResponses;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ThreadedPostResponses threadedPostResponses = this.threadedPostResponses;
            return this.responseItemData.hashCode() + wgd.o((iHashCode + (threadedPostResponses == null ? 0 : threadedPostResponses.hashCode())) * 31, 31, this.id);
        }

        public final String toString() {
            return "Post(__typename=" + this.__typename + ", threadedPostResponses=" + this.threadedPostResponses + ", id=" + this.id + ", responseItemData=" + this.responseItemData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J3\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post1;", "", "__typename", "", "threadedPostResponses", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses1;", "id", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses1;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "get__typename", "()Ljava/lang/String;", "getThreadedPostResponses", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses1;", "getId", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post1 {
        private final String __typename;
        private final String id;
        private final ResponseItemData responseItemData;
        private final ThreadedPostResponses1 threadedPostResponses;

        public Post1(String str, ThreadedPostResponses1 threadedPostResponses1, String str2, ResponseItemData responseItemData) {
            str.getClass();
            str2.getClass();
            responseItemData.getClass();
            this.__typename = str;
            this.threadedPostResponses = threadedPostResponses1;
            this.id = str2;
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ Post1 copy$default(Post1 post1, String str, ThreadedPostResponses1 threadedPostResponses1, String str2, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post1.__typename;
            }
            if ((i & 2) != 0) {
                threadedPostResponses1 = post1.threadedPostResponses;
            }
            if ((i & 4) != 0) {
                str2 = post1.id;
            }
            if ((i & 8) != 0) {
                responseItemData = post1.responseItemData;
            }
            return post1.copy(str, threadedPostResponses1, str2, responseItemData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ThreadedPostResponses1 getThreadedPostResponses() {
            return this.threadedPostResponses;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final Post1 copy(String __typename, ThreadedPostResponses1 threadedPostResponses, String id, ResponseItemData responseItemData) {
            __typename.getClass();
            id.getClass();
            responseItemData.getClass();
            return new Post1(__typename, threadedPostResponses, id, responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post1)) {
                return false;
            }
            Post1 post1 = (Post1) other;
            return g76.L(this.__typename, post1.__typename) && g76.L(this.threadedPostResponses, post1.threadedPostResponses) && g76.L(this.id, post1.id) && g76.L(this.responseItemData, post1.responseItemData);
        }

        public final String getId() {
            return this.id;
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final ThreadedPostResponses1 getThreadedPostResponses() {
            return this.threadedPostResponses;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ThreadedPostResponses1 threadedPostResponses1 = this.threadedPostResponses;
            return this.responseItemData.hashCode() + wgd.o((iHashCode + (threadedPostResponses1 == null ? 0 : threadedPostResponses1.hashCode())) * 31, 31, this.id);
        }

        public final String toString() {
            return "Post1(__typename=" + this.__typename + ", threadedPostResponses=" + this.threadedPostResponses + ", id=" + this.id + ", responseItemData=" + this.responseItemData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post2;", "", "__typename", "", "id", "responseItemData", "Lcom/medium/android/graphql/fragment/ResponseItemData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getResponseItemData", "()Lcom/medium/android/graphql/fragment/ResponseItemData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post2 {
        private final String __typename;
        private final String id;
        private final ResponseItemData responseItemData;

        public Post2(String str, String str2, ResponseItemData responseItemData) {
            str.getClass();
            str2.getClass();
            responseItemData.getClass();
            this.__typename = str;
            this.id = str2;
            this.responseItemData = responseItemData;
        }

        public static /* synthetic */ Post2 copy$default(Post2 post2, String str, String str2, ResponseItemData responseItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post2.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post2.id;
            }
            if ((i & 4) != 0) {
                responseItemData = post2.responseItemData;
            }
            return post2.copy(str, str2, responseItemData);
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
        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final Post2 copy(String __typename, String id, ResponseItemData responseItemData) {
            __typename.getClass();
            id.getClass();
            responseItemData.getClass();
            return new Post2(__typename, id, responseItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post2)) {
                return false;
            }
            Post2 post2 = (Post2) other;
            return g76.L(this.__typename, post2.__typename) && g76.L(this.id, post2.id) && g76.L(this.responseItemData, post2.responseItemData);
        }

        public final String getId() {
            return this.id;
        }

        public final ResponseItemData getResponseItemData() {
            return this.responseItemData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.responseItemData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ResponseItemData responseItemData = this.responseItemData;
            StringBuilder sbU = y30.u("Post2(__typename=", str, ", id=", str2, ", responseItemData=");
            sbU.append(responseItemData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007\u0012\u0010\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0011\u0010\u0015\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007HÆ\u0003J\u0013\u0010\u0016\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007HÆ\u0003JE\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u00072\u0012\b\u0002\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0019\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u001b\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses;", "", "__typename", "", "pagingInfo", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo1;", "posts", "", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post1;", "autoExpandedPostIds", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo1;Ljava/util/List;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getPagingInfo", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo1;", "getPosts", "()Ljava/util/List;", "getAutoExpandedPostIds", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ThreadedPostResponses {
        private final String __typename;
        private final List<String> autoExpandedPostIds;
        private final PagingInfo1 pagingInfo;
        private final List<Post1> posts;

        public ThreadedPostResponses(String str, PagingInfo1 pagingInfo1, List<Post1> list, List<String> list2) {
            str.getClass();
            this.__typename = str;
            this.pagingInfo = pagingInfo1;
            this.posts = list;
            this.autoExpandedPostIds = list2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ThreadedPostResponses copy$default(ThreadedPostResponses threadedPostResponses, String str, PagingInfo1 pagingInfo1, List list, List list2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = threadedPostResponses.__typename;
            }
            if ((i & 2) != 0) {
                pagingInfo1 = threadedPostResponses.pagingInfo;
            }
            if ((i & 4) != 0) {
                list = threadedPostResponses.posts;
            }
            if ((i & 8) != 0) {
                list2 = threadedPostResponses.autoExpandedPostIds;
            }
            return threadedPostResponses.copy(str, pagingInfo1, list, list2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingInfo1 getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<Post1> component3() {
            return this.posts;
        }

        public final List<String> component4() {
            return this.autoExpandedPostIds;
        }

        public final ThreadedPostResponses copy(String __typename, PagingInfo1 pagingInfo, List<Post1> posts, List<String> autoExpandedPostIds) {
            __typename.getClass();
            return new ThreadedPostResponses(__typename, pagingInfo, posts, autoExpandedPostIds);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ThreadedPostResponses)) {
                return false;
            }
            ThreadedPostResponses threadedPostResponses = (ThreadedPostResponses) other;
            return g76.L(this.__typename, threadedPostResponses.__typename) && g76.L(this.pagingInfo, threadedPostResponses.pagingInfo) && g76.L(this.posts, threadedPostResponses.posts) && g76.L(this.autoExpandedPostIds, threadedPostResponses.autoExpandedPostIds);
        }

        public final List<String> getAutoExpandedPostIds() {
            return this.autoExpandedPostIds;
        }

        public final PagingInfo1 getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<Post1> getPosts() {
            return this.posts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            PagingInfo1 pagingInfo1 = this.pagingInfo;
            int iHashCode2 = (iHashCode + (pagingInfo1 == null ? 0 : pagingInfo1.hashCode())) * 31;
            List<Post1> list = this.posts;
            int iHashCode3 = (iHashCode2 + (list == null ? 0 : list.hashCode())) * 31;
            List<String> list2 = this.autoExpandedPostIds;
            return iHashCode3 + (list2 != null ? list2.hashCode() : 0);
        }

        public final String toString() {
            return "ThreadedPostResponses(__typename=" + this.__typename + ", pagingInfo=" + this.pagingInfo + ", posts=" + this.posts + ", autoExpandedPostIds=" + this.autoExpandedPostIds + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007\u0012\u0010\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0011\u0010\u0015\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007HÆ\u0003J\u0013\u0010\u0016\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007HÆ\u0003JE\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u00072\u0012\b\u0002\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0019\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u001b\u0010\t\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$ThreadedPostResponses1;", "", "__typename", "", "pagingInfo", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo2;", "posts", "", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$Post2;", "autoExpandedPostIds", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo2;Ljava/util/List;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getPagingInfo", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData$PagingInfo2;", "getPosts", "()Ljava/util/List;", "getAutoExpandedPostIds", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ThreadedPostResponses1 {
        private final String __typename;
        private final List<String> autoExpandedPostIds;
        private final PagingInfo2 pagingInfo;
        private final List<Post2> posts;

        public ThreadedPostResponses1(String str, PagingInfo2 pagingInfo2, List<Post2> list, List<String> list2) {
            str.getClass();
            this.__typename = str;
            this.pagingInfo = pagingInfo2;
            this.posts = list;
            this.autoExpandedPostIds = list2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ThreadedPostResponses1 copy$default(ThreadedPostResponses1 threadedPostResponses1, String str, PagingInfo2 pagingInfo2, List list, List list2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = threadedPostResponses1.__typename;
            }
            if ((i & 2) != 0) {
                pagingInfo2 = threadedPostResponses1.pagingInfo;
            }
            if ((i & 4) != 0) {
                list = threadedPostResponses1.posts;
            }
            if ((i & 8) != 0) {
                list2 = threadedPostResponses1.autoExpandedPostIds;
            }
            return threadedPostResponses1.copy(str, pagingInfo2, list, list2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingInfo2 getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<Post2> component3() {
            return this.posts;
        }

        public final List<String> component4() {
            return this.autoExpandedPostIds;
        }

        public final ThreadedPostResponses1 copy(String __typename, PagingInfo2 pagingInfo, List<Post2> posts, List<String> autoExpandedPostIds) {
            __typename.getClass();
            return new ThreadedPostResponses1(__typename, pagingInfo, posts, autoExpandedPostIds);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ThreadedPostResponses1)) {
                return false;
            }
            ThreadedPostResponses1 threadedPostResponses1 = (ThreadedPostResponses1) other;
            return g76.L(this.__typename, threadedPostResponses1.__typename) && g76.L(this.pagingInfo, threadedPostResponses1.pagingInfo) && g76.L(this.posts, threadedPostResponses1.posts) && g76.L(this.autoExpandedPostIds, threadedPostResponses1.autoExpandedPostIds);
        }

        public final List<String> getAutoExpandedPostIds() {
            return this.autoExpandedPostIds;
        }

        public final PagingInfo2 getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<Post2> getPosts() {
            return this.posts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            PagingInfo2 pagingInfo2 = this.pagingInfo;
            int iHashCode2 = (iHashCode + (pagingInfo2 == null ? 0 : pagingInfo2.hashCode())) * 31;
            List<Post2> list = this.posts;
            int iHashCode3 = (iHashCode2 + (list == null ? 0 : list.hashCode())) * 31;
            List<String> list2 = this.autoExpandedPostIds;
            return iHashCode3 + (list2 != null ? list2.hashCode() : 0);
        }

        public final String toString() {
            return "ThreadedPostResponses1(__typename=" + this.__typename + ", pagingInfo=" + this.pagingInfo + ", posts=" + this.posts + ", autoExpandedPostIds=" + this.autoExpandedPostIds + ")";
        }
    }

    public ResponseCatalogThreadData(String str, PagingInfo pagingInfo, List<Post> list) {
        str.getClass();
        this.__typename = str;
        this.pagingInfo = pagingInfo;
        this.posts = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ResponseCatalogThreadData copy$default(ResponseCatalogThreadData responseCatalogThreadData, String str, PagingInfo pagingInfo, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = responseCatalogThreadData.__typename;
        }
        if ((i & 2) != 0) {
            pagingInfo = responseCatalogThreadData.pagingInfo;
        }
        if ((i & 4) != 0) {
            list = responseCatalogThreadData.posts;
        }
        return responseCatalogThreadData.copy(str, pagingInfo, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final PagingInfo getPagingInfo() {
        return this.pagingInfo;
    }

    public final List<Post> component3() {
        return this.posts;
    }

    public final ResponseCatalogThreadData copy(String __typename, PagingInfo pagingInfo, List<Post> posts) {
        __typename.getClass();
        return new ResponseCatalogThreadData(__typename, pagingInfo, posts);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResponseCatalogThreadData)) {
            return false;
        }
        ResponseCatalogThreadData responseCatalogThreadData = (ResponseCatalogThreadData) other;
        return g76.L(this.__typename, responseCatalogThreadData.__typename) && g76.L(this.pagingInfo, responseCatalogThreadData.pagingInfo) && g76.L(this.posts, responseCatalogThreadData.posts);
    }

    public final PagingInfo getPagingInfo() {
        return this.pagingInfo;
    }

    public final List<Post> getPosts() {
        return this.posts;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        PagingInfo pagingInfo = this.pagingInfo;
        int iHashCode2 = (iHashCode + (pagingInfo == null ? 0 : pagingInfo.hashCode())) * 31;
        List<Post> list = this.posts;
        return iHashCode2 + (list != null ? list.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        PagingInfo pagingInfo = this.pagingInfo;
        List<Post> list = this.posts;
        StringBuilder sb = new StringBuilder("ResponseCatalogThreadData(__typename=");
        sb.append(str);
        sb.append(", pagingInfo=");
        sb.append(pagingInfo);
        sb.append(", posts=");
        return b09.B(sb, list, ")");
    }
}
