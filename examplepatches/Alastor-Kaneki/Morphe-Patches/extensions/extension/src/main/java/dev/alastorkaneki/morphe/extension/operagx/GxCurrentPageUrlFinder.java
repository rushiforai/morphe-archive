package dev.alastorkaneki.morphe.extension.operagx;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.IdentityHashMap;
import java.util.Locale;
import java.util.Map;

/** Best-effort current-tab URL discovery that avoids version-specific Opera hooks. */
public final class GxCurrentPageUrlFinder {
    private static final int MAX_VIEWS = 600;
    private static final int MAX_OBJECTS = 220;
    private static final int MAX_DEPTH = 4;
    private static final int MAX_CONTAINER_ITEMS = 20;

    private GxCurrentPageUrlFinder() {
    }

    public static String find(Activity activity) {
        String result = findInIntent(activity, activity.getIntent());
        if (result != null) {
            return result;
        }

        result = findInViewTree(activity.getWindow().getDecorView());
        if (result != null) {
            return result;
        }

        result = findByReflection(activity);
        if (result != null) {
            return result;
        }

        return findClipboardUrl(activity);
    }

    public static String findClipboardUrl(Context context) {
        ClipboardManager manager =
                (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (manager == null || !manager.hasPrimaryClip()) {
            return null;
        }

        ClipData clip = manager.getPrimaryClip();
        if (clip == null) {
            return null;
        }

        int count = Math.min(clip.getItemCount(), MAX_CONTAINER_ITEMS);
        for (int index = 0; index < count; index++) {
            ClipData.Item item = clip.getItemAt(index);
            String result = extract(item.getText());
            if (result != null) {
                return result;
            }
            result = extract(item.getUri());
            if (result != null) {
                return result;
            }
            CharSequence coerced = item.coerceToText(context);
            result = extract(coerced);
            if (result != null) {
                return result;
            }
        }
        return null;
    }

    private static String findInIntent(Context context, Intent intent) {
        if (intent == null) {
            return null;
        }

        String result = extract(intent.getDataString());
        if (result != null) {
            return result;
        }

        result = extract(intent.getCharSequenceExtra(Intent.EXTRA_TEXT));
        if (result != null) {
            return result;
        }

        ClipData clip = intent.getClipData();
        if (clip == null) {
            return null;
        }

        int count = Math.min(clip.getItemCount(), MAX_CONTAINER_ITEMS);
        for (int index = 0; index < count; index++) {
            ClipData.Item item = clip.getItemAt(index);
            result = extract(item.getText());
            if (result != null) {
                return result;
            }
            result = extract(item.getUri());
            if (result != null) {
                return result;
            }
            result = extract(item.coerceToText(context));
            if (result != null) {
                return result;
            }
        }
        return null;
    }

    private static String findInViewTree(View root) {
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        int inspected = 0;

        while (!queue.isEmpty() && inspected++ < MAX_VIEWS) {
            View view = queue.removeFirst();

            String result = extract(view.getContentDescription());
            if (result != null) {
                return result;
            }
            result = extract(view.getTag());
            if (result != null) {
                return result;
            }

            if (view instanceof TextView) {
                TextView textView = (TextView) view;
                result = extract(textView.getText());
                if (result != null) {
                    return result;
                }
                result = extract(textView.getHint());
                if (result != null) {
                    return result;
                }
            }

            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    queue.addLast(group.getChildAt(index));
                }
            }
        }
        return null;
    }

    private static String findByReflection(Activity activity) {
        ArrayDeque<Node> queue = new ArrayDeque<>();
        IdentityHashMap<Object, Boolean> visited = new IdentityHashMap<>();
        ClassLoader applicationClassLoader = activity.getClass().getClassLoader();
        queue.add(new Node(activity, 0));
        int inspected = 0;

        while (!queue.isEmpty() && inspected++ < MAX_OBJECTS) {
            Node node = queue.removeFirst();
            Object value = node.value;
            if (value == null || visited.put(value, Boolean.TRUE) != null) {
                continue;
            }

            String result = extractKnownValue(value);
            if (result != null) {
                return result;
            }

            result = invokeUrlGetters(value);
            if (result != null) {
                return result;
            }

            if (node.depth >= MAX_DEPTH) {
                continue;
            }

            enqueueContainerValues(queue, value, node.depth + 1, applicationClassLoader);

            Class<?> type = value.getClass();
            for (Class<?> cursor = type;
                 cursor != null && cursor != Object.class;
                 cursor = cursor.getSuperclass()) {
                Field[] fields;
                try {
                    fields = cursor.getDeclaredFields();
                } catch (Throwable ignored) {
                    continue;
                }

                for (Field field : fields) {
                    if (Modifier.isStatic(field.getModifiers()) ||
                            field.getType().isPrimitive() ||
                            field.getType().isEnum()) {
                        continue;
                    }
                    try {
                        field.setAccessible(true);
                        Object child = field.get(value);
                        result = extractKnownValue(child);
                        if (result != null) {
                            return result;
                        }
                        if (shouldTraverse(child, applicationClassLoader)) {
                            queue.addLast(new Node(child, node.depth + 1));
                        }
                    } catch (Throwable ignored) {
                        // Obfuscated or framework fields may reject reflective access.
                    }
                }
            }
        }
        return null;
    }

    private static String invokeUrlGetters(Object target) {
        for (Class<?> cursor = target.getClass();
             cursor != null && cursor != Object.class;
             cursor = cursor.getSuperclass()) {
            Method[] methods;
            try {
                methods = cursor.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }

            for (Method method : methods) {
                if (Modifier.isStatic(method.getModifiers()) ||
                        method.getParameterTypes().length != 0 ||
                        method.getReturnType() == Void.TYPE ||
                        method.getReturnType().isPrimitive()) {
                    continue;
                }

                String name = method.getName().toLowerCase(Locale.US);
                if (!(name.contains("url") || name.contains("uri") ||
                        name.equals("getlocation") || name.equals("location"))) {
                    continue;
                }

                try {
                    method.setAccessible(true);
                    String result = extractKnownValue(method.invoke(target));
                    if (result != null) {
                        return result;
                    }
                } catch (Throwable ignored) {
                    // A getter may depend on tab state that is not currently available.
                }
            }
        }
        return null;
    }

    private static void enqueueContainerValues(
            ArrayDeque<Node> queue,
            Object value,
            int depth,
            ClassLoader applicationClassLoader
    ) {
        Class<?> type = value.getClass();
        if (type.isArray()) {
            int length = Math.min(Array.getLength(value), MAX_CONTAINER_ITEMS);
            for (int index = 0; index < length; index++) {
                Object child = Array.get(value, index);
                if (shouldTraverse(child, applicationClassLoader)) {
                    queue.addLast(new Node(child, depth));
                }
            }
            return;
        }

        if (value instanceof Iterable<?>) {
            int count = 0;
            for (Object child : (Iterable<?>) value) {
                if (count++ >= MAX_CONTAINER_ITEMS) {
                    break;
                }
                if (shouldTraverse(child, applicationClassLoader)) {
                    queue.addLast(new Node(child, depth));
                }
            }
            return;
        }

        if (value instanceof Map<?, ?>) {
            int count = 0;
            for (Object child : ((Map<?, ?>) value).values()) {
                if (count++ >= MAX_CONTAINER_ITEMS) {
                    break;
                }
                if (shouldTraverse(child, applicationClassLoader)) {
                    queue.addLast(new Node(child, depth));
                }
            }
        }
    }

    private static boolean shouldTraverse(Object value, ClassLoader applicationClassLoader) {
        if (value == null || value instanceof String || value instanceof CharSequence ||
                value instanceof Number || value instanceof Boolean || value instanceof Character ||
                value instanceof Class<?> || value instanceof ClassLoader || value instanceof Thread ||
                value instanceof Context || value instanceof View) {
            return false;
        }

        Class<?> type = value.getClass();
        if (type.isArray() || value instanceof Iterable<?> || value instanceof Map<?, ?>) {
            return true;
        }

        String name = type.getName();
        if (name.startsWith("java.lang.") || name.startsWith("android.os.") ||
                name.startsWith("android.content.res.") || name.startsWith("java.util.concurrent.")) {
            return false;
        }

        return type.getClassLoader() == applicationClassLoader ||
                name.startsWith("com.opera.") ||
                name.startsWith("org.chromium.");
    }

    private static String extractKnownValue(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof CharSequence || value instanceof Uri ||
                value instanceof java.net.URI || value instanceof java.net.URL) {
            return extract(value);
        }

        String className = value.getClass().getName().toLowerCase(Locale.US);
        if (className.contains("gurl") || className.endsWith("url") ||
                className.endsWith("uri")) {
            try {
                return extract(value.toString());
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static String extract(Object value) {
        if (value == null) {
            return null;
        }
        return GxModUrlResolver.extractStorePageUrl(String.valueOf(value));
    }

    private static final class Node {
        final Object value;
        final int depth;

        Node(Object value, int depth) {
            this.value = value;
            this.depth = depth;
        }
    }
}
