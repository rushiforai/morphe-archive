package app.morphe.extension.kabbik.patches;

import android.content.Context;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("unused")
public class TempUserPatch {
  public static void onCreate() {
    var context = Utils.getContext();
    if (context == null) {
      return;
    }

    var preferences =
        context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
    if (!preferences.contains("flutter.loginUser")) {
      String loginUser;
      try {
        loginUser =
            getLoginUser(
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiOTc2MCIsInJvbGUiOjEsImlhdCI6MTY3Njg3NjI3OH0.Ll1915AVcmLzRJ473jyjWo_1NIWxneFMVA8OCcWRp4k",
                0);
      } catch (JSONException e) {
        Logger.printException(() -> "getLoginUser failure", e);
        return;
      }

      var editor = preferences.edit();
      editor.putString("flutter.loginUser", loginUser);
      editor.putString("flutter.isSubscribe", "1");
      editor.apply();
    }
    Logger.printDebug(() -> String.format("preferences: %s", preferences.getAll()));
  }

  @SuppressWarnings("SameParameterValue")
  @NotNull
  private static String getLoginUser(@NotNull String token, int userId) throws JSONException {
    return (new JSONObject())
        .put("token", token)
        .put("user", new JSONObject().put("id", userId))
        .toString();
  }
}
