package com.medium.android.graphql;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.graphql.adapter.UserBooksByIdQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.UserBooksByIdQuery_VariablesAdapter;
import com.medium.android.graphql.selections.UserBooksByIdQuerySelections;
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
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0012\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\f()*+,-./012'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u00063"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery;", "Luqa;", "Lcom/medium/android/graphql/UserBooksByIdQuery$Data;", "", "userId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/UserBooksByIdQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Companion", "Data", "UserResult", "OnUser", "AuthoredBook", "Author", "Link", "OnGraphqlEmptyId", "OnNotFound", "OnSuspended", "OnBlocked", "OnAccountSuspended", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserBooksByIdQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "8c0bc713606aec1d12c0a44410f522a0e14107dbccf9456939e553a0901ced55";
    public static final String OPERATION_NAME = "UserBooksByIdQuery";
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$Author;", "", "__typename", "", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getName", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Author {
        private final String __typename;
        private final String name;

        public Author(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.name = str2;
        }

        public static /* synthetic */ Author copy$default(Author author, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = author.__typename;
            }
            if ((i & 2) != 0) {
                str2 = author.name;
            }
            return author.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        public final Author copy(String __typename, String name) {
            __typename.getClass();
            name.getClass();
            return new Author(__typename, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Author)) {
                return false;
            }
            Author author = (Author) other;
            return g76.L(this.__typename, author.__typename) && g76.L(this.name, author.name);
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.name.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("Author(__typename=", this.__typename, ", name=", this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0017\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BS\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0005\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\t0\u0005HÆ\u0003J\u000f\u0010 \u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005HÆ\u0003J\u0010\u0010!\u001a\u0004\u0018\u00010\rHÆ\u0003¢\u0006\u0002\u0010\u0019Jh\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u00052\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\rHÆ\u0001¢\u0006\u0002\u0010#J\u0013\u0010$\u001a\u00020%2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020(HÖ\u0001J\t\u0010)\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0013R\u0017\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0013R\u0015\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\n\n\u0002\u0010\u001a\u001a\u0004\b\u0018\u0010\u0019¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$AuthoredBook;", "", "__typename", "", "isbns", "", "title", "coverImageId", "authors", "Lcom/medium/android/graphql/UserBooksByIdQuery$Author;", "links", "Lcom/medium/android/graphql/UserBooksByIdQuery$Link;", "publicationDate", "", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getIsbns", "()Ljava/util/List;", "getTitle", "getCoverImageId", "getAuthors", "getLinks", "getPublicationDate", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;)Lcom/medium/android/graphql/UserBooksByIdQuery$AuthoredBook;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AuthoredBook {
        private final String __typename;
        private final List<Author> authors;
        private final String coverImageId;
        private final List<String> isbns;
        private final List<Link> links;
        private final Long publicationDate;
        private final String title;

        public AuthoredBook(String str, List<String> list, String str2, String str3, List<Author> list2, List<Link> list3, Long l) {
            str.getClass();
            list.getClass();
            str2.getClass();
            str3.getClass();
            list2.getClass();
            list3.getClass();
            this.__typename = str;
            this.isbns = list;
            this.title = str2;
            this.coverImageId = str3;
            this.authors = list2;
            this.links = list3;
            this.publicationDate = l;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ AuthoredBook copy$default(AuthoredBook authoredBook, String str, List list, String str2, String str3, List list2, List list3, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = authoredBook.__typename;
            }
            if ((i & 2) != 0) {
                list = authoredBook.isbns;
            }
            if ((i & 4) != 0) {
                str2 = authoredBook.title;
            }
            if ((i & 8) != 0) {
                str3 = authoredBook.coverImageId;
            }
            if ((i & 16) != 0) {
                list2 = authoredBook.authors;
            }
            if ((i & 32) != 0) {
                list3 = authoredBook.links;
            }
            if ((i & 64) != 0) {
                l = authoredBook.publicationDate;
            }
            List list4 = list3;
            Long l2 = l;
            List list5 = list2;
            String str4 = str2;
            return authoredBook.copy(str, list, str4, str3, list5, list4, l2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<String> component2() {
            return this.isbns;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getCoverImageId() {
            return this.coverImageId;
        }

        public final List<Author> component5() {
            return this.authors;
        }

        public final List<Link> component6() {
            return this.links;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final Long getPublicationDate() {
            return this.publicationDate;
        }

        public final AuthoredBook copy(String __typename, List<String> isbns, String title, String coverImageId, List<Author> authors, List<Link> links, Long publicationDate) {
            __typename.getClass();
            isbns.getClass();
            title.getClass();
            coverImageId.getClass();
            authors.getClass();
            links.getClass();
            return new AuthoredBook(__typename, isbns, title, coverImageId, authors, links, publicationDate);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AuthoredBook)) {
                return false;
            }
            AuthoredBook authoredBook = (AuthoredBook) other;
            return g76.L(this.__typename, authoredBook.__typename) && g76.L(this.isbns, authoredBook.isbns) && g76.L(this.title, authoredBook.title) && g76.L(this.coverImageId, authoredBook.coverImageId) && g76.L(this.authors, authoredBook.authors) && g76.L(this.links, authoredBook.links) && g76.L(this.publicationDate, authoredBook.publicationDate);
        }

        public final List<Author> getAuthors() {
            return this.authors;
        }

        public final String getCoverImageId() {
            return this.coverImageId;
        }

        public final List<String> getIsbns() {
            return this.isbns;
        }

        public final List<Link> getLinks() {
            return this.links;
        }

        public final Long getPublicationDate() {
            return this.publicationDate;
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iP = wgd.p(wgd.p(wgd.o(wgd.o(wgd.p(this.__typename.hashCode() * 31, 31, this.isbns), 31, this.title), 31, this.coverImageId), 31, this.authors), 31, this.links);
            Long l = this.publicationDate;
            return iP + (l == null ? 0 : l.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            List<String> list = this.isbns;
            String str2 = this.title;
            String str3 = this.coverImageId;
            List<Author> list2 = this.authors;
            List<Link> list3 = this.links;
            Long l = this.publicationDate;
            StringBuilder sbE = b09.E("AuthoredBook(__typename=", str, ", isbns=", ", title=", list);
            ka1.C(sbE, str2, ", coverImageId=", str3, ", authors=");
            sbE.append(list2);
            sbE.append(", links=");
            sbE.append(list3);
            sbE.append(", publicationDate=");
            sbE.append(l);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;", "userResult", "<init>", "(Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;)V", "component1", "()Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;", "copy", "(Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;)Lcom/medium/android/graphql/UserBooksByIdQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;", "getUserResult", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final UserResult userResult;

        public Data(UserResult userResult) {
            this.userResult = userResult;
        }

        public static Data copy$default(Data data, UserResult userResult, int i, Object obj) {
            if ((i & 1) != 0) {
                userResult = data.userResult;
            }
            data.getClass();
            return new Data(userResult);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final Data copy(UserResult userResult) {
            return new Data(userResult);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.userResult, ((Data) other).userResult);
        }

        public final UserResult getUserResult() {
            return this.userResult;
        }

        public final int hashCode() {
            UserResult userResult = this.userResult;
            if (userResult == null) {
                return 0;
            }
            return userResult.hashCode();
        }

        public final String toString() {
            return "Data(userResult=" + this.userResult + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$Link;", "", "__typename", "", "url", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getUrl", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Link {
        private final String __typename;
        private final String url;

        public Link(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.url = str2;
        }

        public static /* synthetic */ Link copy$default(Link link, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = link.__typename;
            }
            if ((i & 2) != 0) {
                str2 = link.url;
            }
            return link.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getUrl() {
            return this.url;
        }

        public final Link copy(String __typename, String url) {
            __typename.getClass();
            url.getClass();
            return new Link(__typename, url);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Link)) {
                return false;
            }
            Link link = (Link) other;
            return g76.L(this.__typename, link.__typename) && g76.L(this.url, link.url);
        }

        public final String getUrl() {
            return this.url;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.url.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y(CspinKvYN.dBfffjfMIeSzx, this.__typename, ", url=", this.url, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAccountSuspended {
        private final String message;

        public OnAccountSuspended(String str) {
            this.message = str;
        }

        public static OnAccountSuspended copy$default(OnAccountSuspended onAccountSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAccountSuspended.message;
            }
            onAccountSuspended.getClass();
            return new OnAccountSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAccountSuspended copy(String message) {
            return new OnAccountSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAccountSuspended) && g76.L(this.message, ((OnAccountSuspended) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnAccountSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnBlocked;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBlocked {
        private final String message;

        public OnBlocked(String str) {
            this.message = str;
        }

        public static OnBlocked copy$default(OnBlocked onBlocked, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBlocked.message;
            }
            onBlocked.getClass();
            return new OnBlocked(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBlocked copy(String message) {
            return new OnBlocked(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBlocked) && g76.L(this.message, ((OnBlocked) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnBlocked(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnGraphqlEmptyId;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnGraphqlEmptyId {
        private final String message;

        public OnGraphqlEmptyId(String str) {
            this.message = str;
        }

        public static OnGraphqlEmptyId copy$default(OnGraphqlEmptyId onGraphqlEmptyId, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onGraphqlEmptyId.message;
            }
            onGraphqlEmptyId.getClass();
            return new OnGraphqlEmptyId(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnGraphqlEmptyId copy(String message) {
            return new OnGraphqlEmptyId(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnGraphqlEmptyId) && g76.L(this.message, ((OnGraphqlEmptyId) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnGraphqlEmptyId(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnNotFound;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnNotFound {
        private final String message;

        public OnNotFound(String str) {
            this.message = str;
        }

        public static OnNotFound copy$default(OnNotFound onNotFound, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onNotFound.message;
            }
            onNotFound.getClass();
            return new OnNotFound(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnNotFound copy(String message) {
            return new OnNotFound(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnNotFound) && g76.L(this.message, ((OnNotFound) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnNotFound(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnSuspended {
        private final String message;

        public OnSuspended(String str) {
            this.message = str;
        }

        public static OnSuspended copy$default(OnSuspended onSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onSuspended.message;
            }
            onSuspended.getClass();
            return new OnSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnSuspended copy(String message) {
            return new OnSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnSuspended) && g76.L(this.message, ((OnSuspended) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0006HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0006HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$OnUser;", "", "authoredBooks", "", "Lcom/medium/android/graphql/UserBooksByIdQuery$AuthoredBook;", "id", "", "<init>", "(Ljava/util/List;Ljava/lang/String;)V", "getAuthoredBooks", "()Ljava/util/List;", "getId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final List<AuthoredBook> authoredBooks;
        private final String id;

        public OnUser(List<AuthoredBook> list, String str) {
            list.getClass();
            str.getClass();
            this.authoredBooks = list;
            this.id = str;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnUser copy$default(OnUser onUser, List list, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onUser.authoredBooks;
            }
            if ((i & 2) != 0) {
                str = onUser.id;
            }
            return onUser.copy(list, str);
        }

        public final List<AuthoredBook> component1() {
            return this.authoredBooks;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnUser copy(List<AuthoredBook> authoredBooks, String id) {
            authoredBooks.getClass();
            id.getClass();
            return new OnUser(authoredBooks, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.authoredBooks, onUser.authoredBooks) && g76.L(this.id, onUser.id);
        }

        public final List<AuthoredBook> getAuthoredBooks() {
            return this.authoredBooks;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.authoredBooks.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(authoredBooks=" + this.authoredBooks + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u000fHÆ\u0003J[\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÆ\u0001J\u0013\u0010(\u001a\u00020)2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020,HÖ\u0001J\t\u0010-\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006."}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$UserResult;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnUser;", "onGraphqlEmptyId", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnGraphqlEmptyId;", "onNotFound", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnNotFound;", "onSuspended", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnSuspended;", "onBlocked", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnBlocked;", "onAccountSuspended", "Lcom/medium/android/graphql/UserBooksByIdQuery$OnAccountSuspended;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UserBooksByIdQuery$OnUser;Lcom/medium/android/graphql/UserBooksByIdQuery$OnGraphqlEmptyId;Lcom/medium/android/graphql/UserBooksByIdQuery$OnNotFound;Lcom/medium/android/graphql/UserBooksByIdQuery$OnSuspended;Lcom/medium/android/graphql/UserBooksByIdQuery$OnBlocked;Lcom/medium/android/graphql/UserBooksByIdQuery$OnAccountSuspended;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnUser;", "getOnGraphqlEmptyId", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnGraphqlEmptyId;", "getOnNotFound", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnNotFound;", "getOnSuspended", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnSuspended;", "getOnBlocked", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnBlocked;", "getOnAccountSuspended", "()Lcom/medium/android/graphql/UserBooksByIdQuery$OnAccountSuspended;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UserResult {
        private final String __typename;
        private final OnAccountSuspended onAccountSuspended;
        private final OnBlocked onBlocked;
        private final OnGraphqlEmptyId onGraphqlEmptyId;
        private final OnNotFound onNotFound;
        private final OnSuspended onSuspended;
        private final OnUser onUser;

        public UserResult(String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onGraphqlEmptyId = onGraphqlEmptyId;
            this.onNotFound = onNotFound;
            this.onSuspended = onSuspended;
            this.onBlocked = onBlocked;
            this.onAccountSuspended = onAccountSuspended;
        }

        public static /* synthetic */ UserResult copy$default(UserResult userResult, String str, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended, int i, Object obj) {
            if ((i & 1) != 0) {
                str = userResult.__typename;
            }
            if ((i & 2) != 0) {
                onUser = userResult.onUser;
            }
            if ((i & 4) != 0) {
                onGraphqlEmptyId = userResult.onGraphqlEmptyId;
            }
            if ((i & 8) != 0) {
                onNotFound = userResult.onNotFound;
            }
            if ((i & 16) != 0) {
                onSuspended = userResult.onSuspended;
            }
            if ((i & 32) != 0) {
                onBlocked = userResult.onBlocked;
            }
            if ((i & 64) != 0) {
                onAccountSuspended = userResult.onAccountSuspended;
            }
            OnBlocked onBlocked2 = onBlocked;
            OnAccountSuspended onAccountSuspended2 = onAccountSuspended;
            OnSuspended onSuspended2 = onSuspended;
            OnGraphqlEmptyId onGraphqlEmptyId2 = onGraphqlEmptyId;
            return userResult.copy(str, onUser, onGraphqlEmptyId2, onNotFound, onSuspended2, onBlocked2, onAccountSuspended2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final UserResult copy(String __typename, OnUser onUser, OnGraphqlEmptyId onGraphqlEmptyId, OnNotFound onNotFound, OnSuspended onSuspended, OnBlocked onBlocked, OnAccountSuspended onAccountSuspended) {
            __typename.getClass();
            return new UserResult(__typename, onUser, onGraphqlEmptyId, onNotFound, onSuspended, onBlocked, onAccountSuspended);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserResult)) {
                return false;
            }
            UserResult userResult = (UserResult) other;
            return g76.L(this.__typename, userResult.__typename) && g76.L(this.onUser, userResult.onUser) && g76.L(this.onGraphqlEmptyId, userResult.onGraphqlEmptyId) && g76.L(this.onNotFound, userResult.onNotFound) && g76.L(this.onSuspended, userResult.onSuspended) && g76.L(this.onBlocked, userResult.onBlocked) && g76.L(this.onAccountSuspended, userResult.onAccountSuspended);
        }

        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        public final OnNotFound getOnNotFound() {
            return this.onNotFound;
        }

        public final OnSuspended getOnSuspended() {
            return this.onSuspended;
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUser onUser = this.onUser;
            int iHashCode2 = (iHashCode + (onUser == null ? 0 : onUser.hashCode())) * 31;
            OnGraphqlEmptyId onGraphqlEmptyId = this.onGraphqlEmptyId;
            int iHashCode3 = (iHashCode2 + (onGraphqlEmptyId == null ? 0 : onGraphqlEmptyId.hashCode())) * 31;
            OnNotFound onNotFound = this.onNotFound;
            int iHashCode4 = (iHashCode3 + (onNotFound == null ? 0 : onNotFound.hashCode())) * 31;
            OnSuspended onSuspended = this.onSuspended;
            int iHashCode5 = (iHashCode4 + (onSuspended == null ? 0 : onSuspended.hashCode())) * 31;
            OnBlocked onBlocked = this.onBlocked;
            int iHashCode6 = (iHashCode5 + (onBlocked == null ? 0 : onBlocked.hashCode())) * 31;
            OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
            return iHashCode6 + (onAccountSuspended != null ? onAccountSuspended.hashCode() : 0);
        }

        public final String toString() {
            return "UserResult(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onGraphqlEmptyId=" + this.onGraphqlEmptyId + ", onNotFound=" + this.onNotFound + ", onSuspended=" + this.onSuspended + ", onBlocked=" + this.onBlocked + ", onAccountSuspended=" + this.onAccountSuspended + ")";
        }
    }

    public UserBooksByIdQuery(String str) {
        str.getClass();
        this.userId = str;
    }

    public static /* synthetic */ UserBooksByIdQuery copy$default(UserBooksByIdQuery userBooksByIdQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userBooksByIdQuery.userId;
        }
        return userBooksByIdQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UserBooksByIdQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final UserBooksByIdQuery copy(String userId) {
        userId.getClass();
        return new UserBooksByIdQuery(userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query UserBooksByIdQuery($userId: ID!) { userResult(id: $userId) { __typename ... on User { authoredBooks { __typename isbns title coverImageId authors { __typename name } links { __typename url } publicationDate } id } ... on GraphqlEmptyId { message } ... on NotFound { message } ... on Suspended { message } ... on Blocked { message } ... on AccountSuspended { message } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UserBooksByIdQuery) && g76.L(this.userId, ((UserBooksByIdQuery) other).userId);
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode();
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
        List<sx1> list = UserBooksByIdQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UserBooksByIdQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("UserBooksByIdQuery(userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UserBooksByIdQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query UserBooksByIdQuery($userId: ID!) { userResult(id: $userId) { __typename ... on User { authoredBooks { __typename isbns title coverImageId authors { __typename name } links { __typename url } publicationDate } id } ... on GraphqlEmptyId { message } ... on NotFound { message } ... on Suspended { message } ... on Blocked { message } ... on AccountSuspended { message } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
