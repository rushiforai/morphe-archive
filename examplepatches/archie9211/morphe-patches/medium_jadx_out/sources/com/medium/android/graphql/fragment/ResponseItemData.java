package com.medium.android.graphql.fragment;

import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.graphql.type.ParagraphType;
import defpackage.b09;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.km4;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b-\b\u0086\b\u0018\u00002\u00020\u0001:\u0012VWXYZ[\\]^_`abcdefgB\u007f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0006\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJ\u0012\u0010\u001f\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0012\u0010!\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0012\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0004\b#\u0010$J\u0012\u0010%\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0012\u0010'\u001a\u0004\u0018\u00010\rHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0012\u0010)\u001a\u0004\u0018\u00010\rHÆ\u0003¢\u0006\u0004\b)\u0010(J\u0012\u0010*\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\b*\u0010+J\u0010\u0010,\u001a\u00020\u0012HÆ\u0003¢\u0006\u0004\b,\u0010-J\u0012\u0010.\u001a\u0004\u0018\u00010\u0014HÆ\u0003¢\u0006\u0004\b.\u0010/J\u0010\u00100\u001a\u00020\u0016HÆ\u0003¢\u0006\u0004\b0\u00101J\u0010\u00102\u001a\u00020\u0018HÆ\u0003¢\u0006\u0004\b2\u00103J¢\u0001\u00104\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u00122\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\b\b\u0002\u0010\u0017\u001a\u00020\u00162\b\b\u0002\u0010\u0019\u001a\u00020\u0018HÆ\u0001¢\u0006\u0004\b4\u00105J\u0010\u00106\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b6\u0010\u001dJ\u0010\u00107\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b7\u00108J\u001a\u0010<\u001a\u00020;2\b\u0010:\u001a\u0004\u0018\u000109HÖ\u0003¢\u0006\u0004\b<\u0010=R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010>\u001a\u0004\b?\u0010\u001dR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010>\u001a\u0004\b@\u0010\u001dR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010A\u001a\u0004\bB\u0010 R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010C\u001a\u0004\bD\u0010\"R\u0019\u0010\n\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\n\u0010E\u001a\u0004\bF\u0010$R\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010G\u001a\u0004\bH\u0010&R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006¢\u0006\f\n\u0004\b\u000e\u0010I\u001a\u0004\bJ\u0010(R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\r8\u0006¢\u0006\f\n\u0004\b\u000f\u0010I\u001a\u0004\bK\u0010(R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010L\u001a\u0004\bM\u0010+R\u0017\u0010\u0013\u001a\u00020\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010N\u001a\u0004\bO\u0010-R\u0019\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006¢\u0006\f\n\u0004\b\u0015\u0010P\u001a\u0004\bQ\u0010/R\u0017\u0010\u0017\u001a\u00020\u00168\u0006¢\u0006\f\n\u0004\b\u0017\u0010R\u001a\u0004\bS\u00101R\u0017\u0010\u0019\u001a\u00020\u00188\u0006¢\u0006\f\n\u0004\b\u0019\u0010T\u001a\u0004\bU\u00103¨\u0006h"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;", "responseRootPost", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;", "inResponseToPostResult", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;", "inResponseToCatalogResult", "Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;", "creator", "", "firstPublishedAt", "latestPublishedAt", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;", "inResponseToMediaResource", "Lcom/medium/android/graphql/fragment/ResponseItemData$Content;", "content", "", "latestRev", "Lcom/medium/android/graphql/fragment/PostClapsData;", "postClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "responseCountData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;Ljava/lang/Long;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;Lcom/medium/android/graphql/fragment/ResponseItemData$Content;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;", "component4", "()Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;", "component5", "()Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;", "component6", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;", "component7", "()Ljava/lang/Long;", "component8", "component9", "()Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;", "component10", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Content;", "component11", "()Ljava/lang/Integer;", "component12", "()Lcom/medium/android/graphql/fragment/PostClapsData;", "component13", "()Lcom/medium/android/graphql/fragment/ResponseCountData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;Ljava/lang/Long;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;Lcom/medium/android/graphql/fragment/ResponseItemData$Content;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;)Lcom/medium/android/graphql/fragment/ResponseItemData;", "toString", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;", "getResponseRootPost", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;", "getInResponseToPostResult", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;", "getInResponseToCatalogResult", "Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;", "getCreator", "Ljava/lang/Long;", "getFirstPublishedAt", "getLatestPublishedAt", "Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;", "getInResponseToMediaResource", "Lcom/medium/android/graphql/fragment/ResponseItemData$Content;", "getContent", "Ljava/lang/Integer;", "getLatestRev", "Lcom/medium/android/graphql/fragment/PostClapsData;", "getPostClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "getResponseCountData", "ResponseRootPost", "InResponseToPostResult", "InResponseToCatalogResult", "Creator1", "InResponseToMediaResource", "Content", "Post", "Creator", "OnPost", "OnCatalog", "Membership", "ViewerEdge", "Verifications", "OnMediaResource", "MediumQuote", "BodyModel", "Paragraph", "Markup", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ResponseItemData implements g15 {
    private final String __typename;
    private final Content content;
    private final Creator1 creator;
    private final Long firstPublishedAt;
    private final String id;
    private final InResponseToCatalogResult inResponseToCatalogResult;
    private final InResponseToMediaResource inResponseToMediaResource;
    private final InResponseToPostResult inResponseToPostResult;
    private final Long latestPublishedAt;
    private final Integer latestRev;
    private final PostClapsData postClapsData;
    private final ResponseCountData responseCountData;
    private final ResponseRootPost responseRootPost;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$BodyModel;", "", "__typename", "", "paragraphs", "", "Lcom/medium/android/graphql/fragment/ResponseItemData$Paragraph;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getParagraphs", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BodyModel {
        private final String __typename;
        private final List<Paragraph> paragraphs;

        public BodyModel(String str, List<Paragraph> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.paragraphs = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ BodyModel copy$default(BodyModel bodyModel, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = bodyModel.__typename;
            }
            if ((i & 2) != 0) {
                list = bodyModel.paragraphs;
            }
            return bodyModel.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Paragraph> component2() {
            return this.paragraphs;
        }

        public final BodyModel copy(String __typename, List<Paragraph> paragraphs) {
            __typename.getClass();
            paragraphs.getClass();
            return new BodyModel(__typename, paragraphs);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BodyModel)) {
                return false;
            }
            BodyModel bodyModel = (BodyModel) other;
            return g76.L(this.__typename, bodyModel.__typename) && g76.L(this.paragraphs, bodyModel.paragraphs);
        }

        public final List<Paragraph> getParagraphs() {
            return this.paragraphs;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paragraphs.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("BodyModel(__typename=", this.__typename, ", paragraphs=", ")", this.paragraphs);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Content;", "", "__typename", "", "bodyModel", "Lcom/medium/android/graphql/fragment/ResponseItemData$BodyModel;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$BodyModel;)V", "get__typename", "()Ljava/lang/String;", "getBodyModel", "()Lcom/medium/android/graphql/fragment/ResponseItemData$BodyModel;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Content {
        private final String __typename;
        private final BodyModel bodyModel;

        public Content(String str, BodyModel bodyModel) {
            str.getClass();
            bodyModel.getClass();
            this.__typename = str;
            this.bodyModel = bodyModel;
        }

        public static /* synthetic */ Content copy$default(Content content, String str, BodyModel bodyModel, int i, Object obj) {
            if ((i & 1) != 0) {
                str = content.__typename;
            }
            if ((i & 2) != 0) {
                bodyModel = content.bodyModel;
            }
            return content.copy(str, bodyModel);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        public final Content copy(String __typename, BodyModel bodyModel) {
            __typename.getClass();
            bodyModel.getClass();
            return new Content(__typename, bodyModel);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Content)) {
                return false;
            }
            Content content = (Content) other;
            return g76.L(this.__typename, content.__typename) && g76.L(this.bodyModel, content.bodyModel);
        }

        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.bodyModel.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Content(__typename=" + this.__typename + ", bodyModel=" + this.bodyModel + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B]\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00030\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\t\u0010\"\u001a\u00020\u0003HÆ\u0003J\t\u0010#\u001a\u00020\u0003HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\bHÆ\u0003J\t\u0010'\u001a\u00020\nHÆ\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\fHÆ\u0003J\u000f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00030\u000eHÆ\u0003J\t\u0010*\u001a\u00020\u0010HÆ\u0003Jq\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\t\u001a\u00020\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f2\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00030\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u0010HÆ\u0001J\u0013\u0010,\u001a\u00020-2\b\u0010.\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010/\u001a\u000200HÖ\u0001J\t\u00101\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0014R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0014R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0014R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0017\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00030\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b \u0010!¨\u00062"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Creator1;", "", "__typename", "", "id", "name", "imageId", "membership", "Lcom/medium/android/graphql/fragment/ResponseItemData$Membership;", "viewerEdge", "Lcom/medium/android/graphql/fragment/ResponseItemData$ViewerEdge;", "verifications", "Lcom/medium/android/graphql/fragment/ResponseItemData$Verifications;", "pronouns", "", "userBlockData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$Membership;Lcom/medium/android/graphql/fragment/ResponseItemData$ViewerEdge;Lcom/medium/android/graphql/fragment/ResponseItemData$Verifications;Ljava/util/List;Lcom/medium/android/graphql/fragment/UserBlockData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getImageId", "getMembership", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Membership;", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/ResponseItemData$ViewerEdge;", "getVerifications", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Verifications;", "getPronouns", "()Ljava/util/List;", "getUserBlockData", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator1 {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final Membership membership;
        private final String name;
        private final List<String> pronouns;
        private final UserBlockData userBlockData;
        private final Verifications verifications;
        private final ViewerEdge viewerEdge;

        public Creator1(String str, String str2, String str3, String str4, Membership membership, ViewerEdge viewerEdge, Verifications verifications, List<String> list, UserBlockData userBlockData) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            list.getClass();
            userBlockData.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.imageId = str4;
            this.membership = membership;
            this.viewerEdge = viewerEdge;
            this.verifications = verifications;
            this.pronouns = list;
            this.userBlockData = userBlockData;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Creator1 copy$default(Creator1 creator1, String str, String str2, String str3, String str4, Membership membership, ViewerEdge viewerEdge, Verifications verifications, List list, UserBlockData userBlockData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator1.id;
            }
            if ((i & 4) != 0) {
                str3 = creator1.name;
            }
            if ((i & 8) != 0) {
                str4 = creator1.imageId;
            }
            if ((i & 16) != 0) {
                membership = creator1.membership;
            }
            if ((i & 32) != 0) {
                viewerEdge = creator1.viewerEdge;
            }
            if ((i & 64) != 0) {
                verifications = creator1.verifications;
            }
            if ((i & 128) != 0) {
                list = creator1.pronouns;
            }
            if ((i & 256) != 0) {
                userBlockData = creator1.userBlockData;
            }
            List list2 = list;
            UserBlockData userBlockData2 = userBlockData;
            ViewerEdge viewerEdge2 = viewerEdge;
            Verifications verifications2 = verifications;
            Membership membership2 = membership;
            String str5 = str3;
            return creator1.copy(str, str2, str5, str4, membership2, viewerEdge2, verifications2, list2, userBlockData2);
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

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Membership getMembership() {
            return this.membership;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final List<String> component8() {
            return this.pronouns;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final Creator1 copy(String __typename, String id, String name, String imageId, Membership membership, ViewerEdge viewerEdge, Verifications verifications, List<String> pronouns, UserBlockData userBlockData) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            pronouns.getClass();
            userBlockData.getClass();
            return new Creator1(__typename, id, name, imageId, membership, viewerEdge, verifications, pronouns, userBlockData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator1)) {
                return false;
            }
            Creator1 creator1 = (Creator1) other;
            return g76.L(this.__typename, creator1.__typename) && g76.L(this.id, creator1.id) && g76.L(this.name, creator1.name) && g76.L(this.imageId, creator1.imageId) && g76.L(this.membership, creator1.membership) && g76.L(this.viewerEdge, creator1.viewerEdge) && g76.L(this.verifications, creator1.verifications) && g76.L(this.pronouns, creator1.pronouns) && g76.L(this.userBlockData, creator1.userBlockData);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final Membership getMembership() {
            return this.membership;
        }

        public final String getName() {
            return this.name;
        }

        public final List<String> getPronouns() {
            return this.pronouns;
        }

        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            Membership membership = this.membership;
            int iHashCode3 = (this.viewerEdge.hashCode() + ((iHashCode2 + (membership == null ? 0 : membership.hashCode())) * 31)) * 31;
            Verifications verifications = this.verifications;
            return this.userBlockData.hashCode() + wgd.p((iHashCode3 + (verifications != null ? verifications.hashCode() : 0)) * 31, 31, this.pronouns);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.imageId;
            Membership membership = this.membership;
            ViewerEdge viewerEdge = this.viewerEdge;
            Verifications verifications = this.verifications;
            List<String> list = this.pronouns;
            UserBlockData userBlockData = this.userBlockData;
            StringBuilder sbU = y30.u("Creator1(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", imageId=", str4, ", membership=");
            sbU.append(membership);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(", verifications=");
            sbU.append(verifications);
            sbU.append(", pronouns=");
            sbU.append(list);
            sbU.append(", userBlockData=");
            sbU.append(userBlockData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToCatalogResult;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/fragment/ResponseItemData$OnCatalog;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$OnCatalog;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/fragment/ResponseItemData$OnCatalog;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToCatalogResult {
        private final String __typename;
        private final OnCatalog onCatalog;

        public InResponseToCatalogResult(String str, OnCatalog onCatalog) {
            str.getClass();
            this.__typename = str;
            this.onCatalog = onCatalog;
        }

        public static /* synthetic */ InResponseToCatalogResult copy$default(InResponseToCatalogResult inResponseToCatalogResult, String str, OnCatalog onCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToCatalogResult.__typename;
            }
            if ((i & 2) != 0) {
                onCatalog = inResponseToCatalogResult.onCatalog;
            }
            return inResponseToCatalogResult.copy(str, onCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final InResponseToCatalogResult copy(String __typename, OnCatalog onCatalog) {
            __typename.getClass();
            return new InResponseToCatalogResult(__typename, onCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToCatalogResult)) {
                return false;
            }
            InResponseToCatalogResult inResponseToCatalogResult = (InResponseToCatalogResult) other;
            return g76.L(this.__typename, inResponseToCatalogResult.__typename) && g76.L(this.onCatalog, inResponseToCatalogResult.onCatalog);
        }

        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnCatalog onCatalog = this.onCatalog;
            return iHashCode + (onCatalog == null ? 0 : onCatalog.hashCode());
        }

        public final String toString() {
            return "InResponseToCatalogResult(__typename=" + this.__typename + ", onCatalog=" + this.onCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToMediaResource;", "", "__typename", "", "id", "onMediaResource", "Lcom/medium/android/graphql/fragment/ResponseItemData$OnMediaResource;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$OnMediaResource;)V", "get__typename", "()Ljava/lang/String;", "getId", "getOnMediaResource", "()Lcom/medium/android/graphql/fragment/ResponseItemData$OnMediaResource;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToMediaResource {
        private final String __typename;
        private final String id;
        private final OnMediaResource onMediaResource;

        public InResponseToMediaResource(String str, String str2, OnMediaResource onMediaResource) {
            str.getClass();
            str2.getClass();
            onMediaResource.getClass();
            this.__typename = str;
            this.id = str2;
            this.onMediaResource = onMediaResource;
        }

        public static /* synthetic */ InResponseToMediaResource copy$default(InResponseToMediaResource inResponseToMediaResource, String str, String str2, OnMediaResource onMediaResource, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToMediaResource.__typename;
            }
            if ((i & 2) != 0) {
                str2 = inResponseToMediaResource.id;
            }
            if ((i & 4) != 0) {
                onMediaResource = inResponseToMediaResource.onMediaResource;
            }
            return inResponseToMediaResource.copy(str, str2, onMediaResource);
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
        public final OnMediaResource getOnMediaResource() {
            return this.onMediaResource;
        }

        public final InResponseToMediaResource copy(String __typename, String id, OnMediaResource onMediaResource) {
            __typename.getClass();
            id.getClass();
            onMediaResource.getClass();
            return new InResponseToMediaResource(__typename, id, onMediaResource);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToMediaResource)) {
                return false;
            }
            InResponseToMediaResource inResponseToMediaResource = (InResponseToMediaResource) other;
            return g76.L(this.__typename, inResponseToMediaResource.__typename) && g76.L(this.id, inResponseToMediaResource.id) && g76.L(this.onMediaResource, inResponseToMediaResource.onMediaResource);
        }

        public final String getId() {
            return this.id;
        }

        public final OnMediaResource getOnMediaResource() {
            return this.onMediaResource;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onMediaResource.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            OnMediaResource onMediaResource = this.onMediaResource;
            StringBuilder sbU = y30.u("InResponseToMediaResource(__typename=", str, ", id=", str2, ", onMediaResource=");
            sbU.append(onMediaResource);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$InResponseToPostResult;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/fragment/ResponseItemData$OnPost;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$OnPost;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/fragment/ResponseItemData$OnPost;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InResponseToPostResult {
        private final String __typename;
        private final OnPost onPost;

        public InResponseToPostResult(String str, OnPost onPost) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
        }

        public static /* synthetic */ InResponseToPostResult copy$default(InResponseToPostResult inResponseToPostResult, String str, OnPost onPost, int i, Object obj) {
            if ((i & 1) != 0) {
                str = inResponseToPostResult.__typename;
            }
            if ((i & 2) != 0) {
                onPost = inResponseToPostResult.onPost;
            }
            return inResponseToPostResult.copy(str, onPost);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final InResponseToPostResult copy(String __typename, OnPost onPost) {
            __typename.getClass();
            return new InResponseToPostResult(__typename, onPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InResponseToPostResult)) {
                return false;
            }
            InResponseToPostResult inResponseToPostResult = (InResponseToPostResult) other;
            return g76.L(this.__typename, inResponseToPostResult.__typename) && g76.L(this.onPost, inResponseToPostResult.onPost);
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost onPost = this.onPost;
            return iHashCode + (onPost == null ? 0 : onPost.hashCode());
        }

        public final String toString() {
            return "InResponseToPostResult(__typename=" + this.__typename + ", onPost=" + this.onPost + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Markup;", "", "__typename", "", "markupData", "Lcom/medium/android/graphql/fragment/MarkupData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MarkupData;)V", "get__typename", "()Ljava/lang/String;", "getMarkupData", "()Lcom/medium/android/graphql/fragment/MarkupData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Markup {
        private final String __typename;
        private final MarkupData markupData;

        public Markup(String str, MarkupData markupData) {
            str.getClass();
            markupData.getClass();
            this.__typename = str;
            this.markupData = markupData;
        }

        public static /* synthetic */ Markup copy$default(Markup markup, String str, MarkupData markupData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = markup.__typename;
            }
            if ((i & 2) != 0) {
                markupData = markup.markupData;
            }
            return markup.copy(str, markupData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MarkupData getMarkupData() {
            return this.markupData;
        }

        public final Markup copy(String __typename, MarkupData markupData) {
            __typename.getClass();
            markupData.getClass();
            return new Markup(__typename, markupData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Markup)) {
                return false;
            }
            Markup markup = (Markup) other;
            return g76.L(this.__typename, markup.__typename) && g76.L(this.markupData, markup.markupData);
        }

        public final MarkupData getMarkupData() {
            return this.markupData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.markupData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Markup(__typename=" + this.__typename + ", markupData=" + this.markupData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$MediumQuote;", "", "__typename", "", "id", "highlightData", "Lcom/medium/android/graphql/fragment/HighlightData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHighlightData", "()Lcom/medium/android/graphql/fragment/HighlightData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MediumQuote {
        private final String __typename;
        private final HighlightData highlightData;
        private final String id;

        public MediumQuote(String str, String str2, HighlightData highlightData) {
            str.getClass();
            str2.getClass();
            highlightData.getClass();
            this.__typename = str;
            this.id = str2;
            this.highlightData = highlightData;
        }

        public static /* synthetic */ MediumQuote copy$default(MediumQuote mediumQuote, String str, String str2, HighlightData highlightData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mediumQuote.__typename;
            }
            if ((i & 2) != 0) {
                str2 = mediumQuote.id;
            }
            if ((i & 4) != 0) {
                highlightData = mediumQuote.highlightData;
            }
            return mediumQuote.copy(str, str2, highlightData);
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
        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final MediumQuote copy(String __typename, String id, HighlightData highlightData) {
            __typename.getClass();
            id.getClass();
            highlightData.getClass();
            return new MediumQuote(__typename, id, highlightData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MediumQuote)) {
                return false;
            }
            MediumQuote mediumQuote = (MediumQuote) other;
            return g76.L(this.__typename, mediumQuote.__typename) && g76.L(this.id, mediumQuote.id) && g76.L(this.highlightData, mediumQuote.highlightData);
        }

        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            HighlightData highlightData = this.highlightData;
            StringBuilder sbU = y30.u("MediumQuote(__typename=", str, ", id=", str2, ", highlightData=");
            sbU.append(highlightData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Membership {
        private final String __typename;
        private final MembershipFragment membershipFragment;

        public Membership(String str, MembershipFragment membershipFragment) {
            str.getClass();
            membershipFragment.getClass();
            this.__typename = str;
            this.membershipFragment = membershipFragment;
        }

        public static /* synthetic */ Membership copy$default(Membership membership, String str, MembershipFragment membershipFragment, int i, Object obj) {
            if ((i & 1) != 0) {
                str = membership.__typename;
            }
            if ((i & 2) != 0) {
                membershipFragment = membership.membershipFragment;
            }
            return membership.copy(str, membershipFragment);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final Membership copy(String __typename, MembershipFragment membershipFragment) {
            __typename.getClass();
            membershipFragment.getClass();
            return new Membership(__typename, membershipFragment);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Membership)) {
                return false;
            }
            Membership membership = (Membership) other;
            return g76.L(this.__typename, membership.__typename) && g76.L(this.membershipFragment, membership.membershipFragment);
        }

        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.membershipFragment.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Membership(__typename=" + this.__typename + ", membershipFragment=" + this.membershipFragment + uvlZTF.fIMxYJEDZaVBjE;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$OnCatalog;", "", "id", "", "<init>", "(Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final String id;

        public OnCatalog(String str) {
            str.getClass();
            this.id = str;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onCatalog.id;
            }
            return onCatalog.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnCatalog copy(String id) {
            id.getClass();
            return new OnCatalog(id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnCatalog) && g76.L(this.id, ((OnCatalog) other).id);
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode();
        }

        public final String toString() {
            return ev6.x("OnCatalog(id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$OnMediaResource;", "", "mediumQuote", "Lcom/medium/android/graphql/fragment/ResponseItemData$MediumQuote;", "<init>", "(Lcom/medium/android/graphql/fragment/ResponseItemData$MediumQuote;)V", "getMediumQuote", "()Lcom/medium/android/graphql/fragment/ResponseItemData$MediumQuote;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMediaResource {
        private final MediumQuote mediumQuote;

        public OnMediaResource(MediumQuote mediumQuote) {
            this.mediumQuote = mediumQuote;
        }

        public static OnMediaResource copy$default(OnMediaResource onMediaResource, MediumQuote mediumQuote, int i, Object obj) {
            if ((i & 1) != 0) {
                mediumQuote = onMediaResource.mediumQuote;
            }
            onMediaResource.getClass();
            return new OnMediaResource(mediumQuote);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        public final OnMediaResource copy(MediumQuote mediumQuote) {
            return new OnMediaResource(mediumQuote);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMediaResource) && g76.L(this.mediumQuote, ((OnMediaResource) other).mediumQuote);
        }

        public final MediumQuote getMediumQuote() {
            return this.mediumQuote;
        }

        public final int hashCode() {
            MediumQuote mediumQuote = this.mediumQuote;
            if (mediumQuote == null) {
                return 0;
            }
            return mediumQuote.hashCode();
        }

        public final String toString() {
            return "OnMediaResource(mediumQuote=" + this.mediumQuote + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$OnPost;", "", "id", "", "<init>", "(Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final String id;

        public OnPost(String str) {
            str.getClass();
            this.id = str;
        }

        public static /* synthetic */ OnPost copy$default(OnPost onPost, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPost.id;
            }
            return onPost.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnPost copy(String id) {
            id.getClass();
            return new OnPost(id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPost) && g76.L(this.id, ((OnPost) other).id);
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode();
        }

        public final String toString() {
            return ev6.x("OnPost(id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\n0\tHÆ\u0003JE\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006!"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Paragraph;", "", "__typename", "", "id", "text", "type", "Lcom/medium/android/graphql/type/ParagraphType;", "markups", "", "Lcom/medium/android/graphql/fragment/ResponseItemData$Markup;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/ParagraphType;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getId", "getText", "getType", "()Lcom/medium/android/graphql/type/ParagraphType;", "getMarkups", "()Ljava/util/List;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paragraph {
        private final String __typename;
        private final String id;
        private final List<Markup> markups;
        private final String text;
        private final ParagraphType type;

        public Paragraph(String str, String str2, String str3, ParagraphType paragraphType, List<Markup> list) {
            str.getClass();
            str2.getClass();
            list.getClass();
            this.__typename = str;
            this.id = str2;
            this.text = str3;
            this.type = paragraphType;
            this.markups = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Paragraph copy$default(Paragraph paragraph, String str, String str2, String str3, ParagraphType paragraphType, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paragraph.__typename;
            }
            if ((i & 2) != 0) {
                str2 = paragraph.id;
            }
            if ((i & 4) != 0) {
                str3 = paragraph.text;
            }
            if ((i & 8) != 0) {
                paragraphType = paragraph.type;
            }
            if ((i & 16) != 0) {
                list = paragraph.markups;
            }
            List list2 = list;
            String str4 = str3;
            return paragraph.copy(str, str2, str4, paragraphType, list2);
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
        public final String getText() {
            return this.text;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final ParagraphType getType() {
            return this.type;
        }

        public final List<Markup> component5() {
            return this.markups;
        }

        public final Paragraph copy(String __typename, String id, String text, ParagraphType type, List<Markup> markups) {
            __typename.getClass();
            id.getClass();
            markups.getClass();
            return new Paragraph(__typename, id, text, type, markups);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paragraph)) {
                return false;
            }
            Paragraph paragraph = (Paragraph) other;
            return g76.L(this.__typename, paragraph.__typename) && g76.L(this.id, paragraph.id) && g76.L(this.text, paragraph.text) && this.type == paragraph.type && g76.L(this.markups, paragraph.markups);
        }

        public final String getId() {
            return this.id;
        }

        public final List<Markup> getMarkups() {
            return this.markups;
        }

        public final String getText() {
            return this.text;
        }

        public final ParagraphType getType() {
            return this.type;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.text;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            ParagraphType paragraphType = this.type;
            return this.markups.hashCode() + ((iHashCode + (paragraphType != null ? paragraphType.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.text;
            ParagraphType paragraphType = this.type;
            List<Markup> list = this.markups;
            StringBuilder sbU = y30.u("Paragraph(__typename=", str, ", id=", str2, ", text=");
            sbU.append(str3);
            sbU.append(", type=");
            sbU.append(paragraphType);
            sbU.append(", markups=");
            return b09.B(sbU, list, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0006HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Post;", "", "__typename", "", "id", "creator", "Lcom/medium/android/graphql/fragment/ResponseItemData$Creator;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseItemData$Creator;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreator", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Creator;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final Creator creator;
        private final String id;

        public Post(String str, String str2, Creator creator) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.creator = creator;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, Creator creator, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                creator = post.creator;
            }
            return post.copy(str, str2, creator);
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
        public final Creator getCreator() {
            return this.creator;
        }

        public final Post copy(String __typename, String id, Creator creator) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id, creator);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.creator, post.creator);
        }

        public final Creator getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Creator creator = this.creator;
            return iO + (creator == null ? 0 : creator.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Creator creator = this.creator;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", creator=");
            sbU.append(creator);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003J0\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0015J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;", "", "__typename", "", "responseDepth", "", "post", "Lcom/medium/android/graphql/fragment/ResponseItemData$Post;", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/ResponseItemData$Post;)V", "get__typename", "()Ljava/lang/String;", "getResponseDepth", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getPost", "()Lcom/medium/android/graphql/fragment/ResponseItemData$Post;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/ResponseItemData$Post;)Lcom/medium/android/graphql/fragment/ResponseItemData$ResponseRootPost;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ResponseRootPost {
        private final String __typename;
        private final Post post;
        private final Integer responseDepth;

        public ResponseRootPost(String str, Integer num, Post post) {
            str.getClass();
            this.__typename = str;
            this.responseDepth = num;
            this.post = post;
        }

        public static /* synthetic */ ResponseRootPost copy$default(ResponseRootPost responseRootPost, String str, Integer num, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                str = responseRootPost.__typename;
            }
            if ((i & 2) != 0) {
                num = responseRootPost.responseDepth;
            }
            if ((i & 4) != 0) {
                post = responseRootPost.post;
            }
            return responseRootPost.copy(str, num, post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getResponseDepth() {
            return this.responseDepth;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final ResponseRootPost copy(String __typename, Integer responseDepth, Post post) {
            __typename.getClass();
            return new ResponseRootPost(__typename, responseDepth, post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ResponseRootPost)) {
                return false;
            }
            ResponseRootPost responseRootPost = (ResponseRootPost) other;
            return g76.L(this.__typename, responseRootPost.__typename) && g76.L(this.responseDepth, responseRootPost.responseDepth) && g76.L(this.post, responseRootPost.post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final Integer getResponseDepth() {
            return this.responseDepth;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.responseDepth;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Post post = this.post;
            return iHashCode2 + (post != null ? post.hashCode() : 0);
        }

        public final String toString() {
            return "ResponseRootPost(__typename=" + this.__typename + ", responseDepth=" + this.responseDepth + ", post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Verifications {
        private final String __typename;
        private final boolean isBookAuthor;

        public Verifications(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.isBookAuthor = z;
        }

        public static /* synthetic */ Verifications copy$default(Verifications verifications, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = verifications.__typename;
            }
            if ((i & 2) != 0) {
                z = verifications.isBookAuthor;
            }
            return verifications.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsBookAuthor() {
            return this.isBookAuthor;
        }

        public final Verifications copy(String __typename, boolean isBookAuthor) {
            __typename.getClass();
            return new Verifications(__typename, isBookAuthor);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Verifications)) {
                return false;
            }
            Verifications verifications = (Verifications) other;
            return g76.L(this.__typename, verifications.__typename) && this.isBookAuthor == verifications.isBookAuthor;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.isBookAuthor ? 1231 : 1237);
        }

        public final boolean isBookAuthor() {
            return this.isBookAuthor;
        }

        public final String toString() {
            return km4.z("Verifications(__typename=", this.__typename, ", isBookAuthor=", ")", this.isBookAuthor);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseItemData$ViewerEdge;", "", "__typename", "", "isUser", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isUser = z;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isUser;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, z, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsUser() {
            return this.isUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isUser, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isUser, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isUser == viewerEdge.isUser && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((this.__typename.hashCode() * 31) + (this.isUser ? 1231 : 1237)) * 31);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isUser;
            return ka1.v(ev6.D("ViewerEdge(__typename=", str, ", isUser=", ", id=", z), this.id, ")");
        }
    }

    public ResponseItemData(String str, String str2, ResponseRootPost responseRootPost, InResponseToPostResult inResponseToPostResult, InResponseToCatalogResult inResponseToCatalogResult, Creator1 creator1, Long l, Long l2, InResponseToMediaResource inResponseToMediaResource, Content content, Integer num, PostClapsData postClapsData, ResponseCountData responseCountData) {
        str.getClass();
        str2.getClass();
        content.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        this.__typename = str;
        this.id = str2;
        this.responseRootPost = responseRootPost;
        this.inResponseToPostResult = inResponseToPostResult;
        this.inResponseToCatalogResult = inResponseToCatalogResult;
        this.creator = creator1;
        this.firstPublishedAt = l;
        this.latestPublishedAt = l2;
        this.inResponseToMediaResource = inResponseToMediaResource;
        this.content = content;
        this.latestRev = num;
        this.postClapsData = postClapsData;
        this.responseCountData = responseCountData;
    }

    public static /* synthetic */ ResponseItemData copy$default(ResponseItemData responseItemData, String str, String str2, ResponseRootPost responseRootPost, InResponseToPostResult inResponseToPostResult, InResponseToCatalogResult inResponseToCatalogResult, Creator1 creator1, Long l, Long l2, InResponseToMediaResource inResponseToMediaResource, Content content, Integer num, PostClapsData postClapsData, ResponseCountData responseCountData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = responseItemData.__typename;
        }
        return responseItemData.copy(str, (i & 2) != 0 ? responseItemData.id : str2, (i & 4) != 0 ? responseItemData.responseRootPost : responseRootPost, (i & 8) != 0 ? responseItemData.inResponseToPostResult : inResponseToPostResult, (i & 16) != 0 ? responseItemData.inResponseToCatalogResult : inResponseToCatalogResult, (i & 32) != 0 ? responseItemData.creator : creator1, (i & 64) != 0 ? responseItemData.firstPublishedAt : l, (i & 128) != 0 ? responseItemData.latestPublishedAt : l2, (i & 256) != 0 ? responseItemData.inResponseToMediaResource : inResponseToMediaResource, (i & 512) != 0 ? responseItemData.content : content, (i & 1024) != 0 ? responseItemData.latestRev : num, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? responseItemData.postClapsData : postClapsData, (i & 4096) != 0 ? responseItemData.responseCountData : responseCountData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final Content getContent() {
        return this.content;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Integer getLatestRev() {
        return this.latestRev;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final ResponseRootPost getResponseRootPost() {
        return this.responseRootPost;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final InResponseToPostResult getInResponseToPostResult() {
        return this.inResponseToPostResult;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final InResponseToCatalogResult getInResponseToCatalogResult() {
        return this.inResponseToCatalogResult;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Creator1 getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final Long getLatestPublishedAt() {
        return this.latestPublishedAt;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final InResponseToMediaResource getInResponseToMediaResource() {
        return this.inResponseToMediaResource;
    }

    public final ResponseItemData copy(String __typename, String id, ResponseRootPost responseRootPost, InResponseToPostResult inResponseToPostResult, InResponseToCatalogResult inResponseToCatalogResult, Creator1 creator, Long firstPublishedAt, Long latestPublishedAt, InResponseToMediaResource inResponseToMediaResource, Content content, Integer latestRev, PostClapsData postClapsData, ResponseCountData responseCountData) {
        __typename.getClass();
        id.getClass();
        content.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        return new ResponseItemData(__typename, id, responseRootPost, inResponseToPostResult, inResponseToCatalogResult, creator, firstPublishedAt, latestPublishedAt, inResponseToMediaResource, content, latestRev, postClapsData, responseCountData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResponseItemData)) {
            return false;
        }
        ResponseItemData responseItemData = (ResponseItemData) other;
        return g76.L(this.__typename, responseItemData.__typename) && g76.L(this.id, responseItemData.id) && g76.L(this.responseRootPost, responseItemData.responseRootPost) && g76.L(this.inResponseToPostResult, responseItemData.inResponseToPostResult) && g76.L(this.inResponseToCatalogResult, responseItemData.inResponseToCatalogResult) && g76.L(this.creator, responseItemData.creator) && g76.L(this.firstPublishedAt, responseItemData.firstPublishedAt) && g76.L(this.latestPublishedAt, responseItemData.latestPublishedAt) && g76.L(this.inResponseToMediaResource, responseItemData.inResponseToMediaResource) && g76.L(this.content, responseItemData.content) && g76.L(this.latestRev, responseItemData.latestRev) && g76.L(this.postClapsData, responseItemData.postClapsData) && g76.L(this.responseCountData, responseItemData.responseCountData);
    }

    public final Content getContent() {
        return this.content;
    }

    public final Creator1 getCreator() {
        return this.creator;
    }

    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    public final String getId() {
        return this.id;
    }

    public final InResponseToCatalogResult getInResponseToCatalogResult() {
        return this.inResponseToCatalogResult;
    }

    public final InResponseToMediaResource getInResponseToMediaResource() {
        return this.inResponseToMediaResource;
    }

    public final InResponseToPostResult getInResponseToPostResult() {
        return this.inResponseToPostResult;
    }

    public final Long getLatestPublishedAt() {
        return this.latestPublishedAt;
    }

    public final Integer getLatestRev() {
        return this.latestRev;
    }

    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    public final ResponseRootPost getResponseRootPost() {
        return this.responseRootPost;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        ResponseRootPost responseRootPost = this.responseRootPost;
        int iHashCode = (iO + (responseRootPost == null ? 0 : responseRootPost.hashCode())) * 31;
        InResponseToPostResult inResponseToPostResult = this.inResponseToPostResult;
        int iHashCode2 = (iHashCode + (inResponseToPostResult == null ? 0 : inResponseToPostResult.hashCode())) * 31;
        InResponseToCatalogResult inResponseToCatalogResult = this.inResponseToCatalogResult;
        int iHashCode3 = (iHashCode2 + (inResponseToCatalogResult == null ? 0 : inResponseToCatalogResult.hashCode())) * 31;
        Creator1 creator1 = this.creator;
        int iHashCode4 = (iHashCode3 + (creator1 == null ? 0 : creator1.hashCode())) * 31;
        Long l = this.firstPublishedAt;
        int iHashCode5 = (iHashCode4 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.latestPublishedAt;
        int iHashCode6 = (iHashCode5 + (l2 == null ? 0 : l2.hashCode())) * 31;
        InResponseToMediaResource inResponseToMediaResource = this.inResponseToMediaResource;
        int iHashCode7 = (this.content.hashCode() + ((iHashCode6 + (inResponseToMediaResource == null ? 0 : inResponseToMediaResource.hashCode())) * 31)) * 31;
        Integer num = this.latestRev;
        int iHashCode8 = num != null ? num.hashCode() : 0;
        return this.responseCountData.hashCode() + ((this.postClapsData.hashCode() + ((iHashCode7 + iHashCode8) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        ResponseRootPost responseRootPost = this.responseRootPost;
        InResponseToPostResult inResponseToPostResult = this.inResponseToPostResult;
        InResponseToCatalogResult inResponseToCatalogResult = this.inResponseToCatalogResult;
        Creator1 creator1 = this.creator;
        Long l = this.firstPublishedAt;
        Long l2 = this.latestPublishedAt;
        InResponseToMediaResource inResponseToMediaResource = this.inResponseToMediaResource;
        Content content = this.content;
        Integer num = this.latestRev;
        PostClapsData postClapsData = this.postClapsData;
        ResponseCountData responseCountData = this.responseCountData;
        StringBuilder sbU = y30.u("ResponseItemData(__typename=", str, ", id=", str2, ", responseRootPost=");
        sbU.append(responseRootPost);
        sbU.append(", inResponseToPostResult=");
        sbU.append(inResponseToPostResult);
        sbU.append(", inResponseToCatalogResult=");
        sbU.append(inResponseToCatalogResult);
        sbU.append(", creator=");
        sbU.append(creator1);
        sbU.append(", firstPublishedAt=");
        sbU.append(l);
        sbU.append(", latestPublishedAt=");
        sbU.append(l2);
        sbU.append(", inResponseToMediaResource=");
        sbU.append(inResponseToMediaResource);
        sbU.append(", content=");
        sbU.append(content);
        sbU.append(", latestRev=");
        sbU.append(num);
        sbU.append(", postClapsData=");
        sbU.append(postClapsData);
        sbU.append(", responseCountData=");
        sbU.append(responseCountData);
        sbU.append(")");
        return sbU.toString();
    }
}
