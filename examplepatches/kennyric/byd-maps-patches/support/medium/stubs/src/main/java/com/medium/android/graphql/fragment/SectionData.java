// Generated compile-only ABI view. Never include this definition in the extension.
package com.medium.android.graphql.fragment;
public final class SectionData {
    private final java.lang.String __typename;
    private final java.lang.String name;
    private final int startIndex;
    public SectionData(java.lang.String arg0, java.lang.String arg1, int arg2) {
        java.util.Objects.requireNonNull(arg0);
        this.__typename = arg0;
        this.name = arg1;
        this.startIndex = arg2;
    }
    public java.lang.String getName() { return this.name; }
    public int getStartIndex() { return this.startIndex; }
    public java.lang.String get__typename() { return this.__typename; }
}
