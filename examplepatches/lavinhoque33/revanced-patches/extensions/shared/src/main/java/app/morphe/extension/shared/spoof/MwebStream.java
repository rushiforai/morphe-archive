/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4764
 * Copyright (C) 2026 lavinhoque33.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.spoof;

import android.net.Uri;
import android.os.SystemClock;

import com.google.android.libraries.youtube.media.interfaces.HttpHeader;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.patches.MediaHttpHeader;
import app.morphe.extension.shared.patches.MediaHttpRequest;
import app.morphe.extension.shared.patches.WebMediaRequest;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Reuses only the anonymous website session for this video in native SABR requests. */
public final class MwebStream {
    private static final int PART_MEDIA_HEADER = 20;
    private static final int PART_SABR_ERROR = 44;
    private static final int PART_SABR_SEEK = 45;
    private static final int MEDIA_HEADER_VIDEO_ID = 2;
    private static final int SABR_SEEK_SOURCE = 3;
    private static final int PLAYBACK_START = 10;
    private static final int SEGMENT_START = 11;
    private static final int ATTESTATION_PENDING = 2;
    private static final int ATTESTATION_REQUIRED = 3;
    private static final long FAILURE_BACKOFF_MS = 30_000;
    private static final long STREAM_LIFETIME_MS = 6 * 60 * 60 * 1000L;

    private static final Map<String, MwebStream> streams = Collections.synchronizedMap(
            Utils.createSizeRestrictedMap(100, true));
    private static final Map<String, Long> failedVideos = Collections.synchronizedMap(Utils.createSizeRestrictedMap(50));
    private static final Map<Object, Reader> readers = Collections.synchronizedMap(new WeakHashMap<>());

    private record Reader(MwebStream stream, SabrResponseReader reader) {
    }

    private final String videoId;
    private final MwebSiteSession.Session session;
    private final long deadline;
    private final SabrContexts contexts = new SabrContexts();
    private volatile boolean failed;
    private boolean sawStatus;
    private boolean confirmedMedia;

    private MwebStream(String videoId, MwebSiteSession.Session session) {
        this.videoId = videoId;
        this.session = session;
        long expiry = System.currentTimeMillis() + STREAM_LIFETIME_MS;
        String signedExpiry = Uri.parse(session.serverAbrStreamingUrl()).getQueryParameter("expire");
        try {
            if (signedExpiry != null) expiry = Math.min(expiry, Math.multiplyExact(Long.parseLong(signedExpiry), 1000));
        } catch (ArithmeticException | NumberFormatException ignored) {
            // Bound retention even when the server does not specify a usable expiry.
        }
        deadline = expiry;
    }

    public static MwebStream register(String videoId, MwebSiteSession.Session session) {
        MwebStream stream = new MwebStream(videoId, session);
        synchronized (streams) {
            streams.values().removeIf(old -> !old.isUsable());
            streams.put(session.streamId(), stream);
        }
        return stream;
    }

    public boolean isUsable() {
        return !failed && System.currentTimeMillis() < deadline;
    }

    public static boolean recentlyFailed(String videoId) {
        Long when = failedVideos.get(videoId);
        return when != null && SystemClock.elapsedRealtime() - when < FAILURE_BACKOFF_MS;
    }

    static MediaHttpRequest onMediaRequest(MediaHttpRequest request, Uri uri, byte[] body, Object callbacks) {
        String streamId = uri.getQueryParameter("id");
        MwebStream stream = streamId == null ? null : streams.get(streamId);
        if (stream == null || !stream.isUsable() || !MwebSiteSession.isMediaUrl(uri)) return request;
        if (!(request instanceof WebMediaRequest webRequest)) {
            stream.fail("media header bridge unavailable");
            return request;
        }
        try {
            MwebSiteSession.Session session = stream.session;
            byte[] webBody = SabrRequestBody.replaceClientInfo(body, session.clientInfo(), session.poToken(),
                    stream.contexts.toSend(), session.ustreamerConfig());
            MediaHttpRequest replacement = webRequest.patch_withBodyAndHeaders(webBody, headers(webRequest));
            readers.put(callbacks, new Reader(stream, new SabrResponseReader(stream::onPart,
                    PART_SABR_SEEK, MwebStream::isSegmentStartSeek, PART_MEDIA_HEADER, PART_SABR_ERROR,
                    SabrContexts.PART_SABR_CONTEXT_UPDATE, SabrContexts.PART_SABR_CONTEXT_SENDING_POLICY)));
            return replacement;
        } catch (IOException | RuntimeException | LinkageError ex) {
            stream.fail("could not build media request");
            return request;
        }
    }

