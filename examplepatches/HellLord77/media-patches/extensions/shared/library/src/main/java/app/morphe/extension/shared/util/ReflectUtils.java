package app.morphe.extension.shared.util;

import app.morphe.extension.shared.Logger;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Objects;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class ReflectUtils {
  @NotNull
  public static Field getField(
      @NotNull Class<?> self, @NotNull String name, @NotNull Class<?> type) {
    Field field = null;
    try {
      field = self.getField(name);
    } catch (NoSuchFieldException e) {
      for (var publicField : self.getFields()) {
        if (publicField.getType() == type) {

          if (field != null) {
            var finalField = field;
            Logger.printException(
                () ->
                    String.format(
                        "getField: %s -> %s, %s",
                        self.getName(), finalField.getName(), publicField.getName()));
            throw new NullPointerException();
          }
          field = publicField;
        }
      }
    }

    Field finalField = field;
    Logger.printDebug(
        () -> String.format("getField: %s.%s -> %s", self.getName(), name, finalField));
    return Objects.requireNonNull(field);
  }

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

  @NotNull
  public static Field getDeclaredField(
      @NotNull Class<?> self, @NotNull String name, @NotNull Class<?> type, int modifiers) {
    Field field = null;
    try {
      field = self.getDeclaredField(name);
    } catch (NoSuchFieldException e) {
      for (var declaredField : self.getDeclaredFields()) {
        if (declaredField.getType() == type && (declaredField.getModifiers() & modifiers) != 0) {

          if (field != null) {
            var finalField = field;
            Logger.printException(
                () ->
                    String.format(
                        "getDeclaredField: %s -> %s, %s",
                        self.getName(), finalField.getName(), declaredField.getName()));
          }
          field = declaredField;
        }
      }
    }

    Field finalField = field;
    Logger.printDebug(
        () -> String.format("getDeclaredField: %s.%s -> %s", self.getName(), name, finalField));
    return Objects.requireNonNull(field);
  }
}
