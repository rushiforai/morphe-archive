package com.bitmovin.player.api;
public interface Player {
    boolean isPlaying();
    boolean isDestroyed();
    Object getSource();
}
