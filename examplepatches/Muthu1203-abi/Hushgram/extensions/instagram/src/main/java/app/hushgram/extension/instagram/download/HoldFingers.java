/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

/**
 * How many fingers Hold to download waits for. {@link #TWO}, the default, keeps clear of Instagram's own
 * one-finger long press. {@link #THREE} is there for anyone who pinches with two fingers and holds still.
 */
public enum HoldFingers {
    TWO(2),
    THREE(3);

    public final int count;

    HoldFingers(int count) {
        this.count = count;
    }
}
