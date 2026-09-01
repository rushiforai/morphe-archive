package com.drew.metadata.mov.media;

import com.drew.metadata.mov.QuickTimeDirectory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeSoundDirectory extends QuickTimeDirectory {
    public static final int TAG_AUDIO_FORMAT = 769;
    public static final int TAG_AUDIO_SAMPLE_RATE = 772;
    public static final int TAG_AUDIO_SAMPLE_SIZE = 771;
    public static final int TAG_NUMBER_OF_CHANNELS = 770;
    public static final int TAG_SOUND_BALANCE = 773;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        QuickTimeMediaDirectory.addQuickTimeMediaTags(map);
        map.put(769, "Format");
        map.put(770, "Number of Channels");
        lv8.x(771, map, "Sample Size", 772, "Sample Rate");
        map.put(773, "Balance");
    }

    public QuickTimeSoundDirectory() {
        setDescriptor(new QuickTimeSoundDescriptor(this));
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final String getName() {
        return "QuickTime Sound";
    }

    @Override // com.drew.metadata.mov.QuickTimeDirectory, com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
