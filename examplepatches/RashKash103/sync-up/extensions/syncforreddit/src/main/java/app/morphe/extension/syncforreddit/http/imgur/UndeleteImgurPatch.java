/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit.http.imgur;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.HttpUrl;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Serves Imgur images the site no longer has from the Wayback Machine. Imgur purged a large
 * amount of older content, so links in old Reddit posts frequently 404.
 *
 * <p>Sync loads images through Glide rather than Volley, so this only sees them because the
 * interception patch hooks Glide's client as well.
 */
public class UndeleteImgurPatch extends PatchedditInterceptor {
    /** The letters Imgur appends to an id for its sized copies. */
    private static final String SIZE_SUFFIXES = "sbtmlh";

    private static final String[] MEDIA_EXTENSIONS =
            {".jpg", ".jpeg", ".png", ".gif", ".gifv", ".mp4", ".webp"};

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * @return An archived copy of the first image of the album this id belongs to, or null if
     *         it is not an album or nothing could be recovered.
     */
    @Nullable
    private static String albumCover(String contentUrl) throws IOException, JSONException {
        int slash = contentUrl.lastIndexOf('/');
        int dot = contentUrl.lastIndexOf('.');
        if (slash < 0 || dot <= slash + 1) {
            return null;
        }

        String id = contentUrl.substring(slash + 1, dot);
        // Sync asks for a sized copy of the cover as well, and the suffix is not part of the
        // album's id.
        if ((id.length() == 6 || id.length() == 8)
                && SIZE_SUFFIXES.indexOf(id.charAt(id.length() - 1)) >= 0) {
            id = id.substring(0, id.length() - 1);
        }

        List<JSONObject> images = ImgurAlbum.imagesOf(id);
        if (images.isEmpty()) {
            return null;
        }

        String cover = images.get(0).optString("link", "");
        if (cover.isEmpty()) {
            return null;
        }
        Logger.printInfo(() -> "Showing the first image of album " + contentUrl);
        return cover;
    }

    /**
     * Imgur names a sized copy by appending one letter to the id, and ids themselves are five
     * or seven characters, so a six or eight character one ending in a size letter is a sized
     * copy rather than an image in its own right.
     */
    @Nullable
    private static String withoutSizeSuffix(String contentUrl) {
        int slash = contentUrl.lastIndexOf('/');
        int dot = contentUrl.lastIndexOf('.');
        if (slash < 0 || dot <= slash + 1) {
            return null;
        }

        String id = contentUrl.substring(slash + 1, dot);
        if (id.length() != 6 && id.length() != 8) {
            return null;
        }
        if (SIZE_SUFFIXES.indexOf(id.charAt(id.length() - 1)) < 0) {
            return null;
        }

        return contentUrl.substring(0, slash + 1)
                + id.substring(0, id.length() - 1)
                + contentUrl.substring(dot);
    }

    /**
     * Imgur mostly does not answer a removed image with a 404. It redirects to a placeholder
     * image carrying the words "The image you are requesting does not exist or is no longer
     * available", which arrives as a perfectly ordinary 200 and gets displayed as the picture.
     */
    private static boolean isMissing(HttpUrl requested, Response response) {
        if (response.code() == HttpURLConnection.HTTP_NOT_FOUND) {
            return true;
        }
        // The request the response came from, which after a redirect is the placeholder.
        if (response.request().url().encodedPath().startsWith("/removed.")) {
            return true;
        }

        // A video Imgur no longer holds is answered with a redirect to its front page, which is
        // an ordinary 200 by the time it arrives here. Judging that by where it landed would
        // look at a path that is not media at all, so the address originally asked for is what
        // decides. Nothing downstream can do anything with the page: the player reports that it
        // recognises no format, and Glide fails to pull a frame out of it.
        String contentType = response.header("Content-Type", "");
        return isMedia(requested.encodedPath())
                && contentType != null && contentType.startsWith("text/");
    }

