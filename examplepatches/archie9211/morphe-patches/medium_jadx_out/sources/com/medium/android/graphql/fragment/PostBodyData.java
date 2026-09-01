package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0002 !B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0016\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u000eJ:\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0004HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\fJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u000eR\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00048\u0006¢\u0006\f\n\u0004\b\b\u0010\u001d\u001a\u0004\b\u001f\u0010\u000e¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/fragment/PostBodyData;", "Lg15;", "", "__typename", "", "Lcom/medium/android/graphql/fragment/PostBodyData$Section;", "sections", "Lcom/medium/android/graphql/fragment/PostBodyData$Paragraph;", "paragraphs", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/List;", "component3", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/medium/android/graphql/fragment/PostBodyData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Ljava/util/List;", "getSections", "getParagraphs", "Section", "Paragraph", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostBodyData implements g15 {
    private final String __typename;
    private final List<Paragraph> paragraphs;
    private final List<Section> sections;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostBodyData$Paragraph;", "", "__typename", "", "id", "paragraphData", "Lcom/medium/android/graphql/fragment/ParagraphData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ParagraphData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getParagraphData", "()Lcom/medium/android/graphql/fragment/ParagraphData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paragraph {
        private final String __typename;
        private final String id;
        private final ParagraphData paragraphData;

        public Paragraph(String str, String str2, ParagraphData paragraphData) {
            str.getClass();
            str2.getClass();
            paragraphData.getClass();
            this.__typename = str;
            this.id = str2;
            this.paragraphData = paragraphData;
        }

        public static /* synthetic */ Paragraph copy$default(Paragraph paragraph, String str, String str2, ParagraphData paragraphData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paragraph.__typename;
            }
            if ((i & 2) != 0) {
                str2 = paragraph.id;
            }
            if ((i & 4) != 0) {
                paragraphData = paragraph.paragraphData;
            }
            return paragraph.copy(str, str2, paragraphData);
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
        public final ParagraphData getParagraphData() {
            return this.paragraphData;
        }

        public final Paragraph copy(String __typename, String id, ParagraphData paragraphData) {
            __typename.getClass();
            id.getClass();
            paragraphData.getClass();
            return new Paragraph(__typename, id, paragraphData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paragraph)) {
                return false;
            }
            Paragraph paragraph = (Paragraph) other;
            return g76.L(this.__typename, paragraph.__typename) && g76.L(this.id, paragraph.id) && g76.L(this.paragraphData, paragraph.paragraphData);
        }

        public final String getId() {
            return this.id;
        }

        public final ParagraphData getParagraphData() {
            return this.paragraphData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paragraphData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ParagraphData paragraphData = this.paragraphData;
            StringBuilder sbU = y30.u("Paragraph(__typename=", str, ", id=", str2, ", paragraphData=");
            sbU.append(paragraphData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/PostBodyData$Section;", "", "__typename", "", "sectionData", "Lcom/medium/android/graphql/fragment/SectionData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/SectionData;)V", "get__typename", "()Ljava/lang/String;", "getSectionData", "()Lcom/medium/android/graphql/fragment/SectionData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Section {
        private final String __typename;
        private final SectionData sectionData;

        public Section(String str, SectionData sectionData) {
            str.getClass();
            sectionData.getClass();
            this.__typename = str;
            this.sectionData = sectionData;
        }

        public static /* synthetic */ Section copy$default(Section section, String str, SectionData sectionData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = section.__typename;
            }
            if ((i & 2) != 0) {
                sectionData = section.sectionData;
            }
            return section.copy(str, sectionData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final SectionData getSectionData() {
            return this.sectionData;
        }

        public final Section copy(String __typename, SectionData sectionData) {
            __typename.getClass();
            sectionData.getClass();
            return new Section(__typename, sectionData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Section)) {
                return false;
            }
            Section section = (Section) other;
            return g76.L(this.__typename, section.__typename) && g76.L(this.sectionData, section.sectionData);
        }

        public final SectionData getSectionData() {
            return this.sectionData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.sectionData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Section(__typename=" + this.__typename + ", sectionData=" + this.sectionData + ")";
        }
    }

    public PostBodyData(String str, List<Section> list, List<Paragraph> list2) {
        str.getClass();
        list.getClass();
        list2.getClass();
        this.__typename = str;
        this.sections = list;
        this.paragraphs = list2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PostBodyData copy$default(PostBodyData postBodyData, String str, List list, List list2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postBodyData.__typename;
        }
        if ((i & 2) != 0) {
            list = postBodyData.sections;
        }
        if ((i & 4) != 0) {
            list2 = postBodyData.paragraphs;
        }
        return postBodyData.copy(str, list, list2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    public final List<Section> component2() {
        return this.sections;
    }

    public final List<Paragraph> component3() {
        return this.paragraphs;
    }

    public final PostBodyData copy(String __typename, List<Section> sections, List<Paragraph> paragraphs) {
        __typename.getClass();
        sections.getClass();
        paragraphs.getClass();
        return new PostBodyData(__typename, sections, paragraphs);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostBodyData)) {
            return false;
        }
        PostBodyData postBodyData = (PostBodyData) other;
        return g76.L(this.__typename, postBodyData.__typename) && g76.L(this.sections, postBodyData.sections) && g76.L(this.paragraphs, postBodyData.paragraphs);
    }

    public final List<Paragraph> getParagraphs() {
        return this.paragraphs;
    }

    public final List<Section> getSections() {
        return this.sections;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.paragraphs.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.sections);
    }

    public final String toString() {
        String str = this.__typename;
        List<Section> list = this.sections;
        return b09.B(b09.E("PostBodyData(__typename=", str, ", sections=", ", paragraphs=", list), this.paragraphs, ")");
    }
}
