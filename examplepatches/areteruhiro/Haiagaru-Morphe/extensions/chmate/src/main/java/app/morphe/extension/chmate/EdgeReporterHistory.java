package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/** Persists acquired Edge metadata independently of live subject/DAT availability. */
public final class EdgeReporterHistory {
    /**
     * A history row can outlive the subject response that originally carried the
     * reporter id.  Keep a title alias as well as the numeric thread key so the
     * NGThread action can recover the id from an already-read row.
     */
    private static final String TITLE_KEY_PREFIX = "title:";
    private static volatile SharedPreferences cache;
    private static volatile ReporterMetadataWrites writes;
    private static ReporterMetadataWrites metadata(SharedPreferences prefs) {
        ReporterMetadataWrites current = writes;
        if (current != null && current.prefs == prefs) return current;
        synchronized (EdgeReporterHistory.class) {
            if (writes == null || writes.prefs != prefs) writes = new ReporterMetadataWrites(prefs);
            return writes;
        }
    }
    private static final ThreadLocal<Object> SUBJECT = new ThreadLocal<>();
    public static void pending(Object list) { SUBJECT.set(list); }
    public static void capturePending(Object url) {
        Object list = SUBJECT.get(); SUBJECT.remove();
        if (url instanceof Object[]) {
            for (Object arg : (Object[]) url) if (arg != null && arg.getClass().getName().equals("jp.syoboi.a2chMate.client.BBSUrlInfo")) { capture(arg, list); return; }
        } else capture(url, list);
    }
    private static final ThreadLocal<Boolean> OPENING = new ThreadLocal<>();
    private EdgeReporterHistory() {}
    public static void initialize(Context context) {
        cache = context.getSharedPreferences("haiagaru.edge-reporters", Context.MODE_PRIVATE);
        metadata(cache);
    }
    public static String historyTitle(long thread, Object board, String title) {
        return title(board, thread, title);
    }
    /** Called only after the display bridge has verified the current board and thread. */
    public static String displayTitle(long thread, String title) {
        return displayTitle("edge:liveedge",thread,title);
    }
    public static String displayTitle(String scope,long thread,String title){
        if (!ReporterMetadataWrites.headroom()) return title;
        SharedPreferences prefs = cache;
        if (prefs == null || thread <= 0 || EdgeReporterId.suffix(title) != null) return title;
        return EdgeReporterId.restore(title, metadata(prefs).get(threadKey(scope,thread)));
    }
    public static String title(Object board, long thread, String title) {
        if (!ReporterMetadataWrites.headroom()) return title;
        String resolved=metadataTitle(board,thread,title);
        return EdgeReporterId.isBoard(board)&&!EdgeReporterOptions.menu()?EdgeReporterId.titleForNextThreadMatch(resolved):resolved;
    }
    private static String metadataTitle(Object board,long thread,String title){
        SharedPreferences prefs = cache;
        if (prefs == null || thread <= 0 || !EdgeReporterId.isBoard(board)) return title;
        String key = threadKey(EdgeReporterId.scope(board),thread);
        ReporterMetadataWrites metadata = metadata(prefs);
        String suffix = EdgeReporterId.suffix(title);
        if (suffix != null) {
            metadata.put(key, suffix);
            metadata.put(aliasKey(board,title), suffix);
            return title;
        }
        String stored = metadata.get(key);
        if (stored != null && title != null) {
            // This is the important path for rows restored from the local
            // history database: the row has no suffix, but its thread key does.
            metadata.put(aliasKey(board,title), stored);
        }
        return EdgeReporterId.restore(title, stored);
    }

    /** Restores reporter metadata for a menu title when the thread is already read. */
    public static String resolveTitle(Object board, String title) {
        if (!ReporterMetadataWrites.headroom()) return title;
        if(EdgeReporterId.isBoard(board)&&!EdgeReporterOptions.menu())return EdgeReporterId.titleForNextThreadMatch(title);
        if (title == null || EdgeReporterId.suffix(title) != null || !EdgeReporterId.isBoard(board)) {
            return title;
        }
        SharedPreferences prefs = cache;
        if (prefs == null) return title;
        return EdgeReporterId.restore(title, metadata(prefs).get(aliasKey(board,title)));
    }

