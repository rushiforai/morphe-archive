package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationNewsletterQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationNewsletterQuery_VariablesAdapter;
import com.medium.android.graphql.selections.PublicationNewsletterQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u0000 *2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005+,-.*B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\tJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\tJ$\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b)\u0010\t¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationNewsletterQuery$Data;", "", "publicationId", "currentUserId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/PublicationNewsletterQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "getCurrentUserId", "Companion", "Data", "Publication", "Newsletter", "User", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationNewsletterQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a94287aee9147295e4ea2fcd6f76bf7e3ced70ba61daa231f3b6ed6920551057";
    public static final String OPERATION_NAME = "PublicationNewsletterQuery";
    private final String currentUserId;
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0012\u0010\b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ(\u0010\f\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;", "publication", "Lcom/medium/android/graphql/PublicationNewsletterQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;Lcom/medium/android/graphql/PublicationNewsletterQuery$User;)V", "component1", "()Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;", "component2", "()Lcom/medium/android/graphql/PublicationNewsletterQuery$User;", "copy", "(Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;Lcom/medium/android/graphql/PublicationNewsletterQuery$User;)Lcom/medium/android/graphql/PublicationNewsletterQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;", "getPublication", "Lcom/medium/android/graphql/PublicationNewsletterQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Publication publication;
        private final User user;

        public Data(Publication publication, User user) {
            this.publication = publication;
            this.user = user;
        }

        public static Data copy$default(Data data, Publication publication, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                publication = data.publication;
            }
            if ((i & 2) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(publication, user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(Publication publication, User user) {
            return new Data(publication, user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.publication, data.publication) && g76.L(this.user, data.user);
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            Publication publication = this.publication;
            int iHashCode = (publication == null ? 0 : publication.hashCode()) * 31;
            User user = this.user;
            return iHashCode + (user != null ? user.hashCode() : 0);
        }

        public final String toString() {
            return "Data(publication=" + this.publication + ", user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery$Newsletter;", "", "__typename", "", "id", "name", "description", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getDescription", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Newsletter {
        private final String __typename;
        private final String description;
        private final String id;
        private final String name;

        public Newsletter(String str, String str2, String str3, String str4) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.description = str4;
        }

        public static /* synthetic */ Newsletter copy$default(Newsletter newsletter, String str, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = newsletter.__typename;
            }
            if ((i & 2) != 0) {
                str2 = newsletter.id;
            }
            if ((i & 4) != 0) {
                str3 = newsletter.name;
            }
            if ((i & 8) != 0) {
                str4 = newsletter.description;
            }
            return newsletter.copy(str, str2, str3, str4);
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
        public final String getDescription() {
            return this.description;
        }

        public final Newsletter copy(String __typename, String id, String name, String description) {
            __typename.getClass();
            id.getClass();
            return new Newsletter(__typename, id, name, description);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Newsletter)) {
                return false;
            }
            Newsletter newsletter = (Newsletter) other;
            return g76.L(this.__typename, newsletter.__typename) && g76.L(this.id, newsletter.id) && g76.L(this.name, newsletter.name) && g76.L(this.description, newsletter.description);
        }

        public final String getDescription() {
            return this.description;
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
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.description;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return km4.C(y30.u("Newsletter(__typename=", str, ", id=", str2, ", name="), this.name, ", description=", this.description, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J3\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery$Publication;", "", "__typename", "", "name", "newsletter", "Lcom/medium/android/graphql/PublicationNewsletterQuery$Newsletter;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/PublicationNewsletterQuery$Newsletter;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getName", "getNewsletter", "()Lcom/medium/android/graphql/PublicationNewsletterQuery$Newsletter;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final String id;
        private final String name;
        private final Newsletter newsletter;

        public Publication(String str, String str2, Newsletter newsletter, String str3) {
            b09.I(str, str2, str3);
            this.__typename = str;
            this.name = str2;
            this.newsletter = newsletter;
            this.id = str3;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, Newsletter newsletter, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.name;
            }
            if ((i & 4) != 0) {
                newsletter = publication.newsletter;
            }
            if ((i & 8) != 0) {
                str3 = publication.id;
            }
            return publication.copy(str, str2, newsletter, str3);
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
        public final Newsletter getNewsletter() {
            return this.newsletter;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, String name, Newsletter newsletter, String id) {
            __typename.getClass();
            name.getClass();
            id.getClass();
            return new Publication(__typename, name, newsletter, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.name, publication.name) && g76.L(this.newsletter, publication.newsletter) && g76.L(this.id, publication.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final Newsletter getNewsletter() {
            return this.newsletter;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.name);
            Newsletter newsletter = this.newsletter;
            return this.id.hashCode() + ((iO + (newsletter == null ? 0 : newsletter.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.name;
            Newsletter newsletter = this.newsletter;
            String str3 = this.id;
            StringBuilder sbU = y30.u("Publication(__typename=", str, ", name=", str2, ", newsletter=");
            sbU.append(newsletter);
            sbU.append(", id=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery$User;", "", "__typename", "", "email", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getEmail", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String email;
        private final String id;

        public User(String str, String str2, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.email = str2;
            this.id = str3;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.email;
            }
            if ((i & 4) != 0) {
                str3 = user.id;
            }
            return user.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getEmail() {
            return this.email;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final User copy(String __typename, String email, String id) {
            __typename.getClass();
            id.getClass();
            return new User(__typename, email, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.email, user.email) && g76.L(this.id, user.id);
        }

        public final String getEmail() {
            return this.email;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.email;
            return this.id.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.email;
            return ka1.v(y30.u("User(__typename=", str, ", email=", str2, ", id="), this.id, ")");
        }
    }

    public PublicationNewsletterQuery(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.publicationId = str;
        this.currentUserId = str2;
    }

    public static /* synthetic */ PublicationNewsletterQuery copy$default(PublicationNewsletterQuery publicationNewsletterQuery, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationNewsletterQuery.publicationId;
        }
        if ((i & 2) != 0) {
            str2 = publicationNewsletterQuery.currentUserId;
        }
        return publicationNewsletterQuery.copy(str, str2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationNewsletterQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getCurrentUserId() {
        return this.currentUserId;
    }

    public final PublicationNewsletterQuery copy(String publicationId, String currentUserId) {
        publicationId.getClass();
        currentUserId.getClass();
        return new PublicationNewsletterQuery(publicationId, currentUserId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationNewsletterQuery($publicationId: String!, $currentUserId: ID!) { publication(id: $publicationId) { __typename name newsletter { __typename id name description } id } user(id: $currentUserId) { __typename email id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationNewsletterQuery)) {
            return false;
        }
        PublicationNewsletterQuery publicationNewsletterQuery = (PublicationNewsletterQuery) other;
        return g76.L(this.publicationId, publicationNewsletterQuery.publicationId) && g76.L(this.currentUserId, publicationNewsletterQuery.currentUserId);
    }

    public final String getCurrentUserId() {
        return this.currentUserId;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.currentUserId.hashCode() + (this.publicationId.hashCode() * 31);
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
        List<sx1> list = PublicationNewsletterQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationNewsletterQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.y("PublicationNewsletterQuery(publicationId=", this.publicationId, ", currentUserId=", this.currentUserId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationNewsletterQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationNewsletterQuery($publicationId: String!, $currentUserId: ID!) { publication(id: $publicationId) { __typename name newsletter { __typename id name description } id } user(id: $currentUserId) { __typename email id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
