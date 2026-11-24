package app.morphe.extension.chmate;

import android.app.Activity;import android.content.*;import android.text.Html;import android.view.*;

final class ResponseNotes {
    static final int MENU=0x7e484a10;
    static final String GESTURE="haiagaruGestureResponseNotes";
    static void homeMenu(Object fragment,Menu menu){if(menu==null)return;Activity activity=Haiagaru.toolbarActivity(fragment);if(activity==null)return;
        MenuItem item=menu.findItem(MENU);if(item==null)item=menu.add(Menu.NONE,MENU,Menu.NONE,"メモ").setShowAsActionFlags(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setIcon(ToolbarIcons.noteIcon(activity,android.graphics.Color.GRAY));
        item.setVisible(SettingsProfiles.prefs(activity).getBoolean("homeResponseNotesMenu",true));item.setOnMenuItemClickListener(v->{open(activity,null);return true;});}
    private static Intent intent(Activity activity,ResponseArchiveEntry entry){
        Intent intent=new Intent(activity,ResponseNotesActivity.class);
        if(entry!=null){String source=Html.fromHtml(entry.body).toString();intent.putExtra("sourceUrl",SiteNativeBoards.copiedText(entry.url)).putExtra("sourceTitle",entry.title).putExtra("sourceNumber",entry.number)
                .putExtra("sourceText",source.substring(0,Math.min(4000,source.length())));}
        return intent;
    }
    static void open(Activity activity,ResponseArchiveEntry entry){if(activity!=null){Intent launch=intent(activity,entry);if(!NativeToolTabs.open(activity,"notes",launch))activity.startActivity(launch);}}
    static boolean handle(Object object){if(!(object instanceof MenuItem)||((MenuItem)object).getItemId()!=MENU)return false;
        Activity activity=Haiagaru.toolbarActivity(null);if(activity!=null){Intent launch=((MenuItem)object).getIntent();activity.startActivity(launch==null?intent(activity,null):launch);}return true;}
    static boolean gesture(View view){Activity activity=Haiagaru.toolbarActivity(null);if(activity==null)return false;open(activity,null);return true;}
    static void append(Object menuObject,Object response,Object board){
        if(!(menuObject instanceof Menu)||response==null||board==null||!ResponseMenuSettings.visible(MENU))return;
        Menu menu=(Menu)menuObject;if(menu.findItem(MENU)!=null)return;
        Activity activity=Haiagaru.toolbarActivity(null);if(activity==null)return;
        try{ResponseArchiveEntry entry=ResponseArchiveEntry.snapshot(response,board,String.valueOf(activity.getTitle()));
            menu.add(Menu.NONE,MENU,ResponseMenuSettings.order(MENU,menu.size()),"メモ").setIcon(ToolbarIcons.noteIcon(activity,android.graphics.Color.GRAY)).setIntent(intent(activity,entry)).setOnMenuItemClickListener(ResponseNotes::handle);
        }catch(ReflectiveOperationException|RuntimeException error){android.util.Log.w("Haiagaru","Response note target unavailable",error);}
    }
    private ResponseNotes(){}
}
