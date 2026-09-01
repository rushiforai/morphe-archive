package com.drew.metadata.jfif;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JfifDirectory extends Directory {
    public static final int TAG_RESX = 8;
    public static final int TAG_RESY = 10;
    public static final int TAG_THUMB_HEIGHT = 13;
    public static final int TAG_THUMB_WIDTH = 12;
    public static final int TAG_UNITS = 7;
    public static final int TAG_VERSION = 5;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(5, map, "Version", 7, "Resolution Units");
        lv8.x(10, map, "Y Resolution", 8, "X Resolution");
        lv8.x(12, map, "Thumbnail Width Pixels", 13, "Thumbnail Height Pixels");
    }

    public JfifDirectory() {
        setDescriptor(new JfifDescriptor(this));
    }

    @Deprecated
    public final int getImageHeight() {
        return getInt(8);
    }

    @Deprecated
    public final int getImageWidth() {
        return getInt(10);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return JfifReader.PREAMBLE;
    }

    public final int getResUnits() {
        return getInt(7);
    }

    public final int getResX() {
        return getInt(8);
    }

    public final int getResY() {
        return getInt(10);
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public final int getVersion() {
        return getInt(5);
    }
}
