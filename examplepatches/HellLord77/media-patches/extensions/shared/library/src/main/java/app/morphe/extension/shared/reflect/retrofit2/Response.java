package app.morphe.extension.shared.reflect.retrofit2;

import app.morphe.extension.shared.reflect.Utils;
import java.lang.reflect.Method;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Response {
  private static final Method RAW = Utils.getMethod(retrofit2.Response.class, "raw", null);

  @Nullable
  public static Object raw(@NotNull Object self) throws Exception {
    return RAW.invoke(self);
  }

  @Deprecated
  @Nullable
  public static okhttp3.Response raw(@NotNull retrofit2.Response<?> self) throws Exception {
    return (okhttp3.Response) raw((Object) self);
  }
}
