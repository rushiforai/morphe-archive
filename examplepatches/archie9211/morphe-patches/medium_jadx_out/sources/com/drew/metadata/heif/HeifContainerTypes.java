package com.drew.metadata.heif;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifContainerTypes {
    public static final String BOX_IMAGE_PROPERTY = "iprp";
    public static final String BOX_ITEM_PROPERTY = "ipco";
    public static final String BOX_MEDIA_DATA = "mdat";
    public static final String BOX_METADATA = "meta";
    private static final ArrayList<String> _containerList;

    static {
        ArrayList<String> arrayList = new ArrayList<>();
        _containerList = arrayList;
        arrayList.add("meta");
        arrayList.add(BOX_IMAGE_PROPERTY);
        arrayList.add(BOX_ITEM_PROPERTY);
    }
}
