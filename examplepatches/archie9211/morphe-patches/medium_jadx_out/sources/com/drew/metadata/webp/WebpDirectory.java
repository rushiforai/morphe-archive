package com.drew.metadata.webp;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class WebpDirectory extends Directory {
    public static final String CHUNK_EXIF = "EXIF";
    public static final String CHUNK_ICCP = "ICCP";
    public static final String CHUNK_VP8 = "VP8 ";
    public static final String CHUNK_VP8L = "VP8L";
    public static final String CHUNK_VP8X = "VP8X";
    public static final String CHUNK_XMP = "XMP ";
    public static final String FORMAT = "WEBP";
    public static final int TAG_HAS_ALPHA = 3;
    public static final int TAG_IMAGE_HEIGHT = 1;
    public static final int TAG_IMAGE_WIDTH = 2;
    public static final int TAG_IS_ANIMATION = 4;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Image Height", 2, "Image Width");
        lv8.x(3, map, "Has Alpha", 4, "Is Animation");
    }

    public WebpDirectory() {
        setDescriptor(new WebpDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "WebP";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
