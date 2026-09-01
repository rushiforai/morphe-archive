package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SetPostTopicsMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetPostTopicsMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.selections.SetPostTopicsMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004./0-B\u001d\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0016\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001e\u0010\nJ*\u0010\u001f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u001d\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010)\u001a\u0004\b*\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\n¨\u00061"}, d2 = {"Lcom/medium/android/graphql/SetPostTopicsMutation;", "Lv78;", "Lcom/medium/android/graphql/SetPostTopicsMutation$Data;", "", "", "topicsName", "postId", "<init>", "(Ljava/util/List;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Ljava/util/List;", "component2", "copy", "(Ljava/util/List;Ljava/lang/String;)Lcom/medium/android/graphql/SetPostTopicsMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/util/List;", "getTopicsName", "Ljava/lang/String;", "getPostId", "Companion", "Data", "SetPostTags", "Tag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostTopicsMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "f82cfd6b2e8ac936aa3eca7480a924d274150eadd41369f58112f9d28d32580b";
    public static final String OPERATION_NAME = "SetPostTopicsMutation";
    private final String postId;
    private final List<String> topicsName;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetPostTopicsMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;", "setPostTags", "<init>", "(Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;)V", "component1", "()Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;", "copy", "(Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;)Lcom/medium/android/graphql/SetPostTopicsMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;", "getSetPostTags", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostTags setPostTags;

        public Data(SetPostTags setPostTags) {
            this.setPostTags = setPostTags;
        }

        public static Data copy$default(Data data, SetPostTags setPostTags, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostTags = data.setPostTags;
            }
            data.getClass();
            return new Data(setPostTags);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostTags getSetPostTags() {
            return this.setPostTags;
        }

        public final Data copy(SetPostTags setPostTags) {
            return new Data(setPostTags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostTags, ((Data) other).setPostTags);
        }

        public final SetPostTags getSetPostTags() {
            return this.setPostTags;
        }

        public final int hashCode() {
            SetPostTags setPostTags = this.setPostTags;
            if (setPostTags == null) {
                return 0;
            }
            return setPostTags.hashCode();
        }

        public final String toString() {
            return "Data(setPostTags=" + this.setPostTags + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J/\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000b¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/SetPostTopicsMutation$SetPostTags;", "", "__typename", "", "tags", "", "Lcom/medium/android/graphql/SetPostTopicsMutation$Tag;", "id", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getTags", "()Ljava/util/List;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostTags {
        private final String __typename;
        private final String id;
        private final List<Tag> tags;

        public SetPostTags(String str, List<Tag> list, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.tags = list;
            this.id = str2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ SetPostTags copy$default(SetPostTags setPostTags, String str, List list, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostTags.__typename;
            }
            if ((i & 2) != 0) {
                list = setPostTags.tags;
            }
            if ((i & 4) != 0) {
                str2 = setPostTags.id;
            }
            return setPostTags.copy(str, list, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Tag> component2() {
            return this.tags;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final SetPostTags copy(String __typename, List<Tag> tags, String id) {
            __typename.getClass();
            id.getClass();
            return new SetPostTags(__typename, tags, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostTags)) {
                return false;
            }
            SetPostTags setPostTags = (SetPostTags) other;
            return g76.L(this.__typename, setPostTags.__typename) && g76.L(this.tags, setPostTags.tags) && g76.L(this.id, setPostTags.id);
        }

        public final String getId() {
            return this.id;
        }

        public final List<Tag> getTags() {
            return this.tags;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Tag> list = this.tags;
            return this.id.hashCode() + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            List<Tag> list = this.tags;
            return ka1.v(b09.E("SetPostTags(__typename=", str, ", tags=", ", id=", list), this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/SetPostTopicsMutation$Tag;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public Tag(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = tag.tagData;
            }
            return tag.copy(str, str2, tagData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TagData getTagData() {
            return this.tagData;
        }

        public final Tag copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new Tag(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug) && g76.L(this.tagData, tag.tagData);
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagData getTagData() {
            return this.tagData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tagData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.normalizedTagSlug;
            TagData tagData = this.tagData;
            StringBuilder sbU = y30.u("Tag(__typename=", str, ", normalizedTagSlug=", str2, ", tagData=");
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public SetPostTopicsMutation(List<String> list, String str) {
        list.getClass();
        str.getClass();
        this.topicsName = list;
        this.postId = str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SetPostTopicsMutation copy$default(SetPostTopicsMutation setPostTopicsMutation, List list, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            list = setPostTopicsMutation.topicsName;
        }
        if ((i & 2) != 0) {
            str = setPostTopicsMutation.postId;
        }
        return setPostTopicsMutation.copy(list, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetPostTopicsMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    public final List<String> component1() {
        return this.topicsName;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final SetPostTopicsMutation copy(List<String> topicsName, String postId) {
        topicsName.getClass();
        postId.getClass();
        return new SetPostTopicsMutation(topicsName, postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetPostTopicsMutation($topicsName: [String!]!, $postId: ID!) { setPostTags(tagNames: $topicsName, targetPostId: $postId) { __typename tags { __typename ...TagData normalizedTagSlug } id } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetPostTopicsMutation)) {
            return false;
        }
        SetPostTopicsMutation setPostTopicsMutation = (SetPostTopicsMutation) other;
        return g76.L(this.topicsName, setPostTopicsMutation.topicsName) && g76.L(this.postId, setPostTopicsMutation.postId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final List<String> getTopicsName() {
        return this.topicsName;
    }

    public final int hashCode() {
        return this.postId.hashCode() + (this.topicsName.hashCode() * 31);
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = SetPostTopicsMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetPostTopicsMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetPostTopicsMutation(topicsName=" + this.topicsName + ", postId=" + this.postId + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetPostTopicsMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetPostTopicsMutation($topicsName: [String!]!, $postId: ID!) { setPostTags(tagNames: $topicsName, targetPostId: $postId) { __typename tags { __typename ...TagData normalizedTagSlug } id } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
