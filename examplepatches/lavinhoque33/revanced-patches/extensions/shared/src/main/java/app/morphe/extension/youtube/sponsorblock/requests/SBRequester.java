package app.morphe.extension.youtube.sponsorblock.requests;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.Route;
import app.morphe.extension.shared.sponsorblock.requests.SBRoutes;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.sponsorblock.SponsorBlockSettings;
import app.morphe.extension.youtube.sponsorblock.SponsorBlockUtils;
import app.morphe.extension.youtube.sponsorblock.objects.SegmentCategory;
import app.morphe.extension.youtube.sponsorblock.objects.SponsorSegment;
import app.morphe.extension.youtube.sponsorblock.objects.SponsorSegment.SegmentVote;
import app.morphe.extension.youtube.sponsorblock.objects.UserStats;

public class SBRequester {
    public enum SegmentSubmitAction {
        HIGHLIGHT("poi"),
        SKIP("skip");

        public final String type;

        SegmentSubmitAction(String type) {
            this.type = type;
        }
    }

    private static final String TIME_TEMPLATE = "%.3f";

    /**
     * TCP timeout
     */
    private static final int TIMEOUT_TCP_DEFAULT_MILLISECONDS = 7000;

    /**
     * HTTP response timeout
     */
    private static final int TIMEOUT_HTTP_DEFAULT_MILLISECONDS = 10000;

    /**
     * Response code of a successful API call
     */
    private static final int HTTP_STATUS_CODE_SUCCESS = 200;

    @Nullable
    private static volatile UserStats lastFetchedStats;

    private SBRequester() {
    }

    private static void handleConnectionError(String toastMessage, @Nullable Exception ex) {
        if (Settings.SB_TOAST_ON_CONNECTION_ERROR.get()) {
            Utils.showToastShort(toastMessage);
        }
        if (ex != null) {
            Logger.printInfo(() -> toastMessage, ex);
        }
    }


    /** Independent, silent requests for stored downloads. */
    public enum DownloadStatus {OK, NONE, ERROR}

    public record DownloadSegments(DownloadStatus status, JSONArray segments, long durationMs) {
    }

