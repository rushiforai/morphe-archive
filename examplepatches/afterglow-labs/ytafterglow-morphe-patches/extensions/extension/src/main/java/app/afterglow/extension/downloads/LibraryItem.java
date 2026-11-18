package app.afterglow.extension.downloads;

/** Detached Vault metadata. Files are accessed with DownloadLibrary.uriForItem. */
public final class LibraryItem {
    public enum RepairState { HEALTHY, MISSING, RECOVERED_ORPHAN }
    public final String id, videoId, title, channelName, collectionName, thumbnailUrl;
    public final String relativePath, mimeType, formatSummary, sourceQuality, sourceType, originalFilename;
    public final long createdAt, fileSize, durationMs, lastPlayedAt;
    public final int height;
    public final boolean audioOnly, favorite;
    public final DownloadRequest.Kind kind;
    public final RepairState repairState;
    LibraryItem(String id, String videoId, String title, String channel, String collection, String thumbnail,
                String path, String mime, String summary, String quality, String source, String original,
                long created, long size, long duration, long played, int height, boolean favorite,
                DownloadRequest.Kind kind, RepairState repair) {
        this.id=id; this.videoId=videoId; this.title=title; channelName=channel; collectionName=collection;
        thumbnailUrl=thumbnail; relativePath=path; mimeType=mime; formatSummary=summary;
        sourceQuality=quality; sourceType=source; originalFilename=original; createdAt=created;
        fileSize=size; durationMs=duration; lastPlayedAt=played; this.height=height;
        this.favorite=favorite; this.kind=kind; audioOnly=kind==DownloadRequest.Kind.AUDIO; repairState=repair;
    }
    public boolean isMissing() { return repairState == RepairState.MISSING; }
}
