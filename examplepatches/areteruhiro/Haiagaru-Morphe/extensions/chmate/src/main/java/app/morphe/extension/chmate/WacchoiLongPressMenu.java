package app.morphe.extension.chmate;

import android.app.Activity;
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
    private static final int SUFFIX_SEARCH_ITEM_ID = 0x7e000077;
    private static final int PREFIX_SEARCH_ITEM_ID = 0x7e000078;
    private static final java.util.Map<MenuItem,Runnable> PREFIX_NG_ACTIONS=new java.util.WeakHashMap<>();
    public static boolean handlePrefixNg(Object object){
        if(!(object instanceof MenuItem)||((MenuItem)object).getItemId()!=0x7e000079)return false;
        Runnable action=PREFIX_NG_ACTIONS.get(object);if(action!=null)action.run();return true;
    }
    private static Intent upperSearch(Context context,String query){
        java.util.regex.Matcher m=WacchoiSearch.SLIP.matcher(query);
        if(!m.find())return null;
        return new Intent(context,HissiWacchoiSearchActivity.class)
                .putExtra(HissiWacchoiSearchActivity.EXTRA_HALF,HissiWacchoiSearchActivity.HALF_UPPER)
                .putExtra("haiagaru.wacchoi.query",m.group(1)+"-");
    }
    // These are toolbar-only choices. Some ChMate builds reuse the toolbar
    // action catalog for the response long-press Menu as well, so explicitly
    // strip them from that transient menu without removing toolbar choices.
    private static final int EDGE_ARCHIVE_TOOLBAR_ID = 0x7e000001;
    private static final int MARK_ALL_READ_TOOLBAR_ID = 0x7e000003;
    private static final ThreadLocal<Object> ACTIVE_DIALOG = new ThreadLocal<>();
    private static final java.util.Set<Object> ORDERED_NAME_SHEETS =
            Collections.newSetFromMap(Collections.synchronizedMap(new java.util.WeakHashMap<>()));

    public static boolean preferredOrderEnabled() {
        Context context = Haiagaru.applicationContextForExtension();
        return context != null && context.getSharedPreferences(
                "io.github.areteruhiro.chmate.haiagaru.ui-config", Context.MODE_PRIVATE)
                .getBoolean("wacchoiNgFirstMenu", false);
    }

    /** Invoked after native sheet items are appended, only for a marked Wacchoi sheet. */
    public static void reorderNameSheet(Object builder) {
        if (!preferredOrderEnabled() || !ORDERED_NAME_SHEETS.contains(builder)) return;
        try {
            String field;
            switch (builder.getClass().getName()) {
                case "o.setDomStorageEnabled": field = "c"; break;
                case "o.OnUserEarnedRewardListener": field = "b"; break;
                case "o.isDataValid": field = "a"; break;
                default: return;
            }
            Object items = fieldValue(builder, field);
            if (!(items instanceof java.util.List)) return;
            @SuppressWarnings("unchecked") java.util.List<Object> rows = (java.util.List<Object>) items;
            WacchoiMenuOrder.reorder(rows, item -> {
                String titleField;
                switch (item.getClass().getName()) {
                    case "o.setDisplayZoomControls": titleField = "h"; break;
                    case "o.MuteThisAdListener": titleField = "g"; break;
                    case "o.onDataRangeInserted": titleField = "j"; break;
                    default: return "";
                }
                Object title = fieldValue(item, titleField);
                return title instanceof String ? (String) title : "";
            });
        } catch (RuntimeException error) {
            android.util.Log.w("Haiagaru", "Cannot order Wacchoi name sheet", error);
        }
    }

    /** Only the legacy name/SLIP menu calls this; response-body and ID menus stay intact. */
    public static void reorderLegacyNameMenu(Object menuObject) {
        if (!preferredOrderEnabled() || !(menuObject instanceof Menu)
                || !menuObject.getClass().getName().equals("o.m6fExternalSyntheticLambda0")) return;
        Menu menu = (Menu) menuObject;
        if (menu.findItem(76) == null && menu.findItem(ITEM_ID) == null) return;
        MenuItem suffix = menu.findItem(76), search = menu.findItem(ITEM_ID);
        if (suffix != null) suffix.setTitle("ﾜｯﾁｮｲ下4桁でNGName登録");
        if (search != null) search.setTitle("必死チェッカーもどき(ﾜｯﾁｮｲ)");
        Object items = fieldValue(menuObject, "c");
        if (items instanceof java.util.List) {
            @SuppressWarnings("unchecked") java.util.List<MenuItem> rows = (java.util.List<MenuItem>) items;
            WacchoiMenuOrder.reorder(rows, item -> String.valueOf(item.getTitle()));
        }
    }
    private static final java.util.Map<Object, Runnable> SUFFIX_LONG_PRESS =
            Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static String combinedClickableOwner;
    public static void configureCombinedClickable(String owner) { combinedClickableOwner = owner; }

    private static final class SuffixRowBinding {
        final boolean clickable, longClickable, addedClick;
        SuffixRowBinding(android.view.View row) {
            clickable = row.isClickable();
            longClickable = row.isLongClickable();
            addedClick = !row.hasOnClickListeners();
        }
    }

    /** Called by native adapter bind hooks; never changes unrelated rows. */
    public static void bindSuffixRow(Object adapter, int position, android.view.View row) {
        if (!(adapter instanceof android.widget.Adapter) || row == null) return;
        try {
            Object item = ((android.widget.Adapter) adapter).getItem(position);
            bindCompactMenuLabel(item, row);
            Runnable action = SUFFIX_LONG_PRESS.get(item);
            if (action == null && item != null) {
                for (Field field : item.getClass().getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    action = SUFFIX_LONG_PRESS.get(field.get(item));
                    if (action != null) break;
                }
            }
            final Runnable selected = action;
            // Only clear a listener installed by us when a row is recycled.
            if (selected != null) {
                Object previous = row.getTag(0x7e000076);
                SuffixRowBinding binding = previous instanceof SuffixRowBinding
                        ? (SuffixRowBinding) previous : new SuffixRowBinding(row);
                row.setTag(0x7e000076, binding);
                if (binding.addedClick) {
                    // A long-clickable child consumes ACTION_UP before ListView
                    // can dispatch it. Forward via the current parent/position so
                    // native popup dismissal and MenuItem dispatch still run.
                    row.setOnClickListener(v -> {
                        android.view.ViewParent parent = v.getParent();
                        while (parent != null) {
                            if (parent instanceof android.widget.AdapterView) {
                                android.widget.AdapterView<?> list = (android.widget.AdapterView<?>) parent;
                                int current = list.getPositionForView(v);
                                if (current != android.widget.AdapterView.INVALID_POSITION
                                        && list.getOnItemClickListener() != null) {
                                    list.performItemClick(v, current, list.getItemIdAtPosition(current));
                                    return;
                                }
                            }
                            parent = parent.getParent();
                        }
                    });
                }
                row.setOnLongClickListener(v -> { selected.run(); return true; });
            } else if (row.getTag(0x7e000076) instanceof SuffixRowBinding) {
                SuffixRowBinding binding = (SuffixRowBinding) row.getTag(0x7e000076);
                if (binding.addedClick) {
                    row.setOnClickListener(null);
                    row.setClickable(binding.clickable);
                }
                row.setOnLongClickListener(null);
                row.setLongClickable(binding.longClickable);
                row.setTag(0x7e000076, null);
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "NG suffix long press row", error);
        }
    }

    /** Native icon grids allow two lines. Keep action titles intact, but fit their visible labels. */
    private static void bindCompactMenuLabel(Object item, android.view.View row) {
        if (!(item instanceof MenuItem)) return;
        MenuItem menuItem = (MenuItem) item;
        String label;
        switch (menuItem.getItemId()) {
            case 0x7e484a01: label = "レスを保存"; break;
            case 0x7e484b01: label = "投稿者を強調"; break;
            default: return;
        }
        replaceMenuLabel(row, String.valueOf(menuItem.getTitle()), label);
    }

    private static void replaceMenuLabel(android.view.View view, String full, String compact) {
        if (view instanceof android.widget.TextView) {
            android.widget.TextView text = (android.widget.TextView) view;
            if (full.contentEquals(text.getText())) text.setText(compact);
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) replaceMenuLabel(group.getChildAt(i), full, compact);
        }
    }

    /** Replace Compose clickable only for our callback, retaining native gesture arbitration. */
    public static Object suffixCombinedClickable5(Object modifier, boolean enabled, String label, Object click, int mask) {
        return suffixCombinedClickable(modifier, enabled, label, null, click, mask);
    }

    public static Object suffixCombinedClickable(Object modifier, boolean enabled, String label, Object role, Object click, int mask) {
        Runnable action = suffixAction(click, 3, new java.util.IdentityHashMap<>());
        if (action == null) return null;
        try {
            Class<?> callback = click.getClass().getInterfaces()[0];
            Object longClick = java.lang.reflect.Proxy.newProxyInstance(callback.getClassLoader(), new Class<?>[]{callback},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                            if (method.getName().equals("equals")) return proxy == args[0];
                            return "HaiagaruSuffixLongPress";
                        }
                        action.run(); return null;
                    });
            Class<?> clickable = Class.forName(combinedClickableOwner, false, callback.getClassLoader());
            for (Method method : clickable.getDeclaredMethods()) {
                Class<?>[] p = method.getParameterTypes();
                // 241's optimized overload: modifier, enabled, long click,
                // haptic feedback, interaction source, click, default mask.
                if (Modifier.isStatic(method.getModifiers()) && p.length == 7 && p[0].isInstance(modifier)
                        && p[1] == boolean.class && p[2] == callback && p[3] == boolean.class
                        && p[5] == callback && p[6] == int.class) {
                    method.setAccessible(true);
                    return method.invoke(null, modifier, (mask & 1) != 0 || enabled, longClick, true, null, click, 0);
                }
                if (!Modifier.isStatic(method.getModifiers()) || (p.length != 9 && p.length != 10)
                        || !p[0].isInstance(modifier) || p[1] != boolean.class || p[2] != String.class
                        || p[4] != String.class || p[5] != callback || p[6] != callback || p[p.length-1] != callback) continue;
                Object[] args = new Object[p.length];
                args[0] = modifier; args[1] = (mask & 1) != 0 || enabled;
                args[2] = (mask & 2) != 0 ? null : label; args[3] = (mask & 4) != 0 ? null : role;
                args[4] = "下4桁をコピーしてNG編集"; args[5] = longClick;
                if (p.length == 10) args[7] = true;
                args[p.length-1] = click;
                method.setAccessible(true);
                return method.invoke(null, args);
            }
        } catch (Exception error) { android.util.Log.w("Haiagaru", "NG suffix combined click", error); }
        return null;
    }

    // Native sheets copy a menu item and wrap its callback to dismiss the sheet.
    // Match only the captured callback graph, not merely the outer lambda.
    private static Runnable suffixAction(Object value, int depth, java.util.IdentityHashMap<Object, Boolean> seen) {
        if (value == null) return null;
        Runnable direct = SUFFIX_LONG_PRESS.get(value);
        if (direct != null) return direct;
        if (depth == 0 || seen.size() >= 24 || seen.put(value, Boolean.TRUE) != null) return null;
        Class<?> type = value.getClass();
        if (type.getName().startsWith("java.") || type.getName().startsWith("android.")
                || type.getName().startsWith("androidx.") || type.isArray()) return null;
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
            try {
                field.setAccessible(true);
                Runnable found = suffixAction(field.get(value), depth - 1, seen);
                if (found != null) return found;
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return null;
    }

    private WacchoiLongPressMenu() {}

    /** Custom popups bypass MenuItem's listener and call their own dispatcher. */
    public static boolean dispatchSuffixNgItem(Object itemObject) {
        return ResponseArchive.handle(itemObject);
    }

    /** 242's Compose body menu dispatches through ResponseArchive, bypassing MenuItem listeners. */
    public static boolean handleSuffixNg(Object itemObject) {
        if (!(itemObject instanceof MenuItem)) return false;
        MenuItem item = (MenuItem) itemObject;
        if (item.getItemId() != 76) return false;
        try {
            for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
                for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())
                            || !MenuItem.OnMenuItemClickListener.class.isAssignableFrom(field.getType())) continue;
                    field.setAccessible(true);
                    Object listener = field.get(item);
                    if (listener instanceof MenuItem.OnMenuItemClickListener) {
                        return ((MenuItem.OnMenuItemClickListener) listener).onMenuItemClick(item);
                    }
                }
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Cannot dispatch Wacchoi suffix NG menu", error);
        }
        return false;
    }

    /** Name/SLIP bottom sheets use a list builder instead of android.view.Menu. */
    public static void appendNameSheet(Object model, Object builder, Object boardId, String selected) {
        String query = queryInText(selected);
        if (query == null || builder == null) return;
        if (preferredOrderEnabled()) ORDERED_NAME_SHEETS.add(builder);
        SearchContext found = new SearchContext();
        readBoard(boardId, found);
        // The NG scope BoardID may omit its server. Resolve only the current
        // thread flow; never scan other loaded responses for a poster's token.
        if (found.host == null || found.board == null) {
            Object currentThread = invokeNoArg(fieldValue(model, "af"), "d");
            if (currentThread == null) currentThread = invokeNoArg(fieldValue(model, "ab"), "b");
            if (currentThread == null && model != null
                    && "o.getImgAcceptedHeight".equals(model.getClass().getName())) {
                currentThread = invokeNoArg(fieldValue(model, "d"), "c");
            }
            if (currentThread != null) readBoard(currentThread, found);
        }
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
                boolean hasIcon = types.length == 6 && types[4] == Integer.class;
                if (Modifier.isStatic(method.getModifiers()) || (!hasIcon && types.length != 5)
                        || types[0] != String.class || types[1] != String.class
                        || types[2] != boolean.class || types[3] != boolean.class
                        || !types[types.length - 1].isInterface()) continue;
                Class<?> callbackType = types[types.length - 1];
                Object callback = searchCallback(callbackType, launchContext, intent);
                method.setAccessible(true);
                if (found.host != null && found.board != null) {
                    if (ResponseMenuSettings.nameMenuVisible(ITEM_ID)) {
                        appendSheetItem(method, builder, hasIcon, preferredOrderEnabled() ? "必死チェッカーもどき(ﾜｯﾁｮｲ)" : "ﾜｯﾁｮｲで検索",
                                ResponseMenuSettings.wacchoiSearchIcon(), callback);
                        moveLastSheetItem(builder, ResponseMenuSettings.order(ITEM_ID, Integer.MAX_VALUE));
                    }
                    String suffix = WacchoiSuffixNg.suffix(query);
                    Intent upper=upperSearch(launchContext,query);
                    if(upper!=null)upper.putExtra("haiagaru.wacchoi.host",found.host).putExtra("haiagaru.wacchoi.board",found.board);
                    if(upper!=null && ResponseMenuSettings.nameMenuVisible(PREFIX_SEARCH_ITEM_ID)){
                        appendSheetItem(method,builder,hasIcon,"ﾜｯﾁｮｲ上4桁で検索",android.R.drawable.ic_menu_search,
                                searchCallback(callbackType,launchContext,upper));
                        moveLastSheetItem(builder,ResponseMenuSettings.order(PREFIX_SEARCH_ITEM_ID,Integer.MAX_VALUE));
                    }
                    if (suffix != null && ResponseMenuSettings.nameMenuVisible(SUFFIX_SEARCH_ITEM_ID)) {
                        Intent suffixIntent = new Intent(intent)
                                .putExtra("haiagaru.wacchoi.query", "-" + suffix);
                        appendSheetItem(method, builder, hasIcon, "ﾜｯﾁｮｲ下4桁で検索",
                                android.R.drawable.ic_menu_search,
                                searchCallback(callbackType, launchContext, suffixIntent));
                        moveLastSheetItem(builder, ResponseMenuSettings.order(SUFFIX_SEARCH_ITEM_ID, Integer.MAX_VALUE));
                    }
                }
                if(WacchoiSuffixNg.prefix(query)!=null&&ResponseMenuSettings.nameMenuVisible(0x7e000079)){
                    Object upperNg=java.lang.reflect.Proxy.newProxyInstance(callbackType.getClassLoader(),new Class<?>[]{callbackType},(proxy,invoked,args)->{
                        if(invoked.getDeclaringClass()==Object.class){if("hashCode".equals(invoked.getName()))return System.identityHashCode(proxy);if("equals".equals(invoked.getName()))return proxy==args[0];return "HaiagaruPrefixNg";}
                        if("invoke".equals(invoked.getName())&&invoked.getParameterTypes().length==0)WacchoiSuffixNg.confirmPrefix(launchContext,query,found.nativeBoard);
                        return null;
                    });
                    appendSheetItem(method,builder,hasIcon,"ﾜｯﾁｮｲ上4桁をNG登録",android.R.drawable.ic_menu_delete,upperNg);
                    moveLastSheetItem(builder,ResponseMenuSettings.order(0x7e000079,Integer.MAX_VALUE));
                }
                if (WacchoiSuffixNg.suffix(query) != null && ResponseMenuSettings.nameMenuVisible(76)) {
                    Object ngCallback = java.lang.reflect.Proxy.newProxyInstance(
                            callbackType.getClassLoader(), new Class<?>[]{callbackType}, (proxy, invoked, args) -> {
                                if (invoked.getDeclaringClass() == Object.class) {
                                    if ("hashCode".equals(invoked.getName())) return System.identityHashCode(proxy);
                                    if ("equals".equals(invoked.getName())) return proxy == args[0];
                                    return "HaiagaruWacchoiSuffixNg";
                                }
                                if ("invoke".equals(invoked.getName()) && invoked.getParameterTypes().length == 0)
                                    WacchoiSuffixNg.confirm(launchContext, query, found.nativeBoard);
                                return null;
                            });
                    SUFFIX_LONG_PRESS.put(ngCallback, () -> WacchoiSuffixNg.copyAndEdit(launchContext, query));
                    appendSheetItem(method, builder, hasIcon, preferredOrderEnabled() ? "ﾜｯﾁｮｲ下4桁でNGName登録" : "ﾜｯﾁｮｲ下4桁をNG登録",
                            android.R.drawable.ic_menu_delete, ngCallback);
                    moveLastSheetItem(builder, ResponseMenuSettings.order(76, Integer.MAX_VALUE));
                }
                return;
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Cannot append Wacchoi name menu", error);
        }
    }

    private static Object searchCallback(Class<?> callbackType, Context context, Intent intent) {
        return java.lang.reflect.Proxy.newProxyInstance(
                callbackType.getClassLoader(), new Class<?>[]{callbackType}, (proxy, invoked, args) -> {
                    if (invoked.getDeclaringClass() == Object.class) {
                        if ("hashCode".equals(invoked.getName())) return System.identityHashCode(proxy);
                        if ("equals".equals(invoked.getName())) return proxy == args[0];
                        return "HaiagaruWacchoiSearch";
                    }
                    if ("invoke".equals(invoked.getName()) && invoked.getParameterTypes().length == 0) {
                        if (!NativeToolTabs.openSearch(context,intent)) {
                            context.startActivity(intent);
                        }
                    }
                    return null;
                });
    }

    private static void appendSheetItem(Method method, Object builder, boolean hasIcon,
            String title, int icon, Object callback) throws ReflectiveOperationException {
        if (hasIcon) method.invoke(builder, title, null, true, false, Integer.valueOf(icon), callback);
        else method.invoke(builder, title, null, true, false, callback);
    }

    /** Reposition a just-added Compose sheet action using ChMate's saved toolbar order. */
    private static void moveLastSheetItem(Object builder, int requestedIndex) {
        if (builder == null || requestedIndex == Integer.MAX_VALUE) return;
        try {
            java.util.List<?> rows = null;
            for (Class<?> type = builder.getClass(); type != null && rows == null; type = type.getSuperclass()) {
                for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                    if (!java.util.List.class.isAssignableFrom(field.getType())) continue;
                    field.setAccessible(true);
                    Object value = field.get(builder);
                    if (value instanceof java.util.List) { rows = (java.util.List<?>) value; break; }
                }
            }
            if (rows == null || rows.size() < 2) return;
            @SuppressWarnings("unchecked") java.util.List<Object> mutable = (java.util.List<Object>) rows;
            Object item = mutable.remove(mutable.size() - 1);
            mutable.add(Math.max(0, Math.min(requestedIndex, mutable.size())), item);
        } catch (ReflectiveOperationException | RuntimeException error) {
            // The underlying native sheet can be immutable in some releases;
            // keep its native order rather than breaking menu construction.
        }
    }

    /** Marks the response-menu builder; its return hook supplies the built menu. */
    public static void captureDialog(Object dialogFragment) {
        ACTIVE_DIALOG.set(dialogFragment);
    }

    public static void appendDialogActions(Object dialogFragment, Object menuObject) {
        if (!(menuObject instanceof Menu)) return;
        Object parent=invokeNoArg(dialogFragment,"getParentFragment");
        append((Menu)menuObject,dialogFragment,parent,findContext(dialogFragment,parent));
    }

    /** Called just before ChMate returns the menu for a long-pressed response. */
    public static void appendForCurrentDialog(Object menuObject) {
        Object dialogFragment = ACTIVE_DIALOG.get();
        ACTIVE_DIALOG.remove();
        if (!(menuObject instanceof Menu) || dialogFragment == null) return;
        ResponseMenuSettings.prepare(menuObject);
        ResponseArchive.appendDialog(dialogFragment, menuObject);
        Menu menu = (Menu) menuObject;
        removeToolbarOnlyChoices(menu);
        if (!ResponseMenuSettings.visible(ITEM_ID)) menu.removeItem(ITEM_ID);
        if (!ResponseMenuSettings.visible(76)) menu.removeItem(76);
        if (!ResponseMenuSettings.visible(SUFFIX_SEARCH_ITEM_ID)) menu.removeItem(SUFFIX_SEARCH_ITEM_ID);
        if (menu.findItem(ITEM_ID) != null) return;
        Object parent = invokeNoArg(dialogFragment, "getParentFragment");
        SearchContext context = findContext(dialogFragment, parent);
        append(menu, dialogFragment, parent, context);
    }

    /** Adds the action using ChMate 191's selected response, not a recycled row view. */
    public static void appendLegacyForResponse(Object fragmentObject, Object menuObject,
            Object responseObject) {
        appendLegacy(fragmentObject,menuObject,responseObject,false);
    }
    public static void appendLegacyForName(Object fragmentObject,Object menuObject,Object responseObject){
        appendLegacy(fragmentObject,menuObject,responseObject,true);
    }
    private static boolean menuVisible(int id,boolean nameMenu){
        return nameMenu?ResponseMenuSettings.nameMenuVisible(id):ResponseMenuSettings.visible(id);
    }
    private static void appendLegacy(Object fragmentObject,Object menuObject,Object responseObject,boolean nameMenu){
        if (!(menuObject instanceof Menu) || fragmentObject == null || responseObject == null) return;
        Menu menu = (Menu) menuObject;
        removeToolbarOnlyChoices(menu);
        for(int id:new int[]{ITEM_ID,76,SUFFIX_SEARCH_ITEM_ID,PREFIX_SEARCH_ITEM_ID,0x7e000079})
            if(!menuVisible(id,nameMenu))menu.removeItem(id);
        SearchContext found = new SearchContext();
        // 191 stores the displayed name in n and the date/SLIP text in q.
        // Do not search the response body: a quoted Wacchoi belongs to a
        // different poster and must not become this menu's query.
        found.query = queryInText(stringField(responseObject, "n"));
        if (found.query == null) found.query = queryInText(stringField(responseObject, "q"));
        readBoard(fieldValue(fragmentObject, "W"), found);
        append(menu, fragmentObject, fragmentObject, found,nameMenu);
    }

    private static void removeToolbarOnlyChoices(Menu menu) {
        menu.removeItem(EDGE_ARCHIVE_TOOLBAR_ID);
        menu.removeItem(MARK_ALL_READ_TOOLBAR_ID);
    }

    private static void append(Menu menu, Object dialogOrFragment, Object parent,
            SearchContext context) {
        append(menu,dialogOrFragment,parent,context,false);
    }
    private static void append(Menu menu,Object dialogOrFragment,Object parent,SearchContext context,boolean nameMenu){
        if (context == null || context.query == null) return;
        Object activity = invokeNoArg(dialogOrFragment, "getActivity");
        if (!(activity instanceof Context)) activity = invokeNoArg(parent, "getActivity");
        if (!(activity instanceof Context)) activity = invokeNoArg(parent, "getContext");
        if (!(activity instanceof Context)) return;

        final Context ngContext = (Context) activity;
        if(menuVisible(0x7e000079,nameMenu)&&WacchoiSuffixNg.prefix(context.query)!=null&&menu.findItem(0x7e000079)==null){
            MenuItem upperNg=menu.add(Menu.NONE,0x7e000079,ResponseMenuSettings.order(0x7e000079,menu.size()),"ﾜｯﾁｮｲ上4桁をNG登録");
            PREFIX_NG_ACTIONS.put(upperNg,()->WacchoiSuffixNg.confirmPrefix(ngContext,context.query,context.nativeBoard));
            upperNg.setOnMenuItemClickListener(item->handlePrefixNg(item));
        }
        if (menuVisible(76,nameMenu) && WacchoiSuffixNg.suffix(context.query) != null && menu.findItem(76) == null) {
            MenuItem suffixItem = menu.add(Menu.NONE, 76, ResponseMenuSettings.order(76, menu.size()), "ﾜｯﾁｮｲ下4桁をNG登録")
                    .setOnMenuItemClickListener(item -> {
                        WacchoiSuffixNg.confirm(ngContext, context.query, context.nativeBoard);
                        return true;
                    });
            SUFFIX_LONG_PRESS.put(suffixItem, () -> WacchoiSuffixNg.copyAndEdit(ngContext, context.query));
        }
        if (context.host == null || context.board == null
                || KyodemoRouting.boardSlug(context.host, context.board) == null) return;

        Intent intent = new Intent((Context) activity, HissiMenuActivity.class);
        intent.putExtra("haiagaru.wacchoi.search", true);
        intent.putExtra("haiagaru.wacchoi.query", context.query);
        intent.putExtra("haiagaru.wacchoi.host", context.host);
        intent.putExtra("haiagaru.wacchoi.board", context.board);
        if(menu.findItem(ITEM_ID)==null)menu.add(Menu.NONE, ITEM_ID, ResponseMenuSettings.order(ITEM_ID, menu.size()), "ﾜｯﾁｮｲで検索")
                .setIcon(ResponseMenuSettings.wacchoiSearchIcon())
                .setVisible(menuVisible(ITEM_ID,nameMenu))
                .setIntent(intent)
                .setOnMenuItemClickListener(item -> NativeToolTabs.openSearch(ngContext,intent))
                .setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        String suffix = WacchoiSuffixNg.suffix(context.query);
        Intent upper=upperSearch((Context)activity,context.query);
        if(upper!=null)upper.putExtra("haiagaru.wacchoi.host",context.host).putExtra("haiagaru.wacchoi.board",context.board);
        if(upper!=null && menuVisible(PREFIX_SEARCH_ITEM_ID,nameMenu) && menu.findItem(PREFIX_SEARCH_ITEM_ID)==null){
            menu.add(Menu.NONE,PREFIX_SEARCH_ITEM_ID,ResponseMenuSettings.order(PREFIX_SEARCH_ITEM_ID,menu.size()),"ﾜｯﾁｮｲ上4桁で検索")
                    .setIntent(upper).setOnMenuItemClickListener(item->NativeToolTabs.openSearch(ngContext,upper)).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        }
        if (menuVisible(SUFFIX_SEARCH_ITEM_ID,nameMenu) && suffix != null && menu.findItem(SUFFIX_SEARCH_ITEM_ID) == null) {
            Intent lower=new Intent(intent).putExtra("haiagaru.wacchoi.query", "-" + suffix);
            menu.add(Menu.NONE, SUFFIX_SEARCH_ITEM_ID, ResponseMenuSettings.order(SUFFIX_SEARCH_ITEM_ID, menu.size()), "ﾜｯﾁｮｲ下4桁で検索")
                    .setIntent(lower).setOnMenuItemClickListener(item->NativeToolTabs.openSearch(ngContext,lower))
                    .setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        }
    }

    private static SearchContext findContext(Object dialogFragment, Object parent) {
        Set<Object> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        SearchContext found = new SearchContext();
        // In current ChMate, the context-menu target is kept separately from
        // the loaded response list. Prefer it so recycled rows cannot leak a
        // neighboring post's Wacchoi into this action.
        Object selectedResponse = null;
        Object modernResponse=fieldValue(fieldValue(parent,"o"),"c");
        if(modernResponse!=null&&modernResponse.getClass().getName().equals("o.KeJ11")){
            selectedResponse=modernResponse;
            found.query=queryInText(stringField(selectedResponse,"n"));
            if(found.query==null)found.query=queryInText(stringField(selectedResponse,"p"));
            Object modernBoard=fieldValue(fieldValue(parent,"r"),"b");if(modernBoard!=null)readBoard(modernBoard,found);
        }
        if (selectedResponse==null && parent != null && parent.getClass().getName().endsWith("ResListFragment")) {
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
        return found.query == null ? null : found;
    }

    static void appendToolsForResponse(Object owner,Menu menu,Object response,Object board){
        SearchContext found=new SearchContext();readBoard(board,found);
        boolean old=response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError"),middle=response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion");
        found.query=queryInText(stringField(response,middle?"m":"n"));
        if(found.query==null)found.query=queryInText(stringField(response,old?"q":middle?"t":"p"));
        append(menu,owner,owner,found);
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
        if (value.getClass().getName().endsWith("BoardID")) found.nativeBoard = value.toString();
        else {
            for (Method method : value.getClass().getMethods()) {
                if (method.getParameterTypes().length != 0
                        || !method.getReturnType().getName().endsWith("BoardID")) continue;
                try {
                    Object boardId = method.invoke(value);
                    if (boardId != null) found.nativeBoard = boardId.toString();
                } catch (ReflectiveOperationException ignored) { }
                break;
            }
        }
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
        String nativeBoard;
        String host;
        String board;
        String query;

        boolean isComplete() { return host != null && board != null && query != null; }
    }
}
