/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.MessageLite;

import java.io.IOException;
import java.util.function.Consumer;

import app.morphe.extension.shared.utils.Utils;

import static app.morphe.extension.shared.utils.StringRef.str;

/** Correlates the native playlist picker's real edit response, never its command dispatch, with Keep. */
public final class SmartShuffleKeep {
    public interface Request {
        byte[] rvxKeepRequest();
    }

    private static final int ADD_TO_PLAYLIST = 69487224;
    private static final int VIDEO_ADDED_RESULT = 138418859;
    private static final int MAX_PROTO_BYTES = 1024 * 1024;
    private static Pending pending;

    private static final class Pending {
        final String videoId;
        final long occurrenceId;
        final Consumer<Boolean> confirmed;
        boolean dispatched;
        boolean confirmationDumped;
        Object request;
        String destination;

        Pending(String videoId, long occurrenceId, Consumer<Boolean> confirmed) {
            this.videoId = videoId;
            this.occurrenceId = occurrenceId;
            this.confirmed = confirmed;
        }
    }

    record Edit(String playlistId, String videoId) {}

    private SmartShuffleKeep() {}

    static void pick(String videoId, long occurrenceId, Consumer<Boolean> confirmed) {
        Pending selection = new Pending(videoId, occurrenceId, confirmed);
        Pending previous;
        synchronized (SmartShuffleKeep.class) {
            previous = pending;
            pending = selection;
        }
        log(selection, "picker-request replacing=" + (previous != null));
        if (previous != null) previous.confirmed.accept(false);

        Utils.runOnMainThread(() -> {
            synchronized (SmartShuffleKeep.class) {
                if (pending != selection) return;
            }
            try {
                SmartShuffleNative.dispatch(pickerCommand(videoId), () -> {
                    synchronized (SmartShuffleKeep.class) {
                        if (pending != selection) return false;
                        selection.dispatched = true;
                        return true;
                    }
                }, exception -> unavailable(selection, "command-dispatch-failed"));
            } catch (Exception exception) {
                unavailable(selection, "command-dispatch-failed");
            }
        });
    }

    /** Native ilj's client-built field-1 endpoint; the r3 construction was unchanged in r4. */
    static byte[] pickerCommand(String videoId) throws IOException {
        int payloadSize = CodedOutputStream.computeStringSize(1, videoId);
        byte[] bytes = new byte[CodedOutputStream.computeTagSize(ADD_TO_PLAYLIST)
                + CodedOutputStream.computeUInt32SizeNoTag(payloadSize) + payloadSize];
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeTag(ADD_TO_PLAYLIST, 2);
        output.writeUInt32NoTag(payloadSize);
        output.writeString(1, videoId);
        output.checkNoSpaceLeft();
        return bytes;
    }

    public static void cancelPending() {
        Pending selection;
        synchronized (SmartShuffleKeep.class) {
            selection = pending;
            pending = null;
        }
        if (selection != null) {
            log(selection, "cancelled");
            selection.confirmed.accept(false);
        }
    }

    /** Receives the fully built native edit request, not an optimistic selection or a request builder. */
    public static void onEditStarted(Object request) {
        Pending selection = currentPending();
        if (selection == null) return;

        try {
            synchronized (SmartShuffleKeep.class) {
                if (pending != selection || !selection.dispatched) return;
                if (selection.request != null) {
                    reject(selection, "request-already-owned");
                    return;
                }
            }

            byte[] bytes = request instanceof Request nativeRequest ? nativeRequest.rvxKeepRequest() : null;
            Edit edit = matchingEdit(selection, request, bytes);
            if (edit == null) return;

            synchronized (SmartShuffleKeep.class) {
                if (pending != selection || !selection.dispatched || selection.request != null) {
                    reject(selection, "request-owner-changed");
                    return;
                }
                selection.request = request;
                selection.destination = edit.playlistId;
            }
            log(selection, "edit-started");
        } catch (Exception exception) {
            reject(selection, "request-parse-failed");
        }
    }

