package com.amazonaws.ivs.player;

import java.util.Set;

public interface Player {
    enum State {
        BUFFERING,
        PLAYING,
        READY,
        IDLE,
        ENDED
    }

    State getState();

    boolean isMuted();

    void pause();

    void play();

    Set<Quality> getQualities();

    Quality getQuality();

    void setQuality(Quality quality);

    boolean isAutoQualityMode();

    void setAutoQualityMode(boolean enabled);

    String getSessionId();

    long getPosition();

    long getBufferedPosition();

    long getLiveLatency();

    long getBandwidthEstimate();

    Statistics getStatistics();
}
