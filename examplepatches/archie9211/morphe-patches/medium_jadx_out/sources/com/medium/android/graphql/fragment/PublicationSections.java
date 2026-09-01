package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0002\u001c\u001dB\u001d\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0016\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ*\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000f\u0010\nJ\u0010\u0010\u0011\u001a\u00020\u0010HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u001d\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001b\u0010\f¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationSections;", "Lg15;", "", "__typename", "", "Lcom/medium/android/graphql/fragment/PublicationSections$Section;", "sections", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/fragment/PublicationSections;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Ljava/util/List;", "getSections", "Section", "OnPublicationSection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationSections implements g15 {
    private final String __typename;
    private final List<Section> sections;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u000b\u0010\f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J!\u0010\u000e\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationSections$OnPublicationSection;", "", "publicationPostSectionData", "Lcom/medium/android/graphql/fragment/PublicationPostSectionData;", "publicationPromotionSectionData", "Lcom/medium/android/graphql/fragment/PublicationPromotionSectionData;", "<init>", "(Lcom/medium/android/graphql/fragment/PublicationPostSectionData;Lcom/medium/android/graphql/fragment/PublicationPromotionSectionData;)V", "getPublicationPostSectionData", "()Lcom/medium/android/graphql/fragment/PublicationPostSectionData;", "getPublicationPromotionSectionData", "()Lcom/medium/android/graphql/fragment/PublicationPromotionSectionData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationSection {
        private final PublicationPostSectionData publicationPostSectionData;
        private final PublicationPromotionSectionData publicationPromotionSectionData;

        public OnPublicationSection(PublicationPostSectionData publicationPostSectionData, PublicationPromotionSectionData publicationPromotionSectionData) {
            this.publicationPostSectionData = publicationPostSectionData;
            this.publicationPromotionSectionData = publicationPromotionSectionData;
        }

        public static OnPublicationSection copy$default(OnPublicationSection onPublicationSection, PublicationPostSectionData publicationPostSectionData, PublicationPromotionSectionData publicationPromotionSectionData, int i, Object obj) {
            if ((i & 1) != 0) {
                publicationPostSectionData = onPublicationSection.publicationPostSectionData;
            }
            if ((i & 2) != 0) {
                publicationPromotionSectionData = onPublicationSection.publicationPromotionSectionData;
            }
            onPublicationSection.getClass();
            return new OnPublicationSection(publicationPostSectionData, publicationPromotionSectionData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublicationPostSectionData getPublicationPostSectionData() {
            return this.publicationPostSectionData;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationPromotionSectionData getPublicationPromotionSectionData() {
            return this.publicationPromotionSectionData;
        }

        public final OnPublicationSection copy(PublicationPostSectionData publicationPostSectionData, PublicationPromotionSectionData publicationPromotionSectionData) {
            return new OnPublicationSection(publicationPostSectionData, publicationPromotionSectionData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublicationSection)) {
                return false;
            }
            OnPublicationSection onPublicationSection = (OnPublicationSection) other;
            return g76.L(this.publicationPostSectionData, onPublicationSection.publicationPostSectionData) && g76.L(this.publicationPromotionSectionData, onPublicationSection.publicationPromotionSectionData);
        }

        public final PublicationPostSectionData getPublicationPostSectionData() {
            return this.publicationPostSectionData;
        }

        public final PublicationPromotionSectionData getPublicationPromotionSectionData() {
            return this.publicationPromotionSectionData;
        }

        public final int hashCode() {
            PublicationPostSectionData publicationPostSectionData = this.publicationPostSectionData;
            int iHashCode = (publicationPostSectionData == null ? 0 : publicationPostSectionData.hashCode()) * 31;
            PublicationPromotionSectionData publicationPromotionSectionData = this.publicationPromotionSectionData;
            return iHashCode + (publicationPromotionSectionData != null ? publicationPromotionSectionData.hashCode() : 0);
        }

        public final String toString() {
            return "OnPublicationSection(publicationPostSectionData=" + this.publicationPostSectionData + ", publicationPromotionSectionData=" + this.publicationPromotionSectionData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationSections$Section;", "", "__typename", "", "onPublicationSection", "Lcom/medium/android/graphql/fragment/PublicationSections$OnPublicationSection;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationSections$OnPublicationSection;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationSection", "()Lcom/medium/android/graphql/fragment/PublicationSections$OnPublicationSection;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Section {
        private final String __typename;
        private final OnPublicationSection onPublicationSection;

        public Section(String str, OnPublicationSection onPublicationSection) {
            str.getClass();
            onPublicationSection.getClass();
            this.__typename = str;
            this.onPublicationSection = onPublicationSection;
        }

        public static /* synthetic */ Section copy$default(Section section, String str, OnPublicationSection onPublicationSection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = section.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationSection = section.onPublicationSection;
            }
            return section.copy(str, onPublicationSection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationSection getOnPublicationSection() {
            return this.onPublicationSection;
        }

        public final Section copy(String __typename, OnPublicationSection onPublicationSection) {
            __typename.getClass();
            onPublicationSection.getClass();
            return new Section(__typename, onPublicationSection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Section)) {
                return false;
            }
            Section section = (Section) other;
            return g76.L(this.__typename, section.__typename) && g76.L(this.onPublicationSection, section.onPublicationSection);
        }

        public final OnPublicationSection getOnPublicationSection() {
            return this.onPublicationSection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onPublicationSection.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Section(__typename=" + this.__typename + ", onPublicationSection=" + this.onPublicationSection + ")";
        }
    }

    public PublicationSections(String str, List<Section> list) {
        str.getClass();
        list.getClass();
        this.__typename = str;
        this.sections = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PublicationSections copy$default(PublicationSections publicationSections, String str, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationSections.__typename;
        }
        if ((i & 2) != 0) {
            list = publicationSections.sections;
        }
        return publicationSections.copy(str, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    public final List<Section> component2() {
        return this.sections;
    }

    public final PublicationSections copy(String __typename, List<Section> sections) {
        __typename.getClass();
        sections.getClass();
        return new PublicationSections(__typename, sections);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationSections)) {
            return false;
        }
        PublicationSections publicationSections = (PublicationSections) other;
        return g76.L(this.__typename, publicationSections.__typename) && g76.L(this.sections, publicationSections.sections);
    }

    public final List<Section> getSections() {
        return this.sections;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.sections.hashCode() + (this.__typename.hashCode() * 31);
    }

    public final String toString() {
        return ka1.s("PublicationSections(__typename=", this.__typename, ", sections=", ")", this.sections);
    }
}
