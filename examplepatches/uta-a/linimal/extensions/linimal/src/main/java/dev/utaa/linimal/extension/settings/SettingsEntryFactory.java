package dev.utaa.linimal.extension.settings;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.List;

/**
 * 設定項目モデルを、難読化後の名前ではなく constructor の形状から特定して生成します。
 *
 * <p>Android API に依存しないため、local JVM test で同じ形状の fixture を使って検証できます。
 * 生成に失敗した場合は例外を投げ、呼び出し側は元のリストをそのまま使います。</p>
 */
final class SettingsEntryFactory {
    private SettingsEntryFactory() {
    }

    /** モデルの constructor は 14 引数で、位置ごとの型が固定されています。 */
    static Constructor<?> findModelConstructor(List<?> items) {
        for (Object item : items) {
            if (item == null) {
                continue;
            }
            for (Constructor<?> constructor : item.getClass().getDeclaredConstructors()) {
                if (matchesModelShape(constructor.getParameterTypes())) {
                    return constructor;
                }
            }
        }
        throw new IllegalStateException("Settings item constructor was not found");
    }

    private static boolean matchesModelShape(Class<?>[] parameters) {
        if (parameters.length != 14) {
            return false;
        }
        Class<?> function2 = parameters[3];
        Class<?> function1 = parameters[9];
        return parameters[0] == String.class
                && parameters[1] == Integer.class
                && parameters[2] == int.class
                && function2.isInterface()
                && parameters[4] == function2
                && parameters[5] == Integer.class
                && parameters[6] == function2
                && parameters[7] == function2
                && parameters[8].isEnum()
                && function1.isInterface()
                && function1 != function2
                && parameters[10] == function1
                && !parameters[11].isInterface()
                && !parameters[11].isPrimitive()
                && parameters[12] == function2
                && parameters[13] == boolean.class;
    }

    /** 既に Linimal の項目が存在する場合は二重追加しません。 */
    static boolean containsKey(List<?> items, String settingKey) {
        for (Object item : items) {
            if (item == null) {
                continue;
            }
            for (Class<?> type = item.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) {
                        continue;
                    }
                    try {
                        field.setAccessible(true);
                        if (settingKey.equals(field.get(item))) {
                            return true;
                        }
                    } catch (RuntimeException | IllegalAccessException ignored) {
                        // 読めない field は判定に使いません。
                    }
                }
            }
        }
        return false;
    }

    /**
     * 遷移・検索用のタグを作ります。副作用のない既存インスタンスがあれば再利用し、
     * なければ同じ型を no-op の関数で生成します。他項目のタグを流用して別画面の
     * 遷移や計測イベントを発生させないための分岐です。
     */
    static Object createNeutralTag(List<?> items, Class<?> tagType, Object unit) {
        Object constructible = null;
        for (Object item : items) {
            Object tag = readFieldValue(item, tagType);
            if (tag == null) {
                continue;
            }
            if (!hasInstanceFields(tag.getClass())) {
                return tag;
            }
            if (constructible == null) {
                constructible = tag;
            }
        }
        if (constructible == null) {
            throw new IllegalStateException("Settings item tag was not found");
        }

        for (Constructor<?> constructor : constructible.getClass().getDeclaredConstructors()) {
            Class<?>[] parameters = constructor.getParameterTypes();
            if (parameters.length != 1 || !parameters[0].isInterface()) {
                continue;
            }
            try {
                constructor.setAccessible(true);
                return constructor.newInstance(constantProxy(parameters[0], unit));
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                // 次の候補を試します。
            }
        }
        throw new IllegalStateException("Settings item tag cannot be constructed");
    }

    private static boolean hasInstanceFields(Class<?> type) {
        for (Class<?> current = type; current != null && current != Object.class; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers()) && !field.isSynthetic()) {
                    return true;
                }
            }
        }
        return false;
    }

    private static Object readFieldValue(Object item, Class<?> type) {
        if (item == null) {
            return null;
        }
        for (Class<?> current = item.getClass(); current != null && current != Object.class; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (!type.isAssignableFrom(field.getType()) || Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object value = field.get(item);
                    if (value != null) {
                        return value;
                    }
                } catch (RuntimeException | IllegalAccessException ignored) {
                    // 読めない field は無視します。
                }
            }
        }
        return null;
    }

    /** 常に同じ値を返す関数。LINE 側からは通常の Kotlin 関数と同じように呼ばれます。 */
    static Object constantProxy(Class<?> functionInterface, Object value) {
        return Proxy.newProxyInstance(
                functionInterface.getClassLoader(),
                new Class<?>[] { functionInterface },
                new ConstantHandler(value, null));
    }

    /** 呼び出し時に action を実行し、Kotlin の Unit を返す関数。 */
    static Object actionProxy(Class<?> functionInterface, Object unit, Runnable action) {
        return Proxy.newProxyInstance(
                functionInterface.getClassLoader(),
                new Class<?>[] { functionInterface },
                new ConstantHandler(unit, action));
    }

    private static final class ConstantHandler implements InvocationHandler {
        private final Object value;
        private final Runnable action;

        ConstantHandler(Object value, Runnable action) {
            this.value = value;
            this.action = action;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] arguments) {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "hashCode":
                        return System.identityHashCode(proxy);
                    case "equals":
                        return arguments != null && arguments.length == 1 && proxy == arguments[0];
                    default:
                        return "LinimalSettingsFunction";
                }
            }
            if (action != null) {
                try {
                    action.run();
                } catch (RuntimeException ignored) {
                    // 画面を開けない場合も LINE 側の呼び出しは正常終了させます。
                }
            }
            return value;
        }
    }
}
