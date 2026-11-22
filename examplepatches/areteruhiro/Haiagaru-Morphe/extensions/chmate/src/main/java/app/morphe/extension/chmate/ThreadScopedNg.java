package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.app.Activity;
import android.widget.CheckBox;
import android.widget.Toast;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Removes only thread-scoped NG rows after their source thread is deleted. */
public final class ThreadScopedNg {
    static final String ENABLED = "threadScopedNgEnabled";
    private static final String[] CATEGORIES = {"ID", "NAME", "WORD"};
    private static final ThreadLocal<Boolean> BYPASS = new ThreadLocal<>();
    private static final Map<Activity,Boolean> PROMPTS = new WeakHashMap<>();

    private ThreadScopedNg() {}

    static void beginBypass(){BYPASS.set(Boolean.TRUE);}
    static void endBypass(){BYPASS.remove();}

    static boolean enabled(Context context){
        if(context==null)return true;
        SharedPreferences prefs=FeatureSwitches.prefs(context);
        return prefs.getBoolean(ENABLED,!prefs.getBoolean(MinimalSetup.ACTIVE,false));
    }

    /** Called by ChMate's native bookmark deletion method after it returns. */
    public static void nativeThreadDeleted(Object nativeBoard, long threadId) {
        Context context = Haiagaru.applicationContext();
        if (context == null || nativeBoard == null || threadId <= 0) return;
        try { BrowsingHistory.nativeThreadDeleted(nativeBoard, threadId); }
        catch (RuntimeException error) { Log.w("Haiagaru", "Unable to remove deleted thread from HOME history", error); }
        onThreadDeleted(context, nativeBoard.toString(), threadId);
    }

    static int onThreadDeleted(Context context, String board, long threadId) {
        int removed = 0;
        for (String category : CATEGORIES) {
            try {
                NativeNgStore store = new NativeNgStore(context, category);
                List<NativeNgStore.Entry> before = store.entries();
                ArrayList<Object> after = new ArrayList<>(before.size());
                int categoryRemoved = 0;
                for (NativeNgStore.Entry entry : before) {
                    if (NgBoardScope.isThread(entry.board, board, threadId)) categoryRemoved++;
                    else after.add(entry.nativeItem);
                }
                if (categoryRemoved > 0) {
                    store.replace(before, after);
                    removed += categoryRemoved;
                }
            } catch (Exception error) {
                // The thread has already been deleted. Keep cleanup failures
                // visible in logcat without interrupting the native deletion.
                Log.w("Haiagaru", "Unable to remove NG rules for deleted thread " + board + "/" + threadId, error);
            }
        }
        return removed;
    }

    /** Defers native ID/name/word insertion until the thread-only checkbox is chosen. */
    public static boolean interceptRegistration(Object nativeStore,Object before,Object after) {
        if(Boolean.TRUE.equals(BYPASS.get())||nativeStore==null||after==null)return false;
        // Native NG writes can also arrive during background refresh. Only a
        // foreground user registration should be replaced with an interactive
        // scope prompt; let all background writes follow ChMate's normal path.
        if(android.os.Looper.myLooper()!=android.os.Looper.getMainLooper())return false;
        Context context=Haiagaru.applicationContext();if(context==null)return false;
        if(!enabled(context))return false;
        NativeNgStore supported=null;
        for(String category:CATEGORIES)try{
            NativeNgStore candidate=new NativeNgStore(context,category);
            if(candidate.store==nativeStore){supported=candidate;break;}
        }catch(Exception ignored){}
        if(supported==null)return false;
        try {
            NativeNgStore.Entry candidate = new NativeNgStore.Entry(after);
            String rejection = NgRuleSafety.rejection(String.valueOf(supported.category),
                    candidate.pattern);
            if (rejection != null) {
                Toast.makeText(context, rejection, Toast.LENGTH_LONG).show();
                return true;
            }
        } catch (Exception error) {
            Log.w("Haiagaru", "Unable to validate NG registration", error);
            Toast.makeText(context, "NG登録内容を確認できませんでした", Toast.LENGTH_LONG).show();
            return true;
        }
        if(before!=null)return false;
        FilterPosition.ThreadTarget target=FilterPosition.currentVisibleThread();if(target==null)return false;
        synchronized(PROMPTS){if(PROMPTS.containsKey(target.activity))return false;PROMPTS.put(target.activity,Boolean.TRUE);}
        NativeNgStore store=supported;
        Runnable display=()->showRegistrationPrompt(target.activity,store,before,after,target);
        if(android.os.Looper.myLooper()==android.os.Looper.getMainLooper())display.run();
        else new android.os.Handler(android.os.Looper.getMainLooper()).post(display);
        return true;
    }

    private static void showRegistrationPrompt(Activity activity,NativeNgStore store,Object before,Object after,FilterPosition.ThreadTarget target){
        if(activity.isFinishing()||activity.isDestroyed()){synchronized(PROMPTS){PROMPTS.remove(activity);}return;}
        CheckBox onlyThread=new CheckBox(activity);onlyThread.setText("このスレのみを対象にする");
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("NGに登録")
                .setMessage("対象を選んでNG登録します。")
                .setView(onlyThread).setNegativeButton("登録しない",(d,w)->finishPrompt(activity))
                .setPositiveButton("登録",null).create();
        dialog.setOnCancelListener(d->finishPrompt(activity));
        dialog.setOnShowListener(d->dialog.getButton(HaiagaruDialog.BUTTON_POSITIVE).setOnClickListener(v->{
            try{
                Object item=after;
                if(onlyThread.isChecked()){
                    NativeNgStore.Entry entry=new NativeNgStore.Entry(after);
                    item=after.getClass().getConstructor(String.class,short.class,long.class,String.class)
                            .newInstance(entry.pattern,entry.flags,entry.timestamp,NgBoardScope.thread(target.board,target.threadId));
                }
                store.updateAndVerify(before,item);
                if(onlyThread.isChecked())Toast.makeText(activity,"このスレのみのNGとして登録しました",Toast.LENGTH_SHORT).show();
                dialog.dismiss();finishPrompt(activity);
            }catch(Exception error){Log.w("Haiagaru","NG registration failed",error);Toast.makeText(activity,"NGを登録できませんでした",Toast.LENGTH_LONG).show();finishPrompt(activity);}
        }));
        dialog.show();
    }
    private static void finishPrompt(Activity activity){synchronized(PROMPTS){PROMPTS.remove(activity);}}
}
