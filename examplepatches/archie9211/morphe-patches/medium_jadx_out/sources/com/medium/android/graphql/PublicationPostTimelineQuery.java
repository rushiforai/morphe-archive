package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationPostTimelineQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationPostTimelineQuery_VariablesAdapter;
import com.medium.android.graphql.selections.PublicationPostTimelineQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005()*+'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationPostTimelineQuery$Data;", "", "publicationId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/PublicationPostTimelineQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "Companion", "Data", "Publication", "PostTimeline", "Year", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationPostTimelineQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "107f371f9e7e8220973840d0f575c08dbd57ad717614c52e377a856e08018678";
    public static final String OPERATION_NAME = "PublicationPostTimelineQuery";
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;", "publication", "<init>", "(Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;)V", "component1", "()Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;", "copy", "(Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;)Lcom/medium/android/graphql/PublicationPostTimelineQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;", "getPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Publication publication;

        public Data(Publication publication) {
            this.publication = publication;
        }

        public static Data copy$default(Data data, Publication publication, int i, Object obj) {
            if ((i & 1) != 0) {
                publication = data.publication;
            }
            data.getClass();
            return new Data(publication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        public final Data copy(Publication publication) {
            return new Data(publication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publication, ((Data) other).publication);
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final int hashCode() {
            Publication publication = this.publication;
            if (publication == null) {
                return 0;
            }
            return publication.hashCode();
        }

        public final String toString() {
            return "Data(publication=" + this.publication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery$PostTimeline;", "", "__typename", "", "years", "", "Lcom/medium/android/graphql/PublicationPostTimelineQuery$Year;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getYears", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostTimeline {
        private final String __typename;
        private final List<Year> years;

        public PostTimeline(String str, List<Year> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.years = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PostTimeline copy$default(PostTimeline postTimeline, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postTimeline.__typename;
            }
            if ((i & 2) != 0) {
                list = postTimeline.years;
            }
            return postTimeline.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Year> component2() {
            return this.years;
        }

        public final PostTimeline copy(String __typename, List<Year> years) {
            __typename.getClass();
            years.getClass();
            return new PostTimeline(__typename, years);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostTimeline)) {
                return false;
            }
            PostTimeline postTimeline = (PostTimeline) other;
            return g76.L(this.__typename, postTimeline.__typename) && g76.L(this.years, postTimeline.years);
        }

        public final List<Year> getYears() {
            return this.years;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.years.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("PostTimeline(__typename=", this.__typename, ", years=", ")", this.years);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery$Publication;", "", "__typename", "", "postTimeline", "Lcom/medium/android/graphql/PublicationPostTimelineQuery$PostTimeline;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationPostTimelineQuery$PostTimeline;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getPostTimeline", "()Lcom/medium/android/graphql/PublicationPostTimelineQuery$PostTimeline;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final String id;
        private final PostTimeline postTimeline;

        public Publication(String str, PostTimeline postTimeline, String str2) {
            str.getClass();
            postTimeline.getClass();
            str2.getClass();
            this.__typename = str;
            this.postTimeline = postTimeline;
            this.id = str2;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, PostTimeline postTimeline, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                postTimeline = publication.postTimeline;
            }
            if ((i & 4) != 0) {
                str2 = publication.id;
            }
            return publication.copy(str, postTimeline, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostTimeline getPostTimeline() {
            return this.postTimeline;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, PostTimeline postTimeline, String id) {
            __typename.getClass();
            postTimeline.getClass();
            id.getClass();
            return new Publication(__typename, postTimeline, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.postTimeline, publication.postTimeline) && g76.L(this.id, publication.id);
        }

        public final String getId() {
            return this.id;
        }

        public final PostTimeline getPostTimeline() {
            return this.postTimeline;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.postTimeline.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            PostTimeline postTimeline = this.postTimeline;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Publication(__typename=");
            sb.append(str);
            sb.append(", postTimeline=");
            sb.append(postTimeline);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery$Year;", "", "__typename", "", "year", "", "<init>", "(Ljava/lang/String;I)V", "get__typename", "()Ljava/lang/String;", "getYear", "()I", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Year {
        private final String __typename;
        private final int year;

        public Year(String str, int i) {
            str.getClass();
            this.__typename = str;
            this.year = i;
        }

        public static /* synthetic */ Year copy$default(Year year, String str, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                str = year.__typename;
            }
            if ((i2 & 2) != 0) {
                i = year.year;
            }
            return year.copy(str, i);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getYear() {
            return this.year;
        }

        public final Year copy(String __typename, int year) {
            __typename.getClass();
            return new Year(__typename, year);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Year)) {
                return false;
            }
            Year year = (Year) other;
            return g76.L(this.__typename, year.__typename) && this.year == year.year;
        }

        public final int getYear() {
            return this.year;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + this.year;
        }

        public final String toString() {
            return ho2.C(this.year, "Year(__typename=", this.__typename, ", year=", ")");
        }
    }

    public PublicationPostTimelineQuery(String str) {
        str.getClass();
        this.publicationId = str;
    }

    public static /* synthetic */ PublicationPostTimelineQuery copy$default(PublicationPostTimelineQuery publicationPostTimelineQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationPostTimelineQuery.publicationId;
        }
        return publicationPostTimelineQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationPostTimelineQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    public final PublicationPostTimelineQuery copy(String publicationId) {
        publicationId.getClass();
        return new PublicationPostTimelineQuery(publicationId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationPostTimelineQuery($publicationId: String!) { publication(id: $publicationId) { __typename postTimeline { __typename years { __typename year } } id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PublicationPostTimelineQuery) && g76.L(this.publicationId, ((PublicationPostTimelineQuery) other).publicationId);
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.publicationId.hashCode();
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
        List<sx1> list = PublicationPostTimelineQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationPostTimelineQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("PublicationPostTimelineQuery(publicationId=", this.publicationId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationPostTimelineQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationPostTimelineQuery($publicationId: String!) { publication(id: $publicationId) { __typename postTimeline { __typename years { __typename year } } id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
