package app.morphe.extension.chmate;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

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

    /** Adds the action using ChMate 191's selected response, not a recycled row view. */
    public static void appendLegacyForResponse(Object fragmentObject, Object menuObject,
            Object responseObject) {
        if (!(menuObject instanceof Menu) || fragmentObject == null || responseObject == null) return;
        Menu menu = (Menu) menuObject;
        if (menu.findItem(ITEM_ID) != null) return;
        SearchContext found = new SearchContext();
        // 191 stores the displayed name in n and the date/SLIP text in q.
        // Do not search the response body: a quoted Wacchoi belongs to a
        // different poster and must not become this menu's query.
        found.query = queryInText(stringField(responseObject, "n"));
        if (found.query == null) found.query = queryInText(stringField(responseObject, "q"));
        readBoard(fieldValue(fragmentObject, "W"), found);
        append(menu, fragmentObject, fragmentObject, found);
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
        Object selectedResponse = null;
        if (parent != null && parent.getClass().getName().endsWith("ResListFragment")) {
            // 226 keeps the long-pressed response in i.b and its board in E.
            Object legacySelection = fieldValue(parent, "i");
            selectedResponse = fieldValue(legacySelection, "b");
            Object legacyBoard = fieldValue(parent, "E");
            if (legacyBoard != null && legacyBoard.getClass().getName().endsWith("BBSUrlInfo")) {
                readBoard(legacyBoard, found);
            }
            // 241 keeps the selected response in k.d. The o field is the
            // RecyclerView adapter, not a response; traversing it could pick
            // a token from a different, already-loaded row.
            if (selectedResponse == null) {
                selectedResponse = fieldValue(fieldValue(parent, "k"), "d");
                Object model = invokeNoArg(fieldValue(parent, "s"), "getValue");
                Object boardFlow = fieldValue(model, "ab");
                Object board = invokeNoArg(boardFlow, "b");
                if (board != null && board.getClass().getName().endsWith("BBSUrlInfo")) {
                    readBoard(board, found);
                }
            }
        }
        // Other versions can still expose the target through the older holder.
        if (selectedResponse == null) {
            Object target = fieldValue(parent, "o");
            selectedResponse = fieldValue(target, "c");
        }
        if (selectedResponse != null) {
            String selectedType = selectedResponse.getClass().getName();
            if (selectedType.equals("o.BouncyCastleSocketAdapterCompanion")) {
                // 226: m is the name, t is the date/SLIP, d is the body.
                found.query = queryInText(stringField(selectedResponse, "m"));
                if (found.query == null) found.query = queryInText(stringField(selectedResponse, "t"));
            } else if (selectedType.equals("o.setDislikeWidth")) {
                // 241: n is the name, p is the date/SLIP, g is the body.
                found.query = queryInText(stringField(selectedResponse, "n"));
                if (found.query == null) found.query = queryInText(stringField(selectedResponse, "p"));
            } else {
                readTokenFromFields(selectedResponse, found);
                if (found.query == null) visit(selectedResponse, 0, seen, found, true);
            }
        }
        // Some releases keep the selected response in the dialog's arguments
        // or view-model rather than the list fragment. Search that first so a
        // neighboring loaded row cannot supply the query accidentally.
        if (found.query == null && selectedResponse == null) {
            visit(dialogFragment, 0, seen, found, true);
        }
        if (found.query == null || found.host == null || found.board == null) {
            Object arguments = invokeNoArg(dialogFragment, "getArguments");
            if (arguments instanceof Bundle) {
                Bundle bundle = (Bundle) arguments;
                for (String key : bundle.keySet()) {
                    visit(bundle.get(key), 0, seen, found,
                            found.query == null && selectedResponse == null);
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
        if (value == null) return;
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
                if (Modifier.isStatic(field.getModifiers())
                        || (field.getType() != String.class
                        && field.getType() != CharSequence.class
                        && field.getType() != CharSequence[].class)) continue;
                try {
                    field.setAccessible(true);
                    Object raw = field.get(target);
                    if (raw instanceof CharSequence[]) {
                        for (CharSequence part : (CharSequence[]) raw) {
                            if (part != null && (found.query = queryInText(part.toString())) != null) return;
                        }
                        continue;
                    }
                    String text = raw == null ? null : raw.toString();
                    if (text == null) continue;
                    String edgeSlip = KyodemoRouting.edgeWacchoiInText(text);
                    if (edgeSlip != null) {
                        found.query = edgeSlip;
                        return;
                    }
                    String labeled = KyodemoRouting.labeledWacchoiInText(text);
                    if (labeled != null) {
                        found.query = labeled;
                        return;
                    }
                    // ChMate stores the already-parsed token without its label
                    // in some versions; only accept a standalone token then.
                    String token = KyodemoRouting.bareWacchoiInText(text);
                    if (token != null) {
                        found.query = token;
                        return;
                    }
                } catch (Throwable ignored) { }
            }
        }
    }

    private static String queryInText(String text) {
        if (text == null || text.isEmpty()) return null;
        String edgeSlip = KyodemoRouting.edgeWacchoiInText(text);
        if (edgeSlip != null) return edgeSlip;
        String labeled = KyodemoRouting.labeledWacchoiInText(text);
        if (labeled != null) return labeled;
        return KyodemoRouting.bareWacchoiInText(text);
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
