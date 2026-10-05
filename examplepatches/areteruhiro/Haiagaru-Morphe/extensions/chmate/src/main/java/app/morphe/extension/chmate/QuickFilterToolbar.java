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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            showModelFilterDialog(activity, model, version,
                    which -> action.invoke(target, filterValues[which]));
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
        showModelFilterDialog(activity, model, "0.8.10.226 dev",
                which -> invoke.invoke(callback, values[which]));
    }

    private interface FilterToggle {
        void toggle(int index) throws Exception;
    }

    private static void showModelFilterDialog(Activity activity, Object model, String version,
            FilterToggle toggle)
            throws Exception {
        boolean[] checked = readModelFilterStates(model, version);
        if (checked == null) throw new IllegalStateException("Filter selection state unavailable");
        // AlertDialog mutates its checkedItems array before invoking this listener.
        boolean[] displayed = checked.clone();
        new AlertDialog.Builder(activity).setTitle("フィルタ")
                .setMultiChoiceItems(new String[]{"人気レス", "リンク", "画像", "動画"}, displayed,
                        (dialog, which, enabled) -> {
                            if (checked[which] == enabled) return;
                            try {
                                toggle.toggle(which);
                                checked[which] = enabled;
                            } catch (Exception error) {
                                Log.e("Haiagaru", "Quick filter failed", error);
                                ((AlertDialog) dialog).getListView().setItemChecked(which, checked[which]);
                                Toast.makeText(activity, "フィルタを切り替えられませんでした", Toast.LENGTH_LONG).show();
                            }
                        }).setNegativeButton("閉じる", null).show();
    }

    private static boolean[] readModelFilterStates(Object model, String version) throws Exception {
        // These are the response model's own StateFlow fields; other flows may
        // have similarly named obfuscated accessors with unrelated side effects.
        String fieldName = "0.8.10.226 dev".equals(version) ? "k"
                : "0.8.10.243 dev".equals(version) ? "z" : "w";
        String getterName = "0.8.10.226 dev".equals(version) ? "c"
                : "0.8.10.241".equals(version) ? "b"
                : "0.8.10.242 dev".equals(version) ? "d" : "a";
        java.lang.reflect.Field field = model.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        Object flow = field.get(model);
        if (flow == null) return null;
        Object state = flow.getClass().getMethod(getterName).invoke(flow);
        if (state == null) return null;
        String description = state.toString();
        if (!description.startsWith("FilterBarStates(popular=")) return null;
        Matcher matcher = Pattern.compile("FilterBarState\\(selected=(true|false),").matcher(description);
        boolean[] checked = new boolean[4];
        int index = 0;
        while (matcher.find() && index < checked.length) {
            checked[index++] = Boolean.parseBoolean(matcher.group(1));
        }
        return index == checked.length && !matcher.find() ? checked : null;
    }

    /** Legacy 191 keeps its four quick filters as data-bound ToggleButtons. */
    public static boolean clickLegacy(Object fragment, int id) {
        if (id != ID || fragment == null) return false;
        Activity activity = null;
        try {
            activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (activity == null || activity.isFinishing()) return true;
            // The filter panel is owned by the activity layout, outside the
            // response fragment's own view on ChMate 191.
            Object model = findLegacyFilterModel(fragment);
            if (model != null) {
                showLegacyModelDialog(activity, model);
                return true;
            }
            Object binding = findLegacyFilterBinding(activity.getWindow().getDecorView());
            if (binding == null) binding = rememberedLegacyBinding(activity);
            ToggleButton[] buttons = legacyFilterButtons(binding);
            if (buttons == null) throw new IllegalStateException("Legacy quick-filter model unavailable");
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

    /** The 191 filter state belongs to the response adapter, not its lazily created header. */
    private static Object findLegacyFilterModel(Object fragment) throws Exception {
        if (!"o.pa".equals(fragment.getClass().getName())) return null;
        java.lang.reflect.Field adapterField = fragment.getClass().getDeclaredField("c");
        adapterField.setAccessible(true);
        Object adapter = adapterField.get(fragment);
        if (adapter == null || !"o.m9ExternalSyntheticLambda1".equals(
                adapter.getClass().getName())) return null;
        java.lang.reflect.Field modelField = adapter.getClass().getDeclaredField("Y");
        modelField.setAccessible(true);
        Object model = modelField.get(adapter);
        return model != null && "o.maExternalSyntheticLambda0".equals(
                model.getClass().getName()) ? model : null;
    }

    private static void showLegacyModelDialog(Activity activity, Object model) throws Exception {
        String[] fields = {"c", "a", "e", "b"};
        Object[] observables = new Object[fields.length];
        boolean[] checked = new boolean[fields.length];
        for (int i = 0; i < fields.length; i++) {
            java.lang.reflect.Field field = model.getClass().getDeclaredField(fields[i]);
            field.setAccessible(true);
            observables[i] = field.get(model);
            java.lang.reflect.Field value = observables[i].getClass().getDeclaredField("mValue");
            value.setAccessible(true);
            checked[i] = value.getBoolean(observables[i]);
        }
        new AlertDialog.Builder(activity).setTitle("フィルタ")
                .setMultiChoiceItems(new String[]{"人気レス", "リンク", "画像", "動画"}, checked,
                        (dialog, which, enabled) -> {
                            try {
                                Object observable = observables[which];
                                java.lang.reflect.Field value = observable.getClass().getDeclaredField("mValue");
                                value.setAccessible(true);
                                if (value.getBoolean(observable) != enabled) {
                                    value.setBoolean(observable, enabled);
                                    // ChMate's original button handler also notifies DataBinding observers.
                                    observable.getClass().getMethod("c").invoke(observable);
                                }
                            } catch (Exception error) {
                                Log.e("Haiagaru", "191 quick filter failed", error);
                                Toast.makeText(activity, "フィルタを切り替えられませんでした", Toast.LENGTH_LONG).show();
                            }
                        }).setNegativeButton("閉じる", null).show();
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
                android.view.View panel = (android.view.View) view;
                panel.setVisibility(android.view.View.GONE);
                android.view.ViewGroup.LayoutParams params = panel.getLayoutParams();
                if (params != null) {
                    params.height = 0;
                    panel.setLayoutParams(params);
                }
                // The binding constructor runs before the row is attached.
                // A dedicated ListView header wrapper may still reserve space.
                panel.addOnAttachStateChangeListener(new android.view.View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(android.view.View view) {
                        collapseLegacyWrapper(view);
                    }
                    @Override public void onViewDetachedFromWindow(android.view.View view) { }
                });
                collapseLegacyWrapper(panel);
            }
        } catch (Exception error) {
            Log.e("Haiagaru", "Unable to hide legacy quick-filter row", error);
        }
    }

    private static void collapseLegacyWrapper(android.view.View panel) {
        android.view.ViewParent parent = panel.getParent();
        if (!(parent instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup holder = (android.view.ViewGroup) parent;
        if (holder.getChildCount() != 1 || holder instanceof android.widget.AdapterView
                || !(holder.getParent() instanceof android.widget.AdapterView)) return;
        holder.setVisibility(android.view.View.GONE);
        android.view.ViewGroup.LayoutParams params = holder.getLayoutParams();
        if (params != null) {
            params.height = 0;
            holder.setLayoutParams(params);
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
