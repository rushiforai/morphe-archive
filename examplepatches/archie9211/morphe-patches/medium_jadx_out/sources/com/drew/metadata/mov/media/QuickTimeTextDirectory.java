package com.drew.metadata.mov.media;

import com.drew.metadata.mov.QuickTimeDirectory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeTextDirectory extends QuickTimeDirectory {
    public static final int TAG_ANTI_ALIAS = 9;
    public static final int TAG_AUTO_SCALE = 1;
    public static final int TAG_BACKGROUND_COLOR = 12;
    public static final int TAG_CONTINUOUS_SCROLL = 7;
    public static final int TAG_DEFAULT_TEXT_BOX = 13;
    public static final int TAG_DROP_SHADOW = 8;
    public static final int TAG_FONT_FACE = 15;
    public static final int TAG_FONT_NUMBER = 14;
    public static final int TAG_FOREGROUND_COLOR = 16;
    public static final int TAG_HORIZONTAL_SCROLL = 5;
    public static final int TAG_JUSTIFICATION = 11;
    public static final int TAG_KEY_TEXT = 10;
    public static final int TAG_MOVIE_BACKGROUND_COLOR = 2;
    public static final int TAG_NAME = 17;
    public static final int TAG_REVERSE_SCROLL = 6;
    public static final int TAG_SCROLL_IN = 3;
    public static final int TAG_SCROLL_OUT = 4;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        QuickTimeMediaDirectory.addQuickTimeMediaTags(map);
        map.put(1, "Auto Scale");
        map.put(2, "Use Background Color");
        lv8.x(3, map, "Scroll In", 4, "Scroll Out");
        lv8.x(5, map, "Scroll Orientation", 6, "Scroll Direction");
        lv8.x(7, map, "Continuous Scroll", 8, "Drop Shadow");
        lv8.x(9, map, "Anti-aliasing", 10, "Display Text Background Color");
        lv8.x(11, map, "Alignment", 12, "Background Color");
        lv8.x(13, map, "Default Text Box", 14, "Font Number");
        lv8.x(15, map, "Font Face", 16, "Foreground Color");
        map.put(17, "Font Name");
    }

    public QuickTimeTextDirectory() {
        setDescriptor(new QuickTimeTextDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Text";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
