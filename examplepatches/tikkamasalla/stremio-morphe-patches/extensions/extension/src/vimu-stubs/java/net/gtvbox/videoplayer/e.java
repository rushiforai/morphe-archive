package net.gtvbox.videoplayer;

/** Compile-only stub of Vimu's player interface (only the members IntroSkip uses). */
public interface e {
    long[] E();

    String y0(int index);

    int getCurrentPosition();

    int getDuration();

    boolean isPlaying();

    void seekTo(int positionMs);

    // Subtitle track API (PlayerFragment subtitle list and selection).
    int L();

    int n0();

    String G0(int index);

    void O0(int index);

    boolean q0();

    void L0(String path);
}
