/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * A feed, reel or story `Media` as the download path sees it. Every read goes through
 * {@link MediaBridge}, whose bodies the patch fills with direct calls into the release's model.
 */
public class MediaData {
    private final Object obj;

    public MediaData(Object obj) {
        this.obj = obj;
    }

    public Object getObject() {
        return this.obj;
    }

    public String getMediaPkId() throws Exception {
        String mediaPkId = MediaBridge.mediaPkId(this.obj);
        if (mediaPkId == null) throw new IllegalStateException("The media has no id");
        return mediaPkId;
    }

    public boolean isVideo() throws Exception {
        return MediaBridge.isVideo(this.obj);
    }

    private String getMediaExtension(MediaType mediaType) throws Exception {
        String imageExtension = ".jpg";
        String videoExtension = ".mp4";

        if (mediaType.equals(MediaType.ANY)) {
            return this.isVideo() ? videoExtension : imageExtension;
        }
        if (mediaType.equals(MediaType.VIDEO)) return videoExtension;
        return imageExtension;
    }

    public String getDownloadFilename(MediaType mediaType) throws Exception {
        return this.getMediaPkId() + this.getMediaExtension(mediaType);
    }

    /** The carousel children, or the media itself when it is not a carousel. */
    public List<Object> getMediaList() throws Exception {
        List mediaList = MediaBridge.carouselMedia(this.obj);
        if (mediaList != null) {
            return mediaList;
        }
        return Arrays.asList(this.obj);
    }

    public int getCarouselSize() throws Exception {
        return this.getMediaList().size();
    }

    public MediaData getMediaAt(int position) throws Exception {
        List<Object> mediaList = this.getMediaList();
        if (mediaList.isEmpty()) return new MediaData(this.obj);

        int safePosition = Math.max(0, Math.min(position, mediaList.size() - 1));
        return new MediaData(mediaList.get(safePosition));
    }

    public List<ImageData> getImageVariants() throws Exception {
        List<?> variants = MediaBridge.imageVariants(this.obj);
        if (variants == null) return new ArrayList<>();

        List<ImageData> imageList = new ArrayList<>(variants.size());
        for (Object item : variants) imageList.add(new ImageData(item));
        return imageList;
    }

    public String getVideoLink() throws Exception {
        List<?> variants = MediaBridge.videoVersions(this.obj);
        if (variants == null || variants.isEmpty()) {
            throw new IllegalStateException("The media has no video versions");
        }
        String url = MediaBridge.videoUrl(variants.get(0));
        if (url == null) throw new IllegalStateException("The video version has no url");
        return url;
    }

    public String getImageLink() throws Exception {
        List<ImageData> imageDataList = this.getImageVariants();
        if (imageDataList.isEmpty()) {
            throw new IllegalStateException("The media has no image versions");
        }
        return imageDataList.get(0).getUrl();
    }

    public String getMediaLink() throws Exception {
        return this.isVideo() ? this.getVideoLink() : this.getImageLink();
    }
}
