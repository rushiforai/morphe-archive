package p;

/**
 * Stands in for {@code Lp/dpy;}, an entity filter: {@code a} is 1 ALBUM, 2 ARTIST, 3 AUDIOBOOK, 4 GENRE,
 * 5 PLAYLIST, 6 PROFILE or 7 TRACK.
 */
public final class dpy extends fpy {
    public final int a;

    public dpy(int a) {
        this.a = a;
    }
}
