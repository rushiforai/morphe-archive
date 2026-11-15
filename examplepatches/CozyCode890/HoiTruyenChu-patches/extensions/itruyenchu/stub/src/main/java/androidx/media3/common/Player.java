package androidx.media3.common;

import android.os.Looper;

/** Compile-time stub of the media3 Player interface, the real one is in the patched app. */
public interface Player {
    int STATE_READY = 3;

    int PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST = 1;

    int DISCONTINUITY_REASON_INTERNAL = 5;

    int COMMAND_PLAY_PAUSE = 1;
    int COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM = 6;
    int COMMAND_SEEK_TO_PREVIOUS = 7;
    int COMMAND_SEEK_TO_NEXT_MEDIA_ITEM = 8;
    int COMMAND_SEEK_TO_NEXT = 9;
    int COMMAND_GET_CURRENT_MEDIA_ITEM = 16;
    int COMMAND_GET_TIMELINE = 17;
    int COMMAND_GET_METADATA = 18;
    int COMMAND_RELEASE = 32;

    Looper getApplicationLooper();

    final class Commands {
        public Builder buildUpon() {
            throw new UnsupportedOperationException("Stub");
        }

        public static final class Builder {
            public Builder() {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder add(int command) {
                throw new UnsupportedOperationException("Stub");
            }

            public Commands build() {
                throw new UnsupportedOperationException("Stub");
            }
        }
    }
}