    private static boolean isMedia(String path) {
        String lower = path.toLowerCase(Locale.ROOT);
        for (String extension : MEDIA_EXTENSIONS) {
            if (lower.endsWith(extension)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isVideo(String path) {
        String lower = path.toLowerCase(Locale.ROOT);
        return lower.endsWith(".mp4") || lower.endsWith(".gifv");
    }

    /**
     * Imgur serves a video under several extensions for the same id, and which one is archived
     * is not the one being asked for. A .gifv is a page wrapping the video, so a capture of it
     * is of no use to a thumbnail; the still Imgur generates or the video itself both are.
     *
     * @return The addresses worth asking the archive about, in order of preference.
     */
    private static List<String> videoCandidates(HttpUrl url) {
        String path = url.encodedPath();
        int dot = path.lastIndexOf('.');
        String id = path.substring(1, dot);

        // The sized copy of a video still carries the suffix, and it is not part of the id.
        // Only a length that is one over an ordinary id can be one, since plenty of ids end in
        // one of those letters in their own right.
        if ((id.length() == 6 || id.length() == 8)
                && SIZE_SUFFIXES.indexOf(id.charAt(id.length() - 1)) >= 0) {
            id = id.substring(0, id.length() - 1);
        }

        String base = url.scheme() + "://" + url.host() + "/" + id;
        List<String> candidates = new ArrayList<>();

        // The video first, whatever was asked for. A .gifv is the address Sync uses for the
        // player as well as for the thumbnail, and answering it with a still leaves the player
        // reporting that nothing can read the stream. A video serves both: Glide pulls a frame
        // out of it for the thumbnail. The still is only worth having where no video survives.
        candidates.add(base + ".mp4");
        if (!path.toLowerCase(Locale.ROOT).endsWith(".mp4")) {
            candidates.add(base + ".jpg");
        }
        return candidates;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        if (!url.host().endsWith("imgur.com")) {
            return chain.proceed(request);
        }

        Response response = chain.proceed(request);

        if (!isMissing(url, response)) {
            return response;
        }

        String contentUrl = url.toString();
        String snapshot;
        try {
            if (isVideo(url.encodedPath())) {
                snapshot = null;
                for (String candidate : videoCandidates(url)) {
                    snapshot = WaybackMachine.findSnapshot(candidate, true);
                    if (snapshot != null) {
                        break;
                    }
                }
                if (snapshot != null) {
                    return serve(chain, request, contentUrl, snapshot, response);
                }

                // Imgur answers a removed video with a placeholder image, and the player keeps
                // whatever it is handed: cached, it fails identically on every later attempt,
                // including ones made after the archive is reachable again. Saying the video is
                // gone fails the same way now and leaves nothing behind.
                Logger.printInfo(() -> "No archived copy of " + contentUrl);
                response.close();
                return gone(request);
            }

            snapshot = WaybackMachine.findSnapshot(contentUrl, true);

            // Sync asks for a sized copy in places such as the feed, and the archive rarely
            // holds those: it captured what pages linked to, which is the image itself. The
            // full image stands in perfectly well, since it is only being scaled down.
            if (snapshot == null) {
                String fullSize = withoutSizeSuffix(contentUrl);
                if (fullSize != null) {
                    Logger.printInfo(() -> "No archived copy of the sized " + contentUrl
                            + ", trying the full image");
                    snapshot = WaybackMachine.findSnapshot(fullSize, true);
                }
            }

            // An album has an id of its own, which is never an image, so asking the archive
            // for it finds nothing. Sync uses it anyway when showing an album post, so fall
            // back to the first image the album held.
            if (snapshot == null) {
                String cover = albumCover(contentUrl);
                if (cover != null) {
                    snapshot = WaybackMachine.findSnapshot(cover, true);
                }
            }
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not read the Wayback Machine index", ex);
            return response;
        } catch (IOException ex) {
            // The Wayback Machine being unreachable should leave the original 404 in place.
            Logger.printInfo(() -> "Wayback Machine request failed: " + ex);
            return response;
        }

        return snapshot == null
                ? missing(contentUrl, response)
                : serve(chain, request, contentUrl, snapshot, response);
    }

    /**
     * Deliberately not a 404, which Sync takes as a dead link worth telling the user about.
     */
    private static Response gone(Request request) {
        return new Response.Builder()
                .message("Gone")
                .code(HttpURLConnection.HTTP_GONE)
                .protocol(Protocol.HTTP_1_1)
                .request(request)
                .body(ResponseBody.create("", null))
                .build();
    }

    private static Response missing(String contentUrl, Response response) {
        Logger.printInfo(() -> "No archived copy of " + contentUrl);
        return response;
    }

    private static Response serve(Chain chain, Request request, String contentUrl,
                                  String snapshot, Response response) throws IOException {
        // Closed only once a replacement is certain, so the original is still returned intact
        // on any of the paths that decline to use one.
        response.close();

        Logger.printInfo(() -> "Serving " + contentUrl + " from the Wayback Machine");
        return chain.proceed(request.newBuilder().url(snapshot).build());
    }
}
