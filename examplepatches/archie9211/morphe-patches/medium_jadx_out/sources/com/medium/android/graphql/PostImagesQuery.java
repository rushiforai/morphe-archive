package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PostImagesQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PostImagesQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.selections.PostImagesQuerySelections;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@kotlin.Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007/01234.B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ,\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u00065"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery;", "Luqa;", "Lcom/medium/android/graphql/PostImagesQuery$Data;", "", "postId", "Lzv8;", "Lcom/medium/android/graphql/type/PostMeteringOptions;", "postMeteringOptions", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/PostImagesQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Lzv8;", "getPostMeteringOptions", "Companion", "Data", "Post", "Content", "BodyModel", "Paragraph", "Metadata", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostImagesQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "6877f53506a1535a1254e29d38f096d19c8c1f8adb29e00eeaf5825aba0dacaa";
    public static final String OPERATION_NAME = "PostImagesQuery";
    private final String postId;
    private final zv8 postMeteringOptions;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$BodyModel;", "", "__typename", "", "paragraphs", "", "Lcom/medium/android/graphql/PostImagesQuery$Paragraph;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getParagraphs", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return ka1.s("BodyModel(__typename=", this.__typename, AEVqIoD.PaAeDSaTKa, ")", this.paragraphs);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Content;", "", "__typename", "", "bodyModel", "Lcom/medium/android/graphql/PostImagesQuery$BodyModel;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PostImagesQuery$BodyModel;)V", "get__typename", "()Ljava/lang/String;", "getBodyModel", "()Lcom/medium/android/graphql/PostImagesQuery$BodyModel;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @kotlin.Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PostImagesQuery$Post;", "post", "<init>", "(Lcom/medium/android/graphql/PostImagesQuery$Post;)V", "component1", "()Lcom/medium/android/graphql/PostImagesQuery$Post;", "copy", "(Lcom/medium/android/graphql/PostImagesQuery$Post;)Lcom/medium/android/graphql/PostImagesQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PostImagesQuery$Post;", "getPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Post post;

        public Data(Post post) {
            this.post = post;
        }

        public static Data copy$default(Data data, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                post = data.post;
            }
            data.getClass();
            return new Data(post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Data copy(Post post) {
            return new Data(post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.post, ((Data) other).post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final int hashCode() {
            Post post = this.post;
            if (post == null) {
                return 0;
            }
            return post.hashCode();
        }

        public final String toString() {
            return "Data(post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Metadata;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Metadata {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public Metadata(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ Metadata copy$default(Metadata metadata, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = metadata.__typename;
            }
            if ((i & 2) != 0) {
                str2 = metadata.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = metadata.imageMetadataData;
            }
            return metadata.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final Metadata copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new Metadata(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Metadata)) {
                return false;
            }
            Metadata metadata = (Metadata) other;
            return g76.L(this.__typename, metadata.__typename) && g76.L(this.id, metadata.id) && g76.L(this.imageMetadataData, metadata.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("Metadata(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Paragraph;", "", "__typename", "", "type", "Lcom/medium/android/graphql/type/ParagraphType;", "metadata", "Lcom/medium/android/graphql/PostImagesQuery$Metadata;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/ParagraphType;Lcom/medium/android/graphql/PostImagesQuery$Metadata;)V", "get__typename", "()Ljava/lang/String;", "getType", "()Lcom/medium/android/graphql/type/ParagraphType;", "getMetadata", "()Lcom/medium/android/graphql/PostImagesQuery$Metadata;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paragraph {
        private final String __typename;
        private final Metadata metadata;
        private final ParagraphType type;

        public Paragraph(String str, ParagraphType paragraphType, Metadata metadata) {
            str.getClass();
            this.__typename = str;
            this.type = paragraphType;
            this.metadata = metadata;
        }

        public static /* synthetic */ Paragraph copy$default(Paragraph paragraph, String str, ParagraphType paragraphType, Metadata metadata, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paragraph.__typename;
            }
            if ((i & 2) != 0) {
                paragraphType = paragraph.type;
            }
            if ((i & 4) != 0) {
                metadata = paragraph.metadata;
            }
            return paragraph.copy(str, paragraphType, metadata);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ParagraphType getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Metadata getMetadata() {
            return this.metadata;
        }

        public final Paragraph copy(String __typename, ParagraphType type, Metadata metadata) {
            __typename.getClass();
            return new Paragraph(__typename, type, metadata);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paragraph)) {
                return false;
            }
            Paragraph paragraph = (Paragraph) other;
            return g76.L(this.__typename, paragraph.__typename) && this.type == paragraph.type && g76.L(this.metadata, paragraph.metadata);
        }

        public final Metadata getMetadata() {
            return this.metadata;
        }

        public final ParagraphType getType() {
            return this.type;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ParagraphType paragraphType = this.type;
            int iHashCode2 = (iHashCode + (paragraphType == null ? 0 : paragraphType.hashCode())) * 31;
            Metadata metadata = this.metadata;
            return iHashCode2 + (metadata != null ? metadata.hashCode() : 0);
        }

        public final String toString() {
            return "Paragraph(__typename=" + this.__typename + ", type=" + this.type + ", metadata=" + this.metadata + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Post;", "", "__typename", "", "content", "Lcom/medium/android/graphql/PostImagesQuery$Content;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PostImagesQuery$Content;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getContent", "()Lcom/medium/android/graphql/PostImagesQuery$Content;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final Content content;
        private final String id;

        public Post(String str, Content content, String str2) {
            str.getClass();
            content.getClass();
            str2.getClass();
            this.__typename = str;
            this.content = content;
            this.id = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, Content content, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                content = post.content;
            }
            if ((i & 4) != 0) {
                str2 = post.id;
            }
            return post.copy(str, content, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Content getContent() {
            return this.content;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Post copy(String __typename, Content content, String id) {
            __typename.getClass();
            content.getClass();
            id.getClass();
            return new Post(__typename, content, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.content, post.content) && g76.L(this.id, post.id);
        }

        public final Content getContent() {
            return this.content;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.content.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Content content = this.content;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Post(__typename=");
            sb.append(str);
            sb.append(", content=");
            sb.append(content);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public PostImagesQuery(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.postId = str;
        this.postMeteringOptions = zv8Var;
    }

    public static /* synthetic */ PostImagesQuery copy$default(PostImagesQuery postImagesQuery, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postImagesQuery.postId;
        }
        if ((i & 2) != 0) {
            zv8Var = postImagesQuery.postMeteringOptions;
        }
        return postImagesQuery.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PostImagesQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final PostImagesQuery copy(String postId, zv8 postMeteringOptions) {
        postId.getClass();
        postMeteringOptions.getClass();
        return new PostImagesQuery(postId, postMeteringOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PostImagesQuery($postId: ID!, $postMeteringOptions: PostMeteringOptions) { post(id: $postId) { __typename content(postMeteringOptions: $postMeteringOptions) { __typename bodyModel { __typename paragraphs { __typename type metadata { __typename ...ImageMetadataData id } } } } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostImagesQuery)) {
            return false;
        }
        PostImagesQuery postImagesQuery = (PostImagesQuery) other;
        return g76.L(this.postId, postImagesQuery.postId) && g76.L(this.postMeteringOptions, postImagesQuery.postMeteringOptions);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final zv8 getPostMeteringOptions() {
        return this.postMeteringOptions;
    }

    public final int hashCode() {
        return this.postMeteringOptions.hashCode() + (this.postId.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = PostImagesQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PostImagesQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PostImagesQuery(postId=" + this.postId + ", postMeteringOptions=" + this.postMeteringOptions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @kotlin.Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PostImagesQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PostImagesQuery($postId: ID!, $postMeteringOptions: PostMeteringOptions) { post(id: $postId) { __typename content(postMeteringOptions: $postMeteringOptions) { __typename bodyModel { __typename paragraphs { __typename type metadata { __typename ...ImageMetadataData id } } } } id } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ PostImagesQuery(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
