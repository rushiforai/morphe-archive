package app.morphe.extension.chmate;

import android.view.Menu;
import android.view.MenuItem;

/** Preserve actions and click handlers; only change their action/overflow placement. */
public final class SelectionMenuPriority {
    static final String KEY="selectionMenuPriority";
    public static void apply(Menu menu) {
        android.content.Context context=Haiagaru.applicationContextForExtension();
        if(menu==null||context==null||!context.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(KEY,false))return;
        boolean word=false,search=false;
        for(int i=0;i<menu.size();i++){
            String title=String.valueOf(menu.getItem(i).getTitle());
            word|="NGワード".equals(title);search|="Web検索".equals(title);
        }
        // Only ChMate's selection menu, never general screen menus.
        if(!word||!search)return;
        for(int i=0;i<menu.size();i++){
            MenuItem item=menu.getItem(i);int id=item.getItemId();
            boolean core=id==android.R.id.copy||id==android.R.id.selectAll||id==android.R.id.cut||id==android.R.id.paste;
            item.setShowAsAction(core?MenuItem.SHOW_AS_ACTION_IF_ROOM:MenuItem.SHOW_AS_ACTION_NEVER);
        }
    }
    private SelectionMenuPriority(){}
}
