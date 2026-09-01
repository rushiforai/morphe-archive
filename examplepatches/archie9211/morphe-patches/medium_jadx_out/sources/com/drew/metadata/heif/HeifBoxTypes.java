package com.drew.metadata.heif;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifBoxTypes {
    public static final String BOX_AUXILIARY_TYPE_PROPERTY = "auxC";
    public static final String BOX_COLOUR_INFO = "colr";
    public static final String BOX_FILE_TYPE = "ftyp";
    public static final String BOX_HANDLER = "hdlr";
    public static final String BOX_HVC1 = "hvc1";
    public static final String BOX_IMAGE_ROTATION = "irot";
    public static final String BOX_IMAGE_SPATIAL_EXTENTS = "ispe";
    public static final String BOX_ITEM_INFO = "iinf";
    public static final String BOX_ITEM_LOCATION = "iloc";
    public static final String BOX_ITEM_PROTECTION = "ipro";
    public static final String BOX_PIXEL_INFORMATION = "pixi";
    public static final String BOX_PRIMARY_ITEM = "pitm";
    private static final ArrayList<String> _boxList;

    static {
        ArrayList<String> arrayList = new ArrayList<>();
        _boxList = arrayList;
        arrayList.add("ftyp");
        arrayList.add(BOX_ITEM_PROTECTION);
        arrayList.add(BOX_PRIMARY_ITEM);
        arrayList.add(BOX_ITEM_INFO);
        arrayList.add(BOX_ITEM_LOCATION);
        arrayList.add("hdlr");
        arrayList.add(BOX_HVC1);
        arrayList.add(BOX_IMAGE_SPATIAL_EXTENTS);
        arrayList.add(BOX_AUXILIARY_TYPE_PROPERTY);
        arrayList.add(BOX_IMAGE_ROTATION);
        arrayList.add(BOX_COLOUR_INFO);
        arrayList.add(BOX_PIXEL_INFORMATION);
    }
}
