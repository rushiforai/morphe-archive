package local.reddit.extension;

import android.app.Activity;
import android.content.res.Resources;
import android.widget.Toast;
import java.lang.reflect.*;
import java.util.*;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import wl3.a;

/** Runtime hooks for Reddit 2026.14.0. */
public final class RedditMode {
    private static final String PREFS = "local.reddit.mode";
    private static final String NSFW_ONLY = "nsfw_filter_active";
    private static volatile Object repository;
    private static volatile Object navScreen;
    private static volatile String inboxLabel;
    private static volatile int nsfwLabelId;
    private static volatile boolean mode;
    private static final androidx.compose.runtime.o1 modeState =
        androidx.compose.runtime.j.B(Boolean.FALSE);

    private RedditMode() {}

    public static void initialize(Object screen, Resources resources) {
        navScreen = screen;
        try {
            int id = resources.getIdentifier("label_inbox", "string", "com.reddit.frontpage");
            if (id != 0) inboxLabel = resources.getString(id);
            nsfwLabelId = resources.getIdentifier("label_nsfw", "string", "com.reddit.frontpage");
        } catch (RuntimeException ignored) { }
        try {
            Activity current = (Activity) screen.getClass().getMethod("H3").invoke(screen);
            if (current != null)
                setMode(current.getSharedPreferences(PREFS, 0).getBoolean(NSFW_ONLY, false));
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static void initializeModern(Object screen) {
        try {
            Activity current = (Activity) screen.getClass().getMethod("H3").invoke(screen);
            initialize(screen, current == null ? null : current.getResources());
        } catch (ReflectiveOperationException | RuntimeException ignored) { navScreen = screen; }
    }

    public static Object replaceModernTab(Object model) {
        int label = nsfwLabelId;
        if (model == null || label == 0) return model;
        try {
            Class<?> type = model.getClass();
            Object tab = type.getField("a").get(model);
            String name = ((Enum<?>) tab).name();
            if (!"Inbox".equals(name) && !"UnifiedInbox".equals(name)) return model;
            Object icon = type.getField("d").get(model);
            Constructor<?> ctor = type.getConstructor(tab.getClass(), int.class, int.class, icon.getClass());
            return ctor.newInstance(tab, label, label, icon);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return model; }
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
            for (int i = 1; i < items.size(); i++) {
                String label = (String) items.get(i).getClass().getField("a").get(items.get(i));
                if (label.equals(inboxLabel) || (inboxLabel == null && "Inbox".equals(label))) {
                    items.set(i, button);
                    return;
                }
            }
            items.add(Math.min(1, items.size()), button);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    public static void rememberRepository(Object value) {
        repository = value;
    }

    public static Function0<?> wrapClick(Object descriptor, Function0<?> original) {
        try {
            String label = (String) descriptor.getClass().getField("a").get(descriptor);
            if ("NSFW".equals(label)) return () -> {
                Object screen = navScreen;
                if (screen != null) toggle(screen);
                return kotlinUnit();
            };
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        return original;
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
        if (current == null) return;
        Object repo = repository;
        if (repo == null) {
            Toast.makeText(current, "NSFW settings are not ready", Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            boolean show = getter(repo, "i");
            if (!show) {
                set(repo, "y", true);
                set(repo, "q", false);
                setMode(true);
            } else {
                set(repo, "y", false);
                set(repo, "q", true);
                setMode(false);
            }
            current.getSharedPreferences(PREFS, 0).edit().putBoolean(NSFW_ONLY, mode).apply();
            Toast.makeText(current, mode ? "NSFW mode on" : "NSFW mode off", Toast.LENGTH_SHORT).show();
            refreshFeed(screen);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Toast.makeText(current, "Could not change NSFW settings", Toast.LENGTH_LONG).show();
        }
    }

    private static void setMode(boolean enabled) {
        mode = enabled;
        modeState.setValue(enabled);
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

    private static boolean getter(Object repo, String name) throws ReflectiveOperationException {
        return (Boolean) repo.getClass().getMethod(name).invoke(repo);
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

    private static void set(Object repo, String name, boolean value) throws ReflectiveOperationException {
        for (Method method : repo.getClass().getMethods()) {
            if (!method.getName().equals(name) || method.getParameterTypes().length != 2
                || method.getParameterTypes()[0] != boolean.class) continue;
            a<Object> completion = new Completion();
            Object continuation = name.equals("q")
                ? new LambdaCompletion(completion) : new ImplCompletion(completion);
            method.invoke(repo, value, continuation);
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
        @Override public CoroutineContext getContext() { return EmptyCoroutineContext.INSTANCE; }
        @Override public void resumeWith(Object result) { }
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