    private static ArrayList<HttpHeader> headers(WebMediaRequest request) {
        ArrayList<HttpHeader> nativeHeaders = request.patch_getHeaders();
        ArrayList<HttpHeader> headers = new ArrayList<>(nativeHeaders == null ? 3 : nativeHeaders.size() + 3);
        if (nativeHeaders != null) {
            for (HttpHeader header : nativeHeaders) {
                String name = ((MediaHttpHeader) (Object) header).patch_getName();
                // Never forward native cookies, access tokens or visitor IDs to the anonymous session.
                if ("Content-Type".equalsIgnoreCase(name) || "Accept".equalsIgnoreCase(name)
                        || "Accept-Encoding".equalsIgnoreCase(name) || "Range".equalsIgnoreCase(name)) {
                    headers.add(header);
                }
            }
        }
        headers.add(new HttpHeader("User-Agent", ClientType.MWEB.getUserAgent()));
        headers.add(new HttpHeader("Origin", MwebSiteSession.ORIGIN));
        headers.add(new HttpHeader("Referer", MwebSiteSession.ORIGIN + "/"));
        return headers;
    }

    static void onMediaResponseChunk(Object callbacks, ByteBuffer chunk) {
        if (readers.isEmpty()) return;
        Reader state = readers.get(callbacks);
        if (state == null) return;
        try {
            int status = state.reader.read(chunk);
            state.stream.onResponse(status, state.reader.sawMedia());
        } catch (RuntimeException ex) {
            readers.remove(callbacks);
            state.stream.fail("invalid media response");
        }
    }

    private synchronized void onResponse(int status, boolean sawMedia) {
        if (status == ATTESTATION_REQUIRED || (status == ATTESTATION_PENDING && !sawStatus)) {
            fail("stream protection rejected the session");
        }
        if (status >= 0) sawStatus = true;
        if (sawMedia && !failed && !confirmedMedia) {
            confirmedMedia = true;
            Logger.printDebug(() -> "Mobile Web: received media for " + videoId);
        }
    }

    private synchronized void fail(String reason) {
        if (failed) return;
        failed = true;
        failedVideos.put(videoId, SystemClock.elapsedRealtime());
        Logger.printDebug(() -> "Mobile Web: " + reason + "; retry with native clients for " + videoId);
    }

    private void onPart(long partType, byte[] part) {
        if (partType == SabrContexts.PART_SABR_CONTEXT_UPDATE
                || partType == SabrContexts.PART_SABR_CONTEXT_SENDING_POLICY) {
            contexts.onPart(partType, part);
        } else if (partType == PART_SABR_ERROR) {
            fail("SABR error");
        } else if (partType == PART_MEDIA_HEADER) {
            try {
                CodedInputStream input = CodedInputStream.newInstance(part);
                for (int tag; (tag = input.readTag()) != 0; ) {
                    if (WireFormat.getTagFieldNumber(tag) == MEDIA_HEADER_VIDEO_ID) {
                        String mediaId = input.readString();
                        if (!mediaId.isEmpty() && !videoId.equals(mediaId)) fail("wrong media video");
                        break;
                    }
                    input.skipField(tag);
                }
            } catch (IOException ex) {
                fail("invalid media header");
            }
        }
    }

    private static boolean isSegmentStartSeek(ByteBuffer chunk, int offset, int length) {
        ByteBuffer view = chunk.duplicate();
        view.position(offset).limit(offset + length);
        try {
            CodedInputStream input = CodedInputStream.newInstance(view);
            for (int tag; (tag = input.readTag()) != 0; ) {
                if (WireFormat.getTagFieldNumber(tag) == SABR_SEEK_SOURCE) {
                    int source = input.readInt32();
                    return source == PLAYBACK_START || source == SEGMENT_START;
                }
                input.skipField(tag);
            }
        } catch (IOException ignored) {
            // Keep unfamiliar messages intact for native code.
        }
        return false;
    }
}
