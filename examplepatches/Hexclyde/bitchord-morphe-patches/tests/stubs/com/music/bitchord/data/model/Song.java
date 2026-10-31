package com.music.bitchord.data.model;

import java.util.List;

/** BitChord 1.8.1's Song constructor, for HostLibraryTest. */
public final class Song {
    public final String videoId, title, artist, thumbnailUrl, durationText, sourceQuality;
    public final QueueTier queueTier;
    public final boolean sourceHiRes;

    public Song(
            String videoId,
            String title,
            String artist,
            String thumbnailUrl,
            String durationText,
            String artistId,
            List<?> artists,
            String albumId,
            String albumName,
            boolean isVideo,
            boolean isVideoOrigin,
            String setVideoId,
            QueueTier queueTier,
            String queueEntryId,
            String radioName,
            String localUri,
            String downloadFormat,
            String localPath,
            Long localDateAddedSeconds,
            Long localDateModifiedSeconds,
            Integer trackNumber,
            String sourceQuality,
            boolean sourceHiRes,
            Boolean isExplicit,
            String playbackSource,
            PlaybackSourceType playbackSourceType,
            String playbackSourceId) {
        this.videoId = videoId;
        this.title = title;
        this.artist = artist;
        this.thumbnailUrl = thumbnailUrl;
        this.durationText = durationText;
        this.queueTier = queueTier;
        this.sourceQuality = sourceQuality;
        this.sourceHiRes = sourceHiRes;
    }
}
