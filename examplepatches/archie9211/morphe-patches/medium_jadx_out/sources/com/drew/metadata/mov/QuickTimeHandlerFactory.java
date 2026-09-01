package com.drew.metadata.mov;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.media.QuickTimeMusicHandler;
import com.drew.metadata.mov.media.QuickTimeSoundHandler;
import com.drew.metadata.mov.media.QuickTimeSubtitleHandler;
import com.drew.metadata.mov.media.QuickTimeTextHandler;
import com.drew.metadata.mov.media.QuickTimeTimecodeHandler;
import com.drew.metadata.mov.media.QuickTimeVideoHandler;
import com.drew.metadata.mov.metadata.QuickTimeDataHandler;
import com.drew.metadata.mov.metadata.QuickTimeDirectoryHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeHandlerFactory {
    private static final String HANDLER_METADATA_DATA = "mdta";
    private static final String HANDLER_METADATA_DIRECTORY = "mdir";
    private static final String HANDLER_MUSIC_MEDIA = "musi";
    private static final String HANDLER_SOUND_MEDIA = "soun";
    private static final String HANDLER_SUBTITLE_MEDIA = "sbtl";
    private static final String HANDLER_TEXT_MEDIA = "text";
    private static final String HANDLER_TIMECODE_MEDIA = "tmcd";
    private static final String HANDLER_VIDEO_MEDIA = "vide";
    private QuickTimeHandler<?> caller;

    public QuickTimeHandlerFactory(QuickTimeHandler<?> quickTimeHandler) {
        this.caller = quickTimeHandler;
    }

    public final QuickTimeHandler<?> getHandler(String str, Metadata metadata, QuickTimeContext quickTimeContext) {
        return str.equals(HANDLER_METADATA_DIRECTORY) ? new QuickTimeDirectoryHandler(metadata) : str.equals(HANDLER_METADATA_DATA) ? new QuickTimeDataHandler(metadata) : str.equals(HANDLER_SOUND_MEDIA) ? new QuickTimeSoundHandler(metadata, quickTimeContext) : str.equals(HANDLER_VIDEO_MEDIA) ? new QuickTimeVideoHandler(metadata, quickTimeContext) : str.equals(HANDLER_TIMECODE_MEDIA) ? new QuickTimeTimecodeHandler(metadata, quickTimeContext) : str.equals("text") ? new QuickTimeTextHandler(metadata, quickTimeContext) : str.equals("sbtl") ? new QuickTimeSubtitleHandler(metadata, quickTimeContext) : str.equals(HANDLER_MUSIC_MEDIA) ? new QuickTimeMusicHandler(metadata, quickTimeContext) : this.caller;
    }
}
