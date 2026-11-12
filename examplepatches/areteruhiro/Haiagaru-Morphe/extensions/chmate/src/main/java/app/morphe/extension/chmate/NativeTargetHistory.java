package app.morphe.extension.chmate;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Use ChMate's thread rows, rank palette and long-press callbacks for refresh targets. */
final class NativeTargetHistory {
    private static final String COLUMNS =
            "_id,title,name,created,res_count,server_res_count,read_count,access,bookmark_order,flag,state,posted";

    static List<Object> load(Context context, String version, List<RefreshTargetHistory.Entry> entries) throws Exception {
        Map<String,Object> rows = new LinkedHashMap<>();
        Set<String> keys = new java.util.HashSet<>();
        for (RefreshTargetHistory.Entry entry : entries) keys.add(entry.key);
        ClassLoader loader = context.getClassLoader();
        boolean old = version.contains("191"), middle = version.contains("226");
        Class<?> boardType = Class.forName(old ? "jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID"
                : "jp.syoboi.a2chMate.client.BoardID", false, loader);
        Constructor<?> constructor = null;
        Method build = null, convert = null;
        if (old || middle) {
            Class<?> rowType = Class.forName(old ? "o.onAdDisplayed$setIcon" : "o.Yy2$open", false, loader);
            constructor = rowType.getConstructor(long.class, String.class, boardType, long.class,
                    int.class, int.class, int.class, long.class, int.class, byte.class, int.class, long.class);
        } else {
            Class<?> factory = Class.forName("o.fromModuleInstallRequest", false, loader);
            build = factory.getMethod("b", long.class, String.class, String.class, long.class,
                    int.class, int.class, int.class, long.class, int.class, int.class, int.class, long.class);
            convert = factory.getMethod("a", build.getReturnType());
        }
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getPath(),
                null, SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery("SELECT " + COLUMNS + " FROM bookmarks", null)) {
            while (cursor.moveToNext()) {
                String board = cursor.getString(2);
                long created = cursor.getLong(3);
                String key = board + "\n" + created;
                if (!keys.contains(key)) continue;
                Object row;
                int count = Math.max(cursor.getInt(4), cursor.getInt(5));
                if (old || middle) {
                    Object boardId = old ? boardType.getConstructor(String.class).newInstance(board)
                            : boardType.getMethod("b", String.class).invoke(null, board);
                    row = constructor.newInstance(cursor.getLong(0), cursor.getString(1), boardId, created,
                            count, cursor.getInt(4), cursor.getInt(6), cursor.getLong(7), cursor.getInt(8),
                            (byte)cursor.getInt(9), cursor.getInt(10), cursor.getLong(11));
                } else {
                    Object bookmark = build.invoke(null, cursor.getLong(0), cursor.getString(1), board, created,
                            cursor.getInt(4), cursor.getInt(5), cursor.getInt(6), cursor.getLong(7),
                            cursor.getInt(8), cursor.getInt(9), cursor.getInt(10), cursor.getLong(11));
                    row = convert.invoke(null, bookmark);
                }
                rows.put(key, row);
            }
        }
        List<Object> result = new ArrayList<>();
        for (RefreshTargetHistory.Entry entry : entries) {
            Object row = rows.get(entry.key);
            if (row != null) result.add(row);
        }
        return result;
    }

    static Binding show(android.widget.PopupWindow popup, String version, Context context, List<Object> rows)
            throws Exception {
        boolean old = version.contains("191"), middle = version.contains("226");
        Object surface = field(popup, old || !middle ? "i" : "k").get(popup);
        if (old || middle) {
            Class<?> type = Class.forName(old ? "o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA" : "o.bea1",
                    false, context.getClassLoader());
            Object adapter = type.getConstructor(Context.class).newInstance(context);
            Field data = field(adapter, old ? "i" : "g");
            Object nativeRows = data.getType().getConstructor(int.class).newInstance(rows.size());
            @SuppressWarnings("unchecked") List<Object> list = (List<Object>)nativeRows;
            list.addAll(rows);
            data.set(adapter, nativeRows);
            field(adapter, old ? "e" : "c").setInt(adapter, 2);
            field(adapter, old ? "l" : "i").setBoolean(adapter, false);
            type.getMethod("b").invoke(adapter);
            android.widget.ListView nativeList = (android.widget.ListView)surface;
            AdapterView.OnItemClickListener targetClick =
                    (AdapterView.OnItemClickListener)field(popup, old ? "c" : "f").get(popup);
            AdapterView.OnItemLongClickListener targetLongClick =
                    (AdapterView.OnItemLongClickListener)field(popup, old ? "f" : "l").get(popup);
            Binding binding = new Binding() {
                ListAdapter original;
                AdapterView.OnItemClickListener click;
                AdapterView.OnItemLongClickListener longClick;
                public void ensure() {
                    if (nativeList.getAdapter() == adapter) return;
                    original = nativeList.getAdapter();
                    click = nativeList.getOnItemClickListener();
                    longClick = nativeList.getOnItemLongClickListener();
                    nativeList.setAdapter((ListAdapter)adapter);
                    nativeList.setOnItemClickListener(targetClick);
                    nativeList.setOnItemLongClickListener(targetLongClick);
                }
                public void restore() {
                    if (nativeList.getAdapter() == adapter) {
                        nativeList.setAdapter(original);
                        nativeList.setOnItemClickListener(click);
                        nativeList.setOnItemLongClickListener(longClick);
                    }
                }
            };
            binding.ensure();
            ((BaseAdapter)adapter).notifyDataSetChanged();
            return binding;
        }
        Class<?> factory = Class.forName("o.elapsedRealtime", false, context.getClassLoader());
        Object adapter = factory.getMethod("c", Context.class).invoke(null, context);
        field(adapter, "j").set(adapter, field(popup, "n").get(popup));
        field(adapter, "h").set(adapter, field(popup, "m").get(popup));
        adapter.getClass().getMethod("c", List.class).invoke(adapter, rows);
        Class<?> adapterType = Class.forName("androidx.recyclerview.widget.RecyclerView$read",
                false, context.getClassLoader());
        Method setter = surface.getClass().getMethod("setAdapter", adapterType);
        Method getter = surface.getClass().getMethod("getAdapter");
        Binding binding = new Binding() {
            Object original;
            public void ensure() throws Exception {
                Object current = getter.invoke(surface);
                if (current == adapter) return;
                original = current;
                setter.invoke(surface, adapter);
            }
            public void restore() throws Exception {
                if (getter.invoke(surface) == adapter) setter.invoke(surface, original);
            }
        };
        binding.ensure();
        return binding;
    }

    private static Field field(Object owner, String name) throws Exception {
        return NativeFields.find(owner.getClass(), name);
    }

    interface Binding {
        void ensure() throws Exception;
        void restore() throws Exception;
    }

    private NativeTargetHistory() {}
}
