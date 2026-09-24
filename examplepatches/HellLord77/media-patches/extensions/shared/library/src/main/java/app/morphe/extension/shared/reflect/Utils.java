package app.morphe.extension.shared.reflect;

import app.morphe.extension.shared.Logger;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Objects;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Utils {
  @Nullable
  public static Method getMethod(
      @NotNull String className,
      @NotNull String name,
      @Nullable Class<?> returnType,
      @NotNull Class<?>... parameterTypes) {
    try {
      return getMethod(Class.forName(className), name, returnType, parameterTypes);
    } catch (ClassNotFoundException e) {
      return null;
    }
  }

  @NotNull
  public static Method getMethod(
      @NotNull Class<?> self,
      @NotNull String name,
      @Nullable Class<?> returnType,
      @NotNull Class<?>... parameterTypes) {
    Method method = null;
    try {
      method = self.getMethod(name, parameterTypes);
    } catch (NoSuchMethodException e) {
      for (var publicMethod : self.getMethods()) {
        if ((returnType == null || publicMethod.getReturnType() == returnType)
            && Arrays.equals(publicMethod.getParameterTypes(), parameterTypes)) {

          if (method != null) {
            var finalMethod = method;
            Logger.printException(
                () ->
                    String.format(
                        "getMethod: %s -> %s, %s",
                        self.getName(), finalMethod.getName(), publicMethod.getName()));
            throw new NullPointerException();
          }
          method = publicMethod;
        }
      }
    }

    var finalMethod = method;
    Logger.printDebug(
        () -> String.format("getMethod: %s.%s -> %s", self.getName(), name, finalMethod));
    return Objects.requireNonNull(method);
  }
}