    /** Keep reporter metadata on screen, but copy the original thread title. */
    public static String copyTitle(String text) {
        if (!ReporterMetadataWrites.headroom()) return text;
        String suffix = EdgeReporterId.suffix(text);
        if (suffix == null || text.indexOf('\n') >= 0 || text.indexOf('\r') >= 0) return text;
        SharedPreferences prefs = cache;
        String stored = prefs == null ? null : metadata(prefs).get(titleKey(text));
        // A title copied from a freshly fetched subject may not have reached the
        // history cache yet.  Its single-line reporter suffix is still display
        // metadata, so remove it at the clipboard boundary too.
        if (stored != null && !suffix.equals(stored)) return text;
        return text.substring(0, text.length() - suffix.length()).trim();
    }

    private static String titleKey(String title) {
        String base = title;
        String suffix = EdgeReporterId.suffix(title);
        if (suffix != null && title != null) base = title.substring(0, title.length() - suffix.length()).trim();
        if (base == null) base = "";
        // Keep preference keys compact and deterministic; including the length
        // reduces accidental collisions without storing a full subject in XML.
        return TITLE_KEY_PREFIX + Integer.toHexString(base.hashCode()) + ":" + base.length();
    }
    private static String threadKey(String scope,long thread){return "edge:liveedge".equals(scope)?Long.toString(thread):scope+":"+thread;}
    private static String aliasKey(Object board,String title){String scope=EdgeReporterId.scope(board);return "edge:liveedge".equals(scope)?titleKey(title):scope+":"+titleKey(title);}
    public static void capture(Object url, Object result) {
        if (!ReporterMetadataWrites.headroom()) return;
        if (url == null || !(result instanceof List) || cache == null) return;
        // BBSUrlInfo exposes server/name in its diagnostic representation on all supported versions.
        String scope=EdgeReporterId.scope(url);
        if(scope==null)return;
        ReporterMetadataWrites metadata = metadata(cache);
        try {
            for (Object item : (List<?>) result) {
                long thread = 0;
                String title = null;
                for (Field field : item.getClass().getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    if (field.getType() == long.class) thread = field.getLong(item);
                    if (field.getType() == String.class) title = (String) field.get(item);
                }
                String suffix = EdgeReporterId.suffix(title);
                if (thread > 0 && suffix != null) metadata.put(threadKey(scope,thread), suffix);
                if (suffix != null && title != null) {
                    String alias = aliasKey(url,title);
                    metadata.put(alias, suffix);
                }
            }
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "Unable to cache subject metadata", error);
        }
    }
    /** Reporter shortcuts register directly; title editing retains the stock editor. */
    public static boolean choose(Activity activity, String title, Object type, Object board) {
        if (!EdgeReporterOptions.menu()||Boolean.TRUE.equals(OPENING.get()) || !(type instanceof Enum)
                || !"THREAD".equals(((Enum<?>) type).name()) || !EdgeReporterId.isBoard(board)) return false;
        final String resolvedTitle = resolveTitle(board, title);
        String suffix = EdgeReporterId.suffix(resolvedTitle);
        if (suffix == null || activity.isFinishing()) return false;
        String owner = type.getClass().getName().equals("o.addPauseListener") ? "o.getSegmentsokio"
                : type.getClass().getName().equals("o.YHn") ? "o.TTRewardVideoActivity2" : "o.zzawg";
        final Method entry;
        try {
            entry = Class.forName(owner).getDeclaredMethod("e", Class.forName("androidx.fragment.app.FragmentActivity"),
                    String.class, type.getClass(), board.getClass());
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "NG editor unavailable", error);
            return false;
        }
        boolean partial = "edge:liveedge".equals(EdgeReporterId.scope(board)) && suffix.matches("\\[[A-Za-z0-9+/.]{8}★\\]");
        String[] choices = partial ? new String[]{reporterButton(board)+"  "+suffix,"前半4桁NG","後半4桁NG","記者ID・スレ名で過去スレ検索","スレタイでNG"}
                : new String[]{reporterButton(board)+"  "+suffix,"スレタイでNG"};
        new HaiagaruDialog.Builder(activity).setTitle("NGThreadに追加")
                .setItems(choices, (dialog, which) -> {
                    if (which == 0 || partial && (which == 1 || which == 2)) {
                        register(activity, suffix, board.toString(), which); return;
                    }
                    if (partial && which == 3) { ReporterSearchUi.show(activity,suffix.substring(1,suffix.length()-2)); return; }
                    try {
                        OPENING.set(true);
                        entry.invoke(null, activity, resolvedTitle, type, board);
                    } catch (ReflectiveOperationException error) {
                        Log.e("HaiagaruReporter", "Unable to open NG editor", error);
                        Toast.makeText(activity, "NG追加画面を開けませんでした", Toast.LENGTH_LONG).show();
                    } finally { OPENING.remove(); }
                }).setNegativeButton(android.R.string.cancel, null).show();
        return true;
    }
    /** The 191 editor uses Views; retain its matching-mode controls and normal save action. */
    public static void addLegacyButton(Object fragment) {
        if(!EdgeReporterOptions.menu())return;
        try {
            Object root = fragment.getClass().getMethod("getView").invoke(fragment);
            if (root instanceof View) addLegacyButton(fragment, (View) root);
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "Unable to resolve legacy editor view", error);
        }
    }
    private static void addLegacyButton(Object fragment, View root) {
        try {
            Object type = fragment.getClass().getField("c").get(fragment);
            if (!(type instanceof Enum) || !"THREAD".equals(((Enum<?>) type).name())) return;
            Object board = fragment.getClass().getField("a").get(fragment);
            if (!EdgeReporterId.isBoard(board)) return;
            EditText input = findInput(root);
            if (input == null || EdgeReporterId.suffix(resolveTitle(board, input.getText().toString())) == null
                    || !(input.getParent() instanceof ViewGroup)) return;
            ViewGroup parent = (ViewGroup) input.getParent();
            String suffix = EdgeReporterId.suffix(resolveTitle(board,input.getText().toString()));
            Activity activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            boolean partial = "edge:liveedge".equals(EdgeReporterId.scope(board)) && suffix.matches("\\[[A-Za-z0-9+/.]{8}★\\]");
            String[] labels = partial ? new String[]{reporterButton(board),"前半4桁NG","後半4桁NG","記者ID・スレ名で過去スレ検索"} : new String[]{reporterButton(board)};
            for(int i=0;i<labels.length;i++) {
                final int action=i;
                Button button=new Button(root.getContext());button.setText(labels[i]);
                button.setOnClickListener(view -> {
                    if(action==3){ReporterSearchUi.show(activity,suffix.substring(1,suffix.length()-2));return;}
                    if(register(activity,suffix,(String)board,action)) {
                        try{fragment.getClass().getMethod("dismiss").invoke(fragment);}catch(ReflectiveOperationException ignored){}
                    }
                });
                parent.addView(button,parent.indexOfChild(input)+1+i);
            }
        } catch (ReflectiveOperationException error) {
            Log.w("HaiagaruReporter", "Unable to add reporter shortcut", error);
        }
    }
    private static boolean register(Activity activity,String suffix,String board,int mode){
        try {
            String pattern = mode==0 ? suffix : ReporterSearch.pattern(suffix,mode);
            short flags=(short)(mode==0?0x10:0x20);
            NativeNgStore store=new NativeNgStore(activity,"THREAD");
            List<NativeNgStore.Entry> entries=store.entries();
            NativeNgStore.Entry existing=ExistingNgActions.find(entries,pattern,board,flags);
            if(existing!=null){
                if((existing.flags&4)!=0)ExistingNgActions.change(store,existing,1);
                Toast.makeText(activity,"登録済みの記者NGを有効にしました",Toast.LENGTH_SHORT).show();return true;
            }
            if(entries.size()>=Haiagaru.getNgRegistrationLimit())throw new IllegalStateException("NG登録上限を超えます");
            store.update(null,store.item(pattern,flags,System.currentTimeMillis(),board));
            PersonalNgSubmissions.changed();
            Toast.makeText(activity,"記者NGを登録しました",Toast.LENGTH_SHORT).show();return true;
        } catch(Exception error){Log.w("HaiagaruReporter","Unable to register reporter NG",error);Toast.makeText(activity,"NGを登録できませんでした",Toast.LENGTH_LONG).show();return false;}
    }
    private static EditText findInput(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText result = findInput(group.getChildAt(i));
                if (result != null) return result;
            }
        }
        return null;
    }
    private static String reporterButton(Object board){String scope=EdgeReporterId.scope(board);return scope!=null&&scope.startsWith("kenmo:")?"記者だけをNG":"記者IDだけをNG";}
}