    /** The success callback still carries the genuine request before native code reuses its parameter. */
    public static void onEditCompleted(Object request, Object response) {
        Pending selection = currentPending();
        if (selection == null) return;

        String rejection;
        synchronized (SmartShuffleKeep.class) {
            if (pending != selection) return;
            rejection = !selection.dispatched ? "response-before-dispatch"
                    : selection.request == null || selection.destination == null ? "request-not-owned"
                    : selection.request != request ? "request-identity-mismatch" : null;
        }
        if (rejection != null) {
            rejectCompletion(selection, rejection, request, response, null, null);
            return;
        }

        byte[] requestBytes = null;
        byte[] responseBytes = null;
        try {
            requestBytes = request instanceof Request nativeRequest ? nativeRequest.rvxKeepRequest() : null;
            Edit edit = matchingEdit(selection, request, requestBytes);
            if (edit == null) {
                rejectCompletion(selection, "request-mismatch", request, response, requestBytes, null);
                return;
            }
            if (!(response instanceof MessageLite message)) {
                rejectCompletion(selection, "response-not-protobuf", request, response, requestBytes, null);
                return;
            }
            responseBytes = message.toByteArray();
            boolean edited = confirmedEdit(responseBytes, edit.videoId, edit.playlistId);
            synchronized (SmartShuffleKeep.class) {
                if (pending != selection || !selection.dispatched) return;
                rejection = selection.request != request ? "request-identity-mismatch"
                        : !edit.playlistId.equals(selection.destination) ? "request-destination-mismatch"
                        : !edited ? "response-not-confirmed-add" : null;
                if (rejection == null) pending = null;
            }
            if (rejection != null) {
                rejectCompletion(selection, rejection, request, response, requestBytes, responseBytes);
                return;
            }
            log(selection, "result confirmed=true");
            selection.confirmed.accept(true);
        } catch (Exception exception) {
            rejectCompletion(selection, "response-parse-failed", request, response, requestBytes, responseBytes);
        }
    }

    private static Edit matchingEdit(Pending selection, Object request, byte[] bytes) throws IOException {
        if (!(request instanceof Request)) {
            reject(selection, "request-not-native-wrapper");
            return null;
        }
        Edit edit = bytes == null ? null : readEdit(bytes);
        if (edit == null) {
            reject(selection, "request-not-single-add-with-destination");
            return null;
        }
        if (!selection.videoId.equals(edit.videoId)) {
            reject(selection, "request-video-mismatch");
            return null;
        }
        return edit;
    }

    private static void rejectCompletion(Pending selection, String reason, Object request, Object response,
                                         byte[] requestBytes, byte[] responseBytes) {
        reject(selection, reason);
        synchronized (SmartShuffleKeep.class) {
            if (pending != selection || selection.confirmationDumped) return;
            selection.confirmationDumped = true;
        }
        SmartShuffleKeepDiagnostics.dump(selection.occurrenceId, selection.videoId, selection.destination,
                reason, request, response, requestBytes, responseBytes);
    }

    private static synchronized Pending currentPending() {
        return pending;
    }

    private static void log(Pending selection, String lifecycle) {
        SmartShuffleManager.debug(() -> "Smart Shuffle Keep picker occurrence=" + selection.occurrenceId
                + " video=" + SmartShuffleManager.logId(selection.videoId) + " " + lifecycle);
    }

    private static void reject(Pending selection, String reason) {
        log(selection, "rejected=" + reason);
    }

    private static void unavailable(Pending selection, String reason) {
        synchronized (SmartShuffleKeep.class) {
            if (pending != selection) return;
        }

        Utils.runOnMainThreadNowOrLater(() -> {
            synchronized (SmartShuffleKeep.class) {
                if (pending != selection) return;

                pending = null;
                reject(selection, reason);
                Utils.showToastShort(str("morphe_smart_shuffle_keep_unavailable"));
            }
            selection.confirmed.accept(false);
        });
    }


