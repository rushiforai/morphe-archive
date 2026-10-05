package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Adds a board-list display preference without replacing ChMate's own sort options. */
public final class ReadThreadsFirst {
    private static final String TAG = "HaiagaruReadFirst";
    private static final String PREFS = "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final String KEY = "readThreadsFirst";
    private static volatile Object label;
    private static volatile Object click;
    private static volatile Method checkbox;
    private static volatile Method text;
    private static volatile Method checkbox226;
    private static volatile Method text226;
    private static volatile Object unit;
    private static final Map<Object, List<Object>> recyclerOriginalRows = new WeakHashMap<>();
    private static final ArrayDeque<List<Object>> mappedOriginalRows = new ArrayDeque<>();
    private static volatile Object compose242CheckedState;
    private static volatile int compose242LabelId;
    private static volatile Object compose241CheckedState;
    private static volatile Object compose226CheckedState;

    private ReadThreadsFirst() { }

    private static SharedPreferences preferences() {
        Context context = Haiagaru.applicationContextForExtension();
        return context == null ? null : context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static boolean enabled() {
        SharedPreferences prefs = preferences();
        return prefs != null && prefs.getBoolean(KEY, false);
    }

    /** ChMate 191 uses a View-based board display dialog instead of Compose. */
    public static void attachLegacyDialog(Object fragment) {
        try {
            Method getView = fragment.getClass().getMethod("getView");
            View root = (View) getView.invoke(fragment);
            CheckBox star = findStarOption(root);
            if (star == null || !(star.getParent() instanceof LinearLayout)) return;
            LinearLayout rows = (LinearLayout) star.getParent();
            for (int i = 0; i < rows.getChildCount(); i++) {
                if ("haiagaru.readThreadsFirst".equals(rows.getChildAt(i).getTag())) return;
            }
            CheckBox readFirst = new CheckBox(star.getContext());
            readFirst.setTag("haiagaru.readThreadsFirst");
            readFirst.setText("既読スレを上に");
            readFirst.setTextColor(star.getCurrentTextColor());
            readFirst.setTextSize(star.getTextSize() / star.getResources().getDisplayMetrics().scaledDensity);
            readFirst.setTypeface(star.getTypeface());
            readFirst.setGravity(star.getGravity());
            readFirst.setMinimumHeight(star.getMinimumHeight());
            readFirst.setButtonTintList(star.getButtonTintList());
            Drawable originalButton = star.getButtonDrawable();
            if (originalButton != null && originalButton.getConstantState() != null) {
                readFirst.setButtonDrawable(originalButton.getConstantState()
                        .newDrawable(star.getResources()).mutate());
            }
            readFirst.setPadding(star.getPaddingLeft(), star.getPaddingTop(),
                    star.getPaddingRight(), star.getPaddingBottom());
            readFirst.setChecked(enabled());
            readFirst.setOnCheckedChangeListener((CompoundButton button, boolean checked) -> {
                SharedPreferences prefs = preferences();
                if (prefs != null) prefs.edit().putBoolean(KEY, checked).apply();
                Haiagaru.refreshBoardListAfterReadSortChange();
            });
            LinearLayout.LayoutParams original = (LinearLayout.LayoutParams) star.getLayoutParams();
            LinearLayout.LayoutParams placement = new LinearLayout.LayoutParams(original.width, original.height);
            placement.setMargins(original.leftMargin, original.topMargin,
                    original.rightMargin, original.bottomMargin);
            placement.gravity = original.gravity;
            placement.weight = original.weight;
            rows.addView(readFirst, placement);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not add legacy display-setting checkbox", failure);
        }
    }

    private static CheckBox findStarOption(View view) {
        if (view instanceof CheckBox) {
            CheckBox checkbox = (CheckBox) view;
            CharSequence label = checkbox.getText();
            if (label != null && label.toString().contains("★")) return checkbox;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                CheckBox found = findStarOption(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** 242/243 render display settings from three groups of Compose row models. */
    public static void appendComposeSetting(List<?> groups) {
        if (groups == null || groups.isEmpty()) return;
        try {
            Context context = Haiagaru.applicationContextForExtension();
            if (context == null) return;
            int labelId = context.getResources().getIdentifier(
                    "haiagaru_read_threads_first", "string", context.getPackageName());
            if (labelId == 0) throw new IllegalStateException("Read-first label resource missing");
            Object group = groups.get(groups.size() - 1);
            String groupName = group.getClass().getName();
            boolean version242 = groupName.equals("o.defaultzzo");
            boolean version243 = groupName.equals("o.zzeoi");
            if (!version242 && !version243) return;
            if (version242) compose242LabelId = labelId;
            Field itemsField = group.getClass().getDeclaredField(version242 ? "e" : "c");
            itemsField.setAccessible(true);
            @SuppressWarnings("unchecked") List<Object> items = (List<Object>) itemsField.get(group);
            ClassLoader loader = group.getClass().getClassLoader();
            Class<?> actionType = loader.loadClass(version242 ? "o.zzcbx" : "o.zzfyl");
            Object unitValue = loader.loadClass(version242 ? "o.zzbwq" : "o.zzftg")
                    .getField("INSTANCE").get(null);
            Object action = Proxy.newProxyInstance(loader, new Class<?>[]{actionType}, (proxy, method, args) -> {
                if (!"invoke".equals(method.getName())) return proxyMethod(proxy, method, args);
                SharedPreferences prefs = preferences();
                if (prefs != null) prefs.edit().putBoolean(KEY, !enabled()).apply();
                if (version242) updateCompose242CheckedState();
                Haiagaru.refreshBoardListAfterReadSortChange();
                return unitValue;
            });
            Class<?> rowType = loader.loadClass(version242 ? "o.zzaxj" : "o.zzemn");
            java.lang.reflect.Constructor<?> constructor = rowType.getDeclaredConstructor(
                    boolean.class, int.class, actionType);
            constructor.setAccessible(true);
            items.add(constructor.newInstance(enabled(), labelId, action));
        } catch (Throwable failure) {
            Log.w(TAG, "Could not add Compose display-setting checkbox", failure);
        }
    }

    /** Read Compose snapshot state inside CheckItem rendering, then sync its immutable model. */
    public static void syncCompose242CheckItem(Object item) {
        if (item == null || compose242LabelId == 0) return;
        try {
            Class<?> type = item.getClass();
            if (!"o.zzaxj".equals(type.getName())) return;
            Field labelField = type.getDeclaredField("b");
            labelField.setAccessible(true);
            if (labelField.getInt(item) != compose242LabelId) return;
            Object state = compose242CheckedState;
            if (state == null) {
                state = type.getClassLoader().loadClass("o.b7bb")
                        .getMethod("b", Object.class).invoke(null, Boolean.valueOf(enabled()));
                compose242CheckedState = state;
            }
            boolean checked = (Boolean) state.getClass().getMethod("c").invoke(state);
            Field checkedField = type.getDeclaredField("a");
            checkedField.setAccessible(true);
            checkedField.setBoolean(item, checked);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not update Compose checkbox", failure);
        }
    }

    private static void updateCompose242CheckedState() {
        Object state = compose242CheckedState;
        if (state == null) return;
        try {
            state.getClass().getMethod("c", Object.class)
                    .invoke(state, Boolean.valueOf(enabled()));
        } catch (Throwable failure) {
            Log.w(TAG, "Could not invalidate Compose checkbox", failure);
        }
    }

    /** Observe the state inside the actual checkbox composable, where invalidation is tracked. */
    public static boolean compose242CheckedForLabel(int labelId, boolean original) {
        if (labelId != compose242LabelId || labelId == 0) return original;
        Object state = compose242CheckedState;
        if (state == null) return enabled();
        try {
            return (Boolean) state.getClass().getMethod("c").invoke(state);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not read Compose checkbox state", failure);
            return enabled();
        }
    }

    /** 226 renders its board-only options directly rather than as row models. */
    public static void render226(Object composer) {
        if (composer == null) return;
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object state = compose226CheckedState;
            if (state == null) {
                state = loader.loadClass("o.a1").getDeclaredMethod("d", Object.class)
                        .invoke(null, Boolean.valueOf(enabled()));
                compose226CheckedState = state;
            }
            boolean checked = (Boolean) state.getClass().getMethod("c").invoke(state);
            Class<?> modifierType = loader.loadClass("o.setAdVideoPlaybackListener");
            Class<?> actionType = loader.loadClass("o.IPMiBroadcastReceiver1");
            Class<?> labelType = loader.loadClass("o.DeviceUtils2");
            Class<?> composerType = loader.loadClass("o.getValue");
            Class<?> optionalType = loader.loadClass("o.pingSis");
            Method render = checkbox226;
            if (render == null) {
                render = loader.loadClass("o.setUserAgentString").getDeclaredMethod("b",
                        boolean.class, modifierType, actionType, boolean.class,
                        optionalType, labelType, composerType, int.class, int.class);
                render.setAccessible(true);
                checkbox226 = render;
            }
            Object value = loader.loadClass("o.Ff11").getField("c").get(null);
            Object change = Proxy.newProxyInstance(loader, new Class<?>[]{actionType}, (proxy, method, args) -> {
                if (!"invoke".equals(method.getName())) return proxyMethod(proxy, method, args);
                SharedPreferences prefs = preferences();
                if (prefs != null && args != null && args.length > 0 && args[0] instanceof Boolean) {
                    prefs.edit().putBoolean(KEY, (Boolean) args[0]).apply();
                    Object checkedState = compose226CheckedState;
                    if (checkedState != null) checkedState.getClass().getMethod("a", Object.class)
                            .invoke(checkedState, args[0]);
                    Haiagaru.refreshBoardListAfterReadSortChange();
                }
                return value;
            });
            Object label = Proxy.newProxyInstance(loader, new Class<?>[]{labelType}, (proxy, method, args) -> {
                if (!"invoke".equals(method.getName())) return proxyMethod(proxy, method, args);
                drawLabel226(args[0]);
                return value;
            });
            Field baseField = modifierType.getField("b");
            render.invoke(null, checked, baseField.get(null), change, false,
                    null, label, composer, 196656, 24);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not add 226 display-setting checkbox", failure);
        }
    }

    private static void drawLabel226(Object composer) throws Exception {
        Method draw = text226;
        if (draw == null) {
            for (Method candidate : composer.getClass().getClassLoader()
                    .loadClass("o.DtbSharedPreferences").getDeclaredMethods()) {
                Class<?>[] types = candidate.getParameterTypes();
                if (candidate.getName().equals("d") && Modifier.isStatic(candidate.getModifiers())
                        && types.length == 21 && types[0] == String.class
                        && types[17].isInstance(composer)) {
                    candidate.setAccessible(true);
                    draw = candidate;
                    text226 = candidate;
                    break;
                }
            }
        }
        if (draw == null) throw new NoSuchMethodException("226 Compose text renderer");
        Class<?>[] types = draw.getParameterTypes();
        Object[] values = new Object[types.length];
        for (int i = 0; i < types.length; i++) {
            if (types[i] == int.class) values[i] = 0;
            else if (types[i] == long.class) values[i] = 0L;
            else if (types[i] == boolean.class) values[i] = false;
        }
        values[0] = "既読スレを上に";
        values[17] = composer;
        values[20] = 131070;
        draw.invoke(null, values);
    }

    /** Called from the board display-settings composable, immediately after the star option. */
    public static void render(Object composer) {
        if (composer == null) return;
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Object state = compose241CheckedState;
            if (state == null) {
                state = loader.loadClass("o.s").getDeclaredMethod("e", Object.class)
                        .invoke(null, Boolean.valueOf(enabled()));
                compose241CheckedState = state;
            }
            boolean checked = (Boolean) state.getClass().getMethod("d").invoke(state);
            Class<?> actionType = loader.loadClass("o.zzalo");
            Class<?> labelType = loader.loadClass("o.zzamd");
            Class<?> composerType = loader.loadClass("o.getSequenceNumber");
            Method render = checkbox;
            if (render == null) {
                render = loader.loadClass("o.zaak").getDeclaredMethod(
                        "e", boolean.class, actionType, labelType, composerType, int.class);
                render.setAccessible(true);
                checkbox = render;
            }
            if (unit == null) unit = loader.loadClass("o.zzagp").getField("INSTANCE").get(null);
            if (click == null) {
                click = Proxy.newProxyInstance(loader, new Class<?>[]{actionType}, (proxy, method, args) -> {
                    if (!"invoke".equals(method.getName())) return proxyMethod(proxy, method, args);
                    SharedPreferences prefs = preferences();
                    if (prefs != null) prefs.edit().putBoolean(KEY, !enabled()).apply();
                    Object checkedState = compose241CheckedState;
                    if (checkedState != null) checkedState.getClass().getMethod("b", Object.class)
                            .invoke(checkedState, Boolean.valueOf(enabled()));
                    Haiagaru.refreshBoardListAfterReadSortChange();
                    return unit;
                });
            }
            if (label == null) {
                label = Proxy.newProxyInstance(loader, new Class<?>[]{labelType}, (proxy, method, args) -> {
                    if (!"invoke".equals(method.getName())) return proxyMethod(proxy, method, args);
                    drawLabel(args[0]);
                    return unit;
                });
            }
            render.invoke(null, checked, click, label, composer, 384);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not add display-setting checkbox", failure);
        }
    }

    private static Object proxyMethod(Object proxy, Method method, Object[] args) {
        switch (method.getName()) {
            case "hashCode": return System.identityHashCode(proxy);
            case "equals": return proxy == args[0];
            case "toString": return "ReadThreadsFirst";
            default: return null;
        }
    }

    private static void drawLabel(Object composer) throws Exception {
        Method draw = text;
        if (draw == null) {
            for (Method candidate : composer.getClass().getClassLoader()
                    .loadClass("o.getOfferTags").getDeclaredMethods()) {
                Class<?>[] types = candidate.getParameterTypes();
                if (candidate.getName().equals("c") && Modifier.isStatic(candidate.getModifiers())
                        && types.length == 22 && types[0] == String.class
                        && types[18].isInstance(composer)) {
                    candidate.setAccessible(true);
                    draw = candidate;
                    text = candidate;
                    break;
                }
            }
        }
        if (draw == null) throw new NoSuchMethodException("Compose text renderer");
        Class<?>[] types = draw.getParameterTypes();
        Object[] values = new Object[types.length];
        for (int i = 0; i < types.length; i++) {
            if (types[i] == int.class) values[i] = 0;
            else if (types[i] == long.class) values[i] = 0L;
            else if (types[i] == boolean.class) values[i] = false;
        }
        values[0] = "既読スレを上に";
        values[18] = composer;
        values[21] = 262142; // Use ChMate's default style for every optional text parameter.
        draw.invoke(null, values);
    }

    /** Stable partition within thread rows; headers and other non-thread rows keep their positions. */
    public static void reorder(List<?> rows) {
        if (!enabled() || rows == null || rows.size() < 2) return;
        try {
            @SuppressWarnings("unchecked") List<Object> mutable = (List<Object>) rows;
            int start = 0;
            while (start < mutable.size()) {
                while (start < mutable.size() && thread(mutable.get(start)) == null) start++;
                int end = start;
                while (end < mutable.size() && thread(mutable.get(end)) != null) end++;
                if (end - start > 1) {
                    List<Object> ordered = new ArrayList<>(end - start);
                    for (int i = start; i < end; i++) if (hasLocalHistory(thread(mutable.get(i)))) ordered.add(mutable.get(i));
                    for (int i = start; i < end; i++) if (!hasLocalHistory(thread(mutable.get(i)))) ordered.add(mutable.get(i));
                    for (int i = start; i < end; i++) mutable.set(i, ordered.get(i - start));
                }
                start = end + 1;
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Could not reorder board threads", failure);
        }
    }

    /** The legacy adapter rebuilds its visible rows after receiving the source list. */
    public static void reorderLegacyAdapter(Object adapter) {
        if (!enabled() || adapter == null) return;
        try {
            String name = adapter.getClass().getName();
            Field field = adapter.getClass().getDeclaredField(
                    name.equals("o.m8a") ? "d" : "e");
            field.setAccessible(true);
            Object rows = field.get(adapter);
            if (!(rows instanceof List)) return;
            ArrayList<Object> visible = new ArrayList<>((List<?>) rows);
            reorder(visible);
            field.set(adapter, visible);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not reorder legacy adapter rows", failure);
        }
    }

    /** Rebuild only the visible legacy board list; avoid a whole-activity flash. */
    public static boolean refreshLegacyAdapterInPlace(Activity activity) {
        if (activity == null || activity.getWindow() == null) return false;
        return refreshLegacyAdapterInView(activity.getWindow().getDecorView());
    }

    /** Update an already visible modern list without recreating its Activity. */
    public static boolean refreshRecyclerAdapterInPlace(Activity activity) {
        if (activity == null || activity.getWindow() == null) return false;
        return refreshRecyclerAdapterInView(activity.getWindow().getDecorView());
    }

    /** Recompose the open settings sheet so its switch reflects the saved value. */
    public static void refreshComposeSettingDialog(Activity activity) {
        try {
            Object manager = activity.getClass().getMethod("getSupportFragmentManager")
                    .invoke(activity);
            refreshDialogsInFragmentManager(manager);
        } catch (NoSuchMethodException ignored) {
            // Older Activity variants host this Compose dialog directly. The
            // snapshot-state read in render() or render226() invalidates it.
        } catch (Throwable failure) {
            Log.w(TAG, "Could not refresh display-setting dialog", failure);
        }
    }

    private static void refreshDialogsInFragmentManager(Object manager) throws Exception {
        @SuppressWarnings("unchecked") List<Object> fragments = (List<Object>) manager.getClass()
                .getMethod("getFragments").invoke(manager);
        for (Object fragment : fragments) {
            if (fragment == null) continue;
            try {
                Object dialog = fragment.getClass().getMethod("getDialog").invoke(fragment);
                if (dialog instanceof Dialog && ((Dialog) dialog).isShowing()
                        && ((Dialog) dialog).getWindow() != null) {
                    View compose = findComposeView(((Dialog) dialog).getWindow().getDecorView());
                    if (compose != null) {
                        compose.post(() -> {
                            try {
                                compose.getClass().getMethod("disposeComposition").invoke(compose);
                                compose.getClass().getMethod("createComposition").invoke(compose);
                            } catch (Throwable failure) {
                                Log.w(TAG, "Could not recompose display-setting dialog", failure);
                            }
                        });
                        return;
                    }
                }
            } catch (NoSuchMethodException ignored) {
                // Other fragments are not dialogs.
            }
            try {
                Object child = fragment.getClass().getMethod("getChildFragmentManager")
                        .invoke(fragment);
                refreshDialogsInFragmentManager(child);
            } catch (NoSuchMethodException ignored) {
                // Not every fragment exposes nested fragments.
            }
        }
    }

    private static View findComposeView(View view) {
        if (view.getClass().getName().contains("ComposeView")) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findComposeView(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean refreshRecyclerAdapterInView(View view) {
        if (isRecyclerView(view)) {
            try {
                Object adapter = view.getClass().getMethod("getAdapter").invoke(view);
                if (adapter != null) {
                    for (Field field : allFields(adapter.getClass())) {
                        if (!List.class.isAssignableFrom(field.getType())) continue;
                        field.setAccessible(true);
                        Object value = field.get(adapter);
                        if (!(value instanceof List)) continue;
                        List<?> current = (List<?>) value;
                        if (current.isEmpty()) continue;
                        boolean containsThread = false;
                        for (Object row : current) {
                            if (thread(row) != null) { containsThread = true; break; }
                        }
                        if (!containsThread) continue;
                        if (enabled()) {
                            ArrayList<Object> original = new ArrayList<>(current);
                            ArrayList<Object> ordered = new ArrayList<>(original);
                            reorder(ordered);
                            synchronized (recyclerOriginalRows) {
                                recyclerOriginalRows.put(adapter, original);
                            }
                            field.set(adapter, ordered);
                        } else {
                            List<Object> original = matchingMappedOriginal(current);
                            synchronized (recyclerOriginalRows) {
                                if (original == null) original = recyclerOriginalRows.remove(adapter);
                            }
                            if (original == null || original.size() != current.size()
                                    || !original.containsAll(current)) return false;
                            field.set(adapter, original);
                        }
                        adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
                        return true;
                    }
                }
            } catch (Throwable failure) {
                Log.w(TAG, "Could not refresh visible RecyclerView rows", failure);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (refreshRecyclerAdapterInView(group.getChildAt(i))) return true;
            }
        }
        return false;
    }

    private static boolean isRecyclerView(View view) {
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            if ("androidx.recyclerview.widget.RecyclerView".equals(type.getName())) return true;
        }
        return false;
    }

    private static List<Field> allFields(Class<?> type) {
        ArrayList<Field> fields = new ArrayList<>();
        for (; type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) fields.add(field);
        }
        return fields;
    }

    private static List<Object> matchingMappedOriginal(List<?> current) {
        synchronized (mappedOriginalRows) {
            for (List<Object> candidate : mappedOriginalRows) {
                if (candidate.size() == current.size()
                        && new HashSet<>(candidate).equals(new HashSet<>(current))) {
                    return candidate;
                }
            }
        }
        return null;
    }

    /** Called on the native-sorted ViewModel output before changing its order. */
    public static void reorderMapped(List<?> rows) {
        if (!enabled() || rows == null || rows.size() < 2) return;
        synchronized (mappedOriginalRows) {
            mappedOriginalRows.addFirst(new ArrayList<>(rows));
            while (mappedOriginalRows.size() > 12) mappedOriginalRows.removeLast();
        }
        reorder(rows);
    }

    private static boolean refreshLegacyAdapterInView(View view) {
        if (view instanceof AdapterView) {
            Object adapter = ((AdapterView<?>) view).getAdapter();
            if (adapter != null) {
                String name = adapter.getClass().getName();
                if (name.equals("o.m8a") || name.equals("o.getWriteBytesTotal")) {
                    try {
                        Method rebuild = adapter.getClass().getDeclaredMethod("d");
                        rebuild.setAccessible(true);
                        rebuild.invoke(adapter);
                        return true;
                    } catch (Throwable failure) {
                        Log.w(TAG, "Could not refresh legacy board list in place", failure);
                    }
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (refreshLegacyAdapterInView(group.getChildAt(i))) return true;
            }
        }
        return false;
    }

    private static Object thread(Object row) throws Exception {
        if (row == null) return null;
        String name = row.getClass().getName();
        if (name.equals("o.OnConnectionFailedListener") || name.equals("o.zzauw")
                || name.equals("o.zzejt") || name.equals("o.MaxAdViewImplExternalSyntheticLambda2")
                || name.equals("o.verifyHostname")) return row;
        if (!name.equals("o.PendingResultFacade$RemoteActionCompatParcelizer")
                && !name.equals("o.zzavl$read")
                && !name.equals("o.zzekb$ComponentActivity")) return null;
        Field field = row.getClass().getDeclaredField(name.equals("o.zzavl$read") ? "a" : "e");
        field.setAccessible(true);
        Object model = field.get(row);
        if (model == null) return null;
        String modelName = model.getClass().getName();
        return modelName.equals("o.OnConnectionFailedListener") || modelName.equals("o.zzauw")
                || modelName.equals("o.zzejt") ? model : null;
    }

    private static boolean hasLocalHistory(Object model) throws Exception {
        // 241's read_count is populated even for unopened board threads. The local
        // SelectByBoardForThreadList row ID stays -1 until a thread has history.
        // 241/242/243 store the local history row ID in d. Their other long
        // field is an activity timestamp and cannot identify opened threads.
        // 241 can populate the local row with ID 0; -1 is its no-history sentinel.
        String name = model.getClass().getName();
        Field field = model.getClass().getDeclaredField(
                name.equals("o.OnConnectionFailedListener") || name.equals("o.zzejt")
                        || name.equals("o.zzauw") ? "d"
                        : name.equals("o.verifyHostname") ? "b" : "e");
        field.setAccessible(true);
        long localRowId = field.getLong(model);
        return name.equals("o.OnConnectionFailedListener")
                ? localRowId >= 0L : localRowId > 0L;
    }
}
