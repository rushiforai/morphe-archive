package app.morphe.extension.shared.reflect.com.google.gson;

import app.morphe.extension.shared.reflect.Utils;
import java.lang.reflect.Method;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Gson {
  private static final Method FROM_JSON =
      Utils.getMethod(
          com.google.gson.Gson.class, "fromJson", Object.class, String.class, Class.class);

  @SuppressWarnings("unchecked")
  @Nullable
  public static <T> T fromJson(
      @NotNull com.google.gson.Gson self, @Nullable String json, @NotNull Class<T> classOfT)
      throws Exception {
    return (T) FROM_JSON.invoke(self, json, classOfT);
  }
}
