/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/80ff578e21fce1b9825f2f7820d8d910e85f8822/extensions/amznmusic/stub/src/main/java/com/amazon/music/account/User.java
 */

package com.amazon.music.account;

@SuppressWarnings("unused")
public class User {
    public static class Benefit {
        public static Benefit[] values() {
            throw new UnsupportedOperationException();
        }
    }
}

