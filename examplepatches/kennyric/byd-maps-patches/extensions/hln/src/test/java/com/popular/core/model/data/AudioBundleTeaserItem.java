package com.popular.core.model.data;

/** JVM test stub of the @Keep Moshi DTO; the real class keeps these getters. */
public final class AudioBundleTeaserItem {
    private final String urn;
    private final String title;
    private final Integer duration;
    private final Picture picture;
    private final boolean paidContent;
    private final boolean textToSpeechEnabled;

    public AudioBundleTeaserItem(String urn, String title, Integer duration, Picture picture,
                                 boolean paidContent, boolean textToSpeechEnabled) {
        this.urn = urn;
        this.title = title;
        this.duration = duration;
        this.picture = picture;
        this.paidContent = paidContent;
        this.textToSpeechEnabled = textToSpeechEnabled;
    }

    public String getUrn() { return urn; }
    public String getTitle() { return title; }
    public Integer getDuration() { return duration; }
    public Picture getPicture() { return picture; }
    public boolean getPaidContent() { return paidContent; }
    public boolean getTextToSpeechEnabled() { return textToSpeechEnabled; }
}
