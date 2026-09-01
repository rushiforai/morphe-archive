package com.drew.metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Tag {
    private final Directory _directory;
    private final int _tagType;

    public Tag(int i, Directory directory) {
        this._tagType = i;
        this._directory = directory;
    }

    public final String getDescription() {
        Directory directory = this._directory;
        return directory._descriptor.getDescription(this._tagType);
    }

    public final String getDirectoryName() {
        return this._directory.getName();
    }

    public final String getTagName() {
        return this._directory.getTagName(this._tagType);
    }

    public final int getTagType() {
        return this._tagType;
    }

    public final String getTagTypeHex() {
        return String.format("0x%04x", Integer.valueOf(this._tagType));
    }

    public final boolean hasTagName() {
        return this._directory.hasTagName(this._tagType);
    }

    public final String toString() {
        String description = getDescription();
        if (description == null) {
            description = this._directory.getString(this._tagType) + " (unable to formulate description)";
        }
        return "[" + this._directory.getName() + "] " + getTagName() + " - " + description;
    }
}
