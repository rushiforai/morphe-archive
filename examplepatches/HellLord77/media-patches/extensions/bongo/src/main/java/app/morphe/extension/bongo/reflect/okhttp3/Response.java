package app.morphe.extension.bongo.reflect.okhttp3;

import app.morphe.extension.shared.util.ReflectUtils;
import java.lang.reflect.Method;
import okhttp3.Request;
import org.jetbrains.annotations.Nullable;

public class Response {
  private static Method REQUEST =
      ReflectUtils.getMethod("okhttp3.Response", "request", Request.class);

  @Nullable
  public static Object request(Object self) throws Exception {
    if (REQUEST == null) {
      REQUEST = ReflectUtils.getMethod(self.getClass(), "request", Request.class);
    }

    return REQUEST.invoke(self);
  }
}