    /** Does not depend on player initialization or emit connection-error toasts. */
    public static DownloadSegments getSegments(String videoId, List<String> categories) {
        Utils.verifyOffMainThread();
        HttpURLConnection connection = null;
        try {
            String encoded = URLEncoder.encode(new JSONArray(categories).toString(), StandardCharsets.UTF_8.name());
            connection = getConnectionFromRoute(SBRoutes.GET_SEGMENTS, videoId, encoded);
            connection.setConnectTimeout(2000);
            connection.setReadTimeout(2000);
            int status = connection.getResponseCode();
            if (status == 404) return new DownloadSegments(DownloadStatus.NONE, new JSONArray(), 0);
            if (status != HTTP_STATUS_CODE_SUCCESS) {
                return new DownloadSegments(DownloadStatus.ERROR, new JSONArray(), 0);
            }
            JSONArray segments = Requester.parseJSONArray(connection);
            long duration = 0;
            for (int index = 0; index < segments.length(); index++) {
                JSONObject segment = segments.optJSONObject(index);
                if (segment != null) duration = Math.max(duration, (long) (segment.optDouble("videoDuration", 0) * 1000));
            }
            return new DownloadSegments(segments.length() == 0 ? DownloadStatus.NONE : DownloadStatus.OK,
                    segments, duration);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Offline SponsorBlock lookup failed for " + videoId, ex);
            return new DownloadSegments(DownloadStatus.ERROR, new JSONArray(), 0);
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    public record PlaybackRequest(String videoId, String endpoint, String categories, long minDurationMs) {
    }

    private record SegmentData(SegmentCategory category, String uuid, long start, long end, boolean locked) {
    }

    /** Playback data only. Incomplete responses can be displayed but must never be reused. */
    public static final class PlaybackResponse {
        private static final SponsorSegment[] NO_SEGMENTS = new SponsorSegment[0];
        private static final PlaybackResponse EMPTY = new PlaybackResponse(true, List.of());

        private final boolean confirmed;
        private final List<SegmentData> segments;

        private PlaybackResponse(boolean confirmed, List<SegmentData> segments) {
            this.confirmed = confirmed;
            this.segments = List.copyOf(segments);
        }

        public boolean isConfirmed() {
            return confirmed;
        }

        public SponsorSegment[] newSegments() {
            if (segments.isEmpty()) {
                return NO_SEGMENTS;
            }

            SponsorSegment[] result = new SponsorSegment[segments.size()];
            for (int i = 0; i < result.length; i++) {
                SegmentData data = segments.get(i);
                result[i] = new SponsorSegment(data.category, data.uuid, data.start, data.end, data.locked);
            }
            return result;
        }
    }

    @NonNull
    public static PlaybackResponse fetchPlaybackSegments(PlaybackRequest request) {
        Utils.verifyOffMainThread();
        List<SegmentData> segments = List.of();
        try {
            HttpURLConnection connection = configureConnection(Requester.getConnectionFromRoute(request.endpoint(),
                    SBRoutes.GET_SEGMENTS, request.videoId(), request.categories()));
            final int responseCode = connection.getResponseCode();

            if (responseCode == HTTP_STATUS_CODE_SUCCESS) {
                JSONArray responseArray = Requester.parseJSONArray(connection);
                if (responseArray.length() != 0) {
                    segments = new ArrayList<>(responseArray.length());
                }
                boolean confirmed = true;
                for (int i = 0, length = responseArray.length(); i < length; i++) {
                    JSONObject obj = responseArray.getJSONObject(i);
                    JSONArray segment = obj.getJSONArray("segment");
                    final long start = (long) (segment.getDouble(0) * 1000);
                    final long end = (long) (segment.getDouble(1) * 1000);

                    String uuid = obj.getString("UUID");
                    final boolean locked = obj.getInt("locked") == 1;
                    String categoryKey = obj.getString("category");
                    SegmentCategory category = SegmentCategory.byCategoryKey(categoryKey);
                    if (category == null) {
                        confirmed = false;
                        Logger.printException(() -> "Received unknown category: " + categoryKey);
                    } else if ((end - start) >= request.minDurationMs() || category == SegmentCategory.HIGHLIGHT) {
                        segments.add(new SegmentData(category, uuid, start, end, locked));
                    }
                }

                PlaybackResponse response = confirmed && segments.isEmpty()
                        ? PlaybackResponse.EMPTY : new PlaybackResponse(confirmed, segments);
                Logger.printDebug(() -> "Downloaded " + response.segments.size() + " segments for " + request.videoId());
                runVipCheckInBackgroundIfNeeded();
                return response;
            }

            if (responseCode == Requester.HTTP_STATUS_CODE_NOT_FOUND) {
                Logger.printDebug(() -> "No segments found for video: " + request.videoId());
                return PlaybackResponse.EMPTY;
            }

            handleConnectionError(str("revanced_sb_sponsorblock_connection_failure_status", responseCode), null);
            connection.disconnect();
        } catch (SocketTimeoutException ex) {
            handleConnectionError(str("revanced_sb_sponsorblock_connection_failure_timeout"), ex);
        } catch (IOException ex) {
            handleConnectionError(str("revanced_sb_sponsorblock_connection_failure_generic"), ex);
        } catch (Exception ex) {
            Logger.printException(() -> "getSegments failure", ex);
        }

        return new PlaybackResponse(false, segments);
    }

    public static void submitSegments(String videoId, SegmentCategory category, SegmentSubmitAction action,
                                      long startTime, long endTime, long videoLength) {
        Utils.verifyOffMainThread();

        try {
            String privateUserId = SponsorBlockSettings.getSBPrivateUserID();
            String start = String.format(Locale.US, TIME_TEMPLATE, startTime / 1000f);
            String end = String.format(Locale.US, TIME_TEMPLATE, endTime / 1000f);
            String duration = String.format(Locale.US, TIME_TEMPLATE, videoLength / 1000f);

            HttpURLConnection connection = getConnectionFromRoute(SBRoutes.SUBMIT_SEGMENTS,
                    privateUserId, videoId, category.keyValue, start, end, duration, action.type);
            final int responseCode = connection.getResponseCode();

            if (responseCode == HTTP_STATUS_CODE_SUCCESS) {
                Utils.showToastLong(str("revanced_sb_submit_succeeded"));
                return;
            }

            String userErrorMessage = switch (responseCode) {
                case 409 -> str("revanced_sb_submit_failed_duplicate");
                case 403 -> str("revanced_sb_submit_failed_forbidden",
                        Requester.parseErrorStringAndDisconnect(connection));
                case 429 -> str("revanced_sb_submit_failed_rate_limit");
                case 400 -> str("revanced_sb_submit_failed_invalid",
                        Requester.parseErrorStringAndDisconnect(connection));
                default -> str("revanced_sb_submit_failed_unknown_error",
                        responseCode, connection.getResponseMessage());
            };

            // Message might be about the users account or an error too large to show in a toast.
            // Use a dialog instead.
            SponsorBlockUtils.showErrorDialog(userErrorMessage);
        } catch (SocketTimeoutException ex) {
            Logger.printDebug(() -> "Timeout", ex);
            Utils.showToastLong(str("revanced_sb_submit_failed_timeout"));
        } catch (IOException ex) {
            Logger.printDebug(() -> "IOException", ex);
            Utils.showToastLong(str("revanced_sb_submit_failed_unknown_error", 0, ex.getMessage()));
        } catch (Exception ex) {
            Logger.printException(() -> "failed to submit segments", ex); // Should never happen.
        } finally {
            lastFetchedStats = null; // Fetch updated stats if needed.
        }
    }

    public static void sendSegmentSkippedViewedRequest(SponsorSegment segment) {
        Utils.verifyOffMainThread();
        try {
            HttpURLConnection connection = getConnectionFromRoute(SBRoutes.VIEWED_SEGMENT, segment.UUID);
            final int responseCode = connection.getResponseCode();

            if (responseCode == HTTP_STATUS_CODE_SUCCESS) {
                Logger.printDebug(() -> "Successfully sent view count for segment: " + segment);
            } else {
                Logger.printDebug(() -> "Failed to sent view count for segment: " + segment.UUID
                        + " responseCode: " + responseCode); // debug level, no toast is shown
            }
        } catch (IOException ex) {
            Logger.printInfo(() -> "Failed to send view count", ex); // do not show a toast
        } catch (Exception ex) {
            Logger.printException(() -> "Failed to send view count request", ex); // should never happen
        }
    }

    public static void voteForSegmentOnBackgroundThread(SponsorSegment segment, SegmentVote voteOption) {
        voteOrRequestCategoryChange(segment, voteOption, null);
    }

    public static void voteToChangeCategoryOnBackgroundThread(SponsorSegment segment, SegmentCategory categoryToVoteFor) {
        voteOrRequestCategoryChange(segment, SegmentVote.CATEGORY_CHANGE, categoryToVoteFor);
    }

    private static void voteOrRequestCategoryChange(SponsorSegment segment, SegmentVote voteOption, SegmentCategory categoryToVoteFor) {
        Utils.runOnBackgroundThread(() -> {
            try {
                String segmentUuid = segment.UUID;
                String uuid = SponsorBlockSettings.getSBPrivateUserID();
                HttpURLConnection connection = (voteOption == SegmentVote.CATEGORY_CHANGE)
                        ? getConnectionFromRoute(SBRoutes.VOTE_ON_SEGMENT_CATEGORY, uuid, segmentUuid, categoryToVoteFor.keyValue)
                        : getConnectionFromRoute(SBRoutes.VOTE_ON_SEGMENT_QUALITY, uuid, segmentUuid, String.valueOf(voteOption.apiVoteType));
                final int responseCode = connection.getResponseCode();

                String userMessage;
                switch (responseCode) {
                    case HTTP_STATUS_CODE_SUCCESS:
                        Logger.printDebug(() -> "Vote success for segment: " + segment);
                        return;
                    case 403:
                        userMessage = str("revanced_sb_vote_failed_forbidden",
                                Requester.parseErrorStringAndDisconnect(connection));
                        break;
                    default:
                        userMessage = str("revanced_sb_vote_failed_unknown_error",
                                responseCode, connection.getResponseMessage());
                        break;
                }

                SponsorBlockUtils.showErrorDialog(userMessage);
            } catch (SocketTimeoutException ex) {
                Utils.showToastShort(str("revanced_sb_vote_failed_timeout"));
            } catch (IOException ex) {
                Utils.showToastShort(str("revanced_sb_vote_failed_unknown_error", 0, ex.getMessage()));
            } catch (Exception ex) {
                Logger.printException(() -> "failed to vote for segment", ex); // should never happen
            }
        });
    }

    /**
     * @return NULL, if stats fetch failed
     */
    @Nullable
    public static UserStats retrieveUserStats() {
        Utils.verifyOffMainThread();
        try {
            UserStats stats = lastFetchedStats;
            if (stats != null && !stats.isExpired()) {
                return stats;
            }

            String privateUserID = SponsorBlockSettings.getSBPrivateUserID();
            UserStats fetchedStats = new UserStats(privateUserID,
                    getJSONObject(SBRoutes.GET_USER_STATS, privateUserID));
            // Logger.printDebug(() -> "user stats: " + fetchedStats);
            lastFetchedStats = fetchedStats;
            return fetchedStats;
        } catch (IOException ex) {
            Logger.printInfo(() -> "failed to retrieve user stats", ex); // info level, do not show a toast
        } catch (Exception ex) {
            Logger.printException(() -> "failure retrieving user stats", ex); // should never happen
        }
        return null;
    }

    /**
     * @return NULL if the call was successful.  If unsuccessful, an error message is returned.
     */
    @Nullable
    public static String setUsername(String username) {
        Utils.verifyOffMainThread();
        try {
            HttpURLConnection connection = getConnectionFromRoute(SBRoutes.CHANGE_USERNAME, SponsorBlockSettings.getSBPrivateUserID(), username);
            final int responseCode = connection.getResponseCode();
            String responseMessage = connection.getResponseMessage();
            if (responseCode == HTTP_STATUS_CODE_SUCCESS) {
                return null;
            }
            return str("revanced_sb_stats_username_change_unknown_error", responseCode, responseMessage);
        } catch (Exception ex) { // should never happen
            Logger.printInfo(() -> "failed to set username", ex); // do not toast
            return str("revanced_sb_stats_username_change_unknown_error", 0, ex.getMessage());
        }
    }

    public static void runVipCheckInBackgroundIfNeeded() {
        if (!SponsorBlockSettings.userHasSBPrivateId()) {
            return; // User cannot be a VIP. User has never voted, created any segments, or has imported a SB user id.
        }
        long now = System.currentTimeMillis();
        if (now < (Settings.SB_LAST_VIP_CHECK.get() + TimeUnit.DAYS.toMillis(3))) {
            return;
        }
        Utils.runOnBackgroundThread(() -> {
            try {
                JSONObject json = getJSONObject(SBRoutes.IS_USER_VIP, SponsorBlockSettings.getSBPrivateUserID());
                boolean vip = json.getBoolean("vip");
                Settings.SB_USER_IS_VIP.save(vip);
                Settings.SB_LAST_VIP_CHECK.save(now);
            } catch (IOException ex) {
                Logger.printInfo(() -> "Failed to check VIP (network error)", ex); // info, so no error toast is shown
            } catch (Exception ex) {
                Logger.printException(() -> "Failed to check VIP", ex); // should never happen
            }
        });
    }

    // helpers

    private static HttpURLConnection getConnectionFromRoute(Route route, String... params) throws IOException {
        return configureConnection(Requester.getConnectionFromRoute(Settings.SB_API_URL.get(), route, params));
    }

    private static HttpURLConnection configureConnection(HttpURLConnection connection) {
        connection.setConnectTimeout(TIMEOUT_TCP_DEFAULT_MILLISECONDS);
        connection.setReadTimeout(TIMEOUT_HTTP_DEFAULT_MILLISECONDS);
        return connection;
    }

    private static JSONObject getJSONObject(Route route, String... params) throws IOException, JSONException {
        return Requester.parseJSONObject(getConnectionFromRoute(route, params));
    }
}
