/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;

import java.io.IOException;

/** The exact native single-song queue command, not a playlist or one of its post-click commands. */
record OfflineQueueCommand(String videoId, int position, @Nullable byte[] watch, boolean playerOnly) {
    private static final int ENDPOINT = 163_162_354;
    /** Private unknown field on synthesized offline player actions, not on captured stock actions. */
    static final int PLAYER_ONLY_FIELD = 536_870_300;

    @Nullable
    static OfflineQueueCommand parse(byte[] root) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(root);
        OfflineQueueCommand command = null;
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (tag == ((ENDPOINT << 3) | 2)) {
                if (command != null) return null;
                command = readEndpoint(input);
                if (command == null) return null;
            } else if (!input.skipField(tag)) return null;
        }
        return command;
    }

    @Nullable
    private static OfflineQueueCommand readEndpoint(CodedInputStream input) throws IOException {
        int limit = input.pushLimit(input.readRawVarint32());
        String id = null;
        byte[] watch = null;
        int position = -1;
        boolean playerOnly = false;
        while (input.getBytesUntilLimit() > 0) {
            int tag = input.readTag();
            switch (tag) {
                case 10 -> {
                    if (id != null) return null;
                    int targetLimit = input.pushLimit(input.readRawVarint32());
                    boolean playlistSeen = false;
                    while (input.getBytesUntilLimit() > 0) {
                        int targetTag = input.readTag();
                        switch (targetTag) {
                            case 10 -> {
                                if (id != null) return null;
                                id = input.readStringRequireUtf8();
                            }
                            case 18 -> {
                                if (playlistSeen || !input.readStringRequireUtf8().isEmpty()) return null;
                                playlistSeen = true;
                            }
                            case 34 -> {
                                if (watch != null) return null;
                                watch = input.readByteArray();
                            }
                            default -> {
                                if (!input.skipField(targetTag)) return null;
                            }
                        }
                    }
                    input.popLimit(targetLimit);
                    if (id == null || !RawAudioFiles.validId(id)) return null;
                }
                case 16 -> {
                    if (position != -1) return null;
                    position = input.readEnum();
                    if (position != 1 && position != 2) return null;
                }
                case PLAYER_ONLY_FIELD << 3 -> {
                    if (playerOnly || !input.readBool()) return null;
                    playerOnly = true;
                }
                default -> {
                    if (!input.skipField(tag)) return null;
                }
            }
        }
        input.popLimit(limit);
        if (id == null || position == -1) return null;
        if (watch != null) {
            OfflineReplayLogic.WatchTarget target = OfflineReplayLogic.onlineWatchOf(watch);
            if (target == null || !id.equals(target.videoId()) || !target.playlistId().isEmpty()) return null;
        }
        return new OfflineQueueCommand(id, position, watch, playerOnly);
    }
}
