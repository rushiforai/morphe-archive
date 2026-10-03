package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
import android.widget.Toast;
import android.widget.ToggleButton;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/** Uses the selected fragment's own filter state, never a global active-tab callback. */
public final class QuickFilterToolbar {
    public static final int ID = 0x7e000002;
    private static final ArrayList<WeakReference<Object>> legacyBindings = new ArrayList<>();
    private QuickFilterToolbar() {}

    public static boolean supported(Context context) {
        try {
            String version = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0).versionName;
            return "0.8.10.191 dev".equals(version)
                    || "0.8.10.226 dev".equals(version)
                    || "0.8.10.241".equals(version)
                    || "0.8.10.242 dev".equals(version)
                    || "0.8.10.243 dev".equals(version);
        } catch (Exception ignored) {
            return false;
        }
    }

    public static boolean click(Object fragment, int id) {
        if (id != ID || fragment == null) return false;
        Activity activity = null;
        try {
            activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (activity == null || activity.isFinishing()) return true;
            if (!Haiagaru.compactQuickFilters()) {
                Toast.makeText(activity, "Haiagaru設定で「クイックフィルターをツールバーにまとめる」をONにしてください", Toast.LENGTH_LONG).show();
                return true;
            }
            String version = activity.getPackageManager()
                    .getPackageInfo(activity.getPackageName(), 0).versionName;
            if ("0.8.10.226 dev".equals(version)) {
                show226FilterDialog(fragment, activity);
                return true;
            }
            Object model = findResponseViewModel(fragment);
            if (model == null) throw new IllegalStateException("Response view model unavailable");
            String actionName = "0.8.10.241".equals(version) ? "d"
                    : "0.8.10.242 dev".equals(version) ? "b"
                    : "0.8.10.243 dev".equals(version) ? "e" : "d";
            Method toggle = null;
            Class<?> kind = null;
            for (Method method : model.getClass().getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!method.getName().equals(actionName) || parameters.length != 1
                        || !parameters[0].isEnum() || method.getReturnType() != void.class) continue;
                if (containsFilterKinds(parameters[0].getEnumConstants())) {
                    method.setAccessible(true);
                    toggle = method;
                    kind = parameters[0];
                    break;
                }
            }
            if (toggle == null || kind == null) throw new IllegalStateException("Quick-filter action unavailable");
            Object[] options = kind.getEnumConstants();
            String[] names = {"POPULAR", "LINK", "IMAGE", "MOVIE"};
            Object[] values = new Object[4];
            for (int i = 0; i < names.length; i++) {
                for (Object option : options) {
                    if (((Enum<?>) option).name().equals(names[i])) values[i] = option;
                }
                if (values[i] == null) throw new IllegalStateException("Missing filter " + names[i]);
            }
            final Object target = model;
            final Method action = toggle;
            final Object[] filterValues = values;
            final Activity owner = activity;
            new AlertDialog.Builder(activity).setTitle("フィルタ（再選択で解除）")
                    .setItems(new String[]{"人気レス", "リンク", "画像", "動画"}, (dialog, which) -> {
                        try {
                            action.invoke(target, filterValues[which]);
                        } catch (Exception error) {
                            Log.e("Haiagaru", "Quick filter failed", error);
                            Toast.makeText(owner, "フィルタを切り替えられませんでした", Toast.LENGTH_LONG).show();
                        }
                    }).setNegativeButton("閉じる", null).show();
        } catch (Exception error) {
            Log.e("Haiagaru", "Unable to open quick filters", error);
            if (activity != null) Toast.makeText(activity, "フィルタを開けませんでした", Toast.LENGTH_LONG).show();
        }
        return true;
    }

    /** 226 stores its model in a lazy provider and uses a Kotlin callback to toggle a filter. */
    private static void show226FilterDialog(Object fragment, Activity activity) throws Exception {
        java.lang.reflect.Field providerField = fragment.getClass().getDeclaredField("H");
        providerField.setAccessible(true);
        Object provider = providerField.get(fragment);
        if (provider == null) throw new IllegalStateException("226 response model provider unavailable");
        Method get = provider.getClass().getMethod("e");
        Object model = get.invoke(provider);
        if (model == null || !model.getClass().getName().equals("o.getImgAcceptedHeight")) {
            throw new IllegalStateException("226 response model unavailable");
        }
        ClassLoader loader = fragment.getClass().getClassLoader();
        Class<?> kind = Class.forName("o.setLastGoodStreamIdokhttp", false, loader);
        Class<?> callbackType = Class.forName("o.listener$setContentView$ComponentActivity", false, loader);
        java.lang.reflect.Constructor<?> constructor = callbackType.getDeclaredConstructor(Object.class);
        constructor.setAccessible(true);
        Object callback = constructor.newInstance(model);
        Method invoke = callbackType.getDeclaredMethod("invoke", Object.class);
        invoke.setAccessible(true);
        String[] names = {"POPULAR", "LINK", "IMAGE", "MOVIE"};
        Object[] options = kind.getEnumConstants();
        Object[] values = new Object[names.length];
        for (int i = 0; i < names.length; i++) {
            for (Object option : options) {
                if (((Enum<?>) option).name().equals(names[i])) values[i] = option;
            }
            if (values[i] == null) throw new IllegalStateException("226 filter missing: " + names[i]);
        }
        new AlertDialog.Builder(activity).setTitle("フィルタ（再選択で解除）")
                .setItems(new String[]{"人気レス", "リンク", "画像", "動画"}, (dialog, which) -> {
                    try {
                        invoke.invoke(callback, values[which]);
                    } catch (Exception error) {
                        Log.e("Haiagaru", "226 quick filter failed", error);
                        Toast.makeText(activity, "フィルタを切り替えられませんでした", Toast.LENGTH_LONG).show();
                    }
                }).setNegativeButton("閉じる", null).show();
    }

    /** Legacy 191 keeps its four quick filters as data-bound ToggleButtons. */
    public static boolean clickLegacy(Object fragment, int id) {
        if (id != ID || fragment == null) return false;
        Activity activity = null;
        try {
            activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (activity == null || activity.isFinishing()) return true;
            if (!Haiagaru.compactQuickFilters()) {
                Toast.makeText(activity, "Haiagaru設定でクイックフィルターをONにしてください", Toast.LENGTH_LONG).show();
                return true;
            }
            // The filter panel is owned by the activity layout, outside the
            // response fragment's own view on ChMate 191.
            Object binding = findLegacyFilterBinding(activity.getWindow().getDecorView());
            if (binding == null) binding = rememberedLegacyBinding(activity);
            ToggleButton[] buttons = legacyFilterButtons(binding);
            if (buttons == null) throw new IllegalStateException("Legacy quick-filter buttons unavailable");
            String[] labels = {"人気レス", "リンク", "画像", "動画"};
            boolean[] checked = new boolean[buttons.length];
            for (int index = 0; index < buttons.length; index++) checked[index] = buttons[index].isChecked();
            new AlertDialog.Builder(activity).setTitle("フィルタ")
                    .setMultiChoiceItems(labels, checked, (dialog, which, enabled) -> {
                        if (buttons[which].isChecked() != enabled) buttons[which].performClick();
                    })
                    .setNegativeButton("閉じる", null).show();
        } catch (Exception error) {
            Log.e("Haiagaru", "Unable to open legacy quick filters", error);
            if (activity != null) Toast.makeText(activity, "フィルタを開けませんでした", Toast.LENGTH_LONG).show();
        }
        return true;
    }

    private static ToggleButton[] legacyFilterButtons(Object binding) throws Exception {
        if (binding == null) return null;
        Class<?> type = Class.forName("o.j4", false, binding.getClass().getClassLoader());
        if (!type.isInstance(binding)) return null;
        // ChMate 191's bound labels map n=popular, m=link, inherited c=image,
        // and s=movie. Preserve the user-facing left-to-right grouping.
        String[] fields = {"n", "m", "s"};
        ToggleButton[] result = new ToggleButton[4];
        java.lang.reflect.Field inherited = Class.forName("o.getLastClickEvent", false,
                binding.getClass().getClassLoader()).getDeclaredField("c");
        inherited.setAccessible(true);
        ToggleButton image = (ToggleButton) inherited.get(binding);
        for (int i = 0; i < fields.length; i++) {
            java.lang.reflect.Field field = type.getDeclaredField(fields[i]);
            field.setAccessible(true);
            result[i < 2 ? i : 3] = (ToggleButton) field.get(binding);
        }
        result[2] = image;
        for (ToggleButton button : result) if (button == null) return null;
        return result;
    }

    /** Hide the entire legacy panel, including its heading and padding. */
    public static void hideLegacyFilterRow(Object binding) {
        if (binding == null || !Haiagaru.compactQuickFilters()) return;
        try {
            rememberLegacyBinding(binding);
            Class<?> rootBinding = Class.forName("o.getMraidName", false,
                    binding.getClass().getClassLoader());
            java.lang.reflect.Field root = rootBinding.getDeclaredField("a");
            root.setAccessible(true);
            Object view = root.get(binding);
            if (view instanceof android.view.View) {
                ((android.view.View) view).setVisibility(android.view.View.GONE);
            }
        } catch (Exception error) {
            Log.e("Haiagaru", "Unable to hide legacy quick-filter row", error);
        }
    }

    private static synchronized void rememberLegacyBinding(Object binding) {
        legacyBindings.removeIf(reference -> reference.get() == null || reference.get() == binding);
        legacyBindings.add(new WeakReference<>(binding));
    }

    private static synchronized Object rememberedLegacyBinding(Activity activity) {
        android.view.View decor = activity.getWindow().getDecorView();
        for (int index = legacyBindings.size() - 1; index >= 0; index--) {
            Object binding = legacyBindings.get(index).get();
            if (binding == null) {
                legacyBindings.remove(index);
                continue;
            }
            try {
                Class<?> rootType = Class.forName("o.getMraidName", false,
                        binding.getClass().getClassLoader());
                java.lang.reflect.Field root = rootType.getDeclaredField("a");
                root.setAccessible(true);
                Object view = root.get(binding);
                if (view instanceof android.view.View) {
                    android.view.View panel = (android.view.View) view;
                    if (panel.getRootView() == decor || belongsToActivity(panel.getContext(), activity)) {
                        return binding;
                    }
                }
            } catch (Exception ignored) { }
        }
        return null;
    }

    private static boolean belongsToActivity(Context context, Activity activity) {
        for (int depth = 0; context != null && depth < 8; depth++) {
            if (context == activity) return true;
            if (!(context instanceof ContextWrapper)) break;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return false;
    }

    private static Object findLegacyFilterBinding(android.view.View view) {
        Object binding = view.getTag(0x7f0a0106);
        if (binding != null && "o.j4".equals(binding.getClass().getName())) return binding;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Object found = findLegacyFilterBinding(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean containsFilterKinds(Object[] constants) {
        if (constants == null || constants.length != 4) return false;
        java.util.HashSet<String> names = new java.util.HashSet<>();
        for (Object constant : constants) names.add(((Enum<?>) constant).name());
        return names.contains("POPULAR") && names.contains("LINK")
                && names.contains("IMAGE") && names.contains("MOVIE");
    }

    private static Object findResponseViewModel(Object fragment) throws Exception {
        for (java.lang.reflect.Field field : fragment.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            Object value = field.get(fragment);
            if (value == null) continue;
            if (value.getClass().getName().contains("ResListFragmentViewModel")) return value;
            for (Method accessor : value.getClass().getMethods()) {
                if (accessor.getParameterTypes().length != 0
                        || !accessor.getName().equals("getValue")) continue;
                try {
                    Object resolved = accessor.invoke(value);
                    if (resolved != null && resolved.getClass().getName()
                            .contains("ResListFragmentViewModel")) return resolved;
                } catch (Exception ignored) { }
            }
        }
        return null;
    }
}
