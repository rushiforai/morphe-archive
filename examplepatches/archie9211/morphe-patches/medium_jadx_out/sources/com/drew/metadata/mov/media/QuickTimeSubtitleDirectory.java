package com.drew.metadata.mov.media;

import com.drew.metadata.mov.QuickTimeDirectory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeSubtitleDirectory extends QuickTimeDirectory {
    public static final int TAG_ALL_SAMPLES_FORCED = 3;
    public static final int TAG_DEFAULT_TEXT_BOX = 4;
    public static final int TAG_FONT_FACE = 6;
    public static final int TAG_FONT_IDENTIFIER = 5;
    public static final int TAG_FONT_SIZE = 7;
    public static final int TAG_FOREGROUND_COLOR = 8;
    public static final int TAG_SOME_SAMPLES_FORCED = 2;
    public static final int TAG_VERTICAL_PLACEMENT = 1;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        QuickTimeMediaDirectory.addQuickTimeMediaTags(map);
        map.put(1, "Vertical Placement");
        map.put(2, "Some Samples Forced");
        lv8.x(3, map, "All Samples Forced", 4, "Default Text Box");
        lv8.x(5, map, "Font Identifier", 6, "Font Face");
        lv8.x(7, map, "Font Size", 8, "Foreground Color");
    }

    public QuickTimeSubtitleDirectory() {
        setDescriptor(new QuickTimeSubtitleDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Subtitle";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
