package com.drew.metadata.exif;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExifThumbnailDirectory extends ExifDirectoryBase {

    @Deprecated
    public static final int TAG_THUMBNAIL_COMPRESSION = 259;
    public static final int TAG_THUMBNAIL_LENGTH = 514;
    public static final int TAG_THUMBNAIL_OFFSET = 513;
    private static final HashMap<Integer, String> _tagNameMap;
    private final int _exifStartOffset;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
        map.put(513, "Thumbnail Offset");
        map.put(514, "Thumbnail Length");
    }

    public ExifThumbnailDirectory(int i) {
        this._exifStartOffset = i;
        setDescriptor(new ExifThumbnailDescriptor(this));
    }

    public final Integer getAdjustedThumbnailOffset() {
        Integer integer = getInteger(513);
        if (integer == null) {
            return null;
        }
        return Integer.valueOf(integer.intValue() + this._exifStartOffset);
    }

    public final int getExifStartOffset() {
        return this._exifStartOffset;
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Exif Thumbnail";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
