package app.morphe.extension.chmate;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
/** Entry to the existing link creator; never edits or sends the current draft. */
public final class PostingSettingLinks {
    static final String KEY="showPostingSettingLinks";
    private static final int ID=0x48690134;
    private static final WeakHashMap<MenuItem,WeakReference<Activity>> OWNERS=new WeakHashMap<>();
    private static Activity activity(Object owner){if(owner instanceof Activity)return (Activity)owner;try{return (Activity)owner.getClass().getMethod("getActivity").invoke(owner);}catch(Exception ignored){return null;}}
    public static void addPostingMenu(Object owner,Menu menu){Activity a=activity(owner);if(!Haiagaru.preparePostingMenu(a,menu,ID,KEY))return;MenuItem item=menu.add(Menu.NONE,ID,Menu.NONE,"設定リンクを作成");item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);OWNERS.put(item,new WeakReference<>(a));item.setOnMenuItemClickListener(i->handlePostingMenu(owner,i));}
    public static boolean handlePostingMenu(Object owner,MenuItem item){Activity a=activity(owner);if(a==null||a.isFinishing()||item==null||item.getItemId()!=ID)return false;a.startActivity(new Intent(a,SettingLinkActivity.class));return true;}
    public static boolean handlePostingActivityMenu(MenuItem item){WeakReference<Activity> a=OWNERS.get(item);return a!=null&&handlePostingMenu(a.get(),item);}
    private PostingSettingLinks(){}
}
