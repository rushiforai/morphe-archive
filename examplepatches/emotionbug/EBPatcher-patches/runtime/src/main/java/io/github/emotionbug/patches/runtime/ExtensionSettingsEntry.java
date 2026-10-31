package io.github.emotionbug.patches.runtime;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** An original Adot row composed after the native settings rows, inside their scrolling Column. */
public final class ExtensionSettingsEntry {
    private static final String TAG = "EBPatcherSettings";
    private static volatile ComposeBridge bridge;
    private static final int[] HIDDEN_IDS = { 0x7f0a03ec, 0x7f0a0773, 0x7f0a0718, 0x7f0a0695,
            0x7f0a068f, 0x7f0a0777, 0x7f0a01d6 };
    private static final String[] HIDDEN_NAMES = { "icon", "subtitle", "setting_value", "right_status_icon",
            "right_button", "switch_button", "category_divider" };
    private static final ExecutorService BADGES = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "EBPatcher-model-badge");
        thread.setDaemon(true);
        return thread;
    });

    private ExtensionSettingsEntry() { }

    public static void install(Object composer) {
        try {
            // Bound to the exact renderer and AndroidView implementation by SettingsEntryPatch.
            if (composer == null || !"byb".equals(composer.getClass().getName())) return;
            ComposeBridge current = bridge;
            if (current == null || current.composerType != composer.getClass()) {
                current = new ComposeBridge(composer.getClass());
                bridge = current;
            }
            // Default Modifier and update callback; the factory is remembered by AndroidView.
            current.androidView.invoke(null, current.factory, null, null, composer, 0, 6);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
            Log.w(TAG, "Unable to add optional settings entry", unavailable);
        }
    }

    private static final class ComposeBridge {
        final Class<?> composerType;
        final Method androidView;
        final Object factory;

        ComposeBridge(Class<?> composerType) throws ReflectiveOperationException {
            this.composerType = composerType;
            ClassLoader loader = composerType.getClassLoader();
            Class<?> function = Class.forName("kotlin.jvm.functions.Function1", false, loader);
            Class<?> modifier = Class.forName("vpg", false, loader);
            androidView = Class.forName("pu6", false, loader).getDeclaredMethod("b",
                    function, modifier, function, composerType, int.class, int.class);
            factory = Proxy.newProxyInstance(loader, new Class<?>[] { function }, (proxy, method, arguments) -> {
                if (method.getDeclaringClass() == Object.class) {
                    switch (method.getName()) {
                        case "equals": return proxy == arguments[0];
                        case "hashCode": return System.identityHashCode(proxy);
                        case "toString": return "EBPatcher native settings row";
                        default: throw new UnsupportedOperationException(method.getName());
                    }
                }
                if (!"invoke".equals(method.getName()) || arguments == null || arguments.length != 1
                        || !(arguments[0] instanceof Context)) throw new IllegalStateException("Unsupported settings row factory");
                return createRow((Context) arguments[0]);
            });
        }
    }

    static View createRow(Context context) {
        try {
            Activity activity = activity(context);
            if (activity == null) throw new IllegalStateException("Missing settings activity");
            NativeRow row = nativeRow(context, new FrameLayout(context), "EBPatcher settings",
                    () -> ExtensionSettingsActivity.open(activity));
            row.watchBadge();
            return row.view;
        } catch (RuntimeException | LinkageError unavailable) {
            // An unavailable optional row must not take down the original settings composition.
            Log.w(TAG, "Unable to inflate optional settings entry", unavailable);
            View absent = new View(context);
            absent.setVisibility(View.GONE);
            return absent;
        }
    }

    private static Activity activity(Context context) {
        while (!(context instanceof Activity) && context instanceof ContextWrapper) {
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return context instanceof Activity ? (Activity) context : null;
    }

    static NativeRow nativeRow(Context context, ViewGroup parent, String label, Runnable action) {
        // 14.4.0 res/Vo.xml includes settings_common_item_layout; no copied private assets.
        requireResource(context, 0x7f0d01ca, "settings_common_normal_row");
        requireResource(context, 0x7f08050a, "icn_new_circle_fill");
        View row = LayoutInflater.from(context).inflate(0x7f0d01ca, parent, false);
        View item = required(row, 0x7f0a0424, "item_layout", ViewGroup.class);
        TextView title = (TextView) required(row, 0x7f0a07c8, "title", TextView.class);
        ImageView chevron = (ImageView) required(row, 0x7f0a053d, "next_icon", ImageView.class);
        for (int i = 0; i < HIDDEN_IDS.length; i++) required(row, HIDDEN_IDS[i], HIDDEN_NAMES[i], View.class).setVisibility(View.GONE);
        required(row, 0x7f0a029e, "divide_line", View.class).setVisibility(View.VISIBLE);
        title.setText(label);
        chevron.setVisibility(View.VISIBLE);
        item.setEnabled(true);
        item.setFocusable(true);
        item.setOnClickListener(view -> action.run());
        NativeRow result = new NativeRow(row, item, title, label);
        result.badge(false);
        return result;
    }

    private static View required(View root, int id, String name, Class<?> type) {
        requireResource(root.getContext(), id, name);
        View view = root.findViewById(id);
        if (!type.isInstance(view)) throw new IllegalStateException("Unsupported original settings row");
        return view;
    }

    private static void requireResource(Context context, int id, String name) {
        if (!name.equals(context.getResources().getResourceEntryName(id)))
            throw new IllegalStateException("Unsupported original settings resource");
    }

    static final class NativeRow {
        final View view;
        private final View item;
        private final TextView title;
        private final String label;
        private int revision;
        private ViewTreeObserver observer;
        private SharedPreferences preferences;
        private final SharedPreferences.OnSharedPreferenceChangeListener changed = (settings, key) -> {
            if (ModelUpdateBadge.ACKNOWLEDGED.equals(key)) refreshBadge();
        };
        private final ViewTreeObserver.OnWindowFocusChangeListener focus = hasFocus -> {
            if (hasFocus) refreshBadge();
        };

        NativeRow(View view, View item, TextView title, String label) {
            this.view = view; this.item = item; this.title = title; this.label = label;
        }

        void badge(boolean unseen) {
            Drawable drawable = unseen ? title.getContext().getDrawable(0x7f08050a).mutate() : null;
            if (drawable != null) {
                // Retain the original absolute right compound drawable and XML 4dp padding.
                int size = (int) (20.0f * title.getResources().getDisplayMetrics().density);
                drawable.setBounds(0, 0, size, size);
            }
            title.setCompoundDrawables(null, null, drawable, null);
            String description = label + (unseen ? ". New models available" : "");
            title.setContentDescription(description);
            item.setContentDescription(description);
        }

        void refreshBadge() {
            final int token = ++revision;
            Context app = view.getContext().getApplicationContext();
            final boolean subscribe = preferences == null && view.isAttachedToWindow();
            BADGES.execute(() -> {
                ModelUpdateBadge.State state = ModelUpdateBadge.observe(app);
                SharedPreferences settings = subscribe ? ExtensionSettings.local(app) : null;
                view.post(() -> {
                    if (token != revision) return;
                    if (settings != null && preferences == null && view.isAttachedToWindow()) {
                        preferences = settings;
                        preferences.registerOnSharedPreferenceChangeListener(changed);
                        // Cover acknowledgement between the observation and listener registration.
                        refreshBadge();
                    } else badge(state.unseen);
                });
            });
        }

        void watchBadge() {
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View attached) {
                    observer = attached.getViewTreeObserver();
                    observer.addOnWindowFocusChangeListener(focus);
                    refreshBadge();
                }
                @Override public void onViewDetachedFromWindow(View detached) {
                    revision++;
                    if (observer != null && observer.isAlive()) observer.removeOnWindowFocusChangeListener(focus);
                    observer = null;
                    if (preferences != null) preferences.unregisterOnSharedPreferenceChangeListener(changed);
                    preferences = null;
                }
            });
            if (view.isAttachedToWindow()) {
                observer = view.getViewTreeObserver();
                observer.addOnWindowFocusChangeListener(focus);
                refreshBadge();
            }
        }
    }
}
