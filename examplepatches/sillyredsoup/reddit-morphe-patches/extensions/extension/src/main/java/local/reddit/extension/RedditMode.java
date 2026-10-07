package local.reddit.extension;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import wl3.a;

/** Runtime hooks for Reddit 2026.14.0. */
public final class RedditMode {
    private static final String PREFS = "local.reddit.mode";
    private static final String NSFW_ONLY = "nsfw_filter_active";
    private static volatile Object repository;
    private static volatile WeakReference<Object> navScreen = new WeakReference<>(null);
    private static volatile Method drawIcon;
    private static volatile Method drawLabel;
    private static volatile boolean mode;
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static SettingUpdate activeUpdate;
    private static SettingUpdate queuedUpdate;
    private static final androidx.compose.runtime.o1 modeState =
        androidx.compose.runtime.j.B(Boolean.FALSE);

    private RedditMode() {}

    public static void initialize(Object screen, Resources resources) {
        navScreen = new WeakReference<>(screen);
        try {
            Activity current = (Activity) screen.getClass().getMethod("H3").invoke(screen);
            if (current != null)
                setMode(current.getSharedPreferences(PREFS, 0).getBoolean(NSFW_ONLY, false));
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static void initializeModern(Object screen) {
        initialize(screen, null);
    }

    @SuppressWarnings("unchecked")
    public static void addButton(Object builder) {
        if (!(builder instanceof List<?>) || ((List<?>) builder).isEmpty()) return;
        try {
            List<Object> items = (List<Object>) builder;
            // Home is the first tab in Reddit 2026.14.0 and is always present.
            Object original = items.get(0);
            Object content = original.getClass().getField("b").get(original);
            Constructor<?> ctor = original.getClass().getConstructor(String.class, content.getClass());
            Object button = ctor.newInstance("NSFW", content);
            int position = 1;
            for (int i = 0; i < items.size(); i++) {
                String label = (String) items.get(i).getClass().getField("a").get(items.get(i));
                if ("NSFW".equals(label)) return;
                if ("Vertical".equals(label)) position = i + 1;
            }
            items.add(position, button);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static void rememberRepository(Object value) {
        repository = value;
    }

    public static Function0<?> wrapClick(Object descriptor, Function0<?> original) {
        if (original instanceof ModeClick) return original;
        try {
            String label = (String) descriptor.getClass().getField("a").get(descriptor);
            if ("NSFW".equals(label)) {
                // Both Reddit bottom-bar implementations capture their owning screen
                // in the original callback. A later bar can replace the global fallback.
                Object owner = clickScreen(original);
                return new ModeClick(owner);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return original;
    }

    private static final class ModeClick implements Function0<Object> {
        final Object owner;
        ModeClick(Object owner) { this.owner = owner; }
        @Override public Object invoke() {
            Object screen = owner != null ? owner : navScreen.get();
            if (screen != null) toggle(screen);
            else Log.w("RedditMode", "NSFW click has no navigation screen");
            return kotlinUnit();
        }
    }

    private static Object clickScreen(Function0<?> click) {
        if (click == null) return null;
        for (Field field : click.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || !
                "com.reddit.launch.bottomnav.BottomNavScreen".equals(field.getType().getName())) continue;
            try {
                field.setAccessible(true);
                return field.get(click);
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return null;
    }

    public static String tabLabel(Object descriptor, String original) {
        try { return "NSFW".equals(descriptor.getClass().getField("a").get(descriptor)) ? "NSFW" : original; }
        catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    @SuppressWarnings("unchecked")
    public static Function2<?, ?, ?> tabIcon(Object descriptor, Function2<?, ?, ?> original) {
        try {
            if (!"NSFW".equals(descriptor.getClass().getField("a").get(descriptor))) return original;
            return (composer, flags) -> {
                try {
                    Method draw = drawIcon;
                    if (draw == null) {
                        // Use the DEX class name; the decompiler aliases ds to pointer.
                        draw = Class.forName("com.reddit.ui.compose.ds.q9").getMethod("a",
                            Class.forName("com.reddit.ui.compose.icons.h"), Class.forName("androidx.compose.ui.s"),
                            long.class, boolean.class, String.class,
                            Class.forName("androidx.compose.runtime.m"), int.class, int.class);
                        drawIcon = draw;
                    }
                    boolean active = (Boolean) modeState.getValue();
                    // icon_nsfw is the icon used by Reddit's blur-content setting.
                    Object icon = Class.forName("com.reddit.ui.compose.icons." + (active ? "h0" : "i0"))
                        .getField("S0").get(null);
                    draw.invoke(null, icon, null, 0L, false, "NSFW", composer, 24576, 14);
                } catch (ReflectiveOperationException | RuntimeException error) {
                    Throwable cause = error instanceof InvocationTargetException && error.getCause() != null
                        ? error.getCause() : error;
                    Log.w("RedditMode", "NSFW icon render failed: " + cause.getClass().getSimpleName());
                    ((Function2<Object, Object, ?>) original).invoke(composer, flags);
                }
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    @SuppressWarnings("unchecked")
    public static Function2<?, ?, ?> tabText(Object descriptor, Function2<?, ?, ?> original) {
        try {
            if (!"NSFW".equals(descriptor.getClass().getField("a").get(descriptor))) return original;
            return (composer, flags) -> {
                try {
                    Method draw = drawLabel;
                    if (draw == null) {
                        for (Method candidate : Class.forName("com.reddit.ui.compose.ds.kh").getMethods()) {
                            if ("b".equals(candidate.getName()) && candidate.getParameterCount() == 21
                                && candidate.getParameterTypes()[0] == String.class) {
                                draw = candidate;
                                drawLabel = draw;
                                break;
                            }
                        }
                    }
                    if (draw == null) throw new NoSuchMethodException("bottom bar text");
                    draw.invoke(null, "NSFW", null, 0L, 0L, null, null, null, 0L,
                        null, 0, 0L, 0, false, 0, 0, null, null, composer, 0, 0, 262142);
                } catch (ReflectiveOperationException | RuntimeException error) {
                    ((Function2<Object, Object, ?>) original).invoke(composer, flags);
                }
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { return original; }
    }

    public static boolean selected(Object descriptor, Function0<?> click, String label,
                                   boolean original) {
        try {
            if ("NSFW".equals(descriptor.getClass().getField("a").get(descriptor))) {
                return (Boolean) modeState.getValue();
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return original;
    }

    public static List<?> filterListing(List<?> original) {
        if (original == null || original.isEmpty()) return original;
        ArrayList<Object> kept = null;
        for (int i = 0; i < original.size(); i++) {
            Object item = original.get(i);
            Object link = findLink(item, 0, Collections.newSetFromMap(new IdentityHashMap<>()));
            boolean drop = link != null && flag(link, "getOver18") != mode;
            if (drop) {
                if (kept == null) {
                    kept = new ArrayList<>(original.size());
                    kept.addAll(original.subList(0, i));
                }
            } else if (kept != null) kept.add(item);
        }
        return kept == null ? original : kept;
    }

    public static Object filterConverted(Object element, Object converted) {
        if (element == null) return converted;
        String type = element.getClass().getName();
        if (!"ym1.u1".equals(type) && !"ym1.z".equals(type)) return converted;
        boolean nsfw = hasNsfwIndicator(element, 0,
            Collections.newSetFromMap(new IdentityHashMap<>()));
        return nsfw == mode ? converted : null;
    }

    public static void toggle(Object screen) {
        Activity current = null;
        try {
            current = (Activity) screen.getClass().getMethod("H3").invoke(screen);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        if (current == null) {
            Log.w("RedditMode", "NSFW click has no attached activity");
            return;
        }
        Object repo = repository;
        if (repo == null) {
            Toast.makeText(current, "NSFW settings are not ready", Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            // Reddit's over18 setter dispatches its local update asynchronously.
            // Toggle the mode shown by this button even if that getter still lags.
            boolean next = !mode;
            setMode(next);
            current.getSharedPreferences(PREFS, 0).edit().putBoolean(NSFW_ONLY, mode).apply();
            Log.i("RedditMode", stateText(next) + " — updating account settings");
            SettingUpdate update = new SettingUpdate(repo, screen, next);
            if (activeUpdate == null) update.start();
            else queuedUpdate = update;
        } catch (RuntimeException | LinkageError error) {
            Log.w("RedditMode", "NSFW settings update failed: " + error.getClass().getSimpleName());
            Toast.makeText(current, "Could not change NSFW settings", Toast.LENGTH_LONG).show();
        }
    }

    private static void setMode(boolean enabled) {
        mode = enabled;
        modeState.setValue(enabled);
    }

    private static String stateText(boolean enabled) {
        return enabled ? "NSFW mode on" : "NSFW mode off";
    }

    /** Observe F(), the request that actually receives Reddit's server response.
     * The over18 setter itself discards an unsuccessful F() result.
     */
    public static a<Object> watchSettingsSync(Object repo, Object patch, a<Object> original) {
        Completion owner = findCompletion(original, 0,
            Collections.newSetFromMap(new IdentityHashMap<>()));
        if (owner == null || owner.update.repo != repo) return original;
        try {
            Object over18 = patch.getClass().getMethod("getOver18").invoke(patch);
            Object blur = patch.getClass().getMethod("getNoProfanity").invoke(patch);
            int fields = 0;
            if (Boolean.valueOf(owner.update.target).equals(over18)) fields |= 1;
            if (Boolean.valueOf(!owner.update.target).equals(blur)) fields |= 2;
            if (fields != 0) return new SyncCompletion(original, owner.update, fields);
        } catch (ReflectiveOperationException | RuntimeException error) {
            main.post(() -> owner.update.finish(false, "account update could not be checked"));
        }
        return original;
    }

    private static Completion findCompletion(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 16 || !seen.add(value)) return null;
        if (value instanceof Completion) return (Completion) value;
        // withContext introduces coroutine frames in addition to Kotlin's base
        // completion field. Follow only Continuation fields, not application data.
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !a.class.isAssignableFrom(field.getType())) continue;
                try {
                    field.setAccessible(true);
                    Completion found = findCompletion(field.get(value), depth + 1, seen);
                    if (found != null) return found;
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        }
        return null;
    }

    /** F() can return immediately instead of resuming its continuation. */
    public static void finishSettingsSync(a<?> continuation, Object result) {
        if (continuation instanceof SyncCompletion && !suspended(result))
            ((SyncCompletion) continuation).received(result);
    }

    private static boolean suspended(Object result) {
        return result instanceof Enum<?> && "COROUTINE_SUSPENDED".equals(((Enum<?>) result).name());
    }

    private static boolean success(Object result) {
        // F() returns hx.g(Unit) only after a successful response; hx.b is failure.
        return result != null && "hx.g".equals(result.getClass().getName());
    }

    private static final class SettingUpdate {
        final Object repo;
        final WeakReference<Object> screen;
        final boolean target;
        int completedFields;
        boolean rejected;
        boolean finished;
        final Runnable timeout = () -> finish(false, "account update timed out");

        SettingUpdate(Object repo, Object screen, boolean target) {
            this.repo = repo;
            this.screen = new WeakReference<>(screen);
            this.target = target;
        }

        void start() {
            activeUpdate = this;
            main.postDelayed(timeout, 30000);
            try {
                set(repo, "y", target, this);
                set(repo, "q", !target, this);
            } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
                Log.w("RedditMode", "NSFW settings update failed: " + error.getClass().getSimpleName());
                finish(false, "account update failed");
            }
        }

        void received(int fields, Object result) {
            if (finished || activeUpdate != this) return;
            if ((completedFields & fields) == fields) return;
            Log.i("RedditMode", stateText(target) + " account sync " + fields +
                (success(result) ? " acknowledged" : " rejected"));
            completedFields |= fields;
            rejected |= !success(result);
            // Even after rejection, let the other request finish before starting
            // a queued mode so it cannot overwrite that mode's blur setting later.
            if (completedFields == 3) finish(!rejected,
                rejected ? "account update failed" : "account settings confirmed");
        }

        void finish(boolean confirmed, String message) {
            if (finished || activeUpdate != this) return;
            finished = true;
            main.removeCallbacks(timeout);
            activeUpdate = null;
            SettingUpdate next = queuedUpdate;
            queuedUpdate = null;
            if (next != null) {
                next.start();
                return;
            }
            Object owner = screen.get();
            if (owner == null) return;
            try {
                Activity activity = (Activity) owner.getClass().getMethod("H3").invoke(owner);
                if (activity == null) return;
                Log.i("RedditMode", stateText(target) + " — " + message);
                if (!confirmed)
                    Toast.makeText(activity, stateText(target) + " — " + message, Toast.LENGTH_SHORT).show();
                if (confirmed) refreshFeed(owner);
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
            if (!confirmed) Log.w("RedditMode", "NSFW " + message);
        }
    }

    private static final class SyncCompletion implements a<Object> {
        final a<Object> original;
        final SettingUpdate update;
        final int fields;
        SyncCompletion(a<Object> original, SettingUpdate update, int fields) {
            this.original = original;
            this.update = update;
            this.fields = fields;
        }
        @Override public CoroutineContext getContext() { return original.getContext(); }
        void received(Object result) { main.post(() -> update.received(fields, result)); }
        @Override public void resumeWith(Object result) {
            received(result);
            original.resumeWith(result);
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void refreshFeed(Object screen) {
        Object current = null;
        try {
            current = screen.getClass().getMethod("getCurrentScreen").invoke(screen);
            if (current == null) return;
            if ("com.reddit.feedslegacy.switcher.impl.homepager.compose.HomePagerScreen"
                .equals(current.getClass().getName()))
                current = current.getClass().getMethod("O5").invoke(current);
            if (current == null) return;
            Object viewModel = current.getClass().getMethod("F1").invoke(current);
            Class<?> type = Class.forName("com.reddit.feeds.ui.events.FeedRefreshType");
            Class<?> interaction = Class.forName("com.reddit.feeds.ui.events.FeedRefreshInteractionMode");
            Class<?> eventType = Class.forName("com.reddit.feeds.ui.events.OnFeedRefresh");
            Object event = eventType.getConstructor(type, interaction).newInstance(
                Enum.valueOf((Class<? extends Enum>) type, "PULL_TO_REFRESH"),
                Enum.valueOf((Class<? extends Enum>) interaction, "MANUAL"));
            viewModel.getClass().getMethod("a0", Class.forName("yn1.a")).invoke(viewModel, event);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            if (current != null) try {
                current.getClass().getMethod("q5").invoke(current);
            } catch (ReflectiveOperationException | RuntimeException alsoIgnored) { }
        }
    }

    private static boolean flag(Object value, String name) {
        try { return (Boolean) value.getClass().getMethod(name).invoke(value); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static boolean hasNsfwIndicator(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 5 || !seen.add(value)) return false;
        if ("ym1.v0".equals(value.getClass().getName())) {
            try {
                Object indicators = value.getClass().getField("j").get(value);
                if (indicators instanceof Iterable<?>)
                    for (Object indicator : (Iterable<?>) indicators)
                        if (indicator instanceof Enum<?> && "NSFW".equals(((Enum<?>) indicator).name()))
                            return true;
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
            return false;
        }
        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value)
                if (hasNsfwIndicator(child, depth + 1, seen)) return true;
            return false;
        }
        if (!value.getClass().getName().startsWith("ym1.")) return false;
        for (Field field : value.getClass().getFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
            try {
                if (hasNsfwIndicator(field.get(value), depth + 1, seen)) return true;
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return false;
    }

    private static Object findLink(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 4 || !seen.add(value)) return null;
        if ("com.reddit.domain.model.Link".equals(value.getClass().getName())) return value;
        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value) {
                Object found = findLink(child, depth + 1, seen);
                if (found != null) return found;
            }
            return null;
        }
        String name = value.getClass().getName();
        if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("kotlin.")) return null;
        for (Class<?> type = value.getClass(); type != null && type != Object.class; type = type.getSuperclass())
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object found = findLink(field.get(value), depth + 1, seen);
                    if (found != null) return found;
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        return null;
    }

    private static void set(Object repo, String name, boolean value, SettingUpdate update)
        throws ReflectiveOperationException {
        for (Method method : repo.getClass().getMethods()) {
            if (!method.getName().equals(name) || method.getParameterTypes().length != 2
                || method.getParameterTypes()[0] != boolean.class) continue;
            Completion completion = new Completion(update, name.equals("y") ? 1 : 2);
            Object continuation = name.equals("q")
                ? new LambdaCompletion(completion) : new ImplCompletion(completion);
            Object result = method.invoke(repo, value, continuation);
            if (!suspended(result)) completion.resumeWith(result);
            return;
        }
        throw new NoSuchMethodException(name);
    }

    private static Object kotlinUnit() {
        try {
            Class<?> type = Class.forName("kotlin.Unit");
            try { return type.getField("a").get(null); }
            catch (NoSuchFieldException missing) { return type.getField("INSTANCE").get(null); }
        } catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }

    private static final class Completion implements a<Object> {
        final SettingUpdate update;
        final int fields;
        Completion(SettingUpdate update, int fields) { this.update = update; this.fields = fields; }
        @Override public CoroutineContext getContext() { return EmptyCoroutineContext.INSTANCE; }
        @Override public void resumeWith(Object result) {
            if (!success(result)) main.post(() -> update.received(fields, result));
        }
    }

    private static final class ImplCompletion extends ContinuationImpl {
        ImplCompletion(a<Object> completion) { super(completion); }
        @Override protected Object invokeSuspend(Object result) { return result; }
    }

    private static final class LambdaCompletion extends SuspendLambda {
        LambdaCompletion(a<Object> completion) { super(0, completion); }
        @Override protected Object invokeSuspend(Object result) { return result; }
    }
}
