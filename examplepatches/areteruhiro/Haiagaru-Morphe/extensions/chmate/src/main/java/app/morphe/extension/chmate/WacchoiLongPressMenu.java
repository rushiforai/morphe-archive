package app.morphe.extension.chmate;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Adds a board-aware Wacchoi search action to ChMate's response long-press menu. */
public final class WacchoiLongPressMenu {
    private static final int ITEM_ID = 75;
    private static final Pattern LABELED_TOKEN = Pattern.compile(
            "(?i)(?:ﾜｯﾁｮｲw?|ワッチョイ|ﾜｯﾁｮｲ)\\s*[:：]?\\s*([a-z0-9]{4}[-‐‑–—][a-z0-9]{4,})");
    private static final Pattern TOKEN = Pattern.compile(
            "(?i)(?<![a-z0-9])([a-z0-9]{4}[-‐‑–—][a-z0-9]{4,})(?![a-z0-9])");
    private static final ThreadLocal<Object> ACTIVE_DIALOG = new ThreadLocal<>();

    private WacchoiLongPressMenu() {}

    /** Name/SLIP bottom sheets use a list builder instead of android.view.Menu. */
    public static void appendNameSheet(Object model, Object builder, Object boardId, String selected) {
        String query = queryInText(selected);
        if (query == null || builder == null || boardId == null) return;
        SearchContext found = new SearchContext();
        readBoard(boardId, found);
        // The NG scope BoardID may omit its server. In 242 the selected
        // thread URL lives in the view-model's af StateFlow.
        if (found.host == null || found.board == null) {
            Object currentThread = invokeNoArg(fieldValue(model, "af"), "d");
            if (currentThread != null) readBoard(currentThread, found);
        }
        if (found.host == null || found.board == null) return;
        try {
            Context context = null;
            for (Field field : builder.getClass().getDeclaredFields()) {
                if (!Context.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                context = (Context) field.get(builder);
                if (context != null) break;
            }
            if (context == null) return;
            final Context launchContext = context;
            final Intent intent = new Intent(context, HissiMenuActivity.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    .putExtra("haiagaru.wacchoi.search", true)
                    .putExtra("haiagaru.wacchoi.query", query)
                    .putExtra("haiagaru.wacchoi.host", found.host)
                    .putExtra("haiagaru.wacchoi.board", found.board);
            for (Method method : builder.getClass().getDeclaredMethods()) {
                Class<?>[] types = method.getParameterTypes();
                if (Modifier.isStatic(method.getModifiers()) || types.length != 6
                        || types[0] != String.class || types[1] != String.class
                        || types[2] != boolean.class || types[3] != boolean.class
                        || types[4] != Integer.class || !types[5].isInterface()) continue;
                Object callback = java.lang.reflect.Proxy.newProxyInstance(
                        types[5].getClassLoader(), new Class<?>[]{types[5]}, (proxy, invoked, args) -> {
                            if (invoked.getDeclaringClass() == Object.class) {
                                if ("hashCode".equals(invoked.getName())) return System.identityHashCode(proxy);
                                if ("equals".equals(invoked.getName())) return proxy == args[0];
                                return "HaiagaruWacchoiSearch";
                            }
                            if ("invoke".equals(invoked.getName()) && invoked.getParameterTypes().length == 0) {
                                launchContext.startActivity(intent);
                            }
                            return null;
                        });
                method.setAccessible(true);
                method.invoke(builder, "ﾜｯﾁｮｲで検索", null, true, false,
                        Integer.valueOf(android.R.drawable.ic_menu_search), callback);
                return;
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Cannot append Wacchoi name menu", error);
        }
    }

    /** Marks the response-menu builder; its return hook supplies the built menu. */
    public static void captureDialog(Object dialogFragment) {
        ACTIVE_DIALOG.set(dialogFragment);
    }

    /** Called just before ChMate returns the menu for a long-pressed response. */
    public static void appendForCurrentDialog(Object menuObject) {
        Object dialogFragment = ACTIVE_DIALOG.get();
        ACTIVE_DIALOG.remove();
        if (!(menuObject instanceof Menu) || dialogFragment == null) return;
        Menu menu = (Menu) menuObject;
        if (menu.findItem(ITEM_ID) != null) return;
        Object parent = invokeNoArg(dialogFragment, "getParentFragment");
        SearchContext context = findContext(dialogFragment, parent);
        append(menu, dialogFragment, parent, context);
    }

    /** Adds the action to ChMate 191's legacy ListView response menu. */
    public static void appendLegacyForView(Object fragmentObject, Object menuObject,
            Object targetObject) {
        if (!(menuObject instanceof Menu) || fragmentObject == null) return;
        Menu menu = (Menu) menuObject;
        if (menu.findItem(ITEM_ID) != null) return;
        Object fragment = fragmentObject;
        SearchContext context = findContextFromLegacyRow(fragment, targetObject);
        append(menu, fragment, fragment, context);
    }

    /** Handles the added item in 191, whose popup callback does not dispatch MenuItem intents. */
    public static boolean dispatchLegacyMenuItem(Object fragmentObject, int itemId,
            Object itemObject) {
        if (itemId != ITEM_ID || !(itemObject instanceof MenuItem) || fragmentObject == null) return false;
        Intent intent = ((MenuItem) itemObject).getIntent();
        if (intent == null) return false;
        Object activity = invokeNoArg(fragmentObject, "getActivity");
        if (!(activity instanceof Context)) return false;
        ((Context) activity).startActivity(intent);
        return true;
    }

    private static void append(Menu menu, Object dialogOrFragment, Object parent,
            SearchContext context) {
        if (context == null || context.host == null || context.board == null
                || context.query == null) return;
        if (KyodemoRouting.boardSlug(context.host, context.board) == null) return;
        Object activity = invokeNoArg(dialogOrFragment, "getActivity");
        if (!(activity instanceof Context)) activity = invokeNoArg(parent, "getActivity");
        if (!(activity instanceof Context)) activity = invokeNoArg(parent, "getContext");
        if (!(activity instanceof Context)) return;

        Intent intent = new Intent((Context) activity, HissiMenuActivity.class);
        intent.putExtra("haiagaru.wacchoi.search", true);
        intent.putExtra("haiagaru.wacchoi.query", context.query);
        intent.putExtra("haiagaru.wacchoi.host", context.host);
        intent.putExtra("haiagaru.wacchoi.board", context.board);
        menu.add(Menu.NONE, ITEM_ID, menu.size(), "ﾜｯﾁｮｲで検索")
                .setIntent(intent)
                .setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
    }

    private static SearchContext findContext(Object dialogFragment, Object parent) {
        Set<Object> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        SearchContext found = new SearchContext();
        // In current ChMate, the context-menu target is kept separately from
        // the loaded response list. Prefer it so recycled rows cannot leak a
        // neighboring post's Wacchoi into this action.
        Object target = fieldValue(parent, "o");
        Object selectedResponse = fieldValue(target, "c");
        if (selectedResponse != null) visit(selectedResponse, 0, seen, found, true);
        // Some releases keep the selected response in the dialog's arguments
        // or view-model rather than the list fragment. Search that first so a
        // neighboring loaded row cannot supply the query accidentally.
        if (found.query == null) visit(dialogFragment, 0, seen, found, true);
        if (found.query == null || found.host == null || found.board == null) {
            Object arguments = invokeNoArg(dialogFragment, "getArguments");
            if (arguments instanceof Bundle) {
                Bundle bundle = (Bundle) arguments;
                for (String key : bundle.keySet()) {
                    visit(bundle.get(key), 0, seen, found, found.query == null);
                    if (found.isComplete()) break;
                }
            }
        }
        if (found.host == null || found.board == null || found.query == null) {
            visit(parent, 0, seen, found, false);
        }
        if (found.host == null || found.board == null) {
            Object activity = invokeNoArg(dialogFragment, "getActivity");
            visit(activity, 0, seen, found, false);
        }
        return found.query == null || found.host == null || found.board == null ? null : found;
    }

    private static SearchContext findContextFromLegacyRow(Object fragment, Object targetObject) {
        Set<Object> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        SearchContext found = new SearchContext();
        if (targetObject instanceof View) {
            readVisibleText((View) targetObject, found, 0);
            Object tag = ((View) targetObject).getTag();
            if (found.query == null) visit(tag, 0, seen, found, true);
        }
        // The board is held on the legacy list fragment. Never fall back to
        // another loaded post's token when the selected row has no Wacchoi.
        visitForBoard(fragment, 0, seen, found);
        return found.query == null || found.host == null || found.board == null ? null : found;
    }

    private static void readVisibleText(View view, SearchContext found, int depth) {
        if (view == null || depth > 8 || found.query != null) return;
        if (view instanceof TextView) {
            String text = String.valueOf(((TextView) view).getText());
            found.query = queryInText(text);
            if (found.query != null) return;
        }
        CharSequence description = view.getContentDescription();
        if (description != null) found.query = queryInText(description.toString());
        if (found.query != null) return;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount() && found.query == null; i++) {
                readVisibleText(group.getChildAt(i), found, depth + 1);
            }
        }
    }

    private static void visitForBoard(Object value, int depth, Set<Object> seen,
            SearchContext found) {
        if (value == null || depth > 5 || !seen.add(value)) return;
        Class<?> type = value.getClass();
        if (!(type.getName().startsWith("jp.syoboi.a2chMate.")
                || type.getName().startsWith("o."))) return;
        if (type.getName().endsWith("BBSUrlInfo")) readBoard(value, found);
        if (found.host != null && found.board != null) return;
        for (Class<?> current = type; current != null && current != Object.class;
                current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object child = field.get(value);
                    if (child instanceof Iterable<?>) {
                        for (Object item : (Iterable<?>) child) {
                            visitForBoard(item, depth + 1, seen, found);
                        }
                    } else if (child != null && child.getClass().isArray()) {
                        int length = Math.min(java.lang.reflect.Array.getLength(child), 32);
                        for (int i = 0; i < length; i++) {
                            visitForBoard(java.lang.reflect.Array.get(child, i), depth + 1, seen, found);
                        }
                    } else {
                        visitForBoard(child, depth + 1, seen, found);
                    }
                    if (found.host != null && found.board != null) return;
                } catch (Throwable ignored) { }
            }
        }
    }

    private static Object fieldValue(Object target, String name) {
        if (target == null) return null;
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static void visit(Object value, int depth, Set<Object> seen, SearchContext found,
            boolean readQuery) {
        if (value == null || depth > 5 || seen.size() >= 128
                || found.isComplete() || !seen.add(value)) return;
        Class<?> type = value.getClass();
        String typeName = type.getName();
        if (!(typeName.startsWith("jp.syoboi.a2chMate.") || typeName.startsWith("o.")
                || typeName.startsWith("kotlin."))) return;

        if (typeName.endsWith("BBSUrlInfo")) readBoard(value, found);
        if (readQuery && found.query == null) readTokenFromFields(value, found);
        if (found.isComplete()) return;

        // Kotlin view-model holders often expose the current BBSUrlInfo through
        // a no-argument accessor; invoke only accessors whose declared result is
        // exactly that data type, avoiding arbitrary application methods.
        for (Method method : type.getDeclaredMethods()) {
            if (method.getParameterTypes().length != 0
                    || !method.getReturnType().getName().endsWith("BBSUrlInfo")) continue;
            try {
                method.setAccessible(true);
            visit(method.invoke(value), depth + 1, seen, found, readQuery);
            } catch (Throwable ignored) { }
        }
        for (Class<?> current = type; current != null && current != Object.class;
                current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    Object child = field.get(value);
                    if (child instanceof Iterable<?>) {
                        for (Object item : (Iterable<?>) child) {
                            visit(item, depth + 1, seen, found, readQuery);
                        }
                    } else if (child != null && child.getClass().isArray()) {
                        int length = Math.min(java.lang.reflect.Array.getLength(child), 32);
                        for (int i = 0; i < length; i++) {
                            visit(java.lang.reflect.Array.get(child, i), depth + 1, seen, found, readQuery);
                        }
                    } else {
                        visit(child, depth + 1, seen, found, readQuery);
                    }
                    if (found.isComplete()) return;
                } catch (Throwable ignored) { }
            }
        }
    }

    private static void readBoard(Object value, SearchContext found) {
        String[] hostFields = {"f", "e", "b", "c", "i", "j"};
        String[] boardFields = {"g", "f", "c", "b", "j", "i"};
        for (String field : hostFields) {
            String candidate = stringField(value, field);
            if (!KyodemoRouting.supportsHost(candidate)) continue;
            for (String boardField : boardFields) {
                String board = stringField(value, boardField);
                if (board != null && KyodemoRouting.boardSlug(candidate, board) != null) {
                    found.host = candidate;
                    found.board = board;
                    return;
                }
            }
        }
        // Field names change between ChMate releases. As a final fallback,
        // inspect all String properties on this exact BBSUrlInfo object and
        // choose the pair accepted by the board router.
        java.util.ArrayList<String> strings = new java.util.ArrayList<>();
        for (Class<?> type = value.getClass(); type != null && type != Object.class;
                type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    String text = (String) field.get(value);
                    if (text != null && !text.trim().isEmpty()) strings.add(text.trim());
                } catch (Throwable ignored) { }
            }
        }
        for (String host : strings) {
            if (!KyodemoRouting.supportsHost(host)) continue;
            for (String board : strings) {
                if (!host.equals(board) && KyodemoRouting.boardSlug(host, board) != null) {
                    found.host = host;
                    found.board = board;
                    return;
                }
            }
        }
        String description;
        try { description = value.toString(); } catch (Throwable ignored) { return; }
        Matcher matcher = Pattern.compile("server[:=]\\s*([^,})]+).*?name[:=]\\s*([^,})]+)")
                .matcher(description);
        if (matcher.find()) {
            String host = matcher.group(1).trim();
            String board = matcher.group(2).trim();
            if (KyodemoRouting.boardSlug(host, board) != null) {
                found.host = host;
                found.board = board;
            }
        }
    }

    private static String stringField(Object target, String name) {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                if (field.getType() != String.class) continue;
                field.setAccessible(true);
                String value = (String) field.get(target);
                return value == null || value.trim().isEmpty() ? null : value.trim();
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static void readTokenFromFields(Object target, SearchContext found) {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    String text = (String) field.get(target);
                    if (text == null) continue;
                    Matcher labeled = LABELED_TOKEN.matcher(text);
                    if (labeled.find()) {
                        found.query = normalize(labeled.group(1));
                        return;
                    }
                    // ChMate stores the already-parsed token without its label
                    // in some versions; only accept a standalone token then.
                    Matcher token = TOKEN.matcher(text);
                    if (token.find()) {
                        found.query = normalize(token.group(1));
                        return;
                    }
                } catch (Throwable ignored) { }
            }
        }
    }

    private static String queryInText(String text) {
        if (text == null || text.isEmpty()) return null;
        Matcher labeled = LABELED_TOKEN.matcher(text);
        if (labeled.find()) return normalize(labeled.group(1));
        Matcher token = TOKEN.matcher(text);
        return token.find() ? normalize(token.group(1)) : null;
    }

    private static String normalize(String value) {
        return value == null ? null : value.replace('‐', '-').replace('‑', '-')
                .replace('–', '-').replace('—', '-');
    }

    private static Object invokeNoArg(Object target, String name) {
        if (target == null) return null;
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod(name);
                method.setAccessible(true);
                return method.invoke(target);
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static final class SearchContext {
        String host;
        String board;
        String query;

        boolean isComplete() { return host != null && board != null && query != null; }
    }
}
