package de.mobile.archive;

import android.util.Log;
import java.io.IOException;
import java.util.List;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONArray;
import org.json.JSONObject;

public final class ApiArchiveInterceptor implements Interceptor {
    private static final String TAG = "MobileArchiveApi";
    private static final MediaType JSON_MEDIA_TYPE = MediaType.parse("application/json; charset=utf-8");

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request origRequest = chain.request();
        Request request = origRequest;
        boolean isInternalPrefetch = origRequest.header(ArchiveManager.HEADER_INTERNAL_PREFETCH) != null;
        if (isInternalPrefetch) {
            request = origRequest.newBuilder().removeHeader(ArchiveManager.HEADER_INTERNAL_PREFETCH).build();
        }

        ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !mgr.getConfig().isEnabled() || !"GET".equalsIgnoreCase(request.method())) {
            return chain.proceed(request);
        }

        HttpUrl url = request.url();
        String host = url.host();
        if (host == null || !host.contains("mobile.de")) {
            return chain.proceed(request);
        }

        List<String> segments = url.pathSegments();

        // 1. VIP Listing: .../a/{adId}
        String vipAdId = matchTwoSegmentId(segments, "a");
        if (vipAdId != null) {
            return handleVipRequest(chain, request, mgr, vipAdId, isInternalPrefetch);
        }

        // 2. Seller Contact: .../a-contact/{adId}
        String contactAdId = matchTwoSegmentId(segments, "a-contact");
        if (contactAdId != null) {
            return handleContactRequest(chain, request, mgr, contactAdId);
        }

        // 3. Parked Listings: .../my/parking-list
        if (isParkingListPath(segments)) {
            return handleParkingListRequest(chain, request, mgr);
        }

        return chain.proceed(request);
    }

    private Response handleVipRequest(Chain chain, Request request, ArchiveManager mgr, String adId, boolean isPrefetch) throws IOException {
        if (!isPrefetch && mgr.isForceArchiveActive(adId)) {
            String archived = mgr.loadListingJsonBlocking(adId);
            if (archived != null && !archived.isEmpty()) {
                String annotated = annotateArchivedListingJson(archived, "[Archiv] ");
                mgr.showToast("Archivierte Version #" + adId + " geladen");
                return buildSyntheticJsonResponse(request, annotated);
            }
        }

        Response response = null;
        IOException networkError = null;
        try {
            response = chain.proceed(request);
        } catch (IOException e) {
            networkError = e;
        }

        if (response != null && response.isSuccessful() && response.body() != null) {
            MediaType contentType = response.body().contentType();
            String bodyStr = response.body().string();
            if (bodyStr != null && bodyStr.trim().startsWith("{")) {
                mgr.archiveVipListingAsync(adId, bodyStr);
            }
            return response.newBuilder()
                    .body(ResponseBody.create(contentType != null ? contentType : JSON_MEDIA_TYPE, bodyStr != null ? bodyStr : ""))
                    .build();
        }

        if (!isPrefetch) {
            String archived = mgr.loadListingJsonBlocking(adId);
            if (archived != null && !archived.isEmpty()) {
                if (response != null) response.close();
                String annotated = annotateArchivedListingJson(archived, "[Archiv • Abgelaufen] ");
                mgr.showToast("Abgelaufenes Inserat #" + adId + " aus Archiv geladen");
                return buildSyntheticJsonResponse(request, annotated);
            }
        }

        if (networkError != null) {
            throw networkError;
        }
        return response;
    }

    private Response handleContactRequest(Chain chain, Request request, ArchiveManager mgr, String adId) throws IOException {
        if (mgr.isForceArchiveActive(adId)) {
            String archived = mgr.loadContactJsonBlocking(adId);
            if (archived != null && !archived.isEmpty()) {
                return buildSyntheticJsonResponse(request, archived);
            }
        }

        Response response = null;
        IOException networkError = null;
        try {
            response = chain.proceed(request);
        } catch (IOException e) {
            networkError = e;
        }

        if (response != null && response.isSuccessful() && response.body() != null) {
            MediaType contentType = response.body().contentType();
            String bodyStr = response.body().string();
            if (bodyStr != null && bodyStr.trim().startsWith("{")) {
                mgr.archiveContactAsync(adId, bodyStr);
            }
            return response.newBuilder()
                    .body(ResponseBody.create(contentType != null ? contentType : JSON_MEDIA_TYPE, bodyStr != null ? bodyStr : ""))
                    .build();
        }

        String archived = mgr.loadContactJsonBlocking(adId);
        if (archived != null && !archived.isEmpty()) {
            if (response != null) response.close();
            return buildSyntheticJsonResponse(request, archived);
        }

        if (networkError != null) {
            throw networkError;
        }
        return response;
    }

    private Response handleParkingListRequest(Chain chain, Request request, ArchiveManager mgr) throws IOException {
        Response response = chain.proceed(request);
        if (!response.isSuccessful() || response.body() == null) {
            return response;
        }

        MediaType contentType = response.body().contentType();
        String bodyStr = response.body().string();
        if (bodyStr == null || !bodyStr.trim().startsWith("{")) {
            return response.newBuilder()
                    .body(ResponseBody.create(contentType != null ? contentType : JSON_MEDIA_TYPE, bodyStr != null ? bodyStr : ""))
                    .build();
        }

        try {
            JSONObject root = new JSONObject(bodyStr);
            JSONArray items = root.optJSONArray("items");
            boolean modified = false;

            if (items != null) {
                for (int i = 0; i < items.length(); i++) {
                    JSONObject item = items.optJSONObject(i);
                    if (item == null) continue;

                    String status = item.optString("status", "");
                    JSONObject parking = item.optJSONObject("parking");
                    JSONObject ad = item.optJSONObject("ad");

                    String adId = null;
                    if (parking != null) adId = parking.optString("adId", null);
                    if ((adId == null || adId.isEmpty()) && ad != null) adId = ad.optString("id", null);
                    if (adId == null || adId.isEmpty()) continue;

                    boolean isExpired = "NOT_FOUND".equalsIgnoreCase(status)
                            || "LOCKED".equalsIgnoreCase(status)
                            || ad == null;

                    if (!isExpired) {
                        mgr.archiveParkedAdAsync(adId, ad.toString());
                    } else {
                        String archivedJson = mgr.loadListingJsonBlocking(adId);
                        if (archivedJson != null && !archivedJson.isEmpty()) {
                            try {
                                JSONObject archivedAd = new JSONObject(archivedJson);
                                annotateExpiredAdObject(archivedAd);
                                item.put("ad", archivedAd);
                                item.put("status", "OK");
                                modified = true;
                            } catch (Exception e) {
                                Log.w(TAG, "Failed restoring parked item " + adId, e);
                            }
                        }
                    }
                }
            }

            String out = modified ? root.toString() : bodyStr;
            return response.newBuilder()
                    .body(ResponseBody.create(contentType != null ? contentType : JSON_MEDIA_TYPE, out))
                    .build();
        } catch (Throwable t) {
            Log.e(TAG, "Error processing parking-list", t);
            return response.newBuilder()
                    .body(ResponseBody.create(contentType != null ? contentType : JSON_MEDIA_TYPE, bodyStr))
                    .build();
        }
    }

    private static String annotateArchivedListingJson(String json, String prefix) {
        try {
            JSONObject obj = new JSONObject(json);
            annotateAdObject(obj, prefix);
            return obj.toString();
        } catch (Exception e) {
            return json;
        }
    }

    private static void annotateExpiredAdObject(JSONObject obj) {
        annotateAdObject(obj, "[Archiv • Abgelaufen] ");
    }

    private static void annotateAdObject(JSONObject obj, String prefix) {
        try {
            String title = obj.optString("title", "");
            if (!title.isEmpty() && !title.startsWith("[Archiv")) {
                obj.put("title", prefix + title);
            }
            String shortTitle = obj.optString("shortTitle", "");
            if (!shortTitle.isEmpty() && !shortTitle.startsWith("[Archiv")) {
                obj.put("shortTitle", prefix + shortTitle);
            }
        } catch (Exception ignored) {
        }
    }

    private static Response buildSyntheticJsonResponse(Request request, String json) {
        return new Response.Builder()
                .request(request)
                .protocol(Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                .header("Content-Type", "application/json; charset=utf-8")
                .header("X-Mobile-Archive", "hit")
                .body(ResponseBody.create(JSON_MEDIA_TYPE, json))
                .build();
    }

    private static String matchTwoSegmentId(List<String> segments, String marker) {
        if (segments == null || segments.size() < 2) return null;
        int n = segments.size();
        if (marker.equals(segments.get(n - 2))) {
            String candidate = segments.get(n - 1);
            if (candidate != null && candidate.matches("[0-9]+")) {
                return candidate;
            }
        }
        return null;
    }

    private static boolean isParkingListPath(List<String> segments) {
        if (segments == null || segments.size() < 2) return false;
        int n = segments.size();
        return "my".equals(segments.get(n - 2)) && "parking-list".equals(segments.get(n - 1));
    }
}
