package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationHomeQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationHomeQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PublicationSections;
import com.medium.android.graphql.selections.PublicationHomeQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004()*'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/PublicationHomeQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationHomeQuery$Data;", "", "publicationId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/PublicationHomeQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "Companion", "Data", "Publication", "Homepage", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationHomeQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4c93ccdb3dfe65c32e46d0f81e7ef8c90eb0c1149c3d0b52609d44082875a446";
    public static final String OPERATION_NAME = "PublicationHomeQuery";
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationHomeQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationHomeQuery$Publication;", "publication", "<init>", "(Lcom/medium/android/graphql/PublicationHomeQuery$Publication;)V", "component1", "()Lcom/medium/android/graphql/PublicationHomeQuery$Publication;", "copy", "(Lcom/medium/android/graphql/PublicationHomeQuery$Publication;)Lcom/medium/android/graphql/PublicationHomeQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationHomeQuery$Publication;", "getPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationHomeQuery$Homepage;", "", "__typename", "", "publicationSections", "Lcom/medium/android/graphql/fragment/PublicationSections;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationSections;)V", "get__typename", "()Ljava/lang/String;", "getPublicationSections", "()Lcom/medium/android/graphql/fragment/PublicationSections;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Homepage {
        private final String __typename;
        private final PublicationSections publicationSections;

        public Homepage(String str, PublicationSections publicationSections) {
            str.getClass();
            publicationSections.getClass();
            this.__typename = str;
            this.publicationSections = publicationSections;
        }

        public static /* synthetic */ Homepage copy$default(Homepage homepage, String str, PublicationSections publicationSections, int i, Object obj) {
            if ((i & 1) != 0) {
                str = homepage.__typename;
            }
            if ((i & 2) != 0) {
                publicationSections = homepage.publicationSections;
            }
            return homepage.copy(str, publicationSections);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationSections getPublicationSections() {
            return this.publicationSections;
        }

        public final Homepage copy(String __typename, PublicationSections publicationSections) {
            __typename.getClass();
            publicationSections.getClass();
            return new Homepage(__typename, publicationSections);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Homepage)) {
                return false;
            }
            Homepage homepage = (Homepage) other;
            return g76.L(this.__typename, homepage.__typename) && g76.L(this.publicationSections, homepage.publicationSections);
        }

        public final PublicationSections getPublicationSections() {
            return this.publicationSections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publicationSections.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Homepage(__typename=" + this.__typename + ", publicationSections=" + this.publicationSections + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J1\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationHomeQuery$Publication;", "", "__typename", "", "name", "homepage", "Lcom/medium/android/graphql/PublicationHomeQuery$Homepage;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/PublicationHomeQuery$Homepage;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getName", "getHomepage", "()Lcom/medium/android/graphql/PublicationHomeQuery$Homepage;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final Homepage homepage;
        private final String id;
        private final String name;

        public Publication(String str, String str2, Homepage homepage, String str3) {
            str.getClass();
            str2.getClass();
            homepage.getClass();
            str3.getClass();
            this.__typename = str;
            this.name = str2;
            this.homepage = homepage;
            this.id = str3;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, Homepage homepage, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.name;
            }
            if ((i & 4) != 0) {
                homepage = publication.homepage;
            }
            if ((i & 8) != 0) {
                str3 = publication.id;
            }
            return publication.copy(str, str2, homepage, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Homepage getHomepage() {
            return this.homepage;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, String name, Homepage homepage, String id) {
            __typename.getClass();
            name.getClass();
            homepage.getClass();
            id.getClass();
            return new Publication(__typename, name, homepage, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.name, publication.name) && g76.L(this.homepage, publication.homepage) && g76.L(this.id, publication.id);
        }

        public final Homepage getHomepage() {
            return this.homepage;
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
            return this.id.hashCode() + ((this.homepage.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.name)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.name;
            Homepage homepage = this.homepage;
            String str3 = this.id;
            StringBuilder sbU = y30.u("Publication(__typename=", str, ", name=", str2, ", homepage=");
            sbU.append(homepage);
            sbU.append(", id=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PublicationHomeQuery(String str) {
        str.getClass();
        this.publicationId = str;
    }

    public static /* synthetic */ PublicationHomeQuery copy$default(PublicationHomeQuery publicationHomeQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationHomeQuery.publicationId;
        }
        return publicationHomeQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationHomeQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    public final PublicationHomeQuery copy(String publicationId) {
        publicationId.getClass();
        return new PublicationHomeQuery(publicationId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationHomeQuery($publicationId: String!) { publication(id: $publicationId) { __typename name homepage { __typename ...PublicationSections } id } }  fragment PublicationPostSectionData on PublicationPostsSection { __typename id title posts { __typename id } }  fragment PublicationPromotionSectionData on PublicationPromotionSection { __typename id backgroundColor { __typename rgb } buttonText headlineText imageId url }  fragment PublicationSections on PublicationPage { __typename sections { __typename ... on PublicationSection { ...PublicationPostSectionData ...PublicationPromotionSectionData } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PublicationHomeQuery) && g76.L(this.publicationId, ((PublicationHomeQuery) other).publicationId);
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
        List<sx1> list = PublicationHomeQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationHomeQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("PublicationHomeQuery(publicationId=", this.publicationId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationHomeQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationHomeQuery($publicationId: String!) { publication(id: $publicationId) { __typename name homepage { __typename ...PublicationSections } id } }  fragment PublicationPostSectionData on PublicationPostsSection { __typename id title posts { __typename id } }  fragment PublicationPromotionSectionData on PublicationPromotionSection { __typename id backgroundColor { __typename rgb } buttonText headlineText imageId url }  fragment PublicationSections on PublicationPage { __typename sections { __typename ... on PublicationSection { ...PublicationPostSectionData ...PublicationPromotionSectionData } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
