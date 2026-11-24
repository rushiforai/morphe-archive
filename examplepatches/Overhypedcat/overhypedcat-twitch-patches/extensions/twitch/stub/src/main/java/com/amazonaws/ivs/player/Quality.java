package com.amazonaws.ivs.player;

/** Compile-time copy (the real one comes with the app); its constructor is for the extension's tests only. */
public final class Quality {
    private final String name;
    private final int height;
    private final float framerate;
    private final int bitrate;

    public Quality(String name, int height, float framerate, int bitrate) {
        this.name = name;
        this.height = height;
        this.framerate = framerate;
        this.bitrate = bitrate;
    }

    public String getName() {
        return name;
    }

    public int getHeight() {
        return height;
    }

    public int getWidth() {
        return height * 16 / 9;
    }

    public float getFramerate() {
        return framerate;
    }

    public int getBitrate() {
        return bitrate;
    }

    public String getCodecs() {
        return "avc1";
    }
}
