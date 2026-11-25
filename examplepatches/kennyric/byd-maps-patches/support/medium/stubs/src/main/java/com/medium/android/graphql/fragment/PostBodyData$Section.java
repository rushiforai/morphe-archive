// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class PostBodyData$Section {
    private final java.lang.String __typename;
    private final com.medium.android.graphql.fragment.SectionData sectionData;
    public PostBodyData$Section(java.lang.String arg0, com.medium.android.graphql.fragment.SectionData arg1) {
        java.util.Objects.requireNonNull(arg0);
        java.util.Objects.requireNonNull(arg1);
        this.__typename = arg0;
        this.sectionData = arg1;
    }
    public com.medium.android.graphql.fragment.SectionData getSectionData() { return this.sectionData; }
    public java.lang.String get__typename() { return this.__typename; }
}
