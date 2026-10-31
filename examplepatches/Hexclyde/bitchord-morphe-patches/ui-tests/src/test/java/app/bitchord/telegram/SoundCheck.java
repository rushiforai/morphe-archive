package app.bitchord.telegram;

/** Fixture: the sound check needs the audio sink, which the UI tests don't have. */
final class SoundCheck {
    static volatile SoundCheck active;

    Integer seconds(String telegramId, String query) {
        return null;
    }

    void playing(String title, String artist, long durationMs, long positionMs) {}
}
