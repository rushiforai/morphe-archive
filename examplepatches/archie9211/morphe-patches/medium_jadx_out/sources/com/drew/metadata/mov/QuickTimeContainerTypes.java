package com.drew.metadata.mov;

import com.squareup.wire.sjIw.ezwlgQm;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class QuickTimeContainerTypes {
    public static final String ATOM_COMPRESSED_MOVIE = "cmov";
    public static final String ATOM_MEDIA = "mdia";
    public static final String ATOM_MEDIA_BASE = "gmhd";
    public static final String ATOM_MEDIA_INFORMATION = "minf";
    public static final String ATOM_MEDIA_SUBTITLE = "sbtl";
    public static final String ATOM_MEDIA_TEXT = "text";
    public static final String ATOM_METADATA = "meta";
    public static final String ATOM_METADATA_LIST = "ilst";
    public static final String ATOM_MOVIE = "moov";
    public static final String ATOM_SAMPLE_TABLE = "stbl";
    public static final String ATOM_TRACK = "trak";
    public static final String ATOM_USER_DATA = "udta";
    private static final ArrayList<String> _containerList;

    static {
        ArrayList<String> arrayList = new ArrayList<>();
        _containerList = arrayList;
        arrayList.add("moov");
        arrayList.add("udta");
        arrayList.add("trak");
        arrayList.add("mdia");
        arrayList.add("minf");
        arrayList.add("stbl");
        arrayList.add("meta");
        arrayList.add("ilst");
        arrayList.add("cmov");
        arrayList.add(ezwlgQm.ABtFJ);
        arrayList.add("sbtl");
        arrayList.add("gmhd");
    }
}
