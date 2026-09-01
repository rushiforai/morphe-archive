package com.drew.metadata.mp4.media;

import com.drew.metadata.mp4.Mp4Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class Mp4MediaDirectory extends Mp4Directory {
    public static final int TAG_CREATION_TIME = 101;
    public static final int TAG_DURATION = 103;
    public static final int TAG_LANGUAGE_CODE = 104;
    public static final int TAG_MODIFICATION_TIME = 102;

    public static void addMp4MediaTags(HashMap<Integer, String> map) {
        lv8.x(101, map, "Creation Time", 102, "Modification Time");
        lv8.x(103, map, "Duration", 104, "ISO 639-2 Language Code");
    }
}
