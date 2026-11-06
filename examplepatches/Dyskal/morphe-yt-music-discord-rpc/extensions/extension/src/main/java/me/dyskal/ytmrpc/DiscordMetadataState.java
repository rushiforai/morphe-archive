package me.dyskal.ytmrpc;

import java.util.LinkedHashMap;

/** Worker-confined association of independently delivered player, queue, and MediaSession events. */
final class DiscordMetadataState {
    private final LinkedHashMap<String, DiscordNativeMetadata> nativeMetadata = new LinkedHashMap<>();
    private DiscordTrack metadata;
    private String videoId, metadataVideoId;

    void metadata(DiscordTrack value) {
        metadata = value;
        metadataVideoId = value == null ? null : value.videoId == null ? videoId : value.videoId;
        DiscordNativeMetadata current = nativeMetadata.get(videoId);
        if (current != null && !current.title.isEmpty() && value != null && value.videoId == null
                && !current.title.equals(value.title)) metadataVideoId = null;
        relink();
    }

    boolean videoId(String value) {
        if (DiscordTrack.videoId(value) == null || value.equals(videoId)) return false;
        videoId = value;
        relink();
        return true;
    }

    boolean nativeMetadata(DiscordNativeMetadata value) {
        boolean added = nativeMetadata.put(value.videoId, value) == null;
        while (nativeMetadata.size() > 4) nativeMetadata.remove(nativeMetadata.keySet().iterator().next());
        if (videoId == null) videoId = value.videoId;
        relink();
        return added;
    }

    private void relink() {
        DiscordNativeMetadata current = nativeMetadata.get(videoId);
        if (metadata != null && current != null && !current.title.isEmpty() && current.title.equals(metadata.title)
                && (metadata.videoId == null || videoId.equals(metadata.videoId))) metadataVideoId = videoId;
    }

    boolean isCurrent() { return videoId == null || videoId.equals(metadataVideoId); }
    DiscordTrack snapshot() { return metadata == null ? null : metadata.enrich(nativeMetadata.get(videoId), videoId); }
}
