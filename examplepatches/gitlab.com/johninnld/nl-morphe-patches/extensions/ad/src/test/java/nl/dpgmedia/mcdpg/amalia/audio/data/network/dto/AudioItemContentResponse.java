package nl.dpgmedia.mcdpg.amalia.audio.data.network.dto;

import java.util.List;

/** Test double with the production 21-argument constructor signature. */
public final class AudioItemContentResponse {
    private final String audioUrl;
    private final String description;
    private final String descriptionHtml;
    private final long durationMs;
    private final Integer episode;
    private final Integer season;
    private final String episodeType;
    private final Boolean hasVodcast;
    private final String id;
    private final nl.dpgmedia.mcdpg.amalia.model.ImageDto image;
    private final String omnyStudioClipId;
    private final String organisationId;
    private final long publicationTimeStampMs;
    private final String title;
    private final String type;
    private final AmaliaPodcastShow show;
    private final String contentAccessCategoryString;
    private final AmaliaTtsDisclaimerResponse ttsDisclaimer;
    private final String urn;
    private final Vodcast vodcast;
    private final List<?> chapters;

    public AudioItemContentResponse(
        String audioUrl, String description, String descriptionHtml, long durationMs,
        Integer episode, Integer season, String episodeType, Boolean hasVodcast, String id,
        nl.dpgmedia.mcdpg.amalia.model.ImageDto image, String omnyStudioClipId,
        String organisationId, long publicationTimeStampMs, String title, String type,
        AmaliaPodcastShow show, String contentAccessCategoryString,
        AmaliaTtsDisclaimerResponse ttsDisclaimer, String urn, Vodcast vodcast, List<?> chapters) {
        this.audioUrl = audioUrl;
        this.description = description;
        this.descriptionHtml = descriptionHtml;
        this.durationMs = durationMs;
        this.episode = episode;
        this.season = season;
        this.episodeType = episodeType;
        this.hasVodcast = hasVodcast;
        this.id = id;
        this.image = image;
        this.omnyStudioClipId = omnyStudioClipId;
        this.organisationId = organisationId;
        this.publicationTimeStampMs = publicationTimeStampMs;
        this.title = title;
        this.type = type;
        this.show = show;
        this.contentAccessCategoryString = contentAccessCategoryString;
        this.ttsDisclaimer = ttsDisclaimer;
        this.urn = urn;
        this.vodcast = vodcast;
        this.chapters = chapters;
    }

    public String getType() {
        return type;
    }

    public String getUrn() {
        return urn;
    }

    public String getTitle() {
        return title;
    }

    public long getDurationMs() {
        return durationMs;
    }

    public long getPublicationTimeStampMs() {
        return publicationTimeStampMs;
    }

    public String getContentAccessCategoryString() {
        return contentAccessCategoryString;
    }

    public nl.dpgmedia.mcdpg.amalia.model.ImageDto getImage() {
        return image;
    }

    public static final class Vodcast {
    }
}
