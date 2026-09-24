package app.morphe.extension.bongo.utils;

import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONUtil {
  @NotNull
  public static JSONObject translateTo(@NotNull JSONObject obj, @NotNull String lang)
      throws JSONException {
    return (JSONObject) translateToNode(obj, lang);
  }

  @NotNull
  private static Object translateToNode(@NotNull Object node, @NotNull String lang)
      throws JSONException {
    if (node instanceof JSONObject obj) {
      if (obj.length() == 3 && obj.has("en") && obj.has("bn") && obj.has("hi")) {
        return obj.get(lang);
      }

      var res = new JSONObject();
      var keys = obj.keys();
      while (keys.hasNext()) {
        var key = keys.next();
        res.put(key, translateToNode(obj.get(key), lang));
      }
      return res;
    }

    if (node instanceof JSONArray arr) {
      var res = new JSONArray();
      for (var idx = 0; idx < arr.length(); idx++) {
        res.put(translateToNode(arr.get(idx), lang));
      }
      return res;
    }

    return node;
  }

  @NotNull
  public static JSONObject snakeToCamel(@NotNull JSONObject obj) throws JSONException {
    return (JSONObject) snakeToCamelNode(obj);
  }

  @NotNull
  private static Object snakeToCamelNode(@NotNull Object node) throws JSONException {
    if (node instanceof JSONObject obj) {
      JSONObject res = new JSONObject();
      var keys = obj.keys();
      while (keys.hasNext()) {
        var key = keys.next();
        res.put(snakeToCamelString(key), snakeToCamelNode(obj.get(key)));
      }
      return res;
    }

    if (node instanceof JSONArray arr) {
      JSONArray res = new JSONArray();
      for (int idx = 0; idx < arr.length(); idx++) {
        res.put(snakeToCamelNode(arr.get(idx)));
      }

      return res;
    }

    return node;
  }

  @NotNull
  static String snakeToCamelString(@NotNull String string) {
    StringBuilder res = new StringBuilder();
    boolean cap = false;

    for (char chr : string.toCharArray()) {
      if (chr == '_') {
        cap = true;
      } else if (cap) {
        res.append(Character.toUpperCase(chr));
        cap = false;
      } else {
        res.append(chr);
      }
    }

    return res.toString();
  }
}
