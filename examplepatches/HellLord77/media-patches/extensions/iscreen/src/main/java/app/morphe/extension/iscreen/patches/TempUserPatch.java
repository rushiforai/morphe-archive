package app.morphe.extension.iscreen.patches;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.compat.java.util.function.Consumer;
import app.morphe.extension.shared.compat.java.util.function.Supplier;
import com.google.gson.Gson;
import com.playoffstudio.modelmodule.LoginResponse;
import java.io.IOException;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import org.jetbrains.annotations.NotNull;

@SuppressWarnings("unused")
public class TempUserPatch {
  @NotNull
  public static String getRefreshToken(@NotNull com.rockstreamer.iscreen.util.PreferenceUtil self) {
    return getRefreshToken(self::getRefreshToken, self::setRefreshToken);
  }

  @NotNull
  public static String getRefreshToken(
      @NotNull com.rockstreamer.iscreentv.utils.PreferenceUtil self) {
    return getRefreshToken(self::getRefreshToken, self::setRefreshToken);
  }

  @NotNull
  private static String getRefreshToken(
      @NotNull Supplier<String> getRefreshToken, @NotNull Consumer<String> setRefreshToken) {
    var refreshToken = getRefreshToken.get();
    if (refreshToken.isEmpty()) {
      try {
        refreshToken = getRefreshToken();
        Utils.showToastShort(String.format("refreshToken: %s", refreshToken));

        setRefreshToken.accept(refreshToken);
      } catch (IOException e) {
        Logger.printException(() -> "getRefreshToken failure", e);
      }
    }

    String finalRefreshToken = refreshToken;
    Logger.printInfo(() -> String.format("refreshToken: %s", finalRefreshToken));
    return refreshToken;
  }

  @NotNull
  private static String getRefreshToken() throws IOException {
    var body = RequestBody.create("{\"platform\": \"iscreen\"}", MediaType.get("application/json"));
    var request =
        new Request.Builder()
            .url("https://api.rockstreamer.com/auth/token/temp")
            .post(body)
            .build();

    String string;
    try (var response = new OkHttpClient().newCall(request).execute()) {
      string = response.body().string();
      Logger.printDebug(() -> String.format("response: %s", string));
    }

    var loginResponse = new Gson().fromJson(string, LoginResponse.class);
    Logger.printInfo(() -> String.format("loginResponse: %s", loginResponse));
    return loginResponse.getRefreshToken();
  }
}
