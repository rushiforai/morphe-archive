package com.drew.metadata.pcx;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PcxDirectory extends Directory {
    public static final int TAG_BITS_PER_PIXEL = 2;
    public static final int TAG_BYTES_PER_LINE = 11;
    public static final int TAG_COLOR_PLANES = 10;
    public static final int TAG_HORIZONTAL_DPI = 7;
    public static final int TAG_HSCR_SIZE = 13;
    public static final int TAG_PALETTE = 9;
    public static final int TAG_PALETTE_TYPE = 12;
    public static final int TAG_VERSION = 1;
    public static final int TAG_VERTICAL_DPI = 8;
    public static final int TAG_VSCR_SIZE = 14;
    public static final int TAG_XMAX = 5;
    public static final int TAG_XMIN = 3;
    public static final int TAG_YMAX = 6;
    public static final int TAG_YMIN = 4;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Version", 2, "Bits Per Pixel");
        lv8.x(3, map, "X Min", 4, "Y Min");
        lv8.x(5, map, "X Max", 6, "Y Max");
        lv8.x(7, map, "Horizontal DPI", 8, "Vertical DPI");
        lv8.x(9, map, "Palette", 10, "Color Planes");
        lv8.x(11, map, "Bytes Per Line", 12, "Palette Type");
        lv8.x(13, map, "H Scr Size", 14, "V Scr Size");
    }

    public PcxDirectory() {
        setDescriptor(new PcxDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "PCX";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
