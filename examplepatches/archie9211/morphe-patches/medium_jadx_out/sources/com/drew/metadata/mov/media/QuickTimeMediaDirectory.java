package com.drew.metadata.mov.media;

import com.drew.metadata.mov.QuickTimeDirectory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class QuickTimeMediaDirectory extends QuickTimeDirectory {
    public static final int TAG_CREATION_TIME = 20481;
    public static final int TAG_DURATION = 20483;
    public static final int TAG_MODIFICATION_TIME = 20482;

    public static void addQuickTimeMediaTags(HashMap<Integer, String> map) {
        lv8.x(TAG_CREATION_TIME, map, "Creation Time", TAG_MODIFICATION_TIME, "Modification Time");
        map.put(Integer.valueOf(TAG_DURATION), "Duration");
    }
}
