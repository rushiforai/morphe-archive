package slick.android;

import java.lang.reflect.Field;
import java.util.concurrent.ConcurrentHashMap;

final class Host {
  private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Field>> fields =
      new ConcurrentHashMap<>();

  private static Field field(Object object, String name) throws NoSuchFieldException {
    Class<?> type = object.getClass();
    ConcurrentHashMap<String, Field> byName =
        fields.computeIfAbsent(type, t -> new ConcurrentHashMap<>());
    Field f = byName.get(name);
    if (f != null) return f;
    f = type.getField(name);
    Field prior = byName.putIfAbsent(name, f);
    return prior != null ? prior : f;
  }

  static Object get(Object object, String name) throws ReflectiveOperationException {
    return object == null ? null : field(object, name).get(object);
  }

  static String string(Object object, String name) throws ReflectiveOperationException {
    Object v = get(object, name);
    return v == null ? "" : v.toString();
  }

  static void set(Object object, String name, Object value) throws ReflectiveOperationException {
    field(object, name).set(object, value);
  }
}
