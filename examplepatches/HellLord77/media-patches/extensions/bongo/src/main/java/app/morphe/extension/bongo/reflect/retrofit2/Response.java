package app.morphe.extension.bongo.reflect.retrofit2;

import app.morphe.extension.shared.util.ReflectUtils;
import java.lang.reflect.Method;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Response {
  private static final Method RAW = ReflectUtils.getMethod(retrofit2.Response.class, "raw", null);

  @Nullable
  public static Object raw(@NotNull Object self) throws Exception {
    return RAW.invoke(self);
  }
}
