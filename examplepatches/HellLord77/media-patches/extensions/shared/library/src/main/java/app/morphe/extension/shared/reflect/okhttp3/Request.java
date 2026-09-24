package app.morphe.extension.shared.reflect.okhttp3;

import app.morphe.extension.shared.reflect.Utils;
import java.lang.reflect.Method;
import okhttp3.HttpUrl;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Request {
  private static final Method URL = Utils.getMethod(okhttp3.Request.class, "url", HttpUrl.class);
  private static final Method HEADER =
      Utils.getMethod(okhttp3.Request.class, "header", String.class, String.class);

  @Nullable
  public static HttpUrl url(@NotNull okhttp3.Request self) throws Exception {
    return (HttpUrl) URL.invoke(self);
  }

  @Nullable
  public static String header(@NotNull okhttp3.Request self, @NotNull String name)
      throws Exception {
    return (String) HEADER.invoke(self, name);
  }
}