    static Edit readEdit(byte[] bytes) throws IOException {
        if (bytes.length > MAX_PROTO_BYTES) return null;

        CodedInputStream input = CodedInputStream.newInstance(bytes);
        String playlistId = "";
        String videoId = "";
        int destinations = 0;
        int actions = 0;
        for (int tag; (tag = input.readTag()) != 0;) {
            if (tag == (3 << 3 | 2)) {
                playlistId = input.readStringRequireUtf8();
                destinations++;
            } else if (tag == (2 << 3 | 2)) {
                videoId = addedVideo(input.readByteArray());
                actions++;
            } else {
                skip(input, tag);
            }
        }
        return destinations == 1 && !playlistId.isEmpty() && actions == 1 && !videoId.isEmpty()
                ? new Edit(playlistId, videoId) : null;
    }

    private static String addedVideo(byte[] bytes) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(bytes);
        int action = 0;
        int actions = 0;
        int videos = 0;
        String videoId = "";
        for (int tag; (tag = input.readTag()) != 0;) {
            if (tag == (6 << 3)) {
                action = input.readInt32();
                actions++;
            } else if (tag == (2 << 3 | 2)) {
                videoId = input.readStringRequireUtf8();
                videos++;
            } else {
                skip(input, tag);
            }
        }
        return action == 1 && actions == 1 && videos == 1 ? videoId : "";
    }

    static boolean confirmedEdit(byte[] bytes, String videoId, String playlistId) throws IOException {
        if (bytes.length > MAX_PROTO_BYTES) return false;

        CodedInputStream input = CodedInputStream.newInstance(bytes);
        int status = 0;
        int statuses = 0;
        int results = 0;
        int destinations = 0;
        boolean added = false;
        boolean destinationMatches = true;
        for (int tag; (tag = input.readTag()) != 0;) {
            if (tag == (2 << 3)) {
                status = input.readInt32();
                statuses++;
            } else if (tag == (12 << 3 | 2)) {
                results++;
                added = addedResult(input.readByteArray(), videoId);
            } else if (tag == (20 << 3 | 2)) {
                // Native response destination override; otherwise native uses the request's destination.
                destinations++;
                destinationMatches = playlistId.equals(input.readStringRequireUtf8());
            } else {
                skip(input, tag);
            }
        }
        return statuses == 1 && status == 1 && results == 1 && added
                && destinations <= 1 && destinationMatches;
    }

    private static boolean addedResult(byte[] bytes, String videoId) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(bytes);
        int results = 0;
        boolean added = false;
        for (int tag; (tag = input.readTag()) != 0;) {
            if (tag == (VIDEO_ADDED_RESULT << 3 | 2)) {
                results++;
                added = addedIdentity(input.readByteArray(), videoId);
            } else {
                skip(input, tag);
            }
        }
        return results == 1 && added;
    }

    private static boolean addedIdentity(byte[] bytes, String videoId) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(bytes);
        String addedVideo = "";
        String setVideoId = "";
        int videos = 0;
        int entries = 0;
        for (int tag; (tag = input.readTag()) != 0;) {
            if (tag == (1 << 3 | 2)) {
                addedVideo = input.readStringRequireUtf8();
                videos++;
            } else if (tag == (2 << 3 | 2)) {
                setVideoId = input.readStringRequireUtf8();
                entries++;
            } else {
                skip(input, tag);
            }
        }
        return videos == 1 && entries == 1 && videoId.equals(addedVideo) && !setVideoId.isEmpty();
    }

    private static void skip(CodedInputStream input, int tag) throws IOException {
        int wire = tag & 7;
        if (wire == 3 || wire == 4 || !input.skipField(tag)) {
            throw new IOException("Unexpected protobuf group");
        }
    }
}
