package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001:\u0001%B-\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0016\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J>\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0015\u0010\rJ\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\rR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b \u0010\rR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010!\u001a\u0004\b\"\u0010\u0010R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006¢\u0006\f\n\u0004\b\t\u0010#\u001a\u0004\b$\u0010\u0012¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/DigestData;", "Lg15;", "", "__typename", "id", "", "createdAt", "", "Lcom/medium/android/graphql/fragment/DigestData$Section;", "sections", "<init>", "(Ljava/lang/String;Ljava/lang/String;JLjava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()J", "component4", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;JLjava/util/List;)Lcom/medium/android/graphql/fragment/DigestData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "J", "getCreatedAt", "Ljava/util/List;", "getSections", "Section", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class DigestData implements g15 {
    private final String __typename;
    private final long createdAt;
    private final String id;
    private final List<Section> sections;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/DigestData$Section;", "", "__typename", "", "digestSectionData", "Lcom/medium/android/graphql/fragment/DigestSectionData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/DigestSectionData;)V", "get__typename", "()Ljava/lang/String;", "getDigestSectionData", "()Lcom/medium/android/graphql/fragment/DigestSectionData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Section {
        private final String __typename;
        private final DigestSectionData digestSectionData;

        public Section(String str, DigestSectionData digestSectionData) {
            str.getClass();
            digestSectionData.getClass();
            this.__typename = str;
            this.digestSectionData = digestSectionData;
        }

        public static /* synthetic */ Section copy$default(Section section, String str, DigestSectionData digestSectionData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = section.__typename;
            }
            if ((i & 2) != 0) {
                digestSectionData = section.digestSectionData;
            }
            return section.copy(str, digestSectionData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final DigestSectionData getDigestSectionData() {
            return this.digestSectionData;
        }

        public final Section copy(String __typename, DigestSectionData digestSectionData) {
            __typename.getClass();
            digestSectionData.getClass();
            return new Section(__typename, digestSectionData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Section)) {
                return false;
            }
            Section section = (Section) other;
            return g76.L(this.__typename, section.__typename) && g76.L(this.digestSectionData, section.digestSectionData);
        }

        public final DigestSectionData getDigestSectionData() {
            return this.digestSectionData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.digestSectionData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Section(__typename=" + this.__typename + ", digestSectionData=" + this.digestSectionData + ")";
        }
    }

    public DigestData(String str, String str2, long j, List<Section> list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.__typename = str;
        this.id = str2;
        this.createdAt = j;
        this.sections = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DigestData copy$default(DigestData digestData, String str, String str2, long j, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = digestData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = digestData.id;
        }
        if ((i & 4) != 0) {
            j = digestData.createdAt;
        }
        if ((i & 8) != 0) {
            list = digestData.sections;
        }
        List list2 = list;
        return digestData.copy(str, str2, j, list2);
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
    public final long getCreatedAt() {
        return this.createdAt;
    }

    public final List<Section> component4() {
        return this.sections;
    }

    public final DigestData copy(String __typename, String id, long createdAt, List<Section> sections) {
        __typename.getClass();
        id.getClass();
        sections.getClass();
        return new DigestData(__typename, id, createdAt, sections);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DigestData)) {
            return false;
        }
        DigestData digestData = (DigestData) other;
        return g76.L(this.__typename, digestData.__typename) && g76.L(this.id, digestData.id) && this.createdAt == digestData.createdAt && g76.L(this.sections, digestData.sections);
    }

    public final long getCreatedAt() {
        return this.createdAt;
    }

    public final String getId() {
        return this.id;
    }

    public final List<Section> getSections() {
        return this.sections;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        long j = this.createdAt;
        return this.sections.hashCode() + ((iO + ((int) (j ^ (j >>> 32)))) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        long j = this.createdAt;
        List<Section> list = this.sections;
        StringBuilder sbU = y30.u("DigestData(__typename=", str, ", id=", str2, ", createdAt=");
        sbU.append(j);
        sbU.append(", sections=");
        sbU.append(list);
        sbU.append(")");
        return sbU.toString();
    }
}
