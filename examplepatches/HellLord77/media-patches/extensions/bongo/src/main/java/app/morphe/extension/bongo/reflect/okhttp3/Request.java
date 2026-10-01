package app.morphe.extension.bongo.reflect.okhttp3;

import app.morphe.extension.shared.util.ReflectUtils;
import java.lang.reflect.Method;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Request {
  private static final Method HEADER =
      ReflectUtils.getMethod(okhttp3.Request.class, "header", String.class, String.class);

  @Nullable
  public static String header(@NotNull okhttp3.Request self, @NotNull String name)
      throws Exception {
    return (String) HEADER.invoke(self, name);
  }
}
