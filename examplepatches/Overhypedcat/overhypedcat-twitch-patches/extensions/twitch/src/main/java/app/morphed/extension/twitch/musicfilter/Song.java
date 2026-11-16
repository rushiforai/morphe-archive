package app.morphed.extension.twitch.musicfilter;

/**
 * A song Shazam named. {@code offset} is where in the song (seconds) the sound Shazam heard began, by its own copy,
 * or NaN when it didn't say; it isn't part of which song it is.
 */
public final class Song {
    public final String key;
    public final String title;
    public final String artist;
    public final double offset;

    public Song(String key, String title, String artist) {
        this(key, title, artist, Double.NaN);
    }

    public Song(String key, String title, String artist, double offset) {
        this.key = key;
        this.title = title;
        this.artist = artist == null ? "" : artist;
        this.offset = offset;
    }

    public boolean hasOffset() {
        return !Double.isNaN(offset);
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof Song)) return false;
        Song song = (Song) other;
        return key.equals(song.key) && title.equals(song.title) && artist.equals(song.artist);
    }

    @Override
    public int hashCode() {
        return (key.hashCode() * 31 + title.hashCode()) * 31 + artist.hashCode();
    }

    @Override
    public String toString() {
        return artist.isEmpty() ? title : artist + " - " + title;
    }
}
