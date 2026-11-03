package dev.utaa.linimal.extension.core;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * LINE に同梱された Kotlin の Unit singleton を取得します。
 *
 * <p>LINE 26.16.0 では Kotlin 標準ライブラリも難読化され、Unit は {@code vs8.i0} になりました。
 * 版を更新したときに別のクラスを誤って返さないよう、{@code toString()} が
 * {@code kotlin.Unit} を返す自己型の static field だけを受け入れます。
 * 取得できない場合は null を返し、呼び出し側は戻り値を使わない経路だけを続行します。</p>
 */
public final class KotlinUnit {
    private static final String LINE_UNIT_CLASS = "vs8.i0";

    private KotlinUnit() {
    }

    public static Object get(ClassLoader classLoader) {
        return get(LINE_UNIT_CLASS, classLoader);
    }

    static Object get(String className, ClassLoader classLoader) {
        try {
            Class<?> type = Class.forName(className, false, classLoader);
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != type || !Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                field.setAccessible(true);
                Object value = field.get(null);
                if (value != null && "kotlin.Unit".equals(value.toString())) {
                    return value;
                }
            }
        } catch (Throwable ignored) {
            // 取得できない場合は null を返します。
        }
        return null;
    }
}
