package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.PointF;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Destructive actions stay scoped to the board list that received the input. */
public final class DeleteReadThreads {
    public static final String KEY = "haiagaruGestureDeleteReadThreads";
    public static final String LONG_PRESS_KEY = "deleteReadThreadsLongPress";
    private static final Map<Object, Boolean> dialogs = new WeakHashMap<>();
    private DeleteReadThreads() {}

    static boolean boardList(Object fragment) {
        if (fragment == null) return false;
        String name = fragment.getClass().getName();
        return name.equals("o.r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ")
                || name.equals("o.Yhp5")
                || name.equals("jp.syoboi.a2chMate.ui.threadlist.ThreadListFragment");
    }

    public static boolean longClick(Object fragment, View button) {
        if(ExtraQuickFilters.longClick(fragment,button))return true;
        if (!boardList(fragment) || button == null || button.getId() != 5) return false;
        if (!Haiagaru.deleteReadThreadsLongPressEnabled()) return false;
        show(fragment);
        return true;
    }

    /** Compatibility no-op for older lifecycle hooks. On 191/226/242 native toolbar long presses reach
     * RoidonListFragment.onLongClick, which the patch intercepts for action 5.
     * Never attach a listener to findViewById(5): the toolbar's only child is a
     * reusable dispatch/anchor View, not a refresh button. Making it long-clickable
     * causes ViewGroup dispatch to deliver later taps to that child instead of
     * the native toolbar, swallowing refresh/patrol clicks after the first use.
     */
    public static void bind(Object fragment) {
        // Intentionally no View mutation. Use the native long-click hook only.
    }

    public static boolean gesture(View view, PointF start) {
        Activity activity = activity(view.getContext());
        if (activity == null) return true;
        try {
            Object manager = fragmentManager(activity);
            ArrayList<Object> candidates = new ArrayList<>();
            find(manager, view, start, candidates);
            // Never fall back to another pane or a globally last-used fragment.
            if (candidates.size() == 1) show(candidates.get(0));
            else toast(activity, "板のスレ一覧上でジェスチャーを行ってください");
        } catch (Exception error) { log(error); toast(activity, "スレ一覧を確認できませんでした"); }
        return true;
    }

    private static void find(Object manager, View input, PointF start, List<Object> result) throws Exception {
        List<?> fragments = (List<?>) fragmentsMethod(manager).invoke(manager);
        for (Object fragment : fragments) {
            // A removed tab can remain in the manager during a transition. Its child
            // manager getter throws before attachment; it must not abort another pane.
            if (fragment == null || !attached(fragment)) continue;
            View root = (View) fragment.getClass().getMethod("getView").invoke(fragment);
            if (boardList(fragment) && root != null && root.isShown()) {
                boolean belongs = descendant(input, root);
                if (!belongs && start != null && descendant(root, input)) {
                    int[] origin = new int[2]; input.getLocationOnScreen(origin);
                    Rect visible = new Rect();
                    belongs = root.getGlobalVisibleRect(visible)
                            && visible.contains(origin[0] + Math.round(start.x), origin[1] + Math.round(start.y));
                }
                if (belongs) result.add(fragment);
            }
            find(fragment.getClass().getMethod("getChildFragmentManager").invoke(fragment), input, start, result);
        }
    }

    private static Object fragmentManager(Activity activity) throws Exception {
        ClassLoader loader = activity.getClass().getClassLoader();
        Class<?> owner = Class.forName("androidx.fragment.app.FragmentActivity", false, loader);
        Class<?> result = Class.forName("androidx.fragment.app.FragmentManager", false, loader);
        return noArgMethod(owner, "getSupportFragmentManager", result).invoke(activity);
    }

    private static Method fragmentsMethod(Object manager) throws Exception {
        Class<?> owner = Class.forName("androidx.fragment.app.FragmentManager", false,
                manager.getClass().getClassLoader());
        return noArgMethod(owner, "getFragments", List.class);
    }

