package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.util.Log;
import android.widget.AdapterView;
import android.widget.Toast;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * An interception of only i2.a(mode==2,...), the ORIGINAL native account
 * Mylist MOVE destination list. The original i2$c listener is retained for
 * the authenticated network operation; this class neither performs HTTP
 * requests nor modifies the stored selection.
 */
public final class NativeMylistMove215 {
    private static final String TAG="nicoid-mylist-move";
    private NativeMylistMove215() {}

    private static String tr(Context context,String japanese,String english,String chinese){
        try{
            Class<?> translations=Class.forName("e.e.a.PanelUi");
            Method m=translations.getDeclaredMethod("tr",Context.class,String.class,String.class,String.class);
            m.setAccessible(true);
            return (String)m.invoke(null,context,japanese,english,chinese);
        }catch(Exception ignore){
            String lang=context.getResources().getConfiguration().locale.getLanguage();
            return "ja".equals(lang)?japanese:"zh".equals(lang)?chinese:english;
        }
    }
    private static AlertDialog.Builder builder(Context context){
        try{
            Class<?> dialogs=Class.forName("e.e.a.UiDialogs");
            Method m=dialogs.getDeclaredMethod("builder",Context.class);
            m.setAccessible(true);return (AlertDialog.Builder)m.invoke(null,context);
        }catch(Exception ignored){return new AlertDialog.Builder(context);}
    }
    private static Context themed(Activity activity){
        try{
            Class<?> c=Class.forName("e.e.a.PlaybackSession");
            Method m=c.getDeclaredMethod("dialogContext",Context.class);
            m.setAccessible(true);return (Context)m.invoke(null,activity);
        }catch(Exception ignored){return activity;}
    }
    private static String text(Map<?,?> m,String key){
        Object value=m.get(key);return value==null?"":value.toString();
    }
    private static String title(Context c,Map<?,?> source){
        String value=text(source,"title");
        if(!value.isEmpty())return value;
        return tr(c,"名称未設定","Unnamed Mylist","未命名清單");
    }
    private static boolean present(List<? extends Map<?,?>> rows,String id){
        for(Map<?,?> m:rows)if(id.equals(text(m,"id")))return true;
        return false;
    }
    private static void executeOriginal(Object owner,ArrayList<HashMap<String,Object>> choices,ArrayList<?> selected,
            String source,int index,AlertDialog listDialog){
        try{
            Class<?> original=Class.forName("e.e.a.i2$c");
            Constructor<?> c=original.getDeclaredConstructors()[0];
            c.setAccessible(true);
            Object instance=c.newInstance(owner,2,choices,selected,source,listDialog);
            ((AdapterView.OnItemClickListener)instance).onItemClick(null,null,index,index);
        }catch(Exception e){Log.w(TAG,"Native authenticated move failed to start",e);}
    }

    /**
     * Returns true for mode 2 even on failures so the old, confirmation-free
     * picker never reappears. All other native actions use their original UI.
     */
    // Original nicoid v6.49 i2.a(mode, destination folders, selected videos,
    // source). Its x0 adapter draws the FIRST ArrayList, not the second.
    public static boolean show(Object owner,int mode,ArrayList<?> destinations,
            ArrayList<?> selected,String source){
        if(mode!=2)return false;
        try{
            if(owner==null||selected==null||selected.isEmpty()||destinations==null)
                throw new IllegalStateException("Missing move selection/destination");
            Field activityField=owner.getClass().getDeclaredField("b");
            activityField.setAccessible(true);
            Activity a=(Activity)activityField.get(owner);
            if(a==null||a.isFinishing()||a.isDestroyed())return true;
            Context c=themed(a);
            String sourceId=source==null?"":source;
            ArrayList<HashMap<String,Object>> eligible=new ArrayList<>();
            for(Object o:destinations){
                if(!(o instanceof Map))continue;
                Map<?,?> row=(Map<?,?>)o;
                String id=text(row,"id");
                if(id.isEmpty()||id.equals(sourceId)||present(eligible,id))continue;
                HashMap<String,Object> copy=new HashMap<>();
                for(Map.Entry<?,?> e:row.entrySet())if(e.getKey() instanceof String)
                    copy.put((String)e.getKey(),e.getValue());
                eligible.add(copy);
            }
            // Existing native k2 handler accepts the same special "deflist"
            // identifier used by the app's own Watch Later operations.
            if(!"deflist".equals(sourceId)&&!present(eligible,"deflist")){
                HashMap<String,Object> watchLater=new HashMap<>();
                watchLater.put("id","deflist");
                watchLater.put("title",tr(c,"とりあえずマイリスト",
                        "Watch Later","稍後觀看"));
                eligible.add(watchLater);
            }
            if(eligible.isEmpty()){
                Toast.makeText(a,tr(c,"移動できるマイリストがありません",
                        "No eligible destination","沒有可移動的清單"),Toast.LENGTH_SHORT).show();
                return true;
            }
            CharSequence[] choices=new CharSequence[eligible.size()];
            for(int i=0;i<choices.length;i++)choices[i]=title(c,eligible.get(i));
            final AlertDialog[] chooser=new AlertDialog[1];
            chooser[0]=builder(c).setTitle(tr(c,"移動先のマイリストを選択",
                    "Choose destination Mylist","選擇目的地清單"))
                .setItems(choices,(d,index)->{
                    if(index<0||index>=eligible.size()||a.isFinishing()||a.isDestroyed())return;
                    String folderName=choices[index].toString();
                    builder(themed(a)).setTitle(tr(a,"選択した動画を移動しますか？",
                            "Move selected videos?","移動已選取影片？"))
                        .setMessage(tr(a,"移動する動画：","Videos: ","影片數：")+selected.size()+"\n"
                            +tr(a,"移動先：","Destination: ","目的地：")+folderName)
                        .setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null)
                        .setPositiveButton(tr(a,"移動","Move","移動"),
                            (confirm,which)->executeOriginal(owner,eligible,selected,sourceId,index,chooser[0]))
                        .show();
                })
                .setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null)
                .create();
            chooser[0].show();
            return true;
        }catch(Exception e){
            Log.w(TAG,"Unable to create safe move picker",e);
            return true;
        }
    }
}