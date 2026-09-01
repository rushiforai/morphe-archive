package com.drew.metadata.mov.media;

import com.drew.metadata.mov.QuickTimeDirectory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeTimecodeDirectory extends QuickTimeDirectory {
    public static final int TAG_24_HOUR_MAX = 2;
    public static final int TAG_BACKGROUND_COLOR = 9;
    public static final int TAG_COUNTER = 4;
    public static final int TAG_DROP_FRAME = 1;
    public static final int TAG_FONT_NAME = 10;
    public static final int TAG_NEGATIVE_TIMES_OK = 3;
    public static final int TAG_TEXT_COLOR = 8;
    public static final int TAG_TEXT_FACE = 6;
    public static final int TAG_TEXT_FONT = 5;
    public static final int TAG_TEXT_SIZE = 7;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        QuickTimeMediaDirectory.addQuickTimeMediaTags(map);
        map.put(1, "Drop Frame");
        map.put(2, "24 Hour Max");
        lv8.x(3, map, "Negative Times OK", 4, "Counter");
        lv8.x(5, map, "Text Font", 6, "Text Face");
        lv8.x(7, map, "Text Size", 8, "Text Color");
        lv8.x(9, map, "Background Color", 10, "Font Name");
    }

    public QuickTimeTimecodeDirectory() {
        setDescriptor(new QuickTimeTimecodeDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Timecode";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