    /** ChMate obfuscates AndroidX getters (e.g. n()/q() in 226).
     * Resolve only the framework owner and exact signature, never an arbitrary
     * activity method or an arbitrary list field (which may contain back-stack tabs).
     * An ambiguous/changed API fails closed before any deletion confirmation.
     */
    private static Method noArgMethod(Class<?> owner, String name, Class<?> result) throws Exception {
        try {
            Method named = owner.getMethod(name);
            if (named.getReturnType() == result && !Modifier.isStatic(named.getModifiers())) return named;
        } catch (NoSuchMethodException ignored) { }
        Method found = null;
        for (Method method : owner.getDeclaredMethods()) {
            if (!Modifier.isPublic(method.getModifiers()) || Modifier.isStatic(method.getModifiers())
                    || method.getParameterTypes().length != 0 || method.getReturnType() != result
                    || method.isBridge() || method.isSynthetic()) continue;
            if (found != null) throw new NoSuchMethodException("Ambiguous fragment API: " + owner.getName());
            found = method;
        }
        if (found == null) throw new NoSuchMethodException(owner.getName() + "." + name);
        return found;
    }

    private static boolean descendant(View child, View root) {
        for (View current = child; current != null;) {
            if (current == root) return true;
            android.view.ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    static final class Candidate {
        final long id, created; final String board, title; final int unread;
        Candidate(long id, String board, long created, String title) {
            this(id,board,created,title,0);
        }
        Candidate(long id, String board, long created, String title,int unread) {
            this.id=id; this.board=board; this.created=created; this.title=title; this.unread=unread;
        }
    }

    public static void show(Object fragment) {
        if (!boardList(fragment) || dialogs.containsKey(fragment)) return;
        Activity activity = Haiagaru.toolbarActivity(fragment);
        if (activity == null || activity.isFinishing()) return;
        dialogs.put(fragment, true);
        try {
            Map<Long, Integer> rows = localRows(fragment);
            new Thread(() -> {
                try {
                    List<Candidate> candidates = readCandidates(activity, rows);
                    activity.runOnUiThread(() -> {
                        if (activity.isFinishing() || !attached(fragment)) { dialogs.remove(fragment); return; }
                        if (candidates.isEmpty()) {
                            dialogs.remove(fragment); toast(activity, "削除できる既読スレはありません"); return;
                        }
                        confirm(activity, fragment, candidates);
                    });
                } catch (Exception error) {
                    log(error); activity.runOnUiThread(() -> {
                        dialogs.remove(fragment); toast(activity, "既読スレを確認できませんでした（削除していません）");
                    });
                }
            }, "Haiagaru-read-delete-list").start();
        } catch (Exception error) {
            dialogs.remove(fragment); log(error); toast(activity, "スレ一覧を確認できませんでした（削除していません）");
        }
    }

    private static void confirm(Activity activity, Object fragment, List<Candidate> candidates) {
        boolean[] checked = new boolean[candidates.size()]; java.util.Arrays.fill(checked, true);
        String[] labels = new String[candidates.size()];
        for (int i=0; i<labels.length; i++) {
            Candidate item=candidates.get(i);
            labels[i]=item.title+(item.unread>0?"（未読"+item.unread+"件）":"");
        }
        android.widget.LinearLayout heading = new android.widget.LinearLayout(activity);
        heading.setOrientation(1); int pad=Math.round(20*activity.getResources().getDisplayMetrics().density);
        heading.setPadding(pad,pad,pad,0);
        android.widget.TextView title = new android.widget.TextView(activity);
        title.setText("既読スレを削除"); title.setTextSize(20); heading.addView(title);
        android.widget.TextView warning = new android.widget.TextView(activity);
        warning.setText("この一覧で一度読んだスレが対象です。未読レスが残るスレも含みます。チェックしたスレの履歴と取得済みログを削除します。元に戻せません。未閲覧・未選択のスレと保存済みアーカイブは削除しません。");
        heading.addView(warning);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setCustomTitle(heading)
                .setMultiChoiceItems(labels, checked, (d,which,on) -> updateCount((HaiagaruDialog)d, checked))
                .setNegativeButton("キャンセル", null).setNeutralButton("すべて解除", null)
                .setPositiveButton("削除", null).create();
        dialog.setOnDismissListener(d -> dialogs.remove(fragment));
        dialog.setOnShowListener(d -> {
            updateCount(dialog, checked);
            dialog.getButton(-3).setOnClickListener(v -> {
                toggleAll(checked);
                for(int i=0;i<checked.length;i++) dialog.getListView().setItemChecked(i,checked[i]);
                updateCount(dialog,checked);
            });
            dialog.getButton(-1).setOnClickListener(v -> {
                if (!attached(fragment)) { dialog.dismiss(); return; }
                try {
                    Map<Long,Integer> current = localRows(fragment);
                    ArrayList<Candidate> selected=new ArrayList<>();
                    for(int i=0;i<checked.length;i++) if(checked[i] && current.containsKey(candidates.get(i).id))
                        selected.add(candidates.get(i));
                    if(selected.isEmpty()) { dialog.dismiss(); toast(activity,"削除対象がなくなりました"); return; }
                    Object table = nativeTable(fragment,activity);
                    Method delete = deleteMethod(table,activity);
                    Class<?> boardType=delete.getParameterTypes()[0];
                    Map<String,Object> boards=new LinkedHashMap<>();
                    for(Candidate item:selected) if(!boards.containsKey(item.board))
                        boards.put(item.board,parseBoard(boardType,item.board));
                    dialog.getButton(-1).setEnabled(false); dialog.getButton(-2).setEnabled(false);
                    dialog.getButton(-3).setEnabled(false); dialog.getListView().setEnabled(false);
                    dialog.setCancelable(false); dialog.setCanceledOnTouchOutside(false);
                    dialog.getButton(-1).setText("削除中…");
                    new Thread(() -> {
                        int deleted=0, skipped=0, failed=0;
                        for(Candidate item:selected) {
                            try {
                                // Unread responses are intentionally included; identity must still match.
                                if(!stillRead(activity,item)) { skipped++; continue; }
                                java.util.concurrent.FutureTask<Boolean> action = new java.util.concurrent.FutureTask<>(() -> {
                                    if(activity.isFinishing() || !attached(fragment)) return false;
                                    if(!localRows(fragment).containsKey(item.id)) return false;
                                    // Native deletion publishes UI events. Keep it on the main thread,
                                    // yielding between items; database discovery remains off-thread.
                                    delete.invoke(table,boards.get(item.board),item.created);
                                    return true;
                                });
                                activity.runOnUiThread(action);
                                if(action.get()) deleted++; else skipped++;
                            } catch(Exception error) { log(error); failed++; }
                        }
                        final String result="削除: "+deleted+"件／状態変更で除外: "+skipped+"件／失敗: "+failed+"件";
                        activity.runOnUiThread(() -> { dialog.dismiss(); toast(activity,result); });
                    },"Haiagaru-read-delete").start();
                } catch(Exception error) { log(error); toast(activity,"削除処理を確認できませんでした（削除していません）"); }
            });
        });
        dialog.show();
    }

    private static void updateCount(HaiagaruDialog dialog, boolean[] checked) {
        int count=selectionCount(checked);
        dialog.getButton(-1).setText("削除（"+count+"件）"); dialog.getButton(-1).setEnabled(count>0);
        dialog.getButton(-3).setText(count==checked.length?"すべて解除":"すべて選択");
    }

    // A starred/patrol-only bookmark is not evidence of reading. Persisted read_count
    // must be positive; remaining unread responses do not exclude a previously read thread.
    static boolean eligible(long id, int read) { return id>0 && read>0; }
    static int selectionCount(boolean[] checked) { int n=0;for(boolean value:checked)if(value)n++;return n; }
    static void toggleAll(boolean[] checked) { java.util.Arrays.fill(checked,selectionCount(checked)!=checked.length); }

    private static Map<Long,Integer> localRows(Object fragment) throws Exception {
        View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
        if(root==null) throw new IllegalStateException("No board view");
        Map<Long,Integer> result=new LinkedHashMap<>(); collectRows(root,result); return result;
    }

    private static void collectRows(View view, Map<Long,Integer> result) throws Exception {
        Object adapter=null;
        if(view instanceof AdapterView) {
            // getItem follows the displayed/filter order and unwraps header/footer adapters.
            // Scanning every List field can miss wrappers and includes hidden backing rows.
            android.widget.Adapter displayed=((AdapterView<?>)view).getAdapter();
            if(displayed!=null)for(int i=0;i<displayed.getCount();i++)collectRow(displayed.getItem(i),result);
        }
        else for(Class<?> cls=view.getClass();cls!=null;cls=cls.getSuperclass())
            if(cls.getName().equals("androidx.recyclerview.widget.RecyclerView")) {
                adapter=view.getClass().getMethod("getAdapter").invoke(view);break;
            }
        if(adapter!=null) {
            for(Class<?> cls=adapter.getClass();cls!=null;cls=cls.getSuperclass()) for(Field field:cls.getDeclaredFields()) {
                if(Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true); Object value=field.get(adapter); if(!(value instanceof List))continue;
                for(Object row:(List<?>)value)collectRow(row,result);
            }
        }
        if(view instanceof ViewGroup) { ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++)collectRows(group.getChildAt(i),result); }
    }

    private static void collectRow(Object row,Map<Long,Integer> result) throws Exception {
        Object model=ReadThreadsFirst.thread(row); if(model==null)return;
        String name=model.getClass().getName();
        if(!name.equals("o.zzauw")&&!name.equals("o.verifyHostname")&&!name.equals("o.MaxAdViewImplExternalSyntheticLambda2"))return;
        String id=name.equals("o.zzauw")?"d":name.equals("o.verifyHostname")?"b":"e";
        String total=name.equals("o.zzauw")?"a":name.equals("o.verifyHostname")?"c":"d";
        long key=number(model,id).longValue(); int count=number(model,total).intValue();
        // The native read-count snapshot can lag behind the right-hand tablet pane.
        // Select local IDs here; only persisted evidence of reading authorizes deletion.
        if(key>0)result.put(key,Math.max(count,result.containsKey(key)?result.get(key):0));
    }

    private static Number number(Object value,String name) throws Exception {
        Field field=value.getClass().getDeclaredField(name);field.setAccessible(true);return (Number)field.get(value);
    }
    private static SQLiteDatabase database(Context context) {
        return SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getAbsolutePath(),null,SQLiteDatabase.OPEN_READONLY);
    }
    private static List<Candidate> readCandidates(Context context,Map<Long,Integer> rows) {
        Map<Long,Candidate> found=new LinkedHashMap<>();
        // One scan, not a per-thread SQL query; only native-visible IDs can be selected.
        try(SQLiteDatabase db=database(context); Cursor cursor=db.rawQuery(
                "SELECT _id,name,created,title,read_count,res_count,server_res_count FROM bookmarks",null)) {
            while(cursor.moveToNext()) {
                long id=cursor.getLong(0);
                if(rows.containsKey(id)&&eligible(id,cursor.getInt(4))) {
                    int total=Math.max(rows.get(id),Math.max(cursor.getInt(5),cursor.getInt(6)));
                    found.put(id,new Candidate(id,cursor.getString(1),cursor.getLong(2),cursor.getString(3),Math.max(0,total-cursor.getInt(4))));
                }
            }
        }
        List<Candidate> result=new ArrayList<>();for(Long id:rows.keySet())if(found.containsKey(id))result.add(found.get(id));return result;
    }
    private static boolean stillRead(Context context,Candidate item) {
        try(SQLiteDatabase db=database(context);Cursor cursor=db.rawQuery(
                "SELECT read_count FROM bookmarks WHERE _id=? AND name=? AND created=?",
                new String[]{Long.toString(item.id),item.board,Long.toString(item.created)})) {
            return cursor.moveToFirst()&&eligible(item.id,cursor.getInt(0));
        }
    }
    private static Object nativeTable(Object fragment,Context context) throws Exception {
        ClassLoader loader=fragment.getClass().getClassLoader();String version=version(context);
        if(version.equals("0.8.10.191 dev"))return Class.forName("o.nh",false,loader).getDeclaredMethod("e").invoke(null);
        if(version.equals("0.8.10.226 dev"))return Class.forName("o.GNkYhp",false,loader).getDeclaredMethod("c").invoke(null);
        Field field=fragment.getClass().getField("bookmarksTable");Object table=field.get(fragment);
        if(table==null || !table.getClass().getName().equals("o.initView"))throw new IllegalStateException("Bookmarks table changed");
        return table;
    }
    private static Method deleteMethod(Object table,Context context) throws Exception {
        String version=version(context);
        String board=version.equals("0.8.10.191 dev")?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID";
        String name=version.equals("0.8.10.191 dev")?"e":version.equals("0.8.10.226 dev")?"b":"a";
        Method method=table.getClass().getDeclaredMethod(name,Class.forName(board,false,table.getClass().getClassLoader()),long.class);
        if(method.getReturnType()!=void.class || Modifier.isStatic(method.getModifiers()))throw new IllegalStateException("Delete action changed");
        method.setAccessible(true);return method;
    }
    private static Object parseBoard(Class<?> type,String value) throws Exception {
        // Use the native canonical-name parser: modern BoardID has four components,
        // not the single-String constructor used by 191.
        if(type.getName().endsWith("BBSUrlInfo$BoardID")) {
            Object result=type.getConstructor(String.class).newInstance(value);
            if(value.equals(result.toString()))return result;
        }
        for(Method method:type.getDeclaredMethods()) {
            if(!Modifier.isStatic(method.getModifiers()) || method.getReturnType()!=type
                    || !java.util.Arrays.equals(method.getParameterTypes(),new Class<?>[]{String.class}))continue;
            method.setAccessible(true);Object result=method.invoke(null,value);
            if(result!=null && value.equals(result.toString()))return result;
        }
        for(Field field:type.getDeclaredFields()) {
            if(!Modifier.isStatic(field.getModifiers()) || !field.getType().getName().startsWith(type.getName()+"$"))continue;
            field.setAccessible(true);Object companion=field.get(null);if(companion==null)continue;
            for(Method method:companion.getClass().getDeclaredMethods()) {
                if(method.getReturnType()!=type || !java.util.Arrays.equals(method.getParameterTypes(),new Class<?>[]{String.class}))continue;
                method.setAccessible(true);Object result=method.invoke(companion,value);
                if(result!=null && value.equals(result.toString()))return result;
            }
        }
        throw new IllegalStateException("Cannot round-trip board identifier");
    }
    private static String version(Context context) throws Exception {
        return context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
    }
    private static boolean attached(Object fragment) {
        try{return Boolean.TRUE.equals(fragment.getClass().getMethod("isAdded").invoke(fragment));}catch(Exception error){return false;}
    }
    private static Activity activity(Context context) {
        while(context instanceof android.content.ContextWrapper && !(context instanceof Activity)) {
            Context next=((android.content.ContextWrapper)context).getBaseContext();if(next==context)break;context=next;
        }return context instanceof Activity?(Activity)context:null;
    }
    private static void toast(Context context,String message){Toast.makeText(context,message,Toast.LENGTH_LONG).show();}
    private static void log(Exception error){android.util.Log.e("HaiagaruReadDelete","Read-thread action failed",error);}
}
