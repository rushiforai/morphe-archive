package dev.utaa.linimal.extension.settings;

import android.content.Context;
import android.content.Intent;

import dev.utaa.linimal.extension.core.KotlinUnit;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

/** LINE の設定一覧へ Linimal の項目を 1 件だけ追加する注入境界。 */
public final class SettingsEntryHooks {
    /** LINE 既存項目と同じ名前空間で衝突しない安定キー。 */
    static final String SETTING_KEY = "line-main-settings.linimal";
    static final String TITLE_RESOURCE_NAME = "linimal_settings_title";

    private static volatile Context applicationContext;

    private SettingsEntryHooks() {
    }

    /** internal core の bootstrap から、設定画面が生成されるより前に呼ばれます。 */
    public static void initialize(Context context) {
        if (context != null) {
            applicationContext = context.getApplicationContext();
        }
    }

    /**
     * 注入点。元のリストを変更せず、Linimal の項目を末尾に加えた新しいリストを返します。
     * 生成できない場合は元のリストをそのまま返すため、LINE の設定画面は元の内容を保ちます。
     */
    public static List<?> appendEntry(List<?> original) {
        try {
            return appendEntryOrOriginal(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    private static List<?> appendEntryOrOriginal(List<?> original) throws Exception {
        Context context = applicationContext;
        if (original == null || original.isEmpty() || context == null) {
            return original;
        }
        if (SettingsEntryFactory.containsKey(original, SETTING_KEY)) {
            return original;
        }

        final int titleResourceId = context.getResources().getIdentifier(
                TITLE_RESOURCE_NAME, "string", context.getPackageName());
        if (titleResourceId == 0) {
            return original;
        }

        Constructor<?> constructor = SettingsEntryFactory.findModelConstructor(original);
        Class<?>[] parameters = constructor.getParameterTypes();
        Class<?> function2 = parameters[3];
        Class<?> function1 = parameters[9];
        Object unit = KotlinUnit.get(constructor.getDeclaringClass().getClassLoader());
        Object tag = SettingsEntryFactory.createNeutralTag(original, parameters[11], unit);

        constructor.setAccessible(true);
        Object entry = constructor.newInstance(
                SETTING_KEY,
                // アイコンは追加せず、LINE の既存アイコン資産を参照しません。
                null,
                titleResourceId,
                SettingsEntryFactory.constantProxy(function2, null),
                SettingsEntryFactory.constantProxy(function2, Boolean.FALSE),
                null,
                SettingsEntryFactory.constantProxy(function2, Boolean.FALSE),
                // 状態バッジは LINE の既定と同じく表示しません。
                SettingsEntryFactory.constantProxy(function2, null),
                null,
                // 下位画面は持たず、項目のタップだけで Linimal の設定画面を開きます。
                SettingsEntryFactory.constantProxy(function1, null),
                SettingsEntryFactory.actionProxy(function1, unit, new OpenSettings(context)),
                tag,
                SettingsEntryFactory.constantProxy(function2, Boolean.TRUE),
                Boolean.TRUE);

        List<Object> entries = new ArrayList<>(original);
        entries.add(entry);
        return entries;
    }

    /** 明示 Intent で、非公開の Linimal 設定画面だけを開きます。 */
    private static final class OpenSettings implements Runnable {
        private final Context context;

        OpenSettings(Context context) {
            this.context = context;
        }

        @Override
        public void run() {
            Intent intent = new Intent(context, LinimalSettingsActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        }
    }
}
