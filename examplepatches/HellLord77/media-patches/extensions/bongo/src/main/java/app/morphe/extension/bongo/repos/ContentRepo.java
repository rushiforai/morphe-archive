package app.morphe.extension.bongo.repos;

import app.morphe.extension.bongo.utils.JSONUtil;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import com.goebl.david.Webb;
import com.google.gson.Gson;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

public class ContentRepo {
  private static final Webb WEBB = Webb.create();
  private static final Gson GSON = new Gson();

  @Nullable
  public static <T> T getContentDetails(
      @NotNull String bongoId,
      @NotNull String authorization,
      @NotNull String acceptLanguage,
      @NotNull Class<T> classOfT)
      throws Exception {
    Logger.printInfo(() -> String.format("bongoId: %s", bongoId));
    var contentTrailer = getContentTrailer(bongoId, authorization, acceptLanguage);
    Logger.printDebug(() -> String.format("contentTrailer: %s", contentTrailer));

    var contentId = contentTrailer.getJSONObject("content").getString("id");
    Logger.printInfo(() -> String.format("contentId: %s", contentId));
    var content = getContent(contentId);
    Logger.printDebug(() -> String.format("content: %s", content));

    var contentDetails = buildContentDetails(contentTrailer, content, acceptLanguage);
    Logger.printDebug(() -> String.format("contentDetails: %s", contentDetails));

    return app.morphe.extension.shared.reflect.com.google.gson.Gson.fromJson(
        GSON, contentDetails.toString(), classOfT);
  }

  @NotNull
  private static JSONObject getContentTrailer(
      @NotNull String systemId, @NotNull String authorization, @NotNull String acceptLanguage) {
    Utils.verifyOffMainThread();
    var url =
        String.format(
            "https://api.bongo-solutions.com/ironman/api/v1/content/content-trailer/%s", systemId);

    return WEBB.get(url)
        .header(Webb.HDR_AUTHORIZATION, authorization)
        .header("Accept-Language", acceptLanguage)
        .header("Country-Code", "QkQ=")
        .ensureSuccess()
        .asJsonObject()
        .getBody();
  }

  @NotNull
  private static JSONObject getContent(@NotNull String contentId) {
    Utils.verifyOffMainThread();
    var url =
        String.format("https://api.bongo-solutions.com/ironman/api/v1/contents/%s", contentId);

    return WEBB.get(url).ensureSuccess().asJsonObject().getBody();
  }

  @NotNull
  private static JSONObject buildContentDetails(
      @NotNull JSONObject contentTrailer,
      @NotNull JSONObject content,
      @NotNull String acceptLanguage)
      throws JSONException {
    var translatedContent = JSONUtil.translateTo(content, acceptLanguage);
    var contentTrailerContent = contentTrailer.getJSONObject("content");
    translatedContent.put("cast_and_crew", contentTrailerContent.get("castAndCrew"));
    translatedContent.put("genre", contentTrailerContent.get("genre"));

    for (var key : new String[] {"shorts", "teaser", "vod"}) {
      try {
        var urls =
            translatedContent
                .getJSONObject(key)
                .getJSONObject("active_encode")
                .getJSONObject("urls");
        var keys = urls.keys();
        while (keys.hasNext()) {
          var urlKey = keys.next();
          var url = urls.getJSONObject(urlKey);
          url.put("url", String.format("https://vod.bongobd.com/vod/vod%s", url.getString("url")));
        }
      } catch (JSONException ignored) {
      }
    }

    var contentDetails = JSONUtil.snakeToCamel(translatedContent);
    try {
      var protectionScheme =
          contentDetails
              .getJSONObject("vod")
              .getJSONObject("activeEncode")
              .getJSONObject("protectionScheme");
      protectionScheme.put("drm_id", protectionScheme.remove("drmId"));
    } catch (JSONException ignored) {
    }
    return contentDetails;
  }
}
